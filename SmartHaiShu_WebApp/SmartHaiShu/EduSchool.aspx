<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EduSchool.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.EduSchool" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>学校讯息</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">

            var currpage = <%= PageNo %>;
            var pageList = <%= PageListNumber %>;
            var maxPageNo = 1;


            function trunPage(pageNo, next) {
                if (next == undefined) {
                    if (pageNo != currpage) {
                        location.href = "EduSchool.aspx?PageNo=" + pageNo;
                    }
                } else {
                    if ((currpage != maxPageNo && next) || (!next && currpage != 1))
                        location.href = "EduSchool.aspx?PageNo=" + (currpage + (next ? 1 : -1));
                }
            }

            function pageNoSelector(pageNo, totalNo) {
                var index = 0;
                var maxIndex = 0;

                maxPageNo = totalNo;
                currpage = pageNo;
                $("#pageNoArea li").removeClass("active");
                index = (currpage + pageList) % pageList;
                index = index == 0 ? pageList : index;
                $("#pageNoArea li").eq(index).addClass("active");
                if (currpage <= pageList) {
                    $("#pagePrev").addClass("disabled");
                } else {
                    $("#pagePrev").removeClass("disabled");
                }

                if (maxPageNo == currpage || maxPageNo < currpage + (pageList - index)) {
                    maxIndex = maxPageNo % pageList;
                    maxIndex = maxIndex == 0 ? pageList : maxIndex;
                    $("#pageNoArea li:gt(" + maxIndex + ")").not("#pageNext").addClass("hidden");
                    $("#pageNext").addClass("disabled");
                } else {
                    $("#pageNoArea li").removeClass("hidden");
                    $("#pageNext").removeClass("disabled");
                }
            }

            $(document).ready(function() {

            });
        </script>
    </head>
    <body>
        <form id="form1" runat="server">
            <div id="container1" class="container ">

                <div class="row ">
                    <div class="panel-group" id="accordion">
                
                        <asp:Repeater ID="RepeaterPrimary" runat="server">
                            <ItemTemplate>
                                <div class="panel panel-info">
                                    <div class="panel-heading">
                                        <button type="button" class="btn btn-warning  btn-link " data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex + 1 %>">
                                            <%# Eval("Name") %>
                                        </button>
                                        <span class="badge" style="background-color: slateblue"><%#Eval("Type") %></span> 
                                    </div>
                                    <div id="collapse<%#Container.ItemIndex + 1 %>"  class="<%#Container.ItemIndex == 0 ? "panel-collapse collapse in" : "panel-collapse collapse" %> ">
                                        <div class="panel-body" style="font-size: 12px; height: 240px; overflow-y: auto; border-color: #bcebf1;">
                                            <h5>简介</h5>
                                            <p><%# Eval("Introduction") %></p>
                                            <!-- Table -->
                                            <table class="table table-bordered table-striped table-condensed">  
                                                <thead> </thead>  
                                                <tbody>  
                                                    <tr>  
                                                        <td>地址</td> <td><%# Eval("Address") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>所属街道</td><td><%# Eval("Seat") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td>学校主页</td><td><%# Eval("WebSite") %> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>联系人</td><td><%# Eval("TelContacts") %> </td>
                                                    </tr>
                                                    <tr>
                                                        <td>投诉电话</td><td><%# Eval("ComplaintTel") %> </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                        
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