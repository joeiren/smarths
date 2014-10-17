<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trip4S.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.Trip4S" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head  runat="server">
    <title>汽车4S店</title>
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
                    location.href = "Trip4S.aspx?PageNo=" + pageNo ;     
                }

            } else {
                if ((currpage != maxPageNo && next )|| (!next && currpage != 1))

                    location.href = "Trip4S.aspx?PageNo=" + (currpage + (next?1:-1)); 
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
    <form id="form2" runat="server">
    <div id="Div1" class="container container_bg">
       
        <div class="table ">
            <table class="table table-bordered table-striped table-condensed table-hover">  
            <%--<caption>Table</caption>  --%>
          <thead>  
            <tr class="warning">  
             <%-- <th class="col-sm-1">#</th>--%>
              <th class="col-sm-2 col-md-2">名称</th>  
              <th class="col-sm-4 col-md-4">汽车品牌</th>
              <th class="col-sm-2 col-md-2">地址</th>  
              <th class="col-sm-2 col-md-2">联系电话</th>  
            </tr>  
          </thead>  
      <tbody>
           <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                       <%--  <td><%#Container.ItemIndex+1 %></td>--%>
                          <td><%# Eval("Name")%></td>  
                          <td><%# Eval("Brand")%></td> 
                          <td><%# Eval("Address")%></td> 
                          <td><%# Eval("Tel")%></td> 
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                    <tr class="info">
                    <%--     <td><%#Container.ItemIndex+1 %></td>--%>
                          <td><%# Eval("Name")%></td>  
                          <td><%# Eval("Brand")%></td> 
                          <td><%# Eval("Address")%></td> 
                          <td><%# Eval("Tel")%></td> 
                          </tr>
                    </AlternatingItemTemplate>
         </asp:Repeater>    
    
      </tbody>  
    </table>
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
        </div>
        
    </div>
    
    </form>
       <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</body>
</html>
