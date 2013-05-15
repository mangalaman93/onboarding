class FixItemTypeColumnName < ActiveRecord::Migration
  def up
    rename_column :items, :type, :type_of
    rename_column :item_templates, :type, :type_of
  end

  def down
    rename_column :items, :type_of, :type
    rename_column :item_templates, :type_of, :type
  end
end
