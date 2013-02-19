function signin() {
    window.location.href = "/users/sign_in"
}


/**
 * 验证表单必输项
 */
$(function () {
    $("#new_user").validate({
        rules:{
            "user[email]":{required:true, email:true},
            "user[password]":{
                required:true,
                rangelength:[6, 12]
            },
            "user[password_confirmation]":{
                required:true,
                rangelength:[6, 12],
                equalTo:'#user_password'
            },
            "user[name]":{
                required:true,
                maxlength:5
            },
            "user[school_text]":{
                required:true
            }
        },
        messages:{
            "user[email]":{required:"邮箱不能为空"},
            "user[password]":{required:"密码不能为空"},
            "user[password_confirmation]":{required:"重复不能为空"},
            "user[name]":{required:"名称不能为空", maxlength:"名称长度不能超过5个字"},
            "user[school_text]":{required:"请选择学校"}
        },
        errorPlacement:function (error, element) {
            if (element.attr("id") == "user_school_text") {
                var t =  $("#user_reg_school_text_error")
                element.removeClass("error");
                t.html(error.html());
                t.addClass("error");
                t.show();
            }
            else {
                var t = element;
                element.removeClass("error");
                t.next("div").html(error.html());
                t.next("div").addClass("error");
                t.next("div").show();
            }


        },
        success:"valid"
    })
})

/**
 * 验证email唯一性
 */
$(function () {
    $("#user_email").blur(function () {
        if ($("#new_user").validate().element("#user_email")) {
            $.ajax({
                type:"POST",
                url:"/user_sessions/email_unique_ajax",
                data:"email=" + this.value
            });
        }
    })
})


/**
 * Created by JetBrains RubyMine.
 * User: robust
 * Date: 12-4-19
 * Time: 上午9:55
 * To change this template use File | Settings | File Templates.
 */
