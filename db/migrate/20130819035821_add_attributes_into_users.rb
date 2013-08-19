class AddAttributesIntoUsers < ActiveRecord::Migration
  def up
        add_column :users, :name, :string
        add_column :users, :status, :string  
        add_column :users, :auth, :string
  end

  def down
        remove_column :name, :status, :auth
  end
end