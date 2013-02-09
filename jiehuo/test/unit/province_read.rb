# coding: UTF-8
class ProvinceRead
  # To change this template use File | Settings | File Templates.
  # coding: UTF-8
  def self.test_read
    open('d:\1.txt').each  do |f|
    puts "------"
    puts f.split(/,/)
    end

  end

  test_read


end
