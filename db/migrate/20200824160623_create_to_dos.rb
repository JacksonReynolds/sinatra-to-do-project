class CreateToDos < ActiveRecord::Migration
  def change
    create_table :to_dos do |t|
      t.integer :list_id
      t.text :task
      t.date :date_created
    end
  end
end
