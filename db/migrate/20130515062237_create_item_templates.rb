class CreateItemTemplates < ActiveRecord::Migration
  def change
    create_table :item_templates do |t|
      t.string :type
      t.string :description
      t.integer :duration
      t.string :comments
      t.text :metadata
      t.integer :task_template_id

      t.timestamps
    end
    add_index :item_templates, :task_template_id
  end
end
