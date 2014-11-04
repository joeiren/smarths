<%@ Page Title="社区通告与风采" Language="C#" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master" AutoEventWireup="true" CodeBehind="NoticeDetail.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.NoticeDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
    <link href="css/siderbar.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript">
     SmartHS_mode = "2";
     
     var noticetype = <%=PageType %>;
     function changeType(type, scoper) {         
         if (noticetype == type) {
             return;
         }
         this.location.href = "NoticeDetail.aspx?Type=" + type;
     }

     function activeMenu(index) {
         $("#menu_list ul li").removeClass("active");
         $("#menu_list ul li:eq(" + index + ")").addClass("active");
     }

    var currpage = <%=PageNo%>;
    var pageList = <%=PageListNumber %>;
    var maxPageNo = 1;
    function trunPage(pageNo, next) {

        if (next == undefined) {
            if (pageNo != currpage) {
                location.href = "NoticeDetail.aspx?PageNo=" + pageNo + "&Type=" + noticetype;     
            }

        } else {
            if ((currpage != maxPageNo && next )|| (!next && currpage != 1))

            location.href = "NoticeDetail.aspx?PageNo=" + (currpage + (next?1:-1)) + "&Type=" + noticetype; 
        }
    }
    function pageNoSelector(pageNo, totalNo) {
        maxPageNo = totalNo;
        currpage = pageNo;
        $("#pageNoArea li").removeClass("active");
        var index = (currpage + pageList) % pageList;
        index = index == 0 ? pageList : index;
        $("#pageNoArea li").eq(index).addClass("active");
        if (currpage <= pageList) {
            $("#pagePrev").addClass("disabled");
        } else {
            $("#pagePrev").removeClass("disabled");
        }

        if (maxPageNo == pageNo || maxPageNo < pageNo + (pageList - index)) {
            var maxIndex = maxPageNo % pageList;
            maxIndex = maxIndex == 0? pageList : maxIndex; 
            $("#pageNoArea li:gt(" + maxIndex + ")").not("#pageNext").addClass("hidden");
            $("#pageNext").addClass("disabled");
        } else {
            $("#pageNoArea li").removeClass("hidden");
            $("#pageNext").removeClass("disabled");
        }
    }
     
 </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
     <div class="container-fluid">
      <div class="row" >
        <div class="col-md-3 sidebar" style="min-height:550px;" id="menu_list">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="javascript:changeType(0)">社区通告</a></li>
            <li><a href="javascript:changeType(1)">社区风采</a></li>
           <%-- <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>--%>
          </ul>
          <%--<ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>--%>
        </div>
        <div class="col-md-9 ">
          <%--<h1 class="page-header">Dashboard</h1>--%>

         <%-- <div class="row placeholders">
            <div class="row">--%>
        <div class="panel-group <%--col-sm-11  col-md-11--%>"  id="accordion">
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
                        <div class="panel-body" style="font-size: 12px;max-height:300px;overflow-y:auto;line-height:24px; " id="content<%# Eval("Id")%>">
                        <%# Eval("Content").ToString().TrimStart().TrimEnd()%>
                        </div>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            </div>

            <div class="row text-center">
            <ul class="pagination pagination-sm " id="pageNoArea">
            <%--<ul class="pager">--%>
              <li id="pagePrev"><a href="javascript:trunPage(<%=Page1%>,false)">&laquo;</a></li>
              <li><a href="javascript:trunPage(<%=Page1%>);"><%=Page1%></a></li>
              <li><a href="javascript:trunPage(<%=Page1 + 1%>);"><%=Page1 + 1%></a></li>
              <li><a href="javascript:trunPage(<%=Page1 + 2%>)"><%=Page1 + 2%></a></li>
              <li><a href="javascript:trunPage(<%=Page1 + 3%>)"><%=Page1 + 3%></a></li>
              <li><a href="javascript:trunPage(<%=Page1 + 4%>)"><%=Page1 + 4%></a></li>
              
              
              

              <li id="pageNext"><a href="javascript:trunPage(<%=Page1 + 4%>,true)">&raquo;</a></li>
            </ul> 
        </div>
      <%-- </div>
       </div>--%>
     </div>
        </div>
        </div>
</asp:Content>