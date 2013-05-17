class UserMailer < ActionMailer::Base
  default :from => "notifications@onboarding.herokuapp.com"

  def welcome_email(email, url)
  		@url = url
	  mail(to: email, subject: 'Welcome to OnBoarding')
	end
end
