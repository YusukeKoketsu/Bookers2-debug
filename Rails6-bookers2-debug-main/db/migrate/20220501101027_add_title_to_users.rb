class AddTitleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :title, :srting
  end
end
