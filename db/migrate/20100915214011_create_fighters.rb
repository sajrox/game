class CreateFighters < ActiveRecord::Migration
  def self.up
    create_table :fighters do |t|
      t.references :member
      t.string :name,
        :null   => false,
        :limit  => 40
    end
  end

  def self.down
    drop_table :fighters
  end
end
