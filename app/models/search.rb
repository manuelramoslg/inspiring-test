# frozen_string_literal: true

class Search < ApplicationRecord
  belongs_to :user
  has_many :fact_results, class_name: 'FactResult'

  before_create :clean_query

  validates :user, presence: true
  private

  def clean_query
    self.query = query.strip.downcase
  end
end
