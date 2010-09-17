class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :email,
        :null   => false,
        :limit  => 100

      t.string :login,
        :null   => false,
        :limit  => 40

      t.column :hpassword, "CHAR(40)",
        :null   => false,
        :limit  => 32

      t.column :salt, "CHAR(6)",
        :null   => false,
        :limit  => 6

      t.datetime :date_register,
        :null   => false,
        :default => Time.now
    end
  end

  def self.down
    drop_table :members
  end
end
