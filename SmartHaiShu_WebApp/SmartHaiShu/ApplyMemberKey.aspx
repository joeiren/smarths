<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyMemberKey.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.ApplyMemberKey" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>申请修改密码</title>
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
         $("#document").ready(function() {
             $("#txtUser").blur(function() {
                 var text = $("#txtUser").val();
                 if (text.length < 6 || text.length > 20) {
                     //$("#userTip").removeClass("hidden");
                     $("#inputUser").addClass("has-error");
                 } else {
                     //$("#userTip").addClass("hidden");
                     $("#inputUser").removeClass("has-error");
                     $.ajax({
                         type: 'POST',
                         url: 'Register.aspx/CheckUserName',
                         contentType: "application/json; charset=utf-8",
                         data: "{'name':'" + text + "'}",
                         success: function(result) {
                             if (result.d == "1") {
                                 $("#userTip").empty().append("未找到该注册用户！").removeClass("hidden");
                             } else {
                                 $("#userTip").empty().addClass("hidden");
                             }
                         }
                     });
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
             var vcode = $("#txtVCode").val();
             $("#form1 input").blur();
             var errorFiled = $("#form1 > div[class='row has-error']").first();
             if (errorFiled.length != 0 || !$("#userTip").hasClass("hidden")) {
                 return false;
             } else {
                 $('#resultDlg').modal({ keyboard: false });
                 $("#myModalLabel").empty().append("正在发送邮件中...");
                 $("#resultContent").empty().removeClass("bg-danger");
                 $("#resultDlg").modal('show');
                 signSuccess = false;

                 var input = "{'user':'" + user + "','vcode':'" + vcode + "'}";
                 $.ajax({
                     type: 'POST',
                     url: 'Register.aspx/OnApplyMemberKey',
                     contentType: "application/json; charset=utf-8",
                     data: input,
                     success: function (result) {
                         var data = eval("(" + result.d + ")");
                         if (data.Code == "1") {
                             $("#myModalLabel").empty().append("发送成功");
                             $("#resultContent").empty().removeClass("bg-danger").append("密码修改链接已经发送到你的邮箱");
                             signSuccess = true;
                         } else {
                             $("#myModalLabel").empty().append("发送失败");
                             $("#resultContent").empty().append(data.Message).addClass("bg-danger");
                         }
                     },
                     error: function (result) {
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
            <li class="active"><a href="#">申请找回密码</a></li>
            <li class="btn-link"><a href="/SmartHaiShu/Register.aspx" >免费注册</a></li>
        </ul>
        <div class="tab-content  tabContainer" >
            <div class="tab-content  active ">
                <form role="form"  id="form1">
                    <div class="row">
                        <label class="col-md-offset-2  col-md-6 signin-head">申请找回密码</label>
                    </div>
                    <p></p>
                    <div class="row" id="inputUser">   
                        <div class="col-md-offset-2  col-md-4">
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <input class="form-control" type="text" id="txtUser" autofocus="true" required="" placeholder="用户名" maxlength="20"/>
                            </p>
                             <span class="bg-info help-block" >6-20位的数字和字母!</span>
                        </div>
                        <div id="userTip" class="alert alert-danger col-md-2 hidden"></div> 
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
                    
                    <p></p>
                    <div class="row last">
                        <div class="col-md-offset-2 col-md-4">
                            <button type="submit" class="btn btn-primary btn-block" id="btnSignin" onclick="return resultShow();">发送找回密码申请到用户注册邮箱</button>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="resultDlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">发送成功</h4>
                          </div>
                          <div class="modal-body" id="resultContent">
                            密码修改链接已经发送到你的邮箱！
                          </div>
            
                        </div>
                      </div>
                    </div>
                    
                    
                </form>
            
        </div>
        </div>
     </div>
    </div>
</body>
</html>
