class ChangeScreenNameForUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :screen_name, :nickname
  end
end
