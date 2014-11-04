<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConvLiveFund.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.ConvLiveFund" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>公积金查询</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <div id="container1" class="container container_bg">
        <div id="alert1"  class="row alert alert-warning fade in" style="margin-right: 0px;">
            查询社保详情，可访问<a href="http://www.nbgjj.com/web/singlepage.aspx?id=1" target="_blank">“宁波住房公积金查询系统”</a>。
        </div> 
        <div id="reqForm" style="width: 400px;">
        <form role="form" class="form-horizontal" id="form1" runat="server">
            <div class="form-group">
                <label for="txtUser" class="col-md-3 control-label" >个人账号：</label>
                <div class="col-md-2" style="width: 300px;">
                    <input type="text" class="form-control" id="txtUser" autofocus="true" maxlength="20" placeholder="">
                </div>
          </div>
          <div class="form-group">
                <label for="txtId" class="col-md-3 control-label">身份证号：</label>
                <div class="col-md-2" style="width: 300px;">
                    <input type="text" class="form-control" id="txtId"  maxlength="20"  placeholder="">
                </div>
          </div>
            
            <div class="form-group" id="pwdInput">
                <label for="txtPwd" class="col-md-3 control-label" >密码：</label>
                <div class="col-md-2" style="width: 300px;">
                    <input type="text" class="form-control" id="txtPwd"  maxlength="30"  placeholder="">
                </div>
            </div>
            <div class="form-group">
            <div class="col-md-offset-3 col-md-2" style="width: 300px;">
              <button type="submit" class="btn btn-primary btn-block">查询</button>
            </div>
          </div>

           
        </form>
       
        </div>
        <div class="form-group">
            <p class="bg-info help-block text-center" ><small>注意：个人帐户和身份证号只需填写一项，不要填写两项！个人初始查询密码为：111111</small></p>
        </div>
    </div>

    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
 
</body>
</html>
