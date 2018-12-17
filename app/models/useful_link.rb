class UsefulLink < ApplicationRecord
  has_one_attached :image
  acts_as_list
end
