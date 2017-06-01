class AddRoleToUsers < ActiveRecord::Migration[5.0]
  class User < ActiveRecord::Base
  end

  def change
    add_column :users, :role, :string, null: false, default: "unassigned"

    User.update_all(role: "unassigned")
  end
end
