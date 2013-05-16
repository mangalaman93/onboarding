class PlanCreatorController < ApplicationController
  include Wicked::Wizard

  steps :select_template, :edit_tasks, :assign_contacts

  def show
    @plan = Plan.find(1)
    @task_templates = TaskTemplate.find(:all)
    render_wizard
  end
end
