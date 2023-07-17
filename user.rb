class User < ActiveRecord::Base
  has_many :reviews
  has_many :products, through: :reviews

  def favorite_product
    products.order(reviews: :desc).first
  end

  def remove_reviews(product)
    Review.where(user: self, product: product).destroy_all
  end
end
