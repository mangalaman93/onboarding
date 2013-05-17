class PlansController < ApplicationController
  def new
    @plan = Plan.new
  end
  
  def create
    @plan = Plan.new(params[:plan])
    @task_templates = TaskTemplate.find(:all)
    
    if(@plan.save)
      #redirect_to "/plan_creator"
      render :select
    else
      render :new
    end
  end
  
  def show    
        
    case params[:id]
    when "select"      
      render :select
    when "modify"
      selected_templates = params[:selectedTemplates].split(',').map{ |x| x.to_i }
      #selected_templates = params[:selectedTemplates]
      
      selected_templates.each do |task_template_id|
        task_template = TaskTemplate.find(task_template_id)
        #item_templates = ItemTemplate.find(task_template_id => task_template)
        
        task = Task.new
        task.title = task_template.title
        task.creator_id = current_user 
        task.owner_id = @plan.user
        task.plan_id = @plan
        
        if task.save!
          # create the appropriate item tasks for the user
          item_templates = ItemTemplate.find(task_template_id => task_template)
          
          items.templates.each do |item_template|
            
            item = Item.new
            item.type = item_template.type
            item.description = item_template.description
            item.duration = item_template.duration
            item.comments = item_template.comments
            item.metadata = item_template.metadata
            
            if item.save!
              
            else
              render :modify, message => "Error saving individual items for the tasks!"
            end
            
          end          
          render :edit, message => "Successfully created the tasks/items for the user!"
          
        else
          render :modify, message => "Error saving tasks for the plan!"
        end
        
      end
            
      render :modify
    when "assign"
      render :assign
    end
  end
  
  def select
    @plan = current_user.plans.first
    render
  end
  
  def update
    @params = params[:plan]    
    
  end
  
  def modify
    
  end
  
  def assign
    
  end

end
