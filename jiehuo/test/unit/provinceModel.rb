

class ProvinceModel
  # Called before every test method runs. Can be used
  # to set up fixture information.
  def test_read
    open('d:\province.txt') do |f|
      rd =  f.readline
      puts "------"
      puts rd

    end

  end

end


