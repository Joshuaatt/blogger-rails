class Comment < ActiveRecord::Base
  belongs_to :blog
  validates :comment_body, presence: true
end
