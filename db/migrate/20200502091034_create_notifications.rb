class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.boolean :status
      t.integer :sender_id
      t.integer :receiver_id

      t.timestamps
    end
  end
end
