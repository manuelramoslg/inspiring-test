module Searcheable extend ActiveSupport::Concern
  private  
  
  def get_categories
    response = Faraday.get("https://api.chucknorris.io/jokes/categories")
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
    response = Faraday.get('https://api.chucknorris.io/jokes/random')
    [JSON.parse(response.body)]
  end

  def get_random_by_categorie(query)
    response = Faraday.get("https://api.chucknorris.io/jokes/random?category=#{query}")
    [JSON.parse(response.body)]
  end
  
  def get_fact_by_query(query)
    response = Faraday.get("https://api.chucknorris.io/jokes/search?query=#{query}")
    JSON.parse(response.body)["result"]
  end

  def random_fact?
    params[:search][:query].blank? || params[:commit].eql?("Random")
  end

  def categorie_fact?(query)
    Category.all.map(&:name).uniq.include?(query.downcase)
  end
end