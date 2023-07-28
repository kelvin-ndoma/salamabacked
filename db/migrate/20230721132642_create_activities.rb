class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.datetime :scheduled_time

      t.timestamps
    end
  end
end
