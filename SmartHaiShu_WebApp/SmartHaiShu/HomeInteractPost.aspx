<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeInteractPost.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.HomeInteractPost" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>互帮互助</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

 
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="container1" class="container ">
        <div class="row">
            <button class="pull-right btn btn-success" style="margin-bottom: 5px;" data-toggle="modal" data-target="#dlgPost">我要发布</button>
        </div>
        <div class="row">
        <div class="panel-group" id="accordion">
       
       <div class="panel panel-warning">
        <div class="panel-heading" style="padding-top: 1px;padding-left: 0px; height: 40px;">
            <ul class="list-group">
                <li class="list-group-item list-group-item-warning " style="float: left;width: 45px;height: 38px;border-bottom-width: 0px;border-top-width: 0px;">
                    <a id="a-head">
                        <i class="glyphicon glyphicon-link"></i>
                    </a>
                </li>
                <li class="list-group-item list-group-item-warning" style="float: left;width: 380px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px; text-align: center;font-weight: bold;">
                    标题
                </li>
                <li class="list-group-item list-group-item-warning" style="float: left;width: 150px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;text-align: center;font-weight: bold;">
                    关键字
                </li>
                <li class="list-group-item list-group-item-warning" style="float: left;width: 150px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;text-align: center;font-weight: bold;">
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
                    <li class="list-group-item" style="float: left;width: 45px;height: 38px;border-bottom-width: 0px;border-top-width: 0px;">
                        <a style="text-decoration: none;cursor: pointer;" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex+1 %>" >
                            <%--<i class="glyphicon glyphicon-link"></i>--%>
                            <span class="caret"></span>
                        </a>
                    </li>
                    <li class="list-group-item" style="float: left;width: 380px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px; font-size: 12px;">
                        <a style="text-decoration: none;cursor: pointer;" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex+1 %>" >
                            <%# Eval("Title")%>
                        </a>
                    </li>
                    <li class="list-group-item" style="float: left;width: 150px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                    <%# Eval("Keyword")%>
                    </li>
                    <li class="list-group-item" style="float: left;width: 150px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                    <%# Eval("ReleaseTime")%>
                    </li>
                </ul>
                        
            </div>
                        
            <div id="collapse<%#Container.ItemIndex+1 %>"  class="<%#Container.ItemIndex==0? "panel-collapse collapse in" : "panel-collapse collapse" %> " >
                    <div class="panel-body" style="font-size: 12px;height: 150px;overflow-y:auto; ">
         <div class="panel">
                    <%# Eval("Content")%>
               </div>
               <div class="panel-success">
                   联系方式： <%# Eval("Contact")%>
               </div>
                <p style="margin-left: 20px; margin-right: 20px;margin-top: 10px;">
                   <span class="bg-success pull-left">
                       发布者：<%# Eval("Member")%>
                   </span>
                   <span class="bg-success pull-right">
                        有效时间：<%# Eval("DateSpan")%>
                   </span>
               </p>
                </div>
            </div>
            </div>
        </ItemTemplate>
        <AlternatingItemTemplate>
        <div class="panel panel-info" style="margin-top: 0px;">
            <div class="panel-heading" style="padding-top: 1px;padding-left: 0px; height: 40px;">
                <ul class="list-group">
                    <li class="list-group-item list-group-item-info" style="float: left;width: 45px;height: 38px;border-bottom-width: 0px;border-top-width: 0px;">
                        <a style="text-decoration: none;cursor: pointer;" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex+1 %>">
                            <span class="caret"></span>
                        </a>
                    </li>
                        <li class="list-group-item list-group-item-info" style="float: left;width: 380px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                        <a style="text-decoration: none;cursor: pointer;" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse<%#Container.ItemIndex+1 %>" >
                            <%# Eval("Title")%>
                        </a>
                    </li>
                        <li class="list-group-item list-group-item-info" style="float: left;width: 150px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                        <%# Eval("Keyword")%>
                    </li>
                        <li class="list-group-item list-group-item-info" style="float: left;width: 150px;height: 38px;border-bottom-width: 0px;border-left-width: 0px; border-top-width: 0px;font-size: 12px;">
                        <%# Eval("ReleaseTime")%>
                    </li>
                </ul>
                        
            </div>
                        
            <div id="collapse<%#Container.ItemIndex+1 %>"  class="panel-collapse collapse" >
                 <div class="panel-body" style="font-size: 12px;height: 150px;overflow-y:auto; ">
               <div class="panel">
                    <%# Eval("Content")%>
               </div>
               <div class="panel-success">
                   联系方式： <%# Eval("Contact")%>
               </div>
                <p style="margin-left: 20px; margin-right: 20px;margin-top: 10px;">
                   <span class="bg-success pull-left">
                       发布者：<%# Eval("Member")%>
                   </span>
                   <span class="bg-success pull-right">
                        有效时间：<%# Eval("DateSpan")%>
                   </span>
               </p>
                </div>
               
            </div>
            </div>
        </AlternatingItemTemplate>
        </asp:Repeater>           
        </div>
        
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
        
        <div class="modal fade" id="dlgPost">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">互帮互助 -- 我要发布</h4>
              </div>
              <div class="modal-body">
                 <form class="form-horizontal" role="form">
                  <div class="form-group">
                    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputEmail3" placeholder="Email"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="inputPassword3" placeholder="Password"/>
                    </div>
                  </div>
                  
                  
                </form>
                
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-sm btn-success" onclick="commitPost();">确定</button>
              </div>
            </div>
          </div>
        </div>
    </div>
    </form>
    
     <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showPostDlg() {
            $('#dlgPost').modal({
                keyboard: false
            });
            $('#dlgPost').modal("show");
        }

        function commitPost() {
            $('#dlgPost').modal("hide");
            //alert($("#inputEmail3").val() + "--" + $("#inputPassword3").val());
            location.href = location.pathname;

        }
    </script>
</body>
</html>
