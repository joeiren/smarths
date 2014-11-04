<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EduHospital.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.EduHospital" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>医院介绍</title>
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
                        location.href = "EduHospital.aspx?PageNo=" + pageNo;
                    }
                } else {
                    if ((currpage != maxPageNo && next) || (!next && currpage != 1))
                        location.href = "EduHospital.aspx?PageNo=" + currpage + "&Next=" + next;
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
   <div id="container1" class="container ">
        <div class="row" style="margin-right: 0px;">
            <div class="panel-group" id="accordion">
                    <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex + 1 %>">
                             <%# Eval("Name") %>
                            </button>
                        </div>
                        <div id="collapse<%#Container.ItemIndex + 1 %>"  class="<%#Container.ItemIndex==0? "panel-collapse collapse in" : "panel-collapse collapse" %> ">
                          <div class="panel-body" style="font-size: 12px; height: 280px;overflow-y:auto; border-color:#bcebf1;">
                        <%--   <h5>简介</h5>
                             <p> <%# Eval("Content") %></p>--%>
                           
                           <table class="table table-bordered table-striped table-condensed">  
                                  <thead> </thead>  
                                  <tbody>  
                                  <tr>
                                        <td>辐射社区</td><td> <%# Eval("Community")%> </td>
                                    </>
                                    <tr>
                                        <td>工作时间</td><td> <%# Eval("WorkTime")%> </td>
                                    </tr> 
                                    <tr> 
                                      <td>法人代表</td> <td> <%# Eval("Corpoarte")%></td>
                                    </tr>
                                     <tr>  
                                      <td>面积</td> <td> <%# Eval("Area")%></td>
                                    </tr>
                                    <tr>  
                                      <td>地址</td> <td> <%# Eval("Address") %></td>
                                    </tr>
                                    <tr>
                                        <td>联系电话</td><td> <%# Eval("Tel") %> </td>
                                    </tr>
                                    <tr>
                                        <td>核定床位数</td><td> <%# Eval("CheckNum")%> </td>
                                    </tr>
                                    <tr>
                                        <td>实际开放床位数</td><td> <%# Eval("FactNum")%> </td>
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
