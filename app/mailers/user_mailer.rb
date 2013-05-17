class UserMailer < ActionMailer::Base
  default :from => "notifications@onboarding.herokuapp.com"

  def welcome_email
	  email_with_name = "#{@user.name} <#{@user.email}>"
	  mail(to: email_with_name, subject: 'Welcome to OnBoarding')
	end
end
