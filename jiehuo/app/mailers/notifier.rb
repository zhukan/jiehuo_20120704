class Notifier < ActionMailer::Base
  default from: "ucgygah@gmail.com"
  def signup_notification
    mail(:to => "melody.zzz@gmail.com", :subject => "New account information")
  end
end
