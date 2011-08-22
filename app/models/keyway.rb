class Keyway < ActiveRecord::Base
  has_many :keys
  has_many :cores
end
