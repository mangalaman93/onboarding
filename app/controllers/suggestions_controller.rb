class SuggestionsController < ApplicationController
  def new
    @contact_active = "active"
  	@sug = Suggestion.new
    if params[:suggestion]
      @sug.email = params[:suggestion][:email]
      @sug.name = params[:suggestion][:name]
      @sug.suggestion_data = params[:suggestion][:suggestion_data]
    elsif current_user
      @sug.email = current_user.email
      @sug.name = current_user.name
    end
  end

  def create
  	@sug = Suggestion.new(params[:suggestion])
    if @sug.save_with_captcha
      to = "ad.onboarding.chronus@gmail.com"
      to_name = "Admin"
      from = {:username => "onboarding.chronus",
              :password => "onboarding",
              :host => "smtp.gmail.com" }
      from_name = params[:suggestion][:name]
      sub = "Suggestion/Query"
      content = "From: #{params[:suggestion][:email]},\nSuggestion/Query: #{params[:suggestion][:suggestion_data]}"
      UserMailer.send_email(to, to_name, from, from_name, sub, content).deliver

      # sending email to user
      UserMailer.send_email(params[:suggestion][:email],
                            from_name,
                            from,
                            "OnBoarding Team",
                            "Thanks you for your Suggestion/Query!",
                            "Your Suggestion/Query will be processed soon.").deliver      
      redirect_to contact_path, :flash => { :success => true }
    else
      flash[:error] = true
      render new_suggestion_path
    end
  end
end
