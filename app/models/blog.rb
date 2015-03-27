class Blog < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates :title, presence: true
  validates :body, presence: true
  validates :date, presence: true
end
