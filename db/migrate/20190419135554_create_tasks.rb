class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
