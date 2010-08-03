ActionMailer::Base.smtp_settings = {
  :enable_starttls_auto => true,
  :address => "smtp,gmail.com",
  :port => 587,
  :domain => "gmail.com",
  :authentication => :plain,
  :user_name => "linuxfi,ror,lulho,2010@gmail.com",
  :password => "rubyonrails"
}
