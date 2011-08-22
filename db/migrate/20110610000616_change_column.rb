class ChangeColumn < ActiveRecord::Migration
  def self.up
	change_table :keys do |t|
		t.change :keyway_id, :integer
		t.change :keytype_id, :integer
	end
  end

  def self.down
		change_table :keys do |t|
		t.change :keyway_id, :string
		t.change :keytype_id, :string
	end
  end
end
