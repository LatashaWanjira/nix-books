class Book < ApplicationRecord
  validates :title,			:presence => true
  validates :description, 	:presence => true
  validates :content, 		:presence => true
  has_many 	:comments
end
