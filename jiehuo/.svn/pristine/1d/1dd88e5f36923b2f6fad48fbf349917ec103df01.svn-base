# coding: utf-8
class FavoriteAsk < ActiveRecord::Base
  belongs_to :user
  belongs_to :ask

  validate :unique_the_favorite_ask, :on => :create

  def unique_the_favorite_ask
    if FavoriteAsk.exists?(:user_id=>self.user_id, :ask_id=>self.ask_id)
      errors.add(:unique_the_favorite_ask,"一个题目只能被收藏一次")
    end
  end

end
