class DevisePasswordsController <Devise::PasswordsController

  layout "devise_default"


  protected

  #重置密码后跳转
  def after_sending_reset_password_instructions_path_for(resource_name)
    "/users/password/reset_pw_send_mail_ok"
  end

  def new
    super
  end



end