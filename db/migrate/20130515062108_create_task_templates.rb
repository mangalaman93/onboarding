class CreateTaskTemplates < ActiveRecord::Migration
  def change
    create_table :task_templates do |t|
      t.string :title

      t.timestamps
    end
  end
end
