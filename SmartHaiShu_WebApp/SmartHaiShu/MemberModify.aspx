<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberModify.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.MemberModify" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户修改</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"  media="screen"/>
    <link href="css/signin.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#txtPwd1").blur(function() {
                var length = $("#txtPwd1").val().length;
                if (length < 6 || length > 24) {
                    $("#pwdInput1").removeClass("has-success");
                    $("#pwdInput1").addClass("has-error");
                } else {
                    $("#pwdInput1").removeClass("has-error");
                }

                if ($("#txtPwd2").val().length > 0) {
                    if ($("#txtPwd1").val() != $("#txtPwd2").val()) {
                        $("#confirmPwd").removeClass("hidden");
                    } else {
                        $("#confirmPwd").addClass("hidden");
                    }
                }
            });
            $("#txtPwd2").blur(function() {
                var length = $("#txtPwd2").val().length;
            if (length < 6 || length > 24) {
                $("#pwdInput2").removeClass("has-success");
                $("#pwdInput2").addClass("has-error");
            } else {
                $("#pwdInput2").removeClass("has-error");
            }

            if ($("#txtPwd1").val() != $("#txtPwd2").val()) {
                $("#confirmPwd").removeClass("hidden");
            } else {
                $("#confirmPwd").addClass("hidden");
            }
            });

        });
        function invalidRequest() {
            alert("该网页链接是无效的或者已过期,将会跳转到首页");
            location.href = "/SmartHaiShu/index.aspx";
        }

        function signinFirst() {
             alert("请先登录才能做信息修改");
            location.href = "/SmartHaiShu/SignIn.aspx";
        }

        function showInputCurrPwd() {
            $("#inputCurrPwd").removeClass("hidden");
        }

        function currPwdValidate() {
            if ($("#inputCurrPwd").hasClass("hidden")) {
                $("#inputCurrPwd").removeClass("has-error");
                return;
            } else {
                var length = $("#txtCurrPwd").val().length;
                if (length < 6 || length > 24) {
                    $("#inputCurrPwd").removeClass("has-success").addClass("has-error");
                } else {
                    $("#inputCurrPwd").removeClass("has-error");
                }
            }
        }



//        function pwd2Validate() {
//            var length = $("#txtPwd2").val().length;
//            if (length < 6 || length > 24) {
//                $("#pwdInput2").removeClass("has-success");
//                $("#pwdInput2").addClass("has-error");
//            } else {
//                $("#pwdInput2").removeClass("has-error");
//            }

//            if ($("#txtPwd1").val() != $("#txtPwd2").val()) {
//                $("#confirmPwd").removeClass("hidden");
//            } else {
//                $("#confirmPwd").addClass("hidden");
//            }
//        }

        var modified = false;

        function resultShow() {
            $("#form1 input").blur();
            var errorFiled = $("#form1 > div[class='row has-error']").first();
            if (errorFiled.length != 0 || !$("#confirmPwd").hasClass("hidden")) {
                return false;
            } else {
                var pwd1 = $("#txtPwd1").val();
                var pwd2 = $("#txtPwd2").val();
                var user = $("#txtUser").val();
                var orignal = $("#txtCurrPwd").val();
                var input = "{'user':'" + user + "','pwd1':'" + pwd1 + "','pwd2':'" + pwd2 + "','orignal':'" + orignal + "','session':" + <%=SessionVerifyId %> + "}";
                modified = false;
                 $("#myModalLabel").empty().append("正在发送修改密码...");
                 $("#resultContent").empty().removeClass("bg-danger");
                  $('#resultDlg').modal({ keyboard: false });
                 $("#resultDlg").modal('show');
                $.ajax({
                    type: 'POST',
                    url: 'Register.aspx/ResetMemberKey',
                    contentType: "application/json; charset=utf-8",
                    data: input,
                    success: function(result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == "1") {
                            $("#result_footer").removeClass("hidden");
                            $("#myModalLabel").empty().append("密码修改成功");
                            $("#resultContent").empty().removeClass("bg-danger");
                            modified = true;
                        } else {
                            $("#result_footer").addClass("hidden");
                            $("#myModalLabel").empty().append("密码修改失败");
                            $("#resultContent").empty().append(data.Message).addClass("bg-danger");
                        }
     
                    },
                    error: function(result) {
                    }
                });
                return false;
            }
        }
    </script>
</head>
<body>
   <div class="container">
        <div class="row">
           <div class="col-sm-12 col-md-12">
                <div class="col-sm-10 col-md-10">
                    <a href="index.aspx"><img src="images/main/logo_simple.png"  ></a>
                </div> 
            </div>
           </div>
        <div class="col-md-10">
        <ul class="nav nav-tabs">
            <li class="active"><a href="#">修改密码</a></li>
            <li class="btn-link"><a href="/SmartHaiShu/Register.aspx" >免费注册</a></li>
        </ul>
        <div class="tab-content  tabContainer" >
            <div class="tab-content  active ">
                <form role="form"  id="form1" runat="server">
                    <p></p>
                    <div class="row" id="inputUser">   
                        <div class="col-md-offset-2  col-md-4">
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <asp:TextBox CssClass="form-control" type="text" ID="txtUser" autofocus="true" required="" Enabled="false"  maxlength="20" runat="server"/>
                            </p>
                        </div>
                    </div>
                    <div class="row hidden" id="inputCurrPwd">
                          <div class="col-md-offset-2  col-md-4">
                                <p class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input class="form-control" type="password" id="txtCurrPwd" autofocus="true" required="" placeholder="当前密码" maxlength="24" onblur="currPwdValidate();"/>
                                </p>
                                <span class="bg-info help-block hidden" id="currPwdTip">密码长度6-24位!</span>
                          </div>
                    </div>

                    <div class="row" id="pwdInput1">
                          <div class="col-md-offset-2  col-md-4">
                                <p class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input class="form-control" type="password" id="txtPwd1" autofocus="true" required="" placeholder="新密码" maxlength="24" />
                                </p>
                                <span class="bg-info help-block" id="pwdTip1">密码长度6-24位!</span>
                          </div>
                    </div>
                    
                    <div class="row" id="pwdInput2">
                          <div class="col-md-offset-2  col-md-4">
                                <p class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input class="form-control" type="password" id="txtPwd2" autofocus="true" required="" placeholder="确认新密码" maxlength="24" />
                                </p>
                                <span class="bg-info help-block" id="pwdTip2">密码长度6-24位!</span>
                          </div>
                          <div id="confirmPwd" class="alert alert-danger col-md-3 hidden">两次输入密码不一致！</div> 
                    </div>
                    
                    <p></p>
                    <div class="row last">
                        <div class="col-md-offset-2 col-md-4">
                            <button type="submit" class="btn btn-primary btn-block" id="btnSignin" onclick="return resultShow();">确认修改</button>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="resultDlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">正在发送修改密码...</h4>
                          </div>
                          <div class="modal-body" id="resultContent">
                            
                          </div>
                          <div class="modal-footer hidden" id="result_footer">
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
                            <button type="button" class="btn btn-primary" onclick="location.href ='/SmartHaiShu/SignIn.aspx'">跳转到用户登陆</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    
                    
                </form>
            
        </div>
        </div>
     </div>
    </div>
    <script type="text/javascript">
        $('#resultDlg').on('hidden.bs.modal', function () {
//            if (modified)
//                location.href = "/SmartHaiShu/SignIn.aspx";
        });    
 </script>
</body>
</html>
