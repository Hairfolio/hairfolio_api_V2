class ChangeColumnDefaultOfTemp < ActiveRecord::Migration[5.2]
  def change
    change_column_default :shared_logs, :title, nil
    change_column_default :shared_logs, :description, nil
  end
end
