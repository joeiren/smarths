<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripBike.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripBike" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


<head id="Head2"  runat="server">
    <title>公共自行车点位分布</title>
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
              <th class="col-sm-2 col-md-2">网点名称</th>  
              <th class="col-sm-4 col-md-4">网点地址</th>
              <th class="col-sm-2 col-md-2">备注信息</th>  
            </tr>  
          </thead>  
      <tbody>  
        <tr>  
          <td>1</td>
          <td>网点名称网点名称</td>  
          <td>leo网点地址网点地址网点地址网点地址网点地址网点地址网点地址网点地址</td> 
          <td>@aehyok</td>  
        </tr>
        <tr class="info">  
          <td>2</td>
          <td>lynn</td>  
          <td>thl网点地址网点地址网点地址网点地址网点地址网点地址网点地址网点地址</td> 
          <td>@lynn</td>  
        </tr>
        <tr>  
          <td>3</td> 
          <td>网点名称网点名称</td>  
          <td>Amy</td> 
          <td>@Amdy</td>  
        </tr>
        <tr class="info"> 
          <td>4</td> 
          <td>Amdy</td>  
          <td>Amy</td> 
          <td>@Amdy</td>  
        </tr>
        <tr > 
          <td >5</td> 
          <td >Amdy</td>  
          <td >Amy</td> 
          <td>@Amdy</td>  
        </tr>
        <tr class="info">  
          <td>6</td>
          <td>lynn</td>  
          <td>thl</td> 
          <td>@lynn</td>  
        </tr>
        <tr>  
          <td>7</td> 
          <td>Amdy</td>  
          <td>Amy</td> 
          <td>@Amdy</td>  
        </tr>
        <tr class="info"> 
          <td>8</td> 
          <td>Amdy</td>  
          <td>Amy</td> 
          <td>@Amdy</td>  
        </tr>
        <tr > 
          <td >9</td> 
          <td >Amdy</td>  
          <td >Amy</td> 
          <td>@Amdy</td>  
        </tr>
        <tr class="info"> 
          <td>10</td> 
          <td>Amdy</td>  
          <td>Amy</td> 
          <td>@Amdy</td>  
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
