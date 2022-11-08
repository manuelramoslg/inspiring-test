class FactResult < ApplicationRecord
  has_many :fact_result_categories, class_name: "FactResultCategory"
  has_many :categories, through: :fact_result_categories

  validates :url, presence: true
  validates :url, uniqueness: true
  validates :value, presence: true
end
