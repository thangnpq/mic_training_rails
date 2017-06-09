class ChangeFirstNameOnUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :firs_name, :first_name
  end
end
