<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trip4S.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.Trip4S" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head  runat="server">
    <title>汽车4S店</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form2" runat="server">
    <div id="Div1" class="container container_bg">
       
        <div class="table ">
            <table class="table table-bordered table-striped table-condensed table-hover">  
            <%--<caption>Table</caption>  --%>
          <thead>  
            <tr class="warning">  
              <th class="col-sm-1">#</th>
              <th class="col-sm-2 col-md-2">名称</th>  
              <th class="col-sm-4 col-md-4">汽车品牌</th>
              <th class="col-sm-2 col-md-2">地址</th>  
              <th class="col-sm-2 col-md-2">联系电话</th>  
            </tr>  
          </thead>  
      <tbody>  
        <tr>  
          <td>1</td>
          <td>宁波辰通汽车有限公司</td>  
          <td>三菱</td> 
          <td>宁波市通达路368号</td>  
          <td>18968315235</td>  
        </tr>
        <tr class="info">  
          <td>2</td>
          <td>宁波明日汽车销售服务有限公司</td>  
          <td>奇瑞</td> 
          <td>宁波市海曙区段塘西路69号</td>  
          <td>400-872-3804</td>   
        </tr>
        <tr>  
          <td>3</td>
          <td>宁波元通辰通汽车有限公司</td>  
          <td>Jeep、道奇、克莱斯勒</td> 
          <td>宁波市海曙区通达路368号</td>  
          <td>400-830-3564</td>   
        </tr>
        <tr class="info"> 
          <td>4</td>
          <td>宁波鑫之杰汽车有限公司</td>  
          <td>马自达</td> 
          <td>宁波市海曙区南苑街301号</td>  
          <td>400-830-6970</td> 
        </tr>
        <tr > 
          <td>5</td>
          <td>宁波广达汽车销售服务有限公司</td>  
          <td>本田，理念</td> 
          <td>宁波市海曙区段塘西路68号</td>  
          <td>400-872-3886</td> 
        </tr>
        <tr class="info">  
          <td>6</td>
          <td>宁波市海曙博纳汽车销售服务有限公司雷诺4S店</td>  
          <td>雷诺</td> 
          <td>宁波市南苑街278号</td>  
          <td>400-872-5141</td> 
        </tr>
        <tr>  
          <td>7</td>
          <td>宁波中基东本汽车销售服务有限公司</td>  
          <td>本田、思铭</td> 
          <td>宁波市雅戈尔大道27号</td>  
          <td>400-872-3180</td> 
        </tr>
    
      </tbody>  
    </table>
    <div class="row text-center">
            <ul class="pagination pagination-sm " id="pageNoArea">
            <li class="disabled"><a href="#">&laquo;</a></li>
          <li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
          <li><a href="#">2</a></li>
          <li><a href="#">3</a></li>
          <li><a href="#">4</a></li>
          <li><a href="#">5</a></li>
          <li><a href="#">&raquo;</a></li>
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
