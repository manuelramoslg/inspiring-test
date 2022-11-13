# frozen_string_literal: true

class FactResultCategory < ApplicationRecord
  belongs_to :fact_result
  belongs_to :category
end
