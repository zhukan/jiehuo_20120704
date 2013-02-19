class Area < ActiveRecord::Base
  self.set_primary_key :area_id



  validates_uniqueness_of :name,
                          :on => :create,
                          :message => "is already being used"
end
