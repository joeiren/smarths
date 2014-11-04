﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeInteractPost.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.HomeInteractPost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>互帮互助</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
       


        var currpage = <%=PageNo%>;
        var pageList = <%=PageListNumber %>;
        var maxPageNo = 1;
        function trunPage(pageNo, next) {

            if (next == undefined) {
                if (pageNo != currpage) {
                    location.href = "HomeInteractPost.aspx?PageNo=" + pageNo ;     
                }
            } else {
                if ((currpage != maxPageNo && next )|| (!next && currpage != 1))

                    location.href = "HomeInteractPost.aspx?PageNo=" + (currpage + (next?1:-1)); 
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
         function showPostDlg() {
            location.href = "HomeInteractionPostPublish.aspx";
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container1" class="container ">
        <div class="row">
            <%--<button class="pull-right btn btn-success" style="margin-bottom: 5px;" data-toggle="modal" data-target="#dlgPost" onclick="showPostDlg();">我要发布</button>--%>
            <button class="pull-left btn btn-success" style="margin-bottom: 5px;" onclick="showPostDlg();return false;">我要发布</button>
            <div class="text-right">
                <ul class="pagination pagination-sm " style="margin-top: 5px; margin-bottom: 5px; " id="pageNoArea">
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
        </div>
        
        <div class="row" >
        <div class="panel-group" id="accordion">
       
       <div class="panel panel-warning">
        <div class="panel-heading" style="padding-top: 1px;padding-left: 0px; height: 40px;">
            <ul class="list-group">
                <li class="list-group-item list-group-item-warning " style="float: left;width: 7%;height: 38px;border-bottom-width: 0px;border-top-width: 0px;">
                    <a id="a-head">
                        <i class="glyphicon glyphicon-link"></i>
                    </a>
                </li>
                <li class="list-group-item list-group-item-warning" style="float: left;width: 50%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px; text-align: center;font-weight: bold;">
                    标题
                </li>
                <li class="list-group-item list-group-item-warning" style="float: left;width: 20%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;text-align: center;font-weight: bold;">
                    关键字
                </li>
                <li class="list-group-item list-group-item-warning" style="float: left;width: 23%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;text-align: center;font-weight: bold;">
                    发布时间
                </li>
            </ul>
        </div>
                    
        </div>
        <asp:Repeater ID="RepeaterInteract" runat="server">
        <ItemTemplate>
        <div class="panel panel-default" style="margin-top: 0px;">
            <div class="panel-heading" style="padding-top: 1px;padding-left: 0px; height: 40px;">
                <ul class="list-group">
                    <li class="list-group-item" style="float: left;width: 7%;height: 38px;border-bottom-width: 0px;border-top-width: 0px;">
                        <a style="text-decoration: none;cursor: pointer;" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex+1 %>" >
                            <%--<i class="glyphicon glyphicon-link"></i>--%>
                            <span class="caret"></span>
                        </a>
                    </li>
                    <li class="list-group-item" style="float: left;width:50%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px; font-size: 12px;">
                        <a style="text-decoration: none;cursor: pointer;" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex+1 %>" >
                            <%# Eval("Title")%>
                        </a>
                    </li>
                    <li class="list-group-item" style="float: left;width: 20%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                    <%# Eval("Keyword")%>
                    </li>
                    <li class="list-group-item" style="float: left;width: 23%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                    <%# Eval("ReleaseTime")%>
                    </li>
                </ul>
                        
            </div>
                        
            <div id="collapse<%#Container.ItemIndex+1 %>"  class="<%#Container.ItemIndex==0? "panel-collapse collapse in" : "panel-collapse collapse" %> " >
                    <div class="panel-body" style="font-size: 12px;height: 200px;overflow-y:auto; ">
                        <%--<h5><strong> <%# Eval("Title")%></strong></h5>--%>
                        <%--<p> <%# Eval("Content")%></p>--%>
                        
                        <table class="table table-bordered table-striped table-condensed">  
                                  <thead>
                                     <tr>
                                         <td colspan="2" style="text-align:center;">
                                             <strong><%# Eval("Title")%></strong>
                                             <span class="badge pull-right" style="background-color:slateblue"><%#Eval("Keyword")%></span>
                                         </td> 
                                     </tr>
                                 </thead>    
                                  <tbody>
                                    <tr><td colspan="2"><%# Eval("Content")%></td></tr>
                                    <tr>  
                                      <td>联系方式</td> <td><%# Eval("Contact")%></td>
                                    </tr>
                                    <tr>
                                        <td>发布者</td><td><%# Eval("Member")%> </td>
                                    </tr>
                                    <tr>
                                        <td>有效时间</td><td><%# Eval("DateSpan")%> </td>
                                    </tr>
                                </tbody>
                          </table>
                </div>
            </div>
            </div>
        </ItemTemplate>
        <AlternatingItemTemplate>
        <div class="panel panel-info" style="margin-top: 0px;">
            <div class="panel-heading" style="padding-top: 1px;padding-left: 0px; height: 40px;">
                <ul class="list-group">
                    <li class="list-group-item list-group-item-info" style="float: left;width: 7%;height: 38px;border-bottom-width: 0px;border-top-width: 0px;">
                        <a style="text-decoration: none;cursor: pointer;" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex+1 %>">
                            <span class="caret"></span>
                        </a>
                    </li>
                        <li class="list-group-item list-group-item-info" style="float: left;width: 50%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                        <a style="text-decoration: none;cursor: pointer;" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex+1 %>" >
                            <%# Eval("Title")%>
                        </a>
                    </li>
                        <li class="list-group-item list-group-item-info" style="float: left;width: 20%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                        <%# Eval("Keyword")%>
                    </li>
                        <li class="list-group-item list-group-item-info" style="float: left;width: 23%;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                        <%# Eval("ReleaseTime")%>
                    </li>
                </ul>
                        
            </div>
                        
            <div id="collapse<%#Container.ItemIndex+1 %>"  class="panel-collapse collapse" >
                 <div class="panel-body" style="font-size: 12px;height: 200px;overflow-y:auto; ">
              
           <%--   <h5><strong> <%# Eval("Title")%></strong></h5>
                        <p> <%# Eval("Content")%></p>--%>
                        
                  <table class="table table-bordered table-striped table-condensed">  
                                 <thead>
                                     <tr>
                                         <td colspan="2" style="text-align:center;">
                                             <strong><%# Eval("Title")%></strong>
                                             <span class="badge pull-right" style="background-color:slateblue"><%#Eval("Keyword")%></span>
                                         </td> 
                                     </tr>
                                 </thead>  
                                  <tbody>
                                    <tr><td colspan="2"><%# Eval("Content")%></td></tr>
                                    <tr>  
                                      <td>联系方式</td> <td><%# Eval("Contact")%></td>
                                    </tr>
                                    <tr>
                                        <td>发布者</td><td><%# Eval("Member")%> </td>
                                    </tr>
                                    <tr>
                                        <td>有效时间</td><td><%# Eval("DateSpan")%> </td>
                                    </tr>
                                </tbody>
                          </table>
                </div>
               
            </div>
            </div>
        </AlternatingItemTemplate>
        </asp:Repeater>           
        </div>
        
    </div>
  
    </div>
    </form>
    
</body>
</html>
