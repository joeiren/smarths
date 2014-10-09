<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EduDoctors.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.EduDoctors" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>专家介绍</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
   <div id="container1" class="container ">
       
       <div class="row">
            <div style="width: 250px;float: left;margin-left: 10px;">
                <div class="input-group">
                    <span class="input-group-addon">医院</span>
                    <%--<asp:DropDownList runat="server" CssClass="form-control" ID="lstStreet" />--%>  
                    <select id="lstStreet" name="lstStreet" class="form-control">
                        <option>宁波市中医院</option>
                        <option>宁波市妇女儿童医院</option>
                        <option>宁波市第一医院</option>
                        <option>宁波市第二医院</option>
                        <option>宁波海曙口腔医院（老院）</option>
                        <option>宁波口腔医院（新院）</option>
                        <option>宁波市华慈医院</option>
                        <option>月湖街道社区卫生服务中心</option>
                    </select>
                </div>
            </div>
            <div style="width: 200px; float: left;margin-left: 10px;">
                <div class="input-group">
                    <span class="input-group-addon">科室</span>
                    
                    <select id="Select1" name="lstStreet" class="form-control">
                        <option>中医专家</option>
                        <option>中医妇科专科</option>
                        <option>产科专家</option>
                        <option>内分泌专科</option>
                        <option>内分泌科</option>
                        <option>内分泌科</option>
                        <option>心血管内科一</option>
                        <option>内科(高级)</option>
                    </select>
                </div>
            </div>
             <div style="width: 120px; float: left;padding-left: 10px;">
              <button  type="button" class="btn btn-primary btn-block"> 查询</button> 
             </div>
        </div>
        
        <div class="row" style="margin-top: 15px; ">
            <div style="width: 320px; float: left;margin-left: 10px;">
             <div class="thumbnail" style="border-color:#bcebf1;;">
                  <div class="caption">
                    <h4>史文骥<span class="badge" style="background-color: slateblue">主任医师</span></h4>
                   <ul class="list-group">
                      <li class="list-group-item list-group-item-success">宁波市第一医院 @ 骨科专家</li>
                      <li class="list-group-item list-group-item-warning">专业：外科专业</li>
                      <li class="list-group-item list-group-item-info">男 &nbsp; 52岁 </li>
                      <li class="list-group-item" style="height: 140px;overflow-y:auto;">史文骥，男，1986年毕业于浙江医科大学医学系，从事骨科临床工作20年。曾在上海第二医科大学附属第九医院骨科进修，擅长关节外科，关节镜外科，四肢创伤，脊柱外科等骨科疾病。发表论文9篇，已参与完成科研1项，获2000年浙江省科技进步奖三等奖，2000年度市科技进步奖三等奖。</li>
                    </ul>
                  </div>
             </div>
            </div>
            
            <div style="width: 320px;float: left;margin-left: 30px;">
             <div class="thumbnail" style="border-color:#bcebf1;;">
                  <div class="caption">
                    <h4>舒静<span class="badge" style="background-color: slateblue">主任医师</span></h4>
                   <ul class="list-group">
                      <li class="list-group-item list-group-item-success">宁波市第一医院 @ 高危妊娠门诊</li>
                      <li class="list-group-item list-group-item-warning">专业：外科专业</li>
                      <li class="list-group-item list-group-item-info">女 &nbsp;47岁</li>
                      <li class="list-group-item" style="height: 140px;overflow-y:auto;">舒静，女，主任医师。1987年毕业于西安医科大学。从事临床工作18年。曾在德国进修4个月。擅长不孕症、难免流产、优生优育、妇产科内分泌相关疾病的诊治。发表论文10余篇。</li>
                    </ul>
                  </div>
             </div>
            </div>
        </div>
        
        <div class="row" style="margin-top: 15px; ">
            <div style="width: 320px; float: left;margin-left: 10px;">
             <div class="thumbnail" style="border-color:#bcebf1;;">
                  <div class="caption">
                    <h4>袁雄芳<span class="badge" style="background-color: slateblue">副主任中医</span></h4>
                   <ul class="list-group">
                      <li class="list-group-item list-group-item-success">宁波市第二医院 @ 中医妇科(副)</li>
                      <li class="list-group-item list-group-item-warning">专业：内科专业</li>
                      <li class="list-group-item list-group-item-info">女 &nbsp; 56岁 </li>
                      <li class="list-group-item" style="height: 140px;overflow-y:auto;">女， 从事中医临床30年，曾师从徐文达、宋世焱、董幼祺等著名老中医。擅长诊治月经失调、痛经、不孕症、盆腔炎、乳房小叶增生、更年期综合症和胃痛、头痛、肿瘤等内、妇科疾病。</li>
                    </ul>
                  </div>
             </div>
            </div>
            
            <div style="width: 320px;float: left;margin-left: 30px;">
             <div class="thumbnail" style="border-color:#bcebf1;;">
                  <div class="caption">
                    <h4>付波<span class="badge" style="background-color: slateblue">副主任医师</span></h4>
                   <ul class="list-group">
                      <li class="list-group-item list-group-item-success">宁波市第一医院 @ 耳鼻喉科专家</li>
                      <li class="list-group-item list-group-item-warning">专业：眼耳鼻咽喉科专业</li>
                      <li class="list-group-item list-group-item-info">女 &nbsp;55岁</li>
                      <li class="list-group-item" style="height: 140px;overflow-y:auto;">1979年毕业于宁波市第二医院卫校临床医学专业，在宁波市第一医院耳鼻咽喉专业工作30年，在耳鼻喉科的常见病、多发病及疑难病、复杂的疾病的诊断及治疗上有丰富的临床经验。</li>
                    </ul>
                  </div>
             </div>
            </div>
        </div>
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
    </form>
     <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</body>
</html>
