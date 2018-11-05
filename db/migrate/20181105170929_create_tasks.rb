class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :status
      t.datetime :expire_at

      t.timestamps
    end
  end
end
