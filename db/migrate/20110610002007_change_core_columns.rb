class ChangeCoreColumns < ActiveRecord::Migration
  def self.up
	change_table :cores do |t|
		t.change :keyway_id, :integer
		t.change :change_id, :integer
		t.change :control_id, :integer
	end
  end

  def self.down
		change_table :cores do |t|
		t.change :keyway_id, :string
		t.change :change_id, :string
		t.change :control_id, :string
	end
  end
end
