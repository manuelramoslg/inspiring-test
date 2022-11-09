class FactResult < ApplicationRecord
  belongs_to :search
  has_many :fact_result_categories, class_name: "FactResultCategory"
  has_many :categories, through: :fact_result_categories

  validates :url, presence: true

  validates :value, presence: true
  validates :search, presence: true
end
