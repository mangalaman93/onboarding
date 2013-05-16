class PlanCreatorController < ApplicationController
  include Wicked::Wizard

  steps :select_template, :edit_tasks, :assign_contacts

  def show
    @task_templates = TaskTemplate.find(:all)
    render_wizard
  end
end
