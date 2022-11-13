# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :fact_result_categories, class_name: 'FactResultCategory'
  has_many :fact_results, through: :fact_result_categories

  validates :name, presence: true
  validates :name, uniqueness: true
end
