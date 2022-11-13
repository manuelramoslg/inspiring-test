# frozen_string_literal: true

module Searcheable
  extend ActiveSupport::Concern

  private

  def get_categories
    response = Faraday.get("#{url_base}/categories")
    JSON.parse(response.body)
  end

  def get_facts(query)
    if random_fact?
      get_random_fact
    elsif categorie_fact?(query)
      get_random_by_categorie(query)
    else
      get_fact_by_query(query)
    end
  end

  def get_random_fact
    response = Faraday.get("#{url_base}/random")
    [JSON.parse(response.body)]
  end

  def get_random_by_categorie(query)
    response = Faraday.get("#{url_base}/random?category=#{query}")
    [JSON.parse(response.body)]
  end

  def get_fact_by_query(query)
    response = Faraday.get("#{url_base}/search?query=#{query}")
    JSON.parse(response.body)['result']
  end

  def random_fact?
    params[:search][:query].blank? || params[:commit].eql?('Random')
  end

  def categorie_fact?(query)
    Category.all.map(&:name).uniq.include?(query.downcase)
  end

  def url_base
    Rails.application.credentials.config[:url][:base]
  end
end
