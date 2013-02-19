class Ask < ActiveRecord::Base
  self.set_primary_key :ask_id
  belongs_to :user
  belongs_to :project
  has_many :answers
  has_and_belongs_to_many :sections

  mount_uploader :image, ImageUploader


  def self.home_all_ask page_size
    where("state=1").order("ask_id desc").limit(page_size).all()

  end

  def self.home_ask_with_project page_size, project_id
    where("state=1 and project_id=?", project_id).order("ask_id desc").limit(page_size).all()
  end

  def self.user_asks_count(ask)
    user_id_key = ask.user_id
    $redis.zincrby("user_asks_count", 1, user_id_key)
  end

  #ajax查询选中project的题目
  def self.home_ajax_with_proj ask_id, project_id, page_size, page_num
    Ask.where("state=1 and ask_id< ? and project_id = ?", ask_id, project_id).order("ask_id desc").limit(page_size).offset(page_size*page_num)

  end

  #ajax查询所有project的题目
  def self.home_ajax_with_all ask_id, page_size, page_num
    Ask.where("state=1 and ask_id< ?", ask_id).order("ask_id desc").limit(page_size).offset(page_size*page_num)

  end

  def self.ajax_count_new_ask_with_all new_ask_id
    Ask.where("state=1 and ask_id>?", new_ask_id.to_i).count
  end

  def self.ajax_count_new_ask_with_proj  new_ask_id,project_id
    Ask.where("state=1 and ask_id>? and project_id = ?", new_ask_id,project_id).count
  end


end
