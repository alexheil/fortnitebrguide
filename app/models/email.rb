class Email < ApplicationRecord

  validates :email, presence: true, uniqueness: true, length: { maximum: 75 }, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  def self.email_blast
    Email.find_each do |email|
      EmailMailer.email_blast(email).deliver_now
    end
  end

  def self.email_blast
    Email.where(daily: true).find_each do |email|
      EmailMailer.daily_blast(email).deliver_now
    end
  end

end
