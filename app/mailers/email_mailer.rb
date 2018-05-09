class EmailMailer < ApplicationMailer

  def success_email(email)
    @email = email
    mail(to: @email.email, subject: 'Hey, you\'re on the VIP list now! | Fortnite BR Guide')
  end

  def email_blast(email)
    @email = email
    @post = Post.where(daily: false).first
    mail(to: @email.email, subject: ' | Fortnite BR Guide')
  end

  def daily_blast(email)
    @email = email
    @post = Post.where(daily: true).first
    mail(from: "daily@fortnitebrguide.com", to: @email.email, subject: ' | Fortnite BR Guide')
  end

end