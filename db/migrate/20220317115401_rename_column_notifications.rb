class RenameColumnNotifications < ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :room_id, :chat_id
  end
end
