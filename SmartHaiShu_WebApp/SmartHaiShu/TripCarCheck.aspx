<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripCarCheck.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripCarCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1"   runat="server">
    <title>车辆检测站</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="Div1" class="container container_bg">
       
        <div class="table ">
            <table class="table table-bordered table-striped table-condensed table-hover">  
            <%--<caption>Table</caption>  --%>
          <thead>  
            <tr class="warning">  
              <th class="col-sm-1">#</th>
              <th>名称</th>  
              <th>地址</th>
              
              <th>联系电话</th>  
            </tr>  
          </thead>  
      <tbody>  
        <tr>  
          <td>1</td>
          <td>宁波第一车辆检测站</td>  
          <td>江北区北环东路与纬五路交叉口西侧（江北区庄桥镇马径村）</td> 
          <td>87646868/87646212</td>  
        </tr>
        <tr class="info">  
          <td>2</td>
         <td>宁波第二车辆检测站</td>  
          <td>宁波市江东区福明路633</td> 
          <td>0574-81983085</td>  
        </tr>
        <tr>  
          <td>3</td>
          <td>宁波第三车辆检测站</td>  
          <td>鄞州区鄞县大道古林段1号（鄞县大道往西开过石碶4公里左右）</td> 
          <td>0574-28882668</td>   
        </tr>
        <tr class="info"> 
          <td>4</td>
         <td>宁波第四车辆检测站</td>  
          <td>位于甬江南路与庐山西路交叉口，北仑大矸茅洋山路500号</td> 
          <td>0574-86118000</td>   
        </tr>
      
      </tbody>  
    </table>
    
        </div>
        
    </div>
    
    </form>
       <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</body>
</html>
