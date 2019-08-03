class AddNullFalseToCategory < ActiveRecord::Migration[6.0]
  def change
    change_column_null :raw_materials, :name, false
    change_column_null :raw_materials, :category, false
  end
end
