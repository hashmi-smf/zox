class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :mobile
      t.string :email
      t.string :budget
      t.string :status
      t.date :follow_up
      t.integer :lead_id
      t.integer :site_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
