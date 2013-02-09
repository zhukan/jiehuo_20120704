class School < ActiveRecord::Base
  self.set_primary_key :school_id
  validates_uniqueness_of :name,
                          :on => :create,
                          :message => "is already being used"
  has_many :user

end
