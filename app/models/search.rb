class Search < ApplicationRecord
  belongs_to :user
  has_many :fact_results, class_name: "FactResult"

  validates :query, presence: true
  validates :user, presence: true

  before_create :clean_query

  private

  def clean_query
    self.query = query.strip.downcase
  end
end
