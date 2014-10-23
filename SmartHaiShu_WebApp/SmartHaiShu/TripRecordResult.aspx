<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripRecordResult.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripRecordResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>交通违章查询结果</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
   <div id="Div1" class="container container_bg">
       <div id="alert1"  class="row alert alert-warning fade in">
            查询违章详情，可访问<a href="http://wf.nbjj.gov.cn/" target="_blank">“宁波公安交管信息网”</a>。
      </div> 
        <div class="table ">
            <table class="table table-bordered table-striped table-condensed table-hover">  
            <caption class="text-left bg-success">查询结果：<%=Message %></caption>  
          <thead>  
            <tr class="warning">  
              <th>车牌号</th>  
              <th>车辆类型</th>
              <th>违法时间</th>
              <th>违法地点</th>  
              <th>记分</th>    
              <th>行为</th>
              <th>罚金</th>    
            </tr>  
          </thead>  
      <tbody>  
         <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%# Eval("LicenceNO")%></td>  
                    <td><%# Eval("VehicleType")%></td> 
                    <td><%# Eval("VioDate")%></td> 
                    <td><%# Eval("VioLocation")%></td>  
                    <td><%# Eval("Score")%></td>  
                    <td><%# Eval("VioBehavior")%></td> 
                    <td><%# Eval("Penalty")%></td>  
                </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
            <tr class="info">
                    <td><%# Eval("LicenceNO")%></td>  
                    <td><%# Eval("VehicleType")%></td> 
                    <td><%# Eval("VioDate")%></td> 
                    <td><%# Eval("VioLocation")%></td>  
                    <td><%# Eval("Score")%></td>  
                    <td><%# Eval("VioBehavior")%></td>  
                    <td><%# Eval("Penalty")%></td> 
                    </tr>
            </AlternatingItemTemplate>
         </asp:Repeater>
      
      </tbody>  
    </table>
    
        </div>
        
    </div>
    </form>
</body>
</html>
