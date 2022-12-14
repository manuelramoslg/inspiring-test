# frozen_string_literal: true

class SearchesController < ApplicationController
  include Searcheable

  def index
    @search = Search.new
    @categories = show_categories
    @fact_results = FactResult.joins(:search)
                              .where(search_id: Search.last)
                              .where(searches: { user: current_or_guest_user })
                              .page params[:page]
  end

  def create
    @search = Search.new(search_params)
    @search.user = current_or_guest_user
    @search.query = 'Random' if @search.query.empty?
    @search.save
    respond_to do |format|
      if get_fact_results(@search)
        format.html { redirect_to searches_index_url, notice: I18n.t('query.create_success') }
      else
        format.html { redirect_to searches_index_url, notice: I18n.t('errors.bad_request.message') }
      end
    end
  end

  def send_fact_email
    SendFactResultFactJob.perform_later(current_or_guest_user.email, params[:email])
    redirect_to searches_index_url, notice: I18n.t('mailer.notify')
  end

  private

  def search_params
    params.require(:search).permit(:query, :user_id)
  end

  def get_fact_results(search)
    facts = get_facts(search.query)
    
    if facts.last.has_key?('url')
      facts.each do |result|
        fact_result = FactResult.create(
          value: result['value'],
          search_id: search.id,
          url: result['url']
        )
        if result['categories'].any?
          result['categories'].each do |category_name|
            fact_result.categories << Category.find_or_create_by(name: category_name)
          end
        end
        fact_result
      end
    else
      false
    end
  end

  def persist_categories
    if Category.none?
      get_categories.each do |category_name|
        Category.find_or_create_by(name: category_name)
      end
    # if the last category was created more than a day ago make request
    elsif Category.last.created_at < DateTime.now - 1.day
      get_categories.each do |category_name|
        Category.find_or_create_by(name: category_name)
      end
    end
  end

  def show_categories
    if get_categories.class.eql?(Array)
      persist_categories
    end
    Category.all.pluck(:name).uniq.sort
  end
end
