class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :user, index: true
      t.references :mission, index: true
      t.integer :experience

      t.timestamps
    end
  end
end
