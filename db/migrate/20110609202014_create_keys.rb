# LockShop - SFIC lock management
# Copyright (C) 2011  Jared Szechy
#
# LockShop is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# LockShop is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with LockShop.  If not, see <http://www.gnu.org/licenses/>.

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
