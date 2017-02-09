class Category < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :jobs
end
