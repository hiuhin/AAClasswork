class Cat < ApplicationRecord
  validates :birth_date, :color, :name, :sex, :description, presence: true
  validates :color, :inclusion => { in: %w(brown white grey black)}
  validates :sex, :inclusion => { in: %w(F M)}

  has_many :rental_requests,
    class_name: :CatRentalRequest,
    primary_key: :id,
    foreign_key: :cat_id

  
end
