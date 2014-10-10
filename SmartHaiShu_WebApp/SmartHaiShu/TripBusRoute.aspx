<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripBusRoute.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripBusRoute" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>公交查询</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    
    </head>
    <body>
        <form id="form1" runat="server">
            <div id="container1" class="container container_bg">
       
                <div class="row">
                    <div class="panel-group" id="accordion">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex + 1 %>">
                                            <%# Eval("Name") %>
                                        </button>
                         
                                    </div>
                        
                                    <div id="collapse<%#Container.ItemIndex + 1 %>"  class="<%#Container.ItemIndex == 0 ? "panel-collapse collapse in" : "panel-collapse collapse" %> ">
                                        <div class="panel-body" style="font-size: 12px; height: 85px; overflow-y: auto;">
                                            <%# Eval("Line") %>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="row text-center">
                    <ul class="pagination pagination-sm " id="pageNoArea">
                        <%--<ul class="pager">--%>
                        <li id="pagePrev"><a href="javascript:trunPage(<%= Page1 %>,false)">&laquo;</a></li>
                        <li><a href="javascript:trunPage(<%= Page1 %>);"><%= Page1 %></a></li>
                        <li><a href="javascript:trunPage(<%= Page1 + 1 %>);"><%= Page1 + 1 %></a></li>
                        <li><a href="javascript:trunPage(<%= Page1 + 2 %>)"><%= Page1 + 2 %></a></li>
                        <li><a href="javascript:trunPage(<%= Page1 + 3 %>)"><%= Page1 + 3 %></a></li>
                        <li><a href="javascript:trunPage(<%= Page1 + 4 %>)"><%= Page1 + 4 %></a></li>
                        <li id="pageNext"><a href="javascript:trunPage(<%= Page1 + 4 %>,true)">&raquo;</a></li>
                    </ul> 
                </div>
                <div id="alert1"  class="row alert alert-warning fade in">
                    查询更多公交线路信息，可参照<a href="http://www.nb84.net/" target="_blank">“宁波公交查询”</a>。
                </div> 
            </div>
            <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
            <script src="js/bootstrap.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                var currpage = 1;
                var pageList = 5;
                var maxPageNo = 1;

                function trunPage(pageNo, next) {

                    if (next == undefined) {
                        if (pageNo != currpage) {
                            location.href = "TripBusRoute.aspx?PageNo=" + pageNo;
                        }

                    } else {
                        if ((currpage != maxPageNo && next) || (!next && currpage != 1))
                            location.href = "TripBusRoute.aspx?PageNo=" + currpage + "&Next=" + next;
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

                    if (totalNo == pageNo || totalNo < pageNo + (pageList - index)) {
                        $("#pageNoArea li:gt(" + index + ")").not("#pageNext").addClass("hidden");
                        $("#pageNext").addClass("disabled");
                    } else {
                        $("#pageNoArea li").removeClass("hidden");
                        $("#pageNext").removeClass("disabled");
                    }
                }
            </script>
        </form>
    </body>
</html>