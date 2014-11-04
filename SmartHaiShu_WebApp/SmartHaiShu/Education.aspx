<%@ Page Title="医疗教育" Language="C#" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master" AutoEventWireup="true" CodeBehind="Education.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.Education" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
 <link rel="stylesheet" type="text/css" href="css/style.css" />
 <script type="text/javascript">
     SmartHS_mode = "5";
     $(document).ready(function () {
         $("#menu_list li ").click(function () {
             menuClick(this);
         });
     });

     function menuClick(menu) {
         var scop = menu;
         if (menu.id == undefined && menu.length > 0) {
             menu = menu[0];
         }
         if (menu.id.indexOf("m_") == 0) {
             var selected = $("#menu_list li.sel").first();
             if (selected.length != null && selected.length > 0) {
                 var html = normalNode(selected[0]);
                 selected.removeClass("sel").empty().append(html);
             }
             var selHtml = selectedNode(menu);
             $(menu).addClass("sel").empty().append(selHtml);

             switch (menu.id) {
                 case "m_school":
                     $("#contentFrame").attr('src', 'EduSchool.aspx');
                     break;
                 case "m_kindergarten":
                     $("#contentFrame").attr('src', 'EduKindergarten.aspx');
                     break;
                 case "m_edu_info":
                     $("#contentFrame").attr('src', 'EduInfo.aspx');
                     break;
                 case "m_jobs":
                     $("#contentFrame").attr('src', 'EduJobs.aspx');
                     break;
                 case "m_hospital":
                     $("#contentFrame").attr('src', 'EduHospital.aspx');
                     break;
                 case "m_doctors":
                     $("#contentFrame").attr('src', 'EduDoctors.aspx');
                     break;
                 case "m_order":
                     $("#contentFrame").attr('src', 'EduHospitalOrder.aspx');
                     break;
                 case "m_drugstore":
                     $("#contentFrame").attr('src', 'EduDrugStore.aspx');
                     break;
                 case "m_health":
                     $("#contentFrame").attr('src', 'EduHealth.aspx');
                     break;
                 case "m_old_people":
                     $("#contentFrame").attr('src', 'EduOldPeople.aspx');
                     break;
                 default:
                     break;
             }
             ("#contentFrame").contentDocument.location.reload(true);

         }
     }

     function normalNode(scop) {
         switch (scop.id) {
         case "m_school":
             return '<a href="#"><span><img src="images/educ/school.png" /></span><span><img src="images/trip/point.png" /></span><span>学校讯息</span></a>';
         case "m_kindergarten":
             return '<a href="#"><span><img src="images/educ/kindergarten.png" /></span><span><img src="images/trip/point.png" /></span><span>幼儿园讯息</span></a>';
         case "m_edu_info":
             return '<a href="#"><span><img src="images/educ/edu_info.png" /></span><span><img src="images/trip/point.png" /></span><span>教育资讯</span></a>';
         case "m_jobs":
             return '<a href="#"><span><img src="images/educ/jobs.png" /></span><span><img src="images/trip/point.png" /></span><span>招聘信息</span></a>';
         case "m_hospital":
             return '<a href="#"><span><img src="images/educ/hospital.png" /></span><span><img src="images/trip/point.png" /></span><span>医院介绍</span></a>';
         case "m_doctors":
             return '<a href="#"><span><img src="images/educ/doctors.png" /></span><span><img src="images/trip/point.png" /></span><span>专家介绍</span></a>';
         case "m_order":
             return '<a href="#"><span><img src="images/educ/order.png" /></span><span><img src="images/trip/point.png" /></span><span>挂号预约</span></a>';
         case "m_drugstore":
             return '<a href="#"><span><img src="images/educ/drugstore.png" /></span><span><img src="images/trip/point.png" /></span><span>药店分布</span></a>';
         case "m_health":
             return '<a href="#"><span><img src="images/educ/health.png" /></span><span><img src="images/trip/point.png" /></span><span>健康百科</span></a>';
         case "m_old_people":
             return '<a href="#"><span><img src="images/educ/old_people.png" /></span><span><img src="images/trip/point.png" /></span><span>养老院信息</span></a>';
             
         default:
             return "";
         }
     }

     function selectedNode(scop) {
         switch (scop.id) {
         case "m_school":
             return '<a href="#"><span><img src="images/educ/school_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">学校讯息</span></a>';
         case "m_kindergarten":
             return '<a href="#"><span><img src="images/educ/kindergarten_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">幼儿园讯息</span></a>';
         case "m_edu_info":
             return '<a href="#"><span><img src="images/educ/edu_info_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">教育资讯</span></a>';
         case "m_jobs":
             return '<a href="#"><span><img src="images/educ/jobs_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">招聘信息</span></a>';
         case "m_hospital":
             return '<a href="#"><span><img src="images/educ/hospital_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">医院介绍</span></a>';
         case "m_doctors":
             return '<a href="#"><span><img src="images/educ/doctors_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">专家介绍</span></a>';
         case "m_order":
             return '<a href="#"><span><img src="images/educ/order_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">挂号预约</span></a>';
         case "m_drugstore":
             return '<a href="#"><span><img src="images/educ/drugstore_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">药店分布</span></a>';
         case "m_health":
             return '<a href="#"><span><img src="images/educ/health_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">健康百科</span></a>';
         case "m_old_people":
             return '<a href="#"><span><img src="images/educ/old_people_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">养老院信息</span></a>';
            
         default:
             return "";

         }
     }

     function iFrameHeight() {
         var ifm = document.getElementById("contentFrame");
         var subWeb = document.frames ? document.frames["contentFrame"].document : ifm.contentDocument;
         if (ifm != null && subWeb != null) {
             ifm.height = subWeb.body.scrollHeight;
         }
     } 
 </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div class="container">

    <ul id="tripContainer">
        <li id="leftNav">
            <div class="row left_bg col-sm-3 col-md-3">
               <ul id="menu_list" style="padding-left: 30px;">
                   <li class="vline_spliter"> |</li>
                   <li id="m_school" class="sel">
                       <a href="#">
                           <span><img src="images/educ/school_0.png" /></span>
                           <span><img src="images/trip/point_0.png" /></span>
                           <span style="font-weight: bold;color: orange;">学校讯息</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_kindergarten">
                       <a href="#">
                           <span><img src="images/educ/kindergarten.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>幼儿园讯息</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_edu_info">
                       <a href="#">
                           <span><img src="images/educ/edu_info.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>教育资讯</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_jobs">
                       <a href="#">
                           <span><img src="images/educ/jobs.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>招聘信息</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                  <li id="m_hospital">
                       <a href="#">
                           <span><img src="images/educ/hospital.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>医院介绍</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_doctors">
                       <a href="#">
                           <span><img src="images/educ/doctors.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>专家介绍</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_order">
                       <a href="#">
                           <span><img src="images/educ/order.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>挂号预约</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   
                   <li id="m_drugstore">
                       <a href="#">
                           <span><img src="images/educ/drugstore.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>药店分布</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_health">
                       <a href="#">
                           <span><img src="images/educ/health.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>健康百科</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_old_people">
                       <a href="#">
                           <span><img src="images/educ/old_people.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>养老院信息</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                  
               </ul>
            </div>
        </li>
        <li>
            <div class="container_bg col-sm-9 col-md-9" style="padding-left: 1px;padding-top: 0px; padding-right: 0px; padding-bottom: 0px;" id="rigthContainer">
               
<iframe src="EduSchool.aspx" id="contentFrame" name="contentFrame" frameborder="0"  marginheight="0" marginwidth="0" scrolling="auto" width="100%" onLoad="iFrameHeight()" ></iframe>
            </div>
        </li>
    </ul>
    </div>
</asp:Content>