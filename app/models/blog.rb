class Blog < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
end
