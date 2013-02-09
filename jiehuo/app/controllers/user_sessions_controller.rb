# coding: UTF-8
class UserSessionsController < ApplicationController

  ##验证email 唯一性

  def email_unique_ajax
    @email_user = User.find_by_email(params[:email])
  end


  ##学校列表
  def school_ajax
    provinceid = params[:provinceid]
    @schools = School.find_all_by_provinceid(provinceid).map { |u| [u.name, u.id] };
    @area = Area.all(:order => "name").map { |u| [u.name, u.id] }
    respond_to do |format|
      format.js
    end
  end

  #登录用户内部注册
  def register
    #reset_last_captcha_code!
    @provinces = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }
    @schools = []
    @user = User.new
    render :layout => "devise_default"
  end

  def register_create
    @user = User.new(params[:user])
    @schools = []
    @provinces = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }
    if (User.find_by_email(params[:user][:email]))
      flash[:notice]="exist_email"
      return render :action => "register", :layout => "sigin"
    end

    unless captcha_valid? params[:captcha]
      flash[:notice] = "validate_code"
      # reset_last_captcha_code!
      return render :action => "register", :layout => "sigin"
    end

    if (email_unique_ajax != nil)
      flash[:notice] = "exist_email"
      return redirect_to "/register"
    end

    respond_to do |format|
      if @user.save
        sign_in(:user, User.find_by_email(params[:user][:email]))
        format.html { redirect_to "/" }
      else
        format.html { render :action => "register", notice: 'User create failture.' }
      end
    end
  end


end
