<%@ Page Title="社区动态" Language="C#" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master" AutoEventWireup="true" CodeBehind="NoticeInfo.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.NoticeInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        SmartHS_mode = "2";
        function setActiveContent(id,content) {
            $('#content'+ id).html(content);
        }


       
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">
    <div class="row">
        <div class="panel-group col-md-8 col-md-offset-1"  id="accordion">
            <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                <div class="panel panel-info">
                    <div class="panel-heading" style="height:40px;">
                        <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%# Eval("Id")%>">
                        <%# Eval("Title")%>
                        </button>
                        <%-- <a data-toggle="collapse" data-toggle="collapse" data-parent="#accordion" href="#collapse<%#Container.ItemIndex+1 %>">
                                 
                        </a>--%>
                         
                    </div>
                        
                    <div id="collapse<%# Eval("Id")%>"  class="<%#Container.ItemIndex==0? "panel-collapse collapse in" : "panel-collapse collapse" %> ">
                        <div class="panel-body" style="font-size: 12px;height:200px;overflow-y:auto; " id="content<%# Eval("Id")%>">
                       dddddddddddd
                        </div>
                    </div>
                    </div>
                    </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
   <%-- <div class="row text-center">
        <ul class="pagination pagination-sm " id="pageNoArea">
     
            <li id="pagePrev"><a href="javascript:trunPage(<%=Page1%>,false)">&laquo;</a></li>
            <li><a href="javascript:trunPage(<%=Page1%>);"><%=Page1%></a></li>
            <li><a href="javascript:trunPage(<%=Page1 + 1%>);"><%=Page1 + 1%></a></li>
            <li><a href="javascript:trunPage(<%=Page1 + 2%>)"><%=Page1 + 2%></a></li>
            <li><a href="javascript:trunPage(<%=Page1 + 3%>)"><%=Page1 + 3%></a></li>
            <li><a href="javascript:trunPage(<%=Page1 + 4%>)"><%=Page1 + 4%></a></li>
            <li id="pageNext"><a href="javascript:trunPage(<%=Page1 + 4%>,true)">&raquo;</a></li>
        </ul> 
    </div>--%>
</div>
</asp:Content>
