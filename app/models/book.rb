class Book < ApplicationRecord
  has_attached_file :book_cover, styles: { medium: "141x 255#", thumb: "100x100>" }, default_url: "/Nix books.jpg"
  validates_attachment_content_type :book_cover, content_type: /\Aimage\/.*\z/
  validates :title,			:presence => true
  validates :description, 	:presence => true
  validates :content, 		:presence => true
  has_many 	:comments
  belongs_to :user
  acts_as_taggable
end
