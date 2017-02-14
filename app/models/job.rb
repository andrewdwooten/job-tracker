class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, :category_id, presence: true
  belongs_to :company
  belongs_to :category
  has_many   :comments

  def self.by_interest
    self.order(level_of_interest: :desc).group_by {|job| job.level_of_interest}
  end
end
