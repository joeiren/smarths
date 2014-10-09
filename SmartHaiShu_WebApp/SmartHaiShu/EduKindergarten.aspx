<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EduKindergarten.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.EduKindergarten" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>幼儿园讯息</title>
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
              <th>主页</th>  
            </tr>  
          </thead>  
      <tbody>  
        <tr>  
          <td>1</td>
          <td>宁波市第二幼儿园（月湖园区）</td>  
          <td>宁波市海曙区解放南路111弄4号</td> 
          <td>0574—87320221</td>  
          <td></td>  
        </tr>
        <tr class="info">  
          <td>2</td>
          <td>宁波市德财幼儿园</td>  
          <td>宁波市海曙区小梁街37号</td> 
          <td>87301630</td>  
          <td></td>   
        </tr>
        <tr>  
          <td>3</td>
          <td>宁波市海曙区东方幼儿园</td>  
          <td>三市路228弄21号</td> 
          <td>0574-87499222</td>  
          <td></td>   
        </tr>
        <tr class="info"> 
          <td>4</td>
          <td>宁波市启文幼儿园</td>  
          <td>海曙区新典路粮丰街38号</td> 
          <td>0574-87467417</td>  
          <td>http://nbqw.hsedu.com.cn/ </td> 
        </tr>
        <tr>  
          <td>5</td>
          <td>宁波市南雅音乐幼儿园</td>  
          <td>宁波市海曙区南雅街10弄22号 </td> 
          <td>0574-87135750</td>  
          <td>http://nbny.hsedu.com.cn/</td>  
        </tr>
        <tr class="info">  
          <td>6</td>
          <td>宁波市红旗幼儿园</td>  
          <td>宁波市柳翠街80号</td> 
          <td>0574-87217929</td>  
          <td></td>   
        </tr>
        <tr>  
          <td>7</td>
          <td>宁波市新芝幼儿园（孝闻园区）</td>  
          <td>宁波市海曙区永丰西路98弄高塘花园</td> 
          <td>(0574)87216126</td>  
          <td>http://xinzhi-baby.hsedu.com.cn/</td>   
        </tr>
        <tr class="info"> 
          <td>8</td>
          <td>宁波市新芝幼儿园（莲桥园区）</td>  
          <td>宁波市海曙区小沙泥街莲桥第</td> 
          <td></td>  
          <td>http://xinzhi-baby.hsedu.com.cn/ </td> 
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
