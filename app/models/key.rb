class Key < ActiveRecord::Base
  belongs_to :keyway
  has_many :cores
  
  validates :code,	:presence => true,
					:length => { :minimum => 6, :maximum => 7 }
  
  validates_uniqueness_of :marking, :allow_blank => true, :allow_nil => true
end
