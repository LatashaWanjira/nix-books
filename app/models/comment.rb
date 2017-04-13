class Comment < ApplicationRecord
  validates		:comment_body, :presence => true
  belongs_to 	:book
end
