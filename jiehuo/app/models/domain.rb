class Domain < ActiveRecord::Base
    self.set_primary_key :domain_id
    has_many :projects
end
