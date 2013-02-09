class InterestUsersController < ApplicationController

  def get_interest_users
    @next_page = params[:current_page].to_i
    @li_interest_user = InterestUser.get_int_users(current_user.id,@next_page)
  end

end
