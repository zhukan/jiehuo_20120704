//控件验证：答案：如果用户没有填写题型的答案，那么系统认为用户不知道答案，系统将“我不知道答案”项存入数据库中
$(function(){
    //初始化页面
    //1）题型默认选择单选题
    $('#ask_ask_type_1').attr("checked",true);

    //控件验证：每个问题必须有对应的知识点
    //value：检测的对象的值
    //element：检测的对象
    //检测方法：检测隐藏域中是否有name属性形如（section_hidden[8]）
    $(":submit[id=tijiao]").click(function(check){
        //找到section_ul下的所有input hidden元素
        var section_hidden =  $("#section_ul input:hidden");

        //如果没有input hidden元素则禁止提交
        if (section_hidden.length == 0){
            //显示禁止提交提示
            $('#validate_section').attr("style","display: block;");
            check.preventDefault();
        }else{
           //如果存在input hidden则判断hidden元素上是否存在名字以section_hidden的元素，如果没有代表没有选择任何知识点，禁止提交
           if($("#section_ul input[name^='section_hidden']").length==0){
               $('#validate_section').attr("style","display: block;");
               check.preventDefault();
           }
        }
    });

    //控件验证：当F选项有值时，E选项不能为空
    $("#xuanxiang_f").blur(function() {
        $("#xuanxiang_e").valid();
    });

    $("#new_ask").validate({
        //debug:true,
        rules:{
            "ask[body]":{
               required:true,
               maxlength:500
            },
            // 1）当题型为单选题或者多选题时，A,B,C,D 4个选项不能为空
            "xuanxiang[a]":{
               required: true,
               maxlength:200
            },
            "xuanxiang[b]":{
               required:true,
               maxlength:200
            },
            "xuanxiang[c]":{
               required:true,
                maxlength:200
            },
            "xuanxiang[d]":{
               required:true,
                maxlength:200
            },
            // 2）当F选项有值时，E选项不能为空
            "xuanxiang[e]":{
                required: function (element) {
                  var el_value =  $("#xuanxiang_f").val();
                  return $.trim(el_value).length != 0;
                },
                maxlength:200
            },
            "xuanxiang[f]":{
                maxlength:200
            },
            "ask[comment]":{
                maxlength:500
            },
            "ask[image]":{
                //判断上传的图片格式是不是JPG,GIF,PNG中的一种，如果不是则提交不成功
                accept:"jpg|gif|png"
            }
        },
        messages:{
            "ask[body]":{required:"题目不能没有题干哦！",maxlength:"题干最多能输入500个中文字哦！"},
            "xuanxiang[a]":{required:"A不能为空",maxlength:"选项能输入200个中文字哦！"},
            "xuanxiang[b]":{required:"B不能为空",maxlength:"选项能输入200个中文字哦！"},
            "xuanxiang[c]":{required:"C不能为空",maxlength:"选项能输入200个中文字哦！"},
            "xuanxiang[d]":{required:"D不能为空",maxlength:"选项能输入200个中文字哦！"},
            "xuanxiang[e]":{required:"E不能为空",maxlength:"选项能输入200个中文字哦！"},
            "xuanxiang[f]":{maxlength:"选项能输入200个中文字哦！"},
            "ask[comment]":{maxlength:"选项能输入500个中文字哦！"},
            "ask[image]":{accept:"你上传的图片错了，仅支持JPG,GIF,PNG图片文件哦！"}
        },
        errorPlacement:function(error,element)
        {
            var t = element.parent();
            element.removeClass("error");
            t.next("div").html(error.html());
            t.next("div").addClass("error1");
            t.next("div").show();
        },
        success: "valid"
    });

});

    function doDomainclicked(var_li) {
    //拼装筛选器名称，筛选器统一选择li标签id
    li_selector = "#" + var_li.id;
    clearAllStyle(li_selector);
    doClicked(li_selector);

    var a_selector = '';
    //取当前LI标签下的A标签下的隐藏域节点值,该节点的值就是被选中的的domain的ID
    var domainValue = $(li_selector).children().children().attr("value");

    if (domainValue != "" && typeof(domainValue) != "undefined") {
        $.get("/asks/get_projects_by_domain/" + domainValue, function (data) {

            $('#projects_ul').html("");
            $('#section_ul').html("");

            for (var i = 0; i < data.length; i++) {
                $("<li onclick='doProjectclicked(this)' id='project_li_" + data[i].project_id + "'><a href='javascript:void(0);' id='project_a_" + data[i].project_id + "'>" + data[i].name + "</a></li>").appendTo($('#projects_ul'));
                a_selector = '#project_a_' + data[i].project_id;
                $("<input type='hidden'" + "value=" + data[i].project_id + ">").appendTo($(a_selector));
            }
        }, "json");
    }
    else return;
}

function doProjectclicked(var_li) {
    li_selector = "#" + var_li.id;
    clearAllStyle(li_selector);
    doClicked(li_selector);
    var a_selector = '';
    var projectValue = $(li_selector).children().children().attr("value");
    if (projectValue != '' && typeof(projectValue) != "undefined") {
        $.get("/asks/get_sections_by_project/" + projectValue, function (sdata) {
            $('#section_ul').html("");
            for (var i = 0; i < sdata.length; i++) {
                $("<li onclick='doSectionClicked(this)' id='section_li_" + sdata[i].section_id + "'><a href='javascript:void(0);' id='section_a_" + sdata[i].section_id + "'>" + sdata[i].name + "</a></li>").appendTo($('#section_ul'));
                a_selector = '#section_a_' + sdata[i].section_id;
                $("<input type='hidden'" + "value=" + sdata[i].section_id +">").appendTo($(a_selector));
            }
        }, "json");
    } else {
        retun;
    }
}

function doSectionClicked(var_li) {
    li_id = $(var_li).attr("id");
    li_id_subs = li_id.substring(11);
    var hidd_name =  "section_hidden["+li_id_subs+"]";

    if ($(var_li).attr("style") == null) {
        $(var_li).css("background", "url(/assets/abg.jpg) no-repeat");
        $(var_li).children().children().attr("name",hidd_name);
        //显示禁止提交提示
        $('#validate_section').attr("style","display: none;");
    } else {
        $(var_li).removeAttr("style");
        $(var_li).children().children().removeAttr("name");
    }
}

function clearAllStyle(var_li){
    //查找在同一UL中的LI，如果有标签style则清除
   ul_selector= '#'+$(var_li).parent().attr("id");
   $(ul_selector).children().removeAttr("style");
}

function doClicked(var_li)
{
    if ($(var_li).attr("style") == null) {
        $(var_li).css("background", "url(/assets/abg.jpg) no-repeat")
    } else {
        $(var_li).removeAttr("style");
    }
}

//当用户点击“新增选项”链接
//新增一个选项，E或者F，并且在最有一个选项后面加上“减号”按钮，用户点击该按钮能隐藏该选项
//如果新增的选项已经是F了，则隐藏“添加选项”链接
function add_option(){
    var ask_type = $("input[name='ask[ask_type]']:checked").val();
    if($('#li_e_option').attr("style") != null){
        $('#li_e_option').removeAttr("style");
        $("input[name='xuanxiang[e]']").after('<input type="button" onclick="doRemoveOption(this)" id="btn_remobeOption" class="kuangbtn" name="aaaaa" value=""/>');

        //在答案下拉框中添加新的选项
        //如果用户选择了单选题则在在单选下拉框中添加新的选项
        //如果选择了多选题则在多选项中添加新的项
        if(ask_type == 1){
            $("#daan_danxuan_sel").append('<option value="E">E</option>');
        }

        if(ask_type == 2){
            $("#daan_duoxuan").append('<input type="checkbox" value="E"/><a name="E">E</a>');
        }

    }else{
        $('#li_f_option').removeAttr("style");
        $("#btn_remobeOption").remove();
        $("input[name='xuanxiang[f]']").after('<input type="button" onclick="doRemoveOption(this)" id="btn_remobeOption" class="kuangbtn" name="aaaaaa" value=""/>');
        $('#div_add_option').hide();

        if(ask_type == 1){
            $("#daan_danxuan_sel").append('<option value="F">F</option>');
        }

        if(ask_type == 2){
            $("#daan_duoxuan").append('<input type="checkbox" value="F"/><a name="F">F</a>');
        }
    }
}

//点击最后一个选项中的减号按钮，自动清空该选项text框中的内容
//并且将该Text控件隐藏
//并且显示“新增选项”链接
function doRemoveOption(val_btn){
   var li_dom = $(val_btn).parent().parent();
   li_dom.hide();
   $(val_btn).prev().attr("value","");
   $(val_btn).remove();
   $('#div_add_option').show();
   if(li_dom.attr("id") === "li_f_option"){
       $("input[name='xuanxiang[e]']").after('<input type="button" onclick="doRemoveOption(this)" id="btn_remobeOption" class="kuangbtn" name="aaaaaa" value=""/>');
   }

   //删除选项中的选项的同时，删除答案中的最后一个项
   var ask_type = $("input[name='ask[ask_type]']:checked").val();
    //单选的情况
    if(ask_type == 1){
        $("#daan_danxuan_sel>option").last().remove();
    }
    //多选的情况
    if(ask_type == 2){
        $("#daan_duoxuan :checkbox").last().remove();
        $("#daan_duoxuan>a").last().remove();
    }
}

function askType_danxuan(){
    //将单选题的答案项设置成可见
    var danxuan = $('#daan_danxuan :input');
    $("#li_e_option").hide();
    $("#xuanxiang_e").val("");
    $("#li_f_option").hide();
    $("#xuanxiang_f").val("");
    $("#div_add_option").show();

    $("#daan_duoxuan").children().each(function(){
        //alert($(this).attr("value"));
        if($(this).attr("value")=="E"||$(this).attr("value")=="F"||$(this).attr("name")=="E"||$(this).attr("name")=="F"){
            $(this).remove();
        }
    });

    danxuan.each(function(i){
        if(this.name==""){
            this.name = "daan[danxuan]";
        }
    });

    $('#daan_danxuan').show();
    //将单选题的选项区域制成可见
    $('#xuanxiang').show();

    //将其他题型的答案项设置成不可见
    $('#daan_duoxuan').hide();
    $('#daan_duoxuan :checkbox').removeAttr("name");

    $('#daan_panduan').hide();
    $('#daan_panduan :input').removeAttr("name");

    $('#daan_jianda').hide();
    $('#daan_jianda :input').removeAttr("name");
}

function askType_duoxuan(){
    //将单选题的答案项设置成可见
    var duoxuan = $('#daan_duoxuan :checkbox');
    $("#li_e_option").hide();
    $("#xuanxiang_e").val("");
    $("#li_f_option").hide();
    $("#xuanxiang_f").val("");
    $("#div_add_option").show();

    $("#daan_danxuan_sel>option").each(function(){
        //alert($(this).attr("value"));
        if($(this).attr("value")=="E"||$(this).attr("value")=="F"){
            $(this).remove();
        }
    });

    duoxuan.each(function(i){
        if(this.name==""){
            this.name = "daan[duoxuan]["+i+"]";
        }
    });

    $('#daan_duoxuan').show();
    //将单选题的选项区域制成可见
    $('#xuanxiang').show();

    //将其他题型的答案项设置成不可见
    $('#daan_danxuan').hide();
    $('#daan_danxuan :input').removeAttr("name");

    $('#daan_panduan').hide();
    $('#daan_panduan :input').removeAttr("name");

    $('#daan_jianda').hide();
    $('#daan_jianda :input').removeAttr("name");
}

function askType_panduan(){
    //将判断题的答案项设置成可见
    var panduan = $('#daan_panduan :input');
    panduan.each(function(){
        if(this.name==""){
            this.name = "daan[panduan]";
        }
    });
    $('#daan_panduan').show();

    //隐藏选项区
    $('#xuanxiang').hide();
    //隐藏非判断题的答案项区域
    $('#daan_danxuan').hide();
    $('#daan_danxuan :input').removeAttr("name");

    $('#daan_duoxuan').hide();
    $('#daan_duoxuan :checkbox').removeAttr("name");

    $('#daan_jianda').hide();
    $('#daan_jianda :input').removeAttr("name");
}

function askType_jianda(){
    //将简答题的答案项设置成可见
    var jianda = $('#daan_jianda :input');
    jianda.each(function(){
        if(this.name==""){
            this.name = "daan[jianda]";
        }
    });

    $('#daan_jianda').show();
    //隐藏选项区
    $('#xuanxiang').hide();
    //隐藏非判断题的答案项区域
    $('#daan_danxuan').hide();
    $('#daan_danxuan :input').removeAttr("name");

    $('#daan_duoxuan').hide();
    $('#daan_duoxuan :checkbox').removeAttr("name");

    $('#daan_panduan').hide();
    $('#daan_panduan :input').removeAttr("name");
}

function do_no_daan(){
    //检查no[daan]单选框是否已经被选择，如果没有被选择，则选择，并且设置4个答案空间为不可用
    if($('#no_daan').attr('checked')==undefined)
    {
        //当取消勾选上“我不知道答案”选框时
        //重新激活所有答案控件
        $('#daan_danxuan :input').attr("disabled",false);
        $('#daan_duoxuan :checkbox').attr("disabled",false);
        $('#daan_panduan :input').attr("disabled",false);
        $('#daan_jianda :input').attr("disabled",false);

    }else{
        //当勾选上我不知道答案选框时
        //清空所有答案控件中的内容，使其不能提交到服务器
        $('#daan_danxuan :input').attr("value","");
        $('#daan_duoxuan :checkbox').removeAttr("checked");
        $('#daan_panduan :input').attr("value","");
        $('#daan_jianda :input').attr("value","");
        //同时，将答案的控件设置成不可用
        $('#daan_danxuan :input').attr("disabled",true);
        $('#daan_duoxuan :checkbox').attr("disabled",true);
        $('#daan_panduan :input').attr("disabled",true);
        $('#daan_jianda :input').attr("disabled",true);
    }
}







