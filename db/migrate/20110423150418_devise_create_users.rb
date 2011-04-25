class DeviseCreateUsers < ActiveRecord::Migration
  def self.up
    create_table(:users) do |t|
      t.string :name
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable
      t.boolean :is_admin, :default => false
      t.boolean :is_active, :default => true
      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
  end

  def self.down
    drop_table :users
  end
end