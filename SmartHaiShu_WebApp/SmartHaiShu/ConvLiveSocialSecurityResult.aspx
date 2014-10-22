<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConvLiveSocialSecurityResult.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.ConvLiveSocialSecurityResult" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>社保 养老保险个人缴费情况</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="Div1" class="container container_bg">
       
        <div class="table ">
            <table class="table table-bordered table-striped table-condensed table-hover">  
            <caption class="text-left bg-success"> 养老保险--近12个月缴费情况：</caption>  
          <thead>  
            <tr class="warning">  
              <th>申报年月</th>  
              <th>到账年月</th>
              <th>缴费基数</th>
              <th>单位缴费</th>  
              <th>个人部分</th>    
              <th>缴费月数</th>    
            </tr>  
          </thead>  
      <tbody>  
         <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                          <td><%# Eval("DaozhangNY")%></td>  
                          <td><%# Eval("JiaofeiJS")%></td> 
                          <td><%# Eval("DanweiJF")%></td> 
                          <td><%# Eval("GerenBF")%></td>  
                          <td><%# Eval("JiaofeiYS")%></td>  
                          <td><%# Eval("ShenbaoNY")%></td>  
                        </tr>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                    <tr class="info">
                          <td><%# Eval("DaozhangNY")%></td>  
                          <td><%# Eval("JiaofeiJS")%></td> 
                          <td><%# Eval("DanweiJF")%></td> 
                          <td><%# Eval("GerenBF")%></td>  
                          <td><%# Eval("JiaofeiYS")%></td>  
                          <td><%# Eval("ShenbaoNY")%></td>  
                          </tr>
                    </AlternatingItemTemplate>
         </asp:Repeater>
      
      </tbody>  
    </table>
    
        </div>
        
    </div>
    </form>
</body>
</html>
