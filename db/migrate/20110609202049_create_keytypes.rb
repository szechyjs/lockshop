class CreateKeytypes < ActiveRecord::Migration
  def self.up
    create_table :keytypes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :keytypes
  end
end
