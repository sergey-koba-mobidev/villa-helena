class Photo < ApplicationRecord
  has_one_attached :image
  acts_as_list

  def self.main
    self.where(main: true).first
  end
end
