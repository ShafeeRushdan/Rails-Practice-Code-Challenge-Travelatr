class Blogger < ApplicationRecord
has_many :posts
has_many :destinations, through: :posts 


validates :name, uniqueness: true

validates :bio, length: { minimum: 30 }

validates :age, numericality: {greater_than: 0}


def total_likes
  likes = 0
  self.posts.each do |post|
    likes += post.likes
  end
  likes
end

def featured_post
  self.posts.order(:likes).reverse.first
end

end
