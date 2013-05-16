class SuggestionsController < ApplicationController
  def new
    @contact_active = "active"
  	@sug = Suggestion.new
    if params[:suggestion]
      @sug.email = params[:suggestion][:email]
      @sug.name = params[:suggestion][:name]
      @sug.suggestion_data = params[:suggestion][:suggestion_data]
    end
  end

  def create
  	@sug = Suggestion.new(params[:suggestion])
    if @sug.save_with_captcha
      redirect_to contact_path, :flash => { :success => true }
    else
      render new_suggestion_path
    end
  end
end
