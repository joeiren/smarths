<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EduInfo.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.EduInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>教育资讯</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            var currpage = 1;
            var pageList = 5;
            var maxPageNo = 1;

            function trunPage(pageNo, next) {

                if (next == undefined) {
                    if (pageNo != currpage) {
                        location.href = "EduInfo.aspx?PageNo=" + pageNo;
                    }

                } else {
                    if ((currpage != maxPageNo && next) || (!next && currpage != 1))
                        location.href = "EduInfo.aspx?PageNo=" + currpage + "&Next=" + next;
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
                    maxIndex = maxIndex == 0 ? pageList : maxIndex;
                    $("#pageNoArea li:gt(" + maxIndex + ")").not("#pageNext").addClass("hidden");
                    $("#pageNext").addClass("disabled");
                } else {
                    $("#pageNoArea li").removeClass("hidden");
                    $("#pageNext").removeClass("disabled");
                }
            }
        </script>
    </head>
    <body>
        <form id="form1" runat="server">
            <div id="container1" class="container container_bg">
       
                <div class="row" style="margin-right: 0px;">
                    <div class="panel-group" id="accordion">
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex + 1 %>">
                                            <%# Eval("Title") %>
                                        </button>
                         
                                    </div>
                        
                                    <div id="collapse<%#Container.ItemIndex + 1 %>"  class="<%#Container.ItemIndex == 0 ? "panel-collapse collapse in" : "panel-collapse collapse" %> ">
                                        <div class="panel-body" style="font-size: 12px; height: 200px; overflow-y: auto;">
                                            <%# Eval("Contents") %>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
                <div class="row text-center">
                    <ul class="pagination pagination-sm " id="pageNoArea">
                        <li id="pagePrev"><a href="javascript:trunPage(<%= Page1 %>,false)">&laquo;</a></li>
                        <li><a href="javascript:trunPage(<%= Page1 %>);"><%= Page1 %></a></li>
                        <li><a href="javascript:trunPage(<%= Page1 + 1 %>);"><%= Page1 + 1 %></a></li>
                        <li><a href="javascript:trunPage(<%= Page1 + 2 %>)"><%= Page1 + 2 %></a></li>
                        <li><a href="javascript:trunPage(<%= Page1 + 3 %>)"><%= Page1 + 3 %></a></li>
                        <li><a href="javascript:trunPage(<%= Page1 + 4 %>)"><%= Page1 + 4 %></a></li>
                        <li id="pageNext"><a href="javascript:trunPage(<%= Page1 + 4 %>,true)">&raquo;</a></li>
                    </ul> 
                </div>
            </div>
    
        </form>
     
    </body>
</html>