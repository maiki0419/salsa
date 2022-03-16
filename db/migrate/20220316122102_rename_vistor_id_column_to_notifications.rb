class RenameVistorIdColumnToNotifications < ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :vistor_id, :visitor_id
  end
end
