# -*- coding: utf-8 -*-
class Goody < ApplicationRecord
  belongs_to :campaign
  has_many :orders
  has_many :supporters, through: :orders

  validates :price, numericality: true, presence: true
  validates :quantity, numericality: true, presence: true

  def orders_count
    orders.count
  end

  def remaining_quantity
    if quantity != -1
      quantity - orders_count
    else
      '∞'
    end
  end

end
