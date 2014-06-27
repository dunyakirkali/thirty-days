class UserMailer < ActionMailer::Base
  default from: 'info@thirty-days.herokuapp.com'
 
  def reminder_email(user)
    @user = user  
    mail(to: @user.email, subject: '30 Days: Did you do what you should do?')
  end
end
