# coding: utf-8
class InterestUser < ActiveRecord::Base
  before_update :calc_int_users_before_update

  PAGE_SIZE = 5

  def calc_int_users_before_update
    if InterestUser.count(:conditions => ["cur_user_id=? and state=1",self.cur_user_id]) == 1
      InterestUsersCalc.calc_one_user(self.cur_user_id)
    end
  end

  def self.get_int_users(current_user_id,page_num)
      @page_num = page_num

      if InterestUser.exists?(:cur_user_id=> current_user_id,:state=>1)
        display_int_users(current_user_id)
      else
        InterestUsersCalc.calc_one_user(current_user_id)
        display_int_users(current_user_id)
    end
  end

  private

  def self.display_int_users(current_user_id)
    all_int_user_num = count_int_users(current_user_id)

    #if @page_num*PAGE_SIZE > all_int_user_num
    if all_int_user_num == 0
      all_int_user_num = 1
    else
      @page_num = ((@page_num*PAGE_SIZE) % all_int_user_num)/PAGE_SIZE
    end
    User.find_by_sql(["select us.user_id, us.name, us.avatar,ius.reason from users us,interest_users ius where us.user_id in(select ius.int_user_id from interest_users ius where ius.cur_user_id = ? and ius.state = 1 ) and us.user_id = int_user_id and ius.cur_user_id =? order by ius.score desc, ius.created_at desc limit ?,?",current_user_id,current_user_id,PAGE_SIZE*@page_num,PAGE_SIZE])
  end

  def self.count_int_users(current_user_id)
     User.count_by_sql(["select count(*) from users us,interest_users ius where us.user_id in(select ius.int_user_id from interest_users ius where ius.cur_user_id = ? ) and us.user_id = int_user_id and ius.cur_user_id =?",current_user_id,current_user_id])
  end

end
