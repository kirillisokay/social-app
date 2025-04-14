class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  has_many :likes, as: :likable, dependent: :destroy

  def liked_by?(user)
    likes.exists?(user: user)
  end

  validates :body, presence: true
  validates :title, presence: true
end
