<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"  media="screen"/>
    <link href="css/reg.css" rel="stylesheet" type="text/css"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
     <script type="text/javascript">
         var communityDic= new Object();
         $(document).ready(function () {
                 // load street
                 $.ajax({
                     type: 'POST',
                     url: 'Register.aspx/LoadStreet',
                     contentType: "application/json; charset=utf-8", 
                     success: function(result) {
                         var data = eval("(" + result.d + ")");
                         $.each(data, function(entryIndex, entry) {
                             var item = '<option value=' + '"' + entry["id"] + '">' +entry["name"] + '</option>';
                             $("#lstStreet").append(item);
                         });
                         reloadCommunity();
                     },
                     error: function(result) {
                     }
                
                 });
                 // load community
                 $("#lstStreet").change(function() {
                     reloadCommunity();
                 });

                 $("#contract").collapse({
                     toggle: false
                 });

                 $("#checkName").click(function () {
                     var text = $("#txtUser").val();
                     if (text.length >= 6 && text.length <= 20) {
                         $.ajax({
                             type: 'POST',
                             url: 'Register.aspx/CheckUserName',
                             contentType: "application/json; charset=utf-8",
                             data: "{'name':'" + text + "'}",
                             success: function(result) {
                                 if (result.d == "1") {
                                     $("#userInput").addClass("has-success");
                                     $("#userTip").empty().append("该用户名可以被注册！");
                                     $("#userTip").removeClass("hidden alert-danger");
                                     $("#userTip").addClass("alert-success");
                                 } else {
                                     $("#userInput").removeClass("has-success");
                                     $("#userTip").empty().append("该用户名已被注册！").removeClass("hidden alert-success").addClass("alert-danger");
                                 }
                             },
                             error: function(result) {
                             }
                         });
                     } else {
                         $("#userTip").addClass("hidden");
                     }
                    
                 });

                 $("#txtUser").blur(function () {
                     var text = $.trim($("#txtUser").val());
                     var reg = /^[0-9a-zA-Z]+$/;

                     if ((text.length < 6 || text.length > 20) || !reg.test(text)) {
                         $("#userInput").removeClass("has-success");
                         $("#userInput").addClass("has-error");
                     } else {
                         $("#userInput").removeClass("has-error");
                     }
                     $("#userTip").addClass("hidden");
                 });

                 $("#txtPwd1").blur(function () {
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

                 $("#txtPwd2").blur(function () {
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

                 $("#txtMail").blur(function () {
                     //var reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                     var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                     var text = $("#txtMail").val();
                     //if ($.trim(text).length > 0 && !reg.test(text)) {
                     if (!reg.test(text)) {
                         $("#mailInput").addClass("has-error");
                     } else {
                         $("#mailInput").removeClass("has-error");
                     }
                 });

                 $("#txtPhone").blur(function () {
                     var reg = /^1[3|4|5|8][0-9]\d{4,8}$/;
                     var text = $("#txtPhone").val();
                     if ($.trim(text).length > 0 && !reg.test(text)) {
                         $("#phoneInput").addClass("has-error");
                     } else {
                         $("#phoneInput").removeClass("has-error");
                     }

                 });

                 $("#txtVCode").blur(function() {
                     checkVCode();
                 });

                 $("#btnContract").mouseup(function () {
                     if ($("#contract").hasClass("collapse")) {
                         $("#contract").collapse("show");
                     }
                     else {
                         $("#contract").collapse("hide");
                     }
                 });
             }
         );

         function reloadCommunity() {
             var index = $("#lstStreet").children('option:selected').val();
             if (index > 0) {
                 if (communityDic[index] == undefined) {
                     $.ajax({
                         type: 'POST',
                         url: 'Register.aspx/FindCommunities',
                         contentType: "application/json; charset=utf-8",
                         data: "{'id':" + index + "}",
                         success: function(result) {
                             var data = eval("(" + result.d + ")");
                             if (data.length > 0) {
                                 communityDic[index] = data;
                                 appendCommunityItem(data);
                             }
                         },
                         error: function(result) {
                         }

                     });
                 } else {
                     appendCommunityItem(data);
                 }
             }
         }

         function appendCommunityItem(data) {
             $("#lstCommunity").children().remove();
             //$("#lstCommunity").append('<option value="0"> </option>');
             $.each(data, function (entryIndex, entry) {
                 var item = '<option value="' + entry["id"] + '">' + entry["name"] + '</option>';
                 $("#lstCommunity").append(item);
             });
             $("#lstCommunity").get(0).selectedIndex = 0;
         }

         function showContract() {
             if ($("#contract").hasClass("collapse")) {
                 $("#contract").collapse("show");
             }
             else {
                 $("#contract").collapse("hide");
             }
         }

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
                    },
                    error: function (result) {
                    }
                });
            }
        }

        var success = false;
        function submitCheck() {
            $("#readTip").addClass("hidden");
            $("#form1 input").blur();
            var errorFiled = $("#form1 > div[class='row has-error']").first();
            if (errorFiled.length != 0 || !$("#confirmPwd").hasClass("hidden")) {
                 return false;
             } else {
                 if (!$("#chkRead")[0].checked) {
                     $("#readTip").removeClass("hidden");
                     return false;
                 } else {
                     success = false;
                     $('#resultDlg').modal({ keyboard: false });
                     $("#myModalLabel").empty().append("正在注册中...");
                     $("#resultContent").empty().removeClass("bg-danger");
                     $("#resultDlg").modal('show');
                     var input = "{'user':'" + $("#txtUser").val() + "','pwd1':'" + $("#txtPwd1").val() + "','pwd2':'" + $("#txtPwd2").val() + "','community':" + $("#lstCommunity").val() + ",'vcode':'" + $("#txtVCode").val() + "', 'phone':'" + $("#txtPhone").val() + "','mail':'" + $("#txtMail").val() +"'}";
                     $.ajax({
                         type: 'POST',
                         url: 'Register.aspx/OnRegister',
                         contentType: "application/json; charset=utf-8",
                         data: input,
                         success: function (result) {
                             var data = eval("(" + result.d + ")");
                             if (data.Code == 1) {
                                 $("#myModalLabel").empty().append("注册成功");
                                 $("#resultContent").empty().removeClass("bg-danger");
                                 $("#resultFoot").removeClass("hidden");
                                 success = true;
                                //  $("#registerContract").removeClass("hidden").addClass("alert-info");
                                //  $("#resultMsg").empty().append(data.Message).append("5秒钟后浏览器会自动跳转的"+ "<a href='index.aspx'> 首页</a> ");
                             } else {
                                // $("#registerContract").removeClass("alert-info hidden").addClass("alert-danger");
                                // $("#resultMsg").empty().append(data.Message);
                                 $("#myModalLabel").empty().append("注册失败");
                                 $("#resultContent").empty().append(data.Message).addClass("bg-danger");
                                 $("#resultFoot").addClass("hidden");
                             }
                         },
                         error: function (result) {
                             //alert(result);
                         }

                     });
                     return false;
                 }
             }
         }
     </script>
</head>
<body>
  
    <div class="container" >
        <div class="row">
            <div class="col-sm-12 col-md-12">
                <a href="index.aspx"><img src="images/main/logo_simple.png"  ></a>
            </div>
            
        </div>
        <ul class="nav nav-tabs">
            <li class="active"><a href="#">用户注册</a></li>
            <li class="btn-link"><a href="/SmartHaiShu/SignIn.aspx" >已有注册账号，马上登录</a></li>
        </ul>
    
        <div class="tab-content tabContainer    " >
            <div class="tab-content active ">
                <p></p>
                <form role="form" class="form-horizontal" id="form1" runat="server">
                   <div class="row" id="userInput">
                        <label for="txtUser" class="col-md-3 control-label">
                            <span class="required-field">*</span>用户名：
                        </label>
                        <div class="col-md-4">
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                <asp:TextBox CssClass="form-control" ID="txtUser" MaxLength="20" autofocus="true" required="" placeholder="用户名"  runat="server">
                                    
                                </asp:TextBox>
                                
                                <span class="input-group-btn ">
                                    <button type="button" class="btn btn-block" id="checkName">
                                        <span class="glyphicon glyphicon-eye-open"></span>
                                    </button>
                                </span>
                                
                            </p>
                            <span class="bg-info help-block" >6-20位的数字和字母!请注意，用户名注册后不能更改!</span>
                        </div>
                        <div id="userTip" class="alert alert-danger col-md-2 hidden"></div>  
                    </div>
                    <div class="row" id="pwdInput1">
                        <label for="txtPwd1" class="col-md-3 control-label"><span class="required-field">*</span>密码：</label>
                        <div class="col-md-4">
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <asp:TextBox type="password" class="form-control" maxlength="24" id="txtPwd1" required="" placeholder="请输入密码"  runat="server"/>
                            </p>
                            <span class="bg-info help-block">6-24位长度!</span>
                        </div>
                    </div>
            
                    <div class="row" id="pwdInput2">
                        <label for="txtPwd2" class="col-md-3 control-label"><span class="required-field">*</span>确认密码：</label>
                        <div class="col-md-4">
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
                                <asp:TextBox type="password" class="form-control" id="txtPwd2" required="" maxlength="24" placeholder="请再次输入密码"  runat="server"/>
                            </p>
                            <span class="bg-info help-block">6-24位长度!</span>  
                        </div>
                        <div id="confirmPwd" class="alert alert-danger col-md-2 hidden">两次输入密码不一致！</div>  
                    </div>
            
                    <div class="row" id="mailInput">
                        <label for="txtMail" class="col-md-3 control-label"><span class="required-field">*</span>邮箱地址：</label>
                        <div class="col-md-4">
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                                <asp:TextBox type="text" class="form-control" id="txtMail" placeholder="example@website.com" MaxLength="30"  runat="server"/>
                            </p> 
                            <span class="bg-info help-block" >请输入常用邮箱，作为找回密码所用。</span>   
                        </div>
                        
                    </div>
            
                    <div class="row" id="phoneInput">
                        <label for="txtPhone" class="col-md-3 control-label">手机号：</label>
                        <div class="col-md-4">
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                                <asp:TextBox type="text" class="form-control" id="txtPhone" placeholder="" MaxLength="15"  runat="server"/>
                            </p>  
                            <span class="bg-info help-block" >11位纯数字手机号码！</span>
                        </div>
                        
                    </div>
                
                    <div class="row">
                        <label for="txtPhone" class="col-md-3 control-label"><span class="required-field">*</span>所在社区：</label>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">街道</span>
                                <%--<asp:DropDownList runat="server" CssClass="form-control" ID="lstStreet" />--%>  
                                <select id="lstStreet" name="lstStreet" class="form-control"></select>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="input-group">
                                <span class="input-group-addon">社区</span>
                                <%--<asp:DropDownList runat="server" CssClass="form-control" ID="lstCommunity">
                                    <asp:ListItem Value="0"></asp:ListItem>
                                </asp:DropDownList>--%>
                                <select id="lstCommunity" name="lstCommunity" class="form-control"></select>
                              </div> 
                              <p></p>
                            <span class="bg-info help-block"></span>
                        </div>
                        
                    </div>
                    <div class="row" id="inputVCode">
                        <label for="txtVCode" class="col-md-3 control-label"><span class="required-field">*</span>验证码：</label>
                        <div class="col-md-2" >
                            <p class="input-group">
                                <span class="input-group-addon"><span class="glyphicon glyphicon-check"></span></span>
                                <asp:TextBox type="text" class="form-control " maxlength="6" ID="txtVCode" required=""   runat="server"/>
                            </p>
                        </div>
                        <div class="col-md-2">
                            <img id="verifyCode" title="点击刷新" src="/SmartHaiShu/VerifyCode.aspx" style="cursor:pointer" onclick="this.src=this.src+'?'" />
                        </div>
    
                    </div>
                    <p></p>
                    <p></p>
                    <div class="row " id="inputContract">
                        <div class="col-md-offset-3 col-md-6">
                            <div class="checkbox" >
                                <label>
                                    <input type="checkbox" id="chkRead"  text=""> 我已阅读并同意</input>
                                    <%--<asp:CheckBox ID="hasRead" Text="我已阅读并同意" runat="server"/>--%>
                                </label>
                                <button id="btnContract" type="button" class="btn btn-sm btn-link" id="contractInfo" data-toggle="collapse" data-target="#contract"
                                        onmouseup="return showContract();">《用户注册协议》</button>
                            </div>
                            
                        </div>
                        <div id="readTip" class="alert alert-danger col-md-2 hidden">请先选择阅读并同意！</div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-1 col-md-7 collapse" id="contract">
                            <textarea class="form-control"  rows="9" style="resize: none;" disabled>
                            <h3 align="center">用户注册协议</h3>
                            <p >
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </p>
                            <p>
                                123 Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                            </p>
                            </textarea>
                        </div>
                    </div>
                    <p></p>
                    <div class="row">
                        <div class="col-md-offset-3 col-md-3">
                            <asp:Button class="btn btn-primary btn-block" type="submit" Text="立即注册" OnClientClick="return submitCheck();" runat="server"/>
                        </div>
                    </div>
                    
                    
                    <div class="modal fade" id="resultDlg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">注册成功！</h4>
                          </div>
                          <div class="modal-body" id="resultContent">
                            
                          </div>
                          <div class="modal-footer hidden" id="resultFoot">
                            
                            <button type="button" class="btn btn-primary">跳转到首页</button>
                          </div>
                        </div>
                      </div>
                    </div>

                </form>
                <hr/>
            </div>
        </div>
    
       <%-- <div class="alert alert-info fade in hidden" id="registerContract">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        
            <p id="resultMsg"></p>
            <p>
          
            </p>
        </div> --%>
      </div>
    </div>
    
    
    <script type="text/javascript">
        $('#resultDlg').on('hidden.bs.modal', function () {
            if (success)
                location.href = "/SmartHaiShu/index.aspx";
        });    
 </script>  
</body>
</html>