class SearchesController < ApplicationController
  include Searcheable

  def index
    @search = Search.new
    @categories = show_categories
    @fact_results = Search.where(user: current_or_guest_user).last&.fact_results || []
  end

  def create
    @search = Search.new(search_params)
    @search.user = current_or_guest_user
    @search.query = "Random" if @search.query&.empty?
    respond_to do |format|
      if @search.save
        fact_results(@search)
        format.html { redirect_to searches_index_url, notice: "Search was successfully created." }
      else
        format.html { redirect_to searches_index_url, notice: :unprocessable_entity }
      end
    end
  end

  private
    def search_params
      params.require(:search).permit(:query, :user_id)
    end

    def fact_results(search)
      get_facts(search.query).each do |result|
        fact_result = FactResult.create(
          value: result["value"], 
          search_id: search.id,
          url: result["url"]
        )
        if result["categories"].any?
          result["categories"].each do |category_name|
            fact_result.categories << Category.find_or_create_by(name: category_name)
          end
        end
        fact_result
      end
    end

    def persist_categories
      if !Category.any?  
        get_categories.each do |category_name|
          Category.find_or_create_by(name: category_name)
        end
      # if the last category was created more than a day ago make request
      elsif Category.last.created_at < DateTime.now-1.days
        get_categories.each do |category_name|
          Category.find_or_create_by(name: category_name)
        end
      end
    end

    def show_categories
      persist_categories
      Category.all.order(name: :desc)
    end

end
