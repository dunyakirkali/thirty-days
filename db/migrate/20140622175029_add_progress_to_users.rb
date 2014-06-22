class AddProgressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :progress, :string, array: true, default: '{}'
  end
end
