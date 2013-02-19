# encoding: utf-8
require 'digest/sha1'


class User < ActiveRecord::Base
  self.set_primary_key :user_id
  has_many :asks
  has_many :favorite_asks
  has_many :answers
  has_many :comments
  has_many :FollowedProjects
  has_many :projects, :through => :FollowedProjects
  belongs_to :school
  #has_and_belongs_to_many :projects 朱侃用through替代2012，5，2


  #头像上传
  mount_uploader :avatar, AvatarUploader


  #devise 用户系统集成，目前集成邮件找回,登录,自动登录,统计,邀请 模块

  devise :recoverable, :database_authenticatable, :rememberable, :trackable, :invitable, :invite_for => 2.weeks

  validates :email, :presence => {:message => "email不能为空!"}, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "email格式不对!"}, :uniqueness => {:message => "email已被注册!"}

  validates :school, :presence => {:message => "学校不能为空!"}, :on => :create

  validates :password, :presence => {:message => "密码不能为空!"}, :confirmation => {:message => "密码不一致"}, :on => :create


  attr_accessor :password_confirmation
  attr_accessor :password
  attr_accessor :school_text
  attr_accessor :inviter





  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.encrypted_password = Sha1CryptoMethod.encrypt(password, password_salt)
  end


  def create_new_salt
    self.password_salt = self.object_id.to_s + rand.to_s
  end

  def follow?(be_follow_user_id)

    if Follower.exists?({:follower_id => self.id, :be_follower_id => be_follow_user_id})
      false
    else
      @follower = Follower.new
      @follower.follower_id = self.id
      @follower.be_follower_id = be_follow_user_id
      @follower.save()
      true
    end
  end


  def valid_password?(password)
    Sha1CryptoMethod.matches?(self.encrypted_password, password, self.password_salt)
  end

  private
  def password_non_blank
    errors.add("密码", "不能为空!") if password.blank?
  end


  def self.update_user_info(id, user)
    @user = User.find(id)
    @user.update_attributes!(user)
  end


end
