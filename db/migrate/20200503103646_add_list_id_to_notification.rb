class AddListIdToNotification < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :todo_list, :integer
    change_column :notifications, :status, :string
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
