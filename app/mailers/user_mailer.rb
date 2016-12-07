class UserMailer < ActionMailer::Base
  default :from => "no-reply@hairfolio.tech"

  def password_reset(user, password)
    @resource = user
    @password = password
    mail(:to => user.email, :subject => 'Password Reset Notification')
  end
end
