<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户登录</title>
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
             $("#txtUser").blur(function() {
                 var text = $("#txtUser").val();
                 if (text.length < 6 || text.length > 20) {
                     $("#userTip").removeClass("hidden");
                     $("#inputUser").addClass("has-error");
                 } else {
                     $("#userTip").addClass("hidden");
                     $("#inputUser").removeClass("has-error");
                 }
             });

             $("#txtPwd").blur(function () {
                 var text = $("#txtPwd").val();
                 if (text.length < 6 || text.length > 20) {
                     $("#pwdTip").removeClass("hidden");
                     $("#inputPwd").addClass("has-error");
                 } else {
                     $("#pwdTip").addClass("hidden");
                     $("#inputPwd").removeClass("has-error");
                 }
             });
         });
         function checkVCode() {
             var text = $.trim($("#txtVCode").val());

             if (text.length != 6) {
                 $("#inputVCode").addClass("has-error");
             } else {
                 $.ajax({
                     type: 'POST',
                     url: 'Register.aspx/ValidateVerfiyCode',
                     contentType: "application/json; charset=utf-8",
                     data: "{'input':'" + text + "'}",
                     success: function (result) {
                         if (result.d == "1") {
                             $("#inputVCode").removeClass("has-error");
                         } else {
                             $("#inputVCode").addClass("has-error");
                         }
                     }
                 });
             }
         }
         var signSuccess = false;
         function resultShow() {
             var user = $("#txtUser").val();
             var pwd = $("#txtPwd").val();
             $("#form1 input").blur();
             var errorFiled = $("#form1 > div[class='row has-error']").first();
             if (errorFiled.length != 0 ) {
                 return false;
             } else {
                 $('#resultDlg').modal({ keyboard: false });
                 $("#myModalLabel").empty().append("正在登录中...");
                 $("#resultContent").empty().removeClass("bg-danger");
                 $("#resultDlg").modal('show');
                 signSuccess = false;
                 var remember = $("#chkRemember")[0].checked;
                 var input = "{'user':'" + user + "','pwd':'" + pwd + "','remember':"+ remember+ "}";
                 $.ajax({
                     type: 'POST',
                     url: 'Register.aspx/OnSignin',
                     contentType: "application/json; charset=utf-8",
                     data: input,
                     success: function(result) {
                         var data = eval("(" + result.d + ")");
                         if (data.Code == "1") {
                             $("#myModalLabel").empty().append("登录成功");
                             $("#resultContent").empty().removeClass("bg-danger");
                             signSuccess = true;
                         } else {
                             $("#myModalLabel").empty().append("登录失败");
                             $("#resultContent").empty().append(data.Message).addClass("bg-danger");
                         }
                        // $("#resultDlg").modal('show');
                     },
                     error: function(result) {
                     }
                 });
             }
             return false;

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
            <li class="active"><a href="#">用户登录</a></li>
            <li class="btn-link"><a href="/SmartHaiShu/Register.aspx" >免费注册</a></li>
        </ul>
        <div class="tab-content  tabContainer" >
            <div class="tab-content  active ">
                <form role="form"  id="form1">
 <%--                   <div class="row">
                        <label class="col-md-offset-2  col-md-6 signin-head">用户登录</label>
                    </div>--%>
                    <p></p>
                    <div class="row" id="inputUser">   
                        <div class="col-md-offset-2  col-md-4">
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input class="form-control" type="text" id="txtUser" autofocus="true" required="" placeholder="用户名" maxlength="20"/>
                            </p>
                            <span class="bg-info help-block hidden" id="userTip">6-20位的数字和字母!</span>
                        </div>
                    </div>
                    <div class="row" id="inputPwd">
                          <div class="col-md-offset-2  col-md-4">
                                <p class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                    <input class="form-control" type="password" id="txtPwd" autofocus="true" required="" placeholder="密码" maxlength="24"/>
                                </p>
                                <span class="bg-info help-block hidden" id="pwdTip">密码长度6-24位!</span>
                          </div>
                    </div>
                    
                     <div class="row" id="inputVCode">
                        <div class="col-md-offset-2 col-md-2" >
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-check"></span></span>
                                <input type="text" class="form-control " maxlength="6" ID="txtVCode" required=""   onblur="checkVCode();"/>
                            </p>
                        </div>
                        <div class="col-md-2">
                            <img id="verifyCode" title="点击刷新" src="/SmartHaiShu/VerifyCode.aspx" style="cursor:pointer" onclick="this.src=this.src+'?'" />
                        </div>
    
                    </div>
                    <div class="row" id="autoSignInput">
                          <div class="col-md-offset-2 col-md-5 ">
                            <div class="checkbox col-md-5" >
                                <label>
                                    <input type="checkbox" id="chkRemember"  text=""> 自动登录</input>
                                </label>
                            </div>
                            <div class="col-md-4 pull-left"><%--<a href="/SmartHaiShu/ApplyMemberKey.aspx" >忘记密码？</a>--%>
                                <button class="btn  btn-link" value="忘记密码？" onclick="location.href='/SmartHaiShu/ApplyMemberKey.aspx?#'">忘记密码？</button>
                            </div>
                        </div>
                        
                    </div>
                    <p></p>
                    <div class="row last">
                        <div class="col-md-offset-2 col-md-4">
                            <button type="submit" class="btn btn-primary btn-block" id="btnSignin" onclick="return resultShow();">登录</button>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="resultDlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">登录成功！</h4>
                          </div>
                          <div class="modal-body" id="resultContent">
                            
                          </div>
                          <%--<div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                          </div>--%>
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
           if (signSuccess)
            location.href = "/SmartHaiShu/index.aspx";
       });    
 </script>      
</body>
</html>
