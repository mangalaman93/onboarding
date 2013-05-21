class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(params[:plan])
    @task_templates = TaskTemplate.find(:all)
    
    if(@plan.save!)
      #redirect_to "/plan_creator"
      cookies[:current_plan] = @plan.id
      render :select
    else
      render :new
    end
  end
  
  def edit
    @user_plan = Plan.find(params[:id])    
  end
  
  def show   
    #debugger 
    @user_plans = current_user.plans
      
        
    case params[:id]
    when "select"      
      render :select
    when "modify"
      @plan = Plan.find(cookies[:current_plan])
      
      selected_templates = cookies[:selected_templates].split(',').map{ |x| x.to_i }
      
      selected_templates.each do |task_template_id|
        task_template = TaskTemplate.find(task_template_id)
        #item_templates = ItemTemplate.find(task_template_id => task_template)
        
        task = Task.new
        task.title = task_template.title
        task.creator_id = current_user 
        task.owner_id = @plan.user
        task.plan_id = @plan.id
        
        if task.save!
          #debugger
          # create the appropriate item tasks for the user
          item_templates = ItemTemplate.where("task_template_id = ?",task_template)
          
          item_templates.each do |item_template|
            
            item = Item.new
            item.type_of = item_template.type_of
            item.description = item_template.description
            item.duration = item_template.duration
            item.comments = item_template.comments
            item.metadata = item_template.metadata
            item.task_id = task.id
            
            if item.save!
              
            else
              render :modify, :flash => { :type => "error",
                :message => "Error saving individual items for the tasks!" }
            end
            
          end          
          #render '/plans/' + @plan.id.to_s + '/edit', :flash => { :type => "info",
          #                          :message => "Successfully created the tasks/items for the user!" }
          #@user_plan = @plan
          #render :edit
          redirect_to '/home'  
          return        
          
        else
          render :modify, :flash => { :type => "error", :message => "Error saving tasks for the plan!" }
        end
        
      end
            
      #render :modify
      redirect_to root_path
      return
    when "assign"
      render :assign
    else
      @user_plan = Plan.find(params[:id])
      render :edit
    end
  end
  
  def select
    @plan = current_user.plans.first
    render
  end
  
  def update
    @params = params[:plan]    
    
  end
  
  def destroy
     (Plan.find(params[:id])).destroy
     redirect_to root_path
  end
    
end
