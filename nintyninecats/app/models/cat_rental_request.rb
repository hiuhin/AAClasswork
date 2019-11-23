class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status
  validates :status, :inclusion => { in: %w(PENDING APPROVED DENIED) }

  belongs_to :cat,
    dependent: :destroy,
    class_name: :Cat,
    primary_key: :id,
    foreign_key: :cat_id

  def overlapping_requests
    
  end
end
