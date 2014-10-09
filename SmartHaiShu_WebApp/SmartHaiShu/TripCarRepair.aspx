<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripCarRepair.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripCarRepair" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head   runat="server">
    <title>汽车维修站</title>
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
              <th>类型</th> 
              <th>联系人</th>
              <th>联系电话</th>  
            </tr>  
          </thead>  
      <tbody>  
        <tr>  
          <td>1</td>
          <td>宁波海曙永润汽车销售服务有限公司</td>  
          <td>海曙段塘西路68号</td> 
          <td></td>  
          <td>暂无</td>  
          <td>0574-87495999/13967808912</td>
        </tr>
        <tr class="info">  
          <td>2</td>
          <td>宁波广达汽车销售服务有限公司</td>  
          <td>海曙段塘西路68号</td> 
          <td>小型汽车</td>  
          <td>俞红华</td>  
          <td>0574-87470088/13008991027</td> 
        </tr>
        <tr>  
          <td>3</td>
          <td>宁波天天汽车贸易有限公司</td>  
          <td>海曙顺德路78弄78号</td> 
          <td>小型汽车</td>  
          <td>俞红华</td>  
          <td>0574-87473819/13605743352</td>  
        </tr>
        <tr class="info"> 
          <td>4</td>
          <td>宁波市景润汽车销售服务有限公司</td>  
          <td>海曙段塘西路68号</td> 
          <td>小型汽车</td>  
          <td>俞红华</td>  
          <td>0574-56166331/13362460052</td>  
        </tr>
        <tr>  
          <td>5</td>
          <td>宁波公运集团股份有限公司客车修理分公司</td>  
          <td>海曙通达路89号</td> 
          <td>大中型客车</td>  
          <td>冯力飞</td>  
          <td>0574-87091263/13454712760</td>  
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
