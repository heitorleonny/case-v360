class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.text :comment
      t.references :task_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
