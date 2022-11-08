class Search < ApplicationRecord
  belongs_to :user

  validates :query, presence: true
  validates :user, presence: true

  before_create :clean_query

  private

  def clean_query
    self.query = query.strip.downcase
  end
end
