class Item < ApplicationRecord
  belongs_to :inventory
  validates_presence_of :name
end
