class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :website
      

      t.timestamps null: false
    end
  end
end
