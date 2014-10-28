<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EduOldPeople.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.EduOldPeople" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>养老院信息</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.9.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">

            var _pageSize = 10;
            var _pageNo = 1;
            var _pageRange = 5;
            $(document).ready(function () {
                loadResultTable();
            });

            function loadResultTable() {
                $("#resultRange").children().remove();
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadRetirementHome',
                    contentType: "application/json; charset=utf-8",
                    data: "{'pageSize':" + _pageSize + ",'pageNo':" + _pageNo + "}",
                    success: function (result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            var count = data.Message.length;
                            var rowLength = Number(count / 2) + (count == 0 ? 0 : (count % 2 == 0 ? 0 : 1));
                            for (var row = 0; row < rowLength; row++) {
                                var rowHtml = ' <div class="row" style="margin-top: 3px;">';
                                var cellsHtml = '';
                                for (var cell = 0; cell < 2; cell++) {
                                    var index = 2 * row + cell;
                                    if (index >= count) {
                                        break;
                                    }
                                    var entry = data.Message[index];
                                    var cellHtml = '<div style="width: 320px; float: left; margin-left: 30px;"><div class="thumbnail" style="margin-bottom: 0px;border-color: #bcebf1; "><div class="caption">';
                                    cellHtml += '<h5><strong>'+entry["Name"]+'</strong></h5>';
                                    cellHtml += ' <ul class="list-group" style="margin-bottom: 0px;">';
                                    cellHtml += '<li class="list-group-item list-group-item-success" style="height: 40px; overflow-y: auto;">地址：'+entry["Address"]+'</li>';
                                    cellHtml += '<li class="list-group-item list-group-item-info">联系电话： &nbsp; '+entry["Tel"]+ ' </li>';
                                    cellHtml += '<li class="list-group-item list-group-item-info">联系人：' + entry["TelR"] + '</li>';
                                    cellHtml += '<li class="list-group-item" style="height: 50px; overflow-y: auto;">服务范围：' + entry["Fanwei"] + '</li>';
                                    cellHtml += '</ul></div></div></div>';
                                    cellsHtml += cellHtml;
                                }
                                rowHtml += cellsHtml;
                                rowHtml += '</div>';
                                $("#resultRange").append(rowHtml);
                            }
                            loadPageSelector();
                        }
                    },
                    error: function (result) {
                    }

                });
            }

            function loadPageSelector() {
                $("#resultRange").prev(".pageSelector").remove();
                $("#resultRange").next(".pageSelector").remove();
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadRetirementHomeCount',
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            var count = Number(data.Message);
                            if (count > 0) {
                                var totalPage = parseInt(count / _pageSize) + (count % _pageSize == 0 ? 0 : 1);
                                var html = ' <div class="text-right pageSelector" ><ul class="pagination pagination-sm " style="margin-right: 25px;margin-top: 5px; margin-bottom: 5px; " id="pageNoArea" >';
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
                                        html += ' <li class="active"><span>' + no + ' <span class="sr-only">(current)</span></span></li>';
                                    } else {
                                        html += ' <li><a href="javascript:trunPage(' + no + ',' + totalPage + ')">' + no + '</a></li>';
                                    }
                                }
                                if (lastpage) {
                                    html += '<li class="disabled"><a href="#">&raquo;</a></li>';
                                } else {
                                    html += '<li><a href="javascript:trunPage(' + (_pageNo + 1) + ',' + totalPage + ')">&raquo;</a></li>';
                                }
                                html += '</ul> </div>';
                                $("#resultRange").before(html);
                                $("#resultRange").after(html);
                            }
                        }
                    },
                    error: function (result) {
                    }

                });
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
            <div id="container1" class="container " style="height: 720px;">
      
      <div id="resultRange">
          
      </div>
            
            </div>
        </form>
        
    </body>
</html>