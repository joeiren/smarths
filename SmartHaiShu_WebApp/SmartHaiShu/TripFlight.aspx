<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripFlight.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripFlight" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>航班信息</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="container1" class="container ">
     <%--   <ul class="nav nav-pills">
          <li><a href="#outPort">出港</a></li>
          <li><a href="#inPort">到港</</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane fade in active" id="outPort">1</div>
          <div class="tab-pane fade" id="inPort">2..Ra</div>
        </div>--%>
        <ul class="nav nav-pills" role="tablist">
  <li class="active"><a href="#outPort" role="tab" data-toggle="tab">出港</a></li>
  <li><a href="#inPort" role="tab" data-toggle="tab">到港</a></li>
  
</ul>

<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane fade in active" id="outPort">
      <div class="table ">
            <table class="table table-bordered table-striped table-condensed table-hover">  
            <%--<caption>Table</caption>  --%>
          <thead>  
            <tr class="warning">  
              <th class="col-sm-1">序号</th>
              <th class="col-sm-2 col-md-2">终点</th>  
              <th class="col-sm-4 col-md-4">经停</th>
              <th class="col-sm-2 col-md-2">航班号</th>  
              <th class="col-sm-2 col-md-2">班期</th>  
            </tr>  
          </thead>  
          <tbody>  
        <tr>  
          <td>1</td>
          <td>三亚</td>  
          <td></td>
          <td>3U8766</td> 
          <td>每周1, 3, 5, 7</td>  
        </tr>
        <tr class="info">  
          <td>2</td>
          <td>三亚</td>  
          <td></td>
          <td>BK2835</td> 
          <td>每周2, 4, 6</td>  
        </tr>
        <tr>  
          <td>3</td>
          <td>三亚</td>  
          <td></td>
          <td>3U8766</td> 
          <td>每周1, 3, 5, 7</td>  
        </tr>
        <tr class="info">  
          <td>4</td>
          <td>丽江</td>  
          <td></td>
          <td>8L9830</td> 
          <td>每周2, 4, 6</td>  
        </tr>
        <tr>  
          <td>5</td>
          <td>三亚</td>  
          <td></td>
          <td>3U8766</td> 
          <td>每周1, 3, 5, 7</td>  
        </tr>
        <tr class="info">  
          <td>6</td>
          <td>丽江</td>  
          <td>武汉</td>
          <td>8L9830</td> 
          <td>每周2, 4, 6</td>  
        </tr>
        <tr>  
          <td>7</td>
          <td>三亚</td>  
          <td></td>
          <td>3U8766</td> 
          <td>每周1, 3, 5, 7</td>  
        </tr>
        <tr class="info">  
          <td>8</td>
          <td>丽江</td>  
          <td></td>
          <td>8L9830</td> 
          <td>每周2, 4, 6</td>  
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
  <div class="tab-pane fade in" id="inPort">
      <div class="table ">
            <table class="table table-bordered table-striped table-condensed table-hover">  
            <%--<caption>Table</caption>  --%>
              <thead>  
            <tr class="warning">  
              <th class="col-sm-1">序号</th>
              <th class="col-sm-2 col-md-2">起点</th>  
              <th class="col-sm-4 col-md-4">经停</th>
              <th class="col-sm-2 col-md-2">航班号</th>  
              <th class="col-sm-2 col-md-2">班期</th>  
            </tr>  
          </thead>  
          <tbody>  
        <tr>  
          <td>1</td>
          <td>三亚</td>  
          <td></td>
          <td>3U8766</td> 
          <td>每周1, 3, 5, 7</td>  
        </tr>
        <tr class="info">  
          <td>2</td>
          <td>三亚</td>  
          <td></td>
          <td>BK2835</td> 
          <td>每周2, 4, 6</td>  
        </tr>
        <tr>  
          <td>3</td>
          <td>三亚</td>  
          <td></td>
          <td>3U8766</td> 
          <td>每周1, 3, 5, 7</td>  
        </tr>
        <tr class="info">  
          <td>4</td>
          <td>丽江</td>  
          <td></td>
          <td>8L9830</td> 
          <td>每周2, 4, 6</td>  
        </tr>
        <tr>  
          <td>5</td>
          <td>三亚</td>  
          <td>武汉</td>
          <td>3U8766</td> 
          <td>每周1, 3, 5, 7</td>  
        </tr>
        <tr class="info">  
          <td>6</td>
          <td>丽江</td>  
          <td></td>
          <td>8L9830</td> 
          <td>每周2, 4, 6</td>  
        </tr>
        <tr>  
          <td>7</td>
          <td>三亚</td>  
          <td></td>
          <td>3U8766</td> 
          <td>每周1, 3, 5, 7</td>  
        </tr>
        <tr class="info">  
          <td>8</td>
          <td>丽江</td>  
          <td></td>
          <td>8L9830</td> 
          <td>每周2, 4, 6</td>  
        </tr>
      </tbody>  
    </table>
            <div class="row text-center">
            <ul class="pagination pagination-sm " id="Ul1">
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

</div>
        
    </div>
    
    </form>
       <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</body>
</html>
