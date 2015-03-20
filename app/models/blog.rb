class Blog < ActiveRecord::Base
  has_many :comments
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
end
