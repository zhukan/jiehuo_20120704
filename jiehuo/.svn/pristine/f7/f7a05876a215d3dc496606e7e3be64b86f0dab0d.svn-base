class HotAsk
  attr_reader :user_name, :ask_count, :ask_id, :ask_body ,:user_id

  def initialize(user_name, ask_body, ask_id, ask_count,user_id)
    @user_name = user_name
    @ask_body = ask_body
    @ask_id = ask_id
    @ask_count = ask_count
    @user_id = user_id
  end


  def self.build_hot_ask ask_id, ask_count
    ask = Ask.find_by_ask_id ask_id
    user = User.find_by_user_id ask.user.user_id
    sim_body = ask.body
    if (sim_body.size>50)
      sim_body = sim_body.slice(0..50)+"..."
    end
    HotAsk.new(user.name, sim_body, ask_id, ask_count,user.user_id)
  end
end