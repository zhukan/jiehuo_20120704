class OneProject
  attr_reader :project_base,:asks_count

  def initialize(project_base)
    @project_base = project_base
    @asks_count= get_asks_count
  end

  def get_asks_count
    $redis.zscore("project_asks_count",@project_base.project_id)
  end

end