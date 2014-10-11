<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowNotice.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.ShowNotice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Show Notice</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"  media="screen"/>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <%--<div class="modal-dialog ">
            <div class="modal-content">
              <div class="modal-header" >
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="false">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title text-center" id="noticeTitle">环保志愿者(社区青少年作文)</h4>
                <label class="pull-right bg-info " id="noticeTime" style="margin-right:100px;">2009-08-03 22:42:20</label>
                
              </div>
              <div class="modal-body" style=" line-height:26px;" id="noticeContent">
                 
              </div>
              
            </div>
          </div>--%>
          
          <div class="row">
              <h4 class="modal-title text-center" id="H1"><%=InfoTitle%></h4>
                <label class="pull-right bg-info " id="Label1" style="margin-right:100px;"><%=ReleaseTime%></label>
          </div>
          <div class="modal-body">
              <%=InfoContent%>
          </div>
    
    </div>
    </form>
</body>
</html>
