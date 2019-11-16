class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true

  def self.random_code
    encoded = SecureRandom.urlsafe_base64

    until !ShortenedUrl.exists?(encoded)
      encoded = SecureRandom.urlsafe_base64
    end
    encoded
  end

  def create!(user, long)
    ShortenedUrl.new(user: user.id, long_url: long, short_url: ShortenedUrl.random_code)
  end

  belongs_to(
    :submitter,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id
  )
end
