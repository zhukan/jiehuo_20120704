# coding: utf-8
module PeopleHelper
  include AsksHelper

  def button_followed_project(user_id,project_id)
    if FollowedProject.exists?(:user_id=>user_id, :project_id=>project_id)
      raw "<a data-remote='true' href='/people/unfollow_project/#{project_id}'class='user_btn01' id='a_follow_link_#{project_id}'></a>"
    else
      raw "<a data-remote='true' href='/people/follow_project/#{project_id}' class='user_btn02' id='a_follow_link_#{project_id}'></a>"
    end
  end

  def a_favorite_ask(user_id,ask_id)
    if FavoriteAsk.exists?(:user_id=>user_id, :ask_id=>ask_id)
      raw "<a data-remote='true' href='/people/uncollect_the_ask/#{ask_id}' id='a_collect_ask_#{ask_id}'>取消收藏</a>"
    else
      raw "<a data-remote='true' href='/people/collect_the_ask/#{ask_id}' id='a_collect_ask_#{ask_id}'>收藏</a>"
    end
  end

  def show_project_asks_count(count)
     if count.nil?
       raw "还没有考题哦，去抢个沙发吧"
     else
       raw "在该学科下有#{count}道考题"
     end
  end

  def show_sex(person)
    if person.user_base.sex == "M" || person.user_base.sex == ""
      raw "<h3>学校：#{person.school.name}</h3>"
    else
      raw "<h2>学校：#{person.school.name}</h2>"
    end
  end

  def show_follow_button(user_id)
    if user_id != current_user.id
      if Follower.exists?(:follower_id=>current_user.id,:be_follower_id=>user_id)
        raw "<a data-remote='true' href='/people/subtract_the_classmate/#{user_id}' id='classmate_#{user_id}'><img border='0' src='/assets/btn27.jpg'></a>"#如果已关注，则显示取消关注按钮
      else
        raw "<a data-remote='true' class='jia' href='/people/add_as_classmate/#{user_id}' id='classmate_#{user_id}'><img border='0' src='/assets/btn18.jpg'></a>" #未关注，则显示加为同学按钮
      end
    end
  end

end
