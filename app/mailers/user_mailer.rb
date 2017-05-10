class UserMailer < ApplicationMailer

  def welcome_artist(user, password)
    @user = user
    @password = password
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to the Site')
  end

end
