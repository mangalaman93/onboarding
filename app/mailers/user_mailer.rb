class UserMailer < ActionMailer::Base
  default :from => "onboarding.chronus@gmail.com"

  def welcome_email(email, url, content)
  	@url = url
  	@content = content
	  mail(to: email, subject: 'Welcome to OnBoarding')
	end

	def send_email(to, to_name, from, from_name, sub, content)
		@to_name = to_name
		@from_name = from_name
		@content = content
		delivery_options = {user_name: from[:username],
                        password: from[:password],
                        address: from[:host] }
    mail(to: to, subject: sub, delivery_method_options: delivery_options)
	end
end
