class UserMailer < ActionMailer::Base
  default :from => "no-reply@hairfolio.tech"

  def password_reset(user, password)
    @resource = user
    @password = password
    mail(:to => user.email, :subject => 'Password Reset Notification')
  end

  def send_invitation_email(email)
  	mail(to: email, subject: "I’d like to add you on Hairfolio")
  end

  def share_note(email,log,url)
    @url = url
    @log = log
    @user = log.note.contact.user
    mail(to: email, subject: "Your stylist's Recommendation")
  end
end
