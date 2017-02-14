class Contact < ActiveRecord::Base
  validates :name, :position, :email, :company_id, presence: true
  belongs_to :company
end
