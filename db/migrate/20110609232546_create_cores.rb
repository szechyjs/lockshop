class CreateCores < ActiveRecord::Migration
  def self.up
    create_table :cores do |t|
      t.string :name
      t.string :description
      t.string :marking
      t.string :change_id
      t.string :control_id
      t.string :keyway_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cores
  end
end
