class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(params[:plan])
    
    if(@plan.save)
      redirect_to plan_creator_path
    else
      render :new
    end
  end

end
