class CreateKeys < ActiveRecord::Migration
  def self.up
    create_table :keys do |t|
      t.string :name
      t.string :marking
      t.string :description
      t.string :keytype_id
      t.string :keyway_id

      t.timestamps
    end
  end

  def self.down
    drop_table :keys
  end
end
