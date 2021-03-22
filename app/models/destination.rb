class Destination < ApplicationRecord
has_many :posts
has_many :bloggers, through: :posts 

  def recent_five
    self.posts.order("created_at DESC").limit(5)
  end

  def featured_post
    self.posts.order("likes DESC").first
  end

  def average_age
    ages = self.bloggers.uniq.pluck(:age)
    ages.sum.to_f/ages.length
  end
end
