<%@ Page Title="社区动态" Language="C#" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master" AutoEventWireup="true" CodeBehind="SheQuDongTai.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.SheQuDongTai" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/pgwslider.min.css" rel="stylesheet">
    <style type="text/css">
    /*body { margin: 0px; background-color: #000000; }
    .m{ width: 800px; height: 600px; margin-left: auto; margin-right: auto; margin-top: 10%; }*/
    </style>
    <link href="css/SheQuDongTai.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    
    <script src="js/pgwslider.min.js"></script>
    
    <script type="text/javascript">
        SmartHS_mode = "2";
        $(document).ready(function () {
            $(document).ready(function () {
                $('.pgwSlider').pgwSlider();
            });

        });
        function showDlg(title, id, type) {
            $("#noticeTitle").html(title);
            $("#noticeTime").html('');
            $("#noticeContent").html('');
            $('#dlgContent').modal({
                keyboard: false
            });
            var func = type == 1 ? "GetSpecialFC" : "GetSpecialNotice";
            $.ajax({
                type: 'POST',
                url: 'CommonInvoke.aspx/' + func,
                contentType: "application/json; charset=utf-8",
                data: "{'noticeId':'" + id + "'}",
                success: function (result) {
                    var data = eval("(" + result.d + ")");
                    if (data.ReleaseTime != undefined) {
                        $("#noticeTime").html(data.ReleaseTime);
                    }
                    if (data.Content != undefined) {
                        $("#noticeContent").html(data.Content);
                    }
                },
                error: function (result) {
                }

            });
           
            $('#dlgContent').modal("show");

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container-fluid">
        <div class="row">
        <div style="float: left;">
            <div class="pgw-slide" id="pgw-slide">
                <ul class="pgwSlider">
				    <%--<li><img src="images/paris.jpg" alt="Paris, France" data-description="Eiffel Tower and Champ de Mars"></li>
				    <li><img src="images/new-york.jpg" alt="Montréal, QC, Canada" data-large-src="images/new-york.jpg"></li>
				    <li> <img src="images/shanghai.jpg"> <span>Shanghai, China</span> </li>
				    <li> <a href="http://www.jq22.com" target="_blank"> <img src="images/new-york.jpg"> <span>New York, NY, USA</span> </a> </li>--%>
                    <li><img src="images/active1.jpg" alt="绿色出行" data-description=""></li>
                    <li><img src="images/active2.jpg" alt="大家一起来行动" data-description=""></li>
                    <li><img src="images/active3.jpg" alt="牵起你我他" data-description=""></li>
                    <li><img src="images/active4.jpg" alt="梨园风采" data-description=""></li>
		        </ul>
            </div>
        </div>
         <div style="float: left;margin-left: 12px;width: 240px; ">
                <div class="panel panel-default">
                    <div class="panel-heading  text-center" style="background-color: #D9EDF7;color:#31708F; "><strong>社区简介</strong></div>
                      <div class="panel-body" id="intro1" style="height: 380px;overflow-y:auto;line-height:23px;">
                       <%=Introduction%>
                      </div>
                </div>
            </div>
       </div>
       <div class="row">
           <div class="col-sm-6 col-md-6" style="padding-left: 30px;">
               <ul class="list-group">
                  <li class="list-group-item list-group-item-info" ><strong>社区通告</strong><span class="badge" style="background-color:lightsalmon"><a href="NoticeDetail.aspx?Type=0">更多</a></span></li>
                  <asp:Repeater ID="RepeaterNotice" runat="server">
                  <ItemTemplate>
                   <li class="list-group-item"><a id="notice_" + <%# Eval("Id")%> href='javascript:showDlg("<%# Eval("Title")%>", <%# Eval("Id")%>, 0)'><%# Eval("Title")%></a></li>
                  </ItemTemplate>
                  </asp:Repeater>
                 <%-- <li class="list-group-item"><a href="#">Dapibus ac facilisis in</a></li>
                  <li class="list-group-item"><a href="#">Dapibus ac facilisis in</a></li>
                  <li class="list-group-item"><a href="#">Dapibus ac facilisis in</a></li>
                  <li class="list-group-item"><a href="#">Dapibus ac facilisis in</a></li>--%>
                </ul>
           </div>
           <div class="col-sm-6 col-md-6" style="padding-right: 30px;">
               <ul class="list-group">
                  <li class="list-group-item list-group-item-info"><strong>社区风采</strong><span class="badge" style="background-color:lightsalmon"><a href="NoticeDetail.aspx?Type=1">更多</a></span></li>
                  <asp:Repeater ID="RepeaterFengcai" runat="server">
                  <ItemTemplate>
                   <li class="list-group-item"><a id="notice_" + <%# Eval("Id")%> href='javascript:showDlg("<%# Eval("Title")%>", <%# Eval("Id")%>, 1)'<%-- data-toggle="modal" data-target="#dlgContent"--%>><%# Eval("Title")%></a></li>
                  </ItemTemplate>
                  </asp:Repeater>
               
                </ul>
           </div>
       </div>

       <div class="modal fade" id="dlgContent">
          <div class="modal-dialog ">
            <div class="modal-content">
              <div class="modal-header" >
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title text-center" id="noticeTitle"></h4>
                <label class="pull-right bg-info " id="noticeTime" style="margin-right:100px;"></label>
                
              </div>
              <div class="modal-body" style=" line-height:26px;" id="noticeContent">
              </div>
              
            </div>
          </div>
        </div>
    </div>
    
    

    <%--<div class="w">
        <div id="pgw-o-slide">

          
        </div>

       
    </div>--%>
    


</asp:Content>
