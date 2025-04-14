class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
has_many :liked_posts, through: :likes, source: :likable, source_type: "Post"
  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
