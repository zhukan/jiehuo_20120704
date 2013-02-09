class AddReasonToInterestUser < ActiveRecord::Migration
  def change
    add_column :interest_users, :reason, :string
  end
end
