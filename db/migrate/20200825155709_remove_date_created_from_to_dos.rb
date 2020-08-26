class RemoveDateCreatedFromToDos < ActiveRecord::Migration
  def change
    remove_column :to_dos, :date_created
  end
end
