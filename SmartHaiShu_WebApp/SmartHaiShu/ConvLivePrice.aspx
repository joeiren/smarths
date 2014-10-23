<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConvLivePrice.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.ConvLivePrice" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>物价查询</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.9.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">

            var _pageSize = 20;
            var _pageNo = 1;
            var _pageRange = 5;
            $(document).ready(function() {
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadFoodCategories',
                    contentType: "application/json; charset=utf-8",
                    success: function(result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            $.each(data.Message, function(entryIndex, entry) {
                                if (entry["Name"] != undefined) {
                                    var item = '<option value=' + '"' + entry["Name"] + '">' + entry["Name"] + '</option>';
                                    $("#lstCategory").append(item);
                                }
                            });
                            reloadFoodList();
                        }
                    },
                    error: function(result) {
                    }

                });

                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadAllFoodMonitorSites',
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            $.each(data.Message, function (entryIndex, entry) {
                                if (entry["Name"] != undefined) {
                                    var item = '<option value=' + '"' + entry["Name"] + '">' + entry["Name"] + '</option>';
                                    $("#lstMonitor").append(item);
                                }
                            });
                           
                        }
                    },
                    error: function (result) {
                    }

                });

                $("#lstCategory").change(function() {
                    reloadFoodList();
                });

            });

            function reloadFoodList() {
                var cate = $("#lstCategory").children('option:selected').val();
                $("#lstFood > option:gt(0)").remove();
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadFoodByCategory',
                    contentType: "application/json; charset=utf-8",
                    data: "{'category':'" + cate + "'}",
                    success: function(result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            $.each(data.Message, function(entryIndex, entry) {
                                if (entry["Name"] != undefined) {
                                    var item = '<option value=' + '"' + entry["Name"] + '">' + entry["Name"] + '</option>';
                                    $("#lstFood").append(item);
                                }
                            });

                        }
                    },
                    error: function(result) {
                    }
                });
            }

            function onQuery() {
                _pageNo = 1;
                loadResultTable();
                
            }

            function loadResultTable() {
                $("#resultTable").addClass("hidden");
                var cate = $("#lstCategory").val();
                var food = $("#lstFood").val();
                var site = $("#lstMonitor").val();
                $("#resultBody").children().remove();
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadFoodMonitorByPage',
                    contentType: "application/json; charset=utf-8",
                    data: "{'category':'" + cate + "','foodname':'" + food + "',site:'" + site + "','pageSize':" + _pageSize + ",'pageNo':" + _pageNo + "}",
                    success: function (result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            $.each(data.Message, function (entryIndex, entry) {
                                if (entryIndex % 2 == 0) {
                                    var tr0 = '<tr><td>' + entry["Category"] + '</td>';
                                    tr0 += '<td>' + entry["FoodName"] + '</td>';
                                    tr0 += '<td>' + entry["Price"] + '</td>';
                                    tr0 += '<td>' + entry["Unit"] + '</td>';
                                    tr0 += '<td>' + entry["SiteName"] + '</td>';
                                    tr0 += '<td>' + entry["Spec"] + '</td>';
                                    tr0 += '<td>' + entry["Uploadtime"] + '</td>';
                                    tr0 += '</tr>';
                                    $("#resultBody").append(tr0);
                                } else {
                                    var tr1 = '<tr class="info"><td>' + entry["Category"] + '</td>';
                                    tr1 += '<td>' + entry["FoodName"] + '</td>';
                                    tr1 += '<td>' + entry["Price"] + '</td>';
                                    tr1 += '<td>' + entry["Unit"] + '</td>';
                                    tr1 += '<td>' + entry["SiteName"] + '</td>';
                                    tr1 += '<td>' + entry["Spec"] + '</td>';
                                    tr1 += '<td>' + entry["Uploadtime"] + '</td>';
                                    tr1 += '</tr>';
                                    $("#resultBody").append(tr1);
                                }
                                
                            });
                            $("#resultTable").removeClass("hidden");
                            showPageSelector();
                        }
                    },
                    error: function (result) {
                    }
                });
            }

            
            function showPageSelector() {
                //$("#pageNoArea").addClass("hidden");
                $("#divTable").prev("#pageDiv").remove();
                var cate = $("#lstCategory").val();
                var food = $("#lstFood").val();
                var site = $("#lstMonitor").val();
                var count = 0;
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadFoodMonitorCount',
                    contentType: "application/json; charset=utf-8",
                    data: "{'category':'" + cate + "','foodname':'" + food + "',site:'" + site + "'}",
                    success: function (result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            count = Number(data.Message);
                            if (count > 0) {
                                var totalPage = parseInt(count / _pageSize) + (count % _pageSize == 0 ? 0 : 1);
                                var html = ' <div class="row text-right" id="pageDiv"><ul class="pagination pagination-sm " style="margin-right: 15px;margin-top: 5px; margin-bottom: 5px; " id="pageNoArea" >';
                                if (_pageNo <= _pageRange) {
                                    html += '<li class="disabled"><a href="#">&laquo;</a></li>';
                                } else {
                                    html += '<li><a href="javascript:trunPage(' + (_pageNo - 1) + ',' + totalPage + ')">&laquo;</a></li>';
                                }
                                var begin = (parseInt(_pageNo / _pageRange) - (_pageNo % _pageRange == 0 ? 1 : 0)) * _pageRange + 1;
                                var end = (parseInt(_pageNo / _pageRange) + (_pageNo % _pageRange == 0 ? 0 : 1)) * _pageRange;
                                var lastpage = _pageNo >= totalPage;
                                end = Math.min(end, totalPage);
                                for (var no = begin; no <= end; no++) {
                                    if (no == _pageNo) {
                                        html += ' <li class="active"><span>'+no +' <span class="sr-only">(current)</span></span></li>';
                                    } else {
                                        html += ' <li><a href="javascript:trunPage(' + no + ',' + totalPage + ')">' + no + '</a></li>';
                                    }
                                }
                                if (lastpage) {
                                    html += '<li class="disabled"><a href="#">&raquo;</a></li>';
                                } else {
                                    html += '<li><a href="javascript:trunPage(' + (_pageNo + 1) + ',' + totalPage + ')">&raquo;</a></li>';
                                }
                                //$("#pageNoArea").append(html);
                                html += '</ul> </div>';
                                $("#divTable").before(html);
                            }

                        }
                    },
                    error: function (result) {
                    }
                });



                //$("#pageNoArea").removeClass("hidden");
            }

            function trunPage(toPageNo, maxPageNo) {
                if (toPageNo > 0 && toPageNo <= maxPageNo) {
                    _pageNo = toPageNo;
                    loadResultTable();
                    
                }
            }

        </script>
    </head>
    <body>
        <form id="form1" runat="server">
            <div id="container1" class="container ">
                <div class="row">
                    <div style="width: 300px; float: left; margin-left: 15px;">
                        <div class="input-group">
                            <span class="input-group-addon">分类</span>
                         
                            <select id="lstCategory" name="lstCategory" class="form-control">
                                <option value="">全部</option>
                            </select>
                        </div>
                    </div>
                    <div style="width: 300px; float: left; margin-left: 15px;">
                        <div class="input-group">
                            <span class="input-group-addon">物品名称</span>
                    
                            <select id="lstFood" name="lstFood" class="form-control">
                                 <option value="">全部</option>
                            </select>
                        </div>
                    </div>

                    
                </div>
                <div class="row" style="margin-top: 15px; margin-bottom: 15px;">
                    <div style="width: 300px; float: left; margin-left: 15px;">
                        <div class="input-group">
                            <span class="input-group-addon">物品观测点</span>
                    
                            <select id="lstMonitor" name="lstMonitor" class="form-control">
                                 <option value="">全部</option>   
                            </select>
                        </div>
                    </div>
                    <div style="width: 150px; float: left; padding-left: 15px;">
                        <button  type="button" class="btn    btn-primary btn-block" onclick="onQuery();"> 查询</button> 
                    </div>
                </div>
                <div class="table" style="height: 620px;" id="divTable">
                    <table class="table table-bordered table-striped table-condensed table-hover hidden" id="resultTable" >  
                  
                        <thead>  
                        <tr class="warning">  
                          <th>分类</th>  
                          <th>物品名称</th>
                          <th>价格</th>  
                          <th>单位</th>    
                          <th>观测点</th>
                          <th>描述</th> 
                          <th>更新时间</th> 
                        </tr>  
                      </thead>  
                      <tbody id="resultBody">  
         
      
                     </tbody>  
                    </table>
    
             </div>
                
                <%--<div class="row text-center">
                    <ul class="pagination pagination-sm " id="pageNoArea" style="height: 25px;">
                        <li class="disabled"><a href="#">&laquo;</a></li>
                        <li class="active"><span>1 <span class="sr-only">(current)</span></span></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                    </ul> 
                </div>--%>
            </div>
        </form>
    </body>
</html>