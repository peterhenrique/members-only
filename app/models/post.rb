class Post < ApplicationRecord
  belongs_to :User

  validates :title, presence: true
  validates :body, presence: true, length: {in: 6..500}
end
