# frozen_string_literal: true

module Juno
  class Charge < ApplicationRecord
    belongs_to :order

    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :code, presence: true
    validates :key, presence: true
    validates :number, presence: true,
                       uniqueness: { scope: :order_id },
                       numericality: { only_integer: true, greater_than: 0 }
    validates :status, presence: true
  end
end
