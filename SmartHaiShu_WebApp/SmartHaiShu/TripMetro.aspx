<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripMetro.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripMetro" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
    <title>轨道交通</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="container1" class="container container_bg">
       
        <div class="row">
            <div class="panel-group" id="accordion">
                
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse1">
                            一号线
                            </button>
                        </div>
                        <div id="collapse1"  class="panel-collapse collapse in">
                          <div class="panel-body" style="font-size: 12px; height: 600px;overflow-y:auto; border-color:#bcebf1;">
                              <ul class="list-group" style="width: 200px;float: left; ">
                                  <li class="list-group-item active">一期（已开通）</li>
                                  <li class="list-group-item list-group-item-success">高桥西</li>
                                  <li class="list-group-item list-group-item-success">高桥</li>
                                  <li class="list-group-item list-group-item-success">梁祝</li>
                                  <li class="list-group-item list-group-item-success">芦港</li>
                                  <li class="list-group-item list-group-item-success">徐家漕长乐</li>
                                  <li class="list-group-item list-group-item-success">望春桥</li>
                                  <li class="list-group-item list-group-item-success">泽民</li>
                                  <li class="list-group-item list-group-item-success">大卿桥</li>
                                  <li class="list-group-item list-group-item-success">西门口</li>
                                  <li class="list-group-item list-group-item-success">鼓楼</li>
                                  <li class="list-group-item list-group-item-success">东门口(天一广场)</li>
                                  <li class="list-group-item list-group-item-success">江厦桥东</li>
                                  <li class="list-group-item list-group-item-success">舟孟北路</li>
                                  <li class="list-group-item list-group-item-success">樱花公园</li>
                                  <li class="list-group-item list-group-item-success">福明路</li>
                                  <li class="list-group-item list-group-item-success">世纪大道</li>
                                  <li class="list-group-item list-group-item-success">海晏北路</li>
                                  <li class="list-group-item list-group-item-success">福庆北路</li>
                                  <li class="list-group-item list-group-item-success">盛莫路</li>
                                  <li class="list-group-item list-group-item-success">东环南路</li>
                               </ul>
                              <ul class="list-group" style="width: 200px;float: left;margin-left: 80px;">
                                  <li class="list-group-item active">二期（未开通）</li>
                                  <li class="list-group-item list-group-item-danger">邱隘</li>
                                  <li class="list-group-item list-group-item-danger">五乡</li>
                                  <li class="list-group-item list-group-item-danger">宝幢</li>
                                  <li class="list-group-item list-group-item-danger">邬隘</li>
                                  <li class="list-group-item list-group-item-danger">松花江路</li>
                                  <li class="list-group-item list-group-item-danger">中河路</li>
                                  <li class="list-group-item list-group-item-danger">长江路</li>
                                  <li class="list-group-item list-group-item-danger">霞浦</li>
                           
                                 
                               </ul>
                               <button id="viewMetro" class="btn btn-success pull-right" style="margin-left: 30px;" data-toggle="modal" data-target="#dlgMetro">
                                   查看一号线示意图
                               </button>

                         </div>
                        </div>
                      </div>
                      
             
            </div>
        </div>
        <div class="modal fade" id="dlgMetro">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">一号线示意图</h4>
              </div>
              <div class="modal-body">
                 
                <img src="images/trip/line1.png" />
              </div>
              <%--<div class="modal-footer">
                <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-sm btn-success">确定</button>
              </div>--%>
            </div><!-- /.modal-content -->
          </div><!-- /.modal-dialog -->
        </div>
    </div>
    
    </form>
       <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showMetro() {
            $('#dlgMetro').modal({
                keyboard: false
            });
            $('#dlgMetro').modal("show");

        }
    </script>
</body>
</html>
