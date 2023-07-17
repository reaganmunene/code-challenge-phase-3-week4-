class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews

  def leave_review(user, star_rating, comment)
    Review.create(user: user, product: self, star_rating: star_rating, comment: comment)
  end

  def print_all_reviews
    reviews.each(&:print_review)
  end

  def average_rating
    reviews.average(:star_rating)
  end
end


##faking a change
