Iknow::Application.routes.draw do



   #用户系统模块
  devise_for :users, :controllers => {:passwords => :devise_passwords,:invitations=>:devise_invitations,:sessions=>:devise_sessions} do
    #密码重置后跳转页面
    match '/users/password/reset_pw_success', :to => 'devise_passwords#reset_pw_success'
    #密码重置邮件发送成功后跳转页面
    match '/users/password/reset_pw_send_mail_ok', :to => 'devise_passwords#reset_pw_send_mail_ok'


  end

  #注册验证码路由
  captcha_route

  get "user_profile/basic"

  root :to => 'home#index'
  get "home/index"

  match '/follow/:id', :to => 'user_profile#follow#:id', :as => 'follow'
  match '/unfollow/:id', :to => 'user_profile#unfollow#:id', :as => 'unfollow'
  match '/unconcern/:id', :to => 'user_profile#unconcern#:id', :as => 'unconcern'
  match '/projects/follow/:id', :to => 'projects#follow#:id', :as => 'follow_project'
  match '/an_answer_comments/:id', :to => 'comments#an_answer_comments#:id', :as => 'comments'
  match '/people/follow_project/:project_id', :to => 'people#follow_project#:project_id', :as => 'people_follow_project'
  match '/people/unfollow_project/:project_id', :to => 'people#unfollow_project#:project_id', :as => 'people_unfollow_project'
  match '/people/collect_the_ask/:ask_id',:to=>'people#collect_the_ask#:ask_id',:as => 'people_collect_the_ask'
  match '/people/uncollect_the_ask/:ask_id',:to=>'people#uncollect_the_ask#:ask_id',:as => 'people_uncollect_the_ask'
  match '/people/add_as_classmate/:user_id',:to=>'people#add_as_classmate#:user_id',:as => 'people_add_as_classmate'
  match '/people/subtract_the_classmate/:user_id',:to=>'people#subtract_the_classmate#:user_id',:as => 'people_subtract_the_classmate'

  match '/register', :to => 'user_sessions#register'
  match '/user_profile/basic', :to => 'user_profile#basic'
  match '/user_profile/passwd', :to => 'user_profile#passwd'
  match '/user_profile/user_avatar', :to => 'user_profile#user_avatar'

  match '/people/more_set_asks/:ask_id/:id',:to=>'people#more_set_asks#:ask_id#:id'
  match '/people/more_answered_asks/:ask_id/:id',:to=>'people#more_answered_asks#:ask_id#:id'
  match '/people/more_favorites_asks/:ask_id/:id',:to=>'people#more_favorites_asks#:ask_id#:id'

  match '/people/answered_asks/:id',:to=>'people#answered_asks#:id'
  match '/people/favorites_asks/:id',:to=>'people#favorites_asks#:id'
  match '/ask/hide_ask/:id',:to=>'asks#hide_ask#:id'

  #match '/asks', :to => 'home#index'
  resources :comments, :answers, :asks
  resources :people
  resources :projects #网站端project模块

  resource :user_sessions, :member => {:register => :post}

  get "interest_users/get_interest_users"

  #CSM下的路由，这些路由进入网站后台
  namespace :cms do
    resources :domains, :schools, :projects, :sections
    resources :users do
      collection do
        post :school_ajax
      end
    end
  end

#-------------------------

#ask.js中使用到
  match ':controller(/:action(/:id(.:format)))'


end
