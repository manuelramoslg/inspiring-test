class SearchesController < ApplicationController
  def index
    @search = Search.new
    @categories = Category.all.order(name: :desc)
  end

  def create
    @search = Search.new(search_params)
    @search.user = current_or_guest_user
    respond_to do |format|
      if @search.save
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
  
end
