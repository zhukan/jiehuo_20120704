class DeviseInvitationsController< Devise::InvitationsController

  layout "devise_default"
  #邀请注册后设置密码及学校页面前action



  def edit
    @provinces = get_redis_provinces().map { |u| [u["province"], u["provinceid"]] }
    @schools = []
    super
  end

  def update
    super
  end


end