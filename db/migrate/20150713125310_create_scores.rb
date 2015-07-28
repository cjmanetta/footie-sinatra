class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :value

      t.references :user, index: true
      t.references :activity, index: true

      t.timestamps
    end
  end
end
