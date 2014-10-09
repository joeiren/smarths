<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripCarSchool.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripCarSchool" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head  runat="server">
    <title>汽车培训驾校</title>
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
              <th>联系人</th>  
              <th>联系电话</th>  
            </tr>  
          </thead>  
      <tbody>  
        <tr>  
          <td>1</td>
          <td>宁海县中意机动车驾驶培训中心</td>  
          <td>城关镇兴宁北路(赵家)</td> 
          <td></td>  
          <td></td>  
        </tr>
        <tr class="info">  
          <td>2</td>
          <td>宁波市江北区象山港机动车驾驶员培训学校</td>  
          <td>江北梅林汽车综合训练场</td> 
          <td>周宏伟</td>  
          <td>87788316/13606780000</td>   
        </tr>
        <tr>  
          <td>3</td>
          <td>余姚市金茂交通技术培训学校</td>  
          <td>余姚市低塘街道郑巷村</td> 
          <td></td>  
          <td>62295998/13905840000</td>   
        </tr>
        <tr class="info"> 
          <td>4</td>
          <td>宁波市鄞州区机动车驾驶员培训学校</td>  
          <td>鄞县下应镇王家弄村</td> 
          <td></td>  
          <td>87884886/13906620000</td> 
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
