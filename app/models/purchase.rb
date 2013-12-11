class Purchase < ActiveRecord::Base
  validates :body, presence: true
end
