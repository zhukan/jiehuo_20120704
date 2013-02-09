class Section < ActiveRecord::Base
  self.set_primary_key :section_id
  belongs_to :project
  has_and_belongs_to_many :asks

end
