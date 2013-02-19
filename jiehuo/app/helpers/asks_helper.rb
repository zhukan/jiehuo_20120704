# coding: utf-8
module AsksHelper
  def format_ask_body_item(one_ask)
    #单选或者多选题时，需要取出已“|”分割的选项，并在前面添加A，B,C......
    if one_ask.the_ask.ask_type == "1" || one_ask.the_ask.ask_type == "2"
      body_items = one_ask.the_ask.body_item
      @a = ("A、".."Z、").to_a
      @body_items_array = body_items.split("[split]")

      @body_items_array.delete("")

      @body_items_array.each_with_index do |body_item, i|
        @i = i
        @body_items_array[i] = @a[i]+body_item
      end
    else
      #判断题和简答题没有选项选项，需要去掉body_item字段中的“/”
      @body_items_array = []
    end
  end

  def format_ask_result(one_ask)
    @ask_result = one_ask.the_ask.result

    @result_array = @ask_result.split("|")
    @result_array.delete("")

    @result_array.each_with_index do |item, i|
      @result_array[i] = item
    end
    @result_array
  end

  def choose_answer_type_by_ask_type(ask_type)
    if ask_type.eql?("1")
      @choices =@a[0..@i]
      @choices.each_with_index do |choice,i|
        @choices[i]=choice.gsub(/[、]/,"")
      end
      return render(:partial =>'/answers/answer_type/single_choice',:object =>@choices)
    end

    if ask_type.eql?("2")
      @choices =@a[0..@i]
      @choices.each_with_index do |choice,i|
        @choices[i]=choice.gsub(/[、]/,"")
      end
        return render(:partial =>'/answers/answer_type/multiple_choice',:object =>@choices)
    end

    if ask_type.eql?("3")
      return render(:partial =>'/answers/answer_type/judgment')
    end

    if ask_type.eql?("4")
      return render(:partial =>'/answers/answer_type/saq')
    end
  end
end
