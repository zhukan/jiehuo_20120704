# coding: UTF-8
class UserProfileController < ApplicationController
  def basic
    @schools = []
    @user = current_user
    @provinces = Province.all.collect { |p| [p.province, p.provinceid] }
    if current_user.provinceid
      @citys_with_province = City.find_all_by_fatherid(current_user.provinceid).map { |u| [u.city, u.cityid] }
    end
  end

  def passwd
    @user = current_user
  end

  def city_with_province_ajax
    province_id = params[:province_id]
    @ajax_citys = City.find_all_by_fatherid(province_id).map { |u| [u.city, u.cityid] }
  end

  def update_user_basic_info
    User.update_user_info(current_user.id, params[:user])
    redirect_to "/user_profile/basic", notice: '基本资料修改成功.'
  end

  def update_user_passwd
    old_password = params[:old][:password]
    return redirect_to "/user_profile/passwd", notice: '当前密码错误.' unless Sha1CryptoMethod.matches?(current_user.encrypted_password, [old_password, current_user.password_salt])
    return redirect_to "/user_profile/passwd", notice: '新密码为空.' if   params[:user][:password].blank?
    return redirect_to "/user_profile/passwd", notice: '密码不一致.' unless    params[:user][:password] == params[:user][:password_confirmation]
    User.update_user_info(current_user.id, params[:user])
    sign_in(User.find(current_user.id), :bypass => true)
    respond_to do |format|
      format.html { redirect_to "/user_profile/passwd", notice: '密码修改成功.' }
    end
  end

  #关注同学
  def follow
    if current_user.follow?(params[:id])
      @interest_user=InterestUser.first(:conditions => {:cur_user_id => current_user.id, :int_user_id => params[:id]})
      if @interest_user
        @interest_user.update_attribute(:state, 0)
      end
      render(:partial => '/share/follow', :object => true, :locals => {:user_id => params[:id]})
    else
      render(:partial => '/share/follow', :object => false, :locals => {:user_id => params[:id]})
    end
  end

  #取消关注同学
  def unfollow
    if InterestUser.exists?(:cur_user_id => current_user.id, :int_user_id => params[:id])
      InterestUser.first(:conditions => {:cur_user_id => current_user.id, :int_user_id => params[:id]}).update_attribute(:state, 2)
    end
    @follower = Follower.where(:follower_id => current_user.id, :be_follower_id => params[:id])
    @follower.destroy_all
    render(:partial => '/share/unfollow', :locals => {:user_id => params[:id]})
  end

  #不感兴趣
  def unconcern
    InterestUser.first(:conditions => {:cur_user_id => current_user.id, :int_user_id => params[:id]}).update_attribute(:state, 3)
    render(:partial => '/share/unconcern', :locals => {:user_id => params[:id]})
  end

  def user_avatar
    @user = current_user
  end

  def upload_avatar
    @user = current_user
    @user.avatar = params[:user][:avatar]
    begin
      respond_to do |format|
        if @user.save!
          format.html { redirect_to "/user_profile/user_avatar" }
        else
          format.html { redirect_to "/user_profile/user_avatar", notice: '头像上传失败.' }
        end
      end
    rescue ActiveRecord::RecordInvalid
      redirect_to "/user_profile/user_avatar", :notice => '头像上传失败,图片格式不对.'
    end
  end

end
