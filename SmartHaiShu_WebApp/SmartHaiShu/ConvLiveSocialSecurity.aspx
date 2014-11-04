<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConvLiveSocialSecurity.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.ConvLiveSocialSecurity" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>社保查询</title>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function onSubmit() {
            var user = $("#txtUser").val(); encodeURI($("#txtUser").val());
            var pwd = encodeURI($("#txtPwd").val());
            if (user.trim().length == 0 || pwd.trim().length == 0) {
                alert("身份证号/社保卡号 或 密码 不能为空！");
                return false;
            } else {
                location.href = "ConvLiveSocialSecurityResult.aspx?user=" + encodeURI(user) + "&pwd=" + encodeURI(pwd);
                return true;
            }
        }
    </script>
</head>
<body>
    <div id="container1" class="container">
        <div id="alert1"  class="row alert alert-warning fade in" style="margin-right: 0px;">
            查询社保详情，可访问<a href="http://www.nbhrss.gov.cn/cx/cxzx/cy/sbgr/#Menu=1303" target="_blank">“宁波市人力资源和社会保障局”</a>。
        </div> 
        <div style="width: 400px;">
        <form class="form-horizontal" role="form">
          <div class="form-group">
            <label for="txtUser" class="col-md-3 control-label">身份证号/社保卡号：</label>
            <div class="col-md-3" style="width: 300px;">
              <input type="text" class="form-control" id="txtUser" autofocus="true" required="" placeholder="">
            </div>
          </div>
          <div class="form-group">
            <label for="txtPwd" class="col-md-3 control-label">密码：</label>
            <div class="col-md-3" style="width: 300px;">
              <input type="password" class="form-control" id="txtPwd" placeholder="" required="">
            </div>
          </div>
          
          <div class="form-group">
            <div class="col-md-offset-3 col-md-2" style="width: 300px;">
              <button type="submit" class="btn btn-primary btn-block" onclick="onSubmit();return false;">查询</button>
            </div>
          </div>
        </form>
        </div>
        <div class="alert-danger">
            <h4>  养老保险个人账户查询说明：</h4>
            <small>
            <p>一、个人账户查询密码统一被初始化(包括第一次查询人员)，请使用初始密码1234查询（请立即修改），原网站个人账户查询密码失效。
            <p>二、养老保险查询范围：在市中心、海曙区、江东区、江北区、鄞州区、镇海区、北仑区、开发区、保税区、科技园区、大榭开发区、东钱湖度假区参加职工社会养老保险的在职或企业离退休（职）人员。
            <p>三、使用中可能出现的问题、原因及处理办法：
            <p>1、身份证号码重复：
            <p>1) 一人多帐户。产生原因主要为职工未及时办理个人账户转移或续保手续。请及时与参保地的社会保险经办机构联系，办妥个人账户转移、合并手续。
            <p>2) 身份证号码重复。发现此类问题，请与参保地的社会保险经办机构或最后办理中断手续的社会保险经办机构联系。确系本人身份证号码重复的，请到公安户籍中心申请变更身份证号码。
            <p>3) 用人单位申报时填写错误或社会保险经办机构工作人员录入错误。发现此类问题，请携带本人身份证及身份证复印件到参保地社会保险经办机构办理更正手续。
            <p>2、提示未进入本系统或身份证不存在或银行帐号不存在：
            <p>1) 身份证号码或银行帐号输入错误。
            <p>2) 属于查询范围以外人员。
            <p>3) 身份证号码与系统中记录的身份证号码不一致。
            <p>4) 更换银行帐号，但未到相关的社会保险经办机构办理账号更改手续。
            <p>5) 变更了身份证号码，但未到相关的社会保险经办机构办理身份证号码更改手续。
            <p>6) 属于本市机关、事业单位职工。
            <p>7) 属于港澳台地区或其它外籍员工。
            <p>四、养老保险个人账户从查询范围以外转入的，每年4月底之前的转入缴费年限反映在累计缴费年限中；每年5月以后的转入缴费年限不反映在累计缴费年限中。
            <p>五、为保障养老保险个人账户数据的安全性，公网与内部业务网络物理割断，您查询的养老保险账户非实时数据，系前二个月的信息。
            </small>
        </div>
    </div>
    
    

    
    
</body>
</html>
