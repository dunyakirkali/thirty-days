class AddBeganAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :began_at, :datetime
  end
end
