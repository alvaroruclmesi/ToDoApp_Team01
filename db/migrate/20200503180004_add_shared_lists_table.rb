class AddSharedListsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :sharedlists do |t|
      t.integer :id_list
      t.integer :id_user

      t.timestamps
    end
  end
end
