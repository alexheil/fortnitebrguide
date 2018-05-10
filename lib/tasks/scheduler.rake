
desc "Heroku scheduler tasks"
task :send_email_blast => :environment do
  puts "Send email blast."
  Email.email_blast
  puts "Email blast sent!"
end
task :send_daily_email => :environment do
  puts "Send daily email."
  Email.daily_blast
  puts "Daily email sent!"
end