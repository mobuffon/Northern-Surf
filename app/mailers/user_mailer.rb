class UserMailer < ApplicationMailer
  def welcome_email
    @user = User.first
    @url  = 'http://example.com/login'
    mail(to: 'moritzvonbuchwaldt@web.de', subject: 'Welcome to My Awesome Site')
  end
end
