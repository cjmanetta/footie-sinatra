class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.string :date
      t.string :activity_type

      t.timestamps
    end
  end
end
