class List < ApplicationRecord
  has_many :items
  has_many :shared_lists
  has_many :users, :through => :shared_lists

  accepts_nested_attributes_for :items
end
