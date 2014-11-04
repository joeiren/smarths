<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EduDoctors.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.EduDoctors" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>专家介绍</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.9.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript">

            var _pageSize = 10;
            var _pageNo = 1;
            var _pageRange = 5;
            $(document).ready(function() {
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadAllDoctorHospitals',
                    contentType: "application/json; charset=utf-8",
                    success: function(result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            $.each(data.Message, function(entryIndex, entry) {
                                if (entry["Name"] != undefined) {
                                    var item = '<option value=' + '"' + entry["Name"] + '">' + entry["Name"] + '</option>';
                                    $("#lstHospital").append(item);
                                }
                            });
                            reloadDepartmentList();
                        }
                    },
                    error: function(result) {
                    }

                });

                $("#lstHospital").change(function() {
                    reloadDepartmentList();
                });

            });

            function reloadDepartmentList() {
                var hospital = $("#lstHospital").children('option:selected').val();
                $("#lstDepartment > option:gt(0)").remove();
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadDepartmentsByHospital',
                    contentType: "application/json; charset=utf-8",
                    data: "{'hospital':'" + hospital + "'}",
                    success: function(result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            $.each(data.Message, function(entryIndex, entry) {
                                if (entry["Name"] != undefined) {
                                    var item = '<option value=' + '"' + entry["Name"] + '">' + entry["Name"] + '</option>';
                                    $("#lstDepartment").append(item);
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
                // $("#resultTable").addClass("hidden");
                var hospital = $("#lstHospital").val();
                var department = $("#lstDepartment").val();

                $("#resultTable").children().remove();
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadDoctorsByHospitalDepartment',
                    contentType: "application/json; charset=utf-8",
                    data: "{'hospital':'" + hospital + "','department':'" + department + "','pageSize':" + _pageSize + ",'pageNo':" + _pageNo + "}",
                    success: function(result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            var count = data.Message.length;
                            var rowLength = Number(count / 2) + (count == 0 ? 0 : (count % 2 == 0 ? 0 : 1));

                            for (var row = 0; row < rowLength; row++) {
                                var rowHtml = '<div class="row" style="margin-top: 15px; ">';
                                var cellsHtml = '';
                                for (var cell = 0; cell < 2; cell++) {
                                    var index = 2 * row + cell;
                                    if (index >= count) {
                                        break;
                                    }
                                    var entry = data.Message[index];
                                    var cellHtml = '<div style="width: 320px; float: left;margin-left: 3px;"><div class="thumbnail" style="border-color:#bcebf1;margin-bottom:0px;"><div class="caption">';
                                    cellHtml += '<h4>' + entry["Name"].substr(0, 9) + (entry["Name"].length > 9 ? '...' : '') + '<span class="badge" style="background-color: slateblue">' + entry["Technic"].substr(0, 6) + (entry["Technic"].length > 6 ? '...' : '') + '</span></h4>';
                                    cellHtml += ' <ul class="list-group" style="margin-bottom:0px;">';
                                    cellHtml += '<li class="list-group-item list-group-item-success">' + entry["Name"] + ' @ ' + entry["Department"].substr(0, 5) + '</li>';
                                    cellHtml += '<li class="list-group-item list-group-item-warning">专业：' + entry["Major"] + '</li>';
                                    cellHtml += '<li class="list-group-item list-group-item-info">' + entry["Sex"] + ' &nbsp;' + entry["Age"] + '岁 </li>';
                                    cellHtml += '<li class="list-group-item" style="height: 140px;overflow-y:auto;">' + entry["Content"] + '</li>';
                                    cellHtml += '</ul></div></div></div>';
                                    cellsHtml += cellHtml;
                                }
                                rowHtml += cellsHtml;
                                rowHtml += '</div>';
                                $("#resultTable").append(rowHtml);
                            }
                            showPageSelector();
                        }
                    },
                    error: function(result) {
                    }
                });
            }


            function showPageSelector() {
                //$("#pageNoArea").addClass("hidden");
                $("#resultTable").prev("#pageDiv").remove();
                var hospital = $("#lstHospital").val();
                var department = $("#lstDepartment").val();
                var count = 0;
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/LoadDoctorCountByHospitalDepartment',
                    contentType: "application/json; charset=utf-8",
                    data: "{'hospital':'" + hospital + "','department':'" + department + "'}",
                    success: function(result) {
                        var data = eval("(" + result.d + ")");
                        if (data.Code == 1) {
                            count = Number(data.Message);
                            if (count > 0) {
                                var totalPage = parseInt(count / _pageSize) + (count % _pageSize == 0 ? 0 : 1);
                                var html = ' <div class="row text-right" style="margin-right:10px;margin-left:0px;" id="pageDiv"><ul class="pagination pagination-sm " style="margin-right: 15px;margin-top: 5px; margin-bottom: 5px; " id="pageNoArea" >';
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
                                $("#resultTable").before(html);
                            }

                        }
                    },
                    error: function(result) {
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
            <div id="container1" class="container ">
       
                <div class="row" style="margin-right: 0px;">
                    <div style="width: 250px; float: left; margin-left: 10px;">
                        <div class="input-group">
                            <span class="input-group-addon">医院</span>
                            <select id="lstHospital" name="lstHospital" class="form-control">
                                <option value="">全部</option>
                            </select>
                        </div>
                    </div>
                    <div style="width: 200px; float: left; margin-left: 10px;">
                        <div class="input-group">
                            <span class="input-group-addon">科室</span>
                    
                            <select id="lstDepartment" name="lstDepartment" class="form-control">
                                <option value="">全部</option>
                            </select>
                        </div>
                    </div>
                    <div style="width: 120px; float: left; padding-left: 10px;">
                        <button  type="button" class="btn btn-primary btn-block" onclick=" onQuery(); "> 查询</button> 
                    </div>
                </div>

                <div id="resultTable" class="container" style="height: 720px; padding-left:0px; padding-right: 0px; ">
        
                </div>
            </div>
        </form>
   
    </body>
</html>