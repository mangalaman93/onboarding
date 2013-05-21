class PlanCreatorController < ApplicationController
  include Wicked::Wizard

  steps :select_template, :edit_tasks, :assign_contacts

  def show
    @plan = current_user.plans.first
    @task_templates = TaskTemplate.find(:all)
    render_wizard
  end
end
