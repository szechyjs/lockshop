class AddCodeToKey < ActiveRecord::Migration
  def self.up
    add_column :keys, :code, :string
  end

  def self.down
    remove_column :keys, :code
  end
end
