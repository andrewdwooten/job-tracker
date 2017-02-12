class Comment < ActiveRecord::Base
  validates :content, :job_id, presence: true
  belongs_to :job
end
