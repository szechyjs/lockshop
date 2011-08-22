class Core < ActiveRecord::Base
  belongs_to :keyway
  has_many :keys
end
