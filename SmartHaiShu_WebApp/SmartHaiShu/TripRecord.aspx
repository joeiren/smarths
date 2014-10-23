<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TripRecord.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.TripRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1"  runat="server">
    <title>违章查询</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="container1" class="container container_bg">
       
        <div id="alert1"  class="row alert alert-warning fade in">
            查询违章详情，可参照<a href="http://wf.nbjj.gov.cn/" target="_blank">“宁波公安交管信息网”</a>。
      </div> 
        <%--<div>
            <img id="verifyCode" title="点击刷新" src="/SmartHaiShu/ConfirmCode4Traffic.aspx" style="cursor:pointer" onclick="this.src=this.src+'?'" />

        </div>--%>
        <div style="width: 500px; ">
        <form class="form-horizontal" role="form">
            <div class="alert-danger">
                为了保护您的隐私信息,请同时输入车牌号码及车辆识别代号(即车架号)最后６位!(不足６位按实际长度输入)
            </div>
          <div class="form-group">
            <label for="txtCarNo" class="col-sm-3 control-label">车牌号码：</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" style="width: 200px;" id="txtCarNo" autofocus="true" required="" value="浙B·"  maxlength="10">
            </div>
          </div>
          <div class="form-group">
            <label for="txtCardSeq" class="col-sm-3 control-label">车辆识别代码：</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" style="width: 200px;" id="txtCardSeq" placeholder="" required="" maxlength="6">
            </div>
          </div>
          <div class="form-group">
            <label for="selCarType" class="col-sm-3 control-label">车辆类型：</label>
            <div class="col-sm-4">
              <select id="selCarType" class="form-control" style="width: 200px;" >
                 <option value="02">小型汽车</option>
                 <option value="01">大型汽车</option>
                 <option value="07">二三轮摩托</option>
                 <option value="08">轻便摩托车</option>
	             <option value="16">教练汽车</option>
	             <option value="15">挂车</option>
                 <option value="-1">其&nbsp;&nbsp;&nbsp;他</option>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label for="txtCode" class="col-sm-3 control-label">验证码：</label>
            <div class="col-sm-2">
              <input type="text" class="form-control" style="width: 200px;"  id="txtCode"  required="" maxlength="6">
              <img id="confirmCode" title="点击刷新" src="/SmartHaiShu/ConfirmCode4Traffic.aspx" style="cursor:pointer" onclick="this.src=this.src+'?'" />
            </div>
          </div>
          <div class="form-group">
            <div class="col-sm-offset-3 col-sm-2">
              <button type="submit" class="btn btn-primary btn-block" style="width: 200px;" onclick="onSubmit();return false;">查询</button>
            </div>
          </div>
        </form>
        </div>
        
    </div>
    
    </form>
       <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function onSubmit() {
            var no = $("#txtCarNo").val();
            if (no.trim().length < 3) {
                alert("请输入完整的‘车牌号码’信息");
                return false;
            }
            var seq = $("#txtCardSeq").val();
            if (seq.trim().length == 0) {
                alert("请输入‘车辆识别代码’信息");
                return false;
            }
            var vCode = $("#txtCode").val();
            if (vCode.trim().length == 0) {
                alert("请输入‘验证码’信息");
                return false;
            }
            var type = $("#selCarType").val();

            location.href = "TripRecordResult.aspx?no=" + no + "&seq=" + seq + "&vcode=" + vCode + "&typ=" + type;
            return true;
        }
    </script>
</body>
</html>
