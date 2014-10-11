<%@ Page Title="互动家园" Language="C#" AutoEventWireup="true" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master" CodeBehind="HomeInteraction.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.InteractionHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
 <link rel="stylesheet" type="text/css" href="css/style.css" />
 <script type="text/javascript">
     SmartHS_mode = "4";
     $(document).ready(function () {
         $("#menu_list li ").click(function () {
             menuClick(this);
         });
     });

     function menuClick(menu) {
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
             case "m_phonerefer":
                 $("#contentFrame").attr('src', 'HomePhoneRefer.aspx');
                 break;
             case "m_streetmail":
                 $("#contentFrame").attr('src', 'HomeStreetMail.aspx');
                 break;
             case "m_volunteer":
                 $("#contentFrame").attr('src', 'HomeVolunteer.aspx');
                 break;
             case "m_interact":
                 $("#contentFrame").attr('src', 'HomeInteractPost.aspx');
                 break;
             case "m_fljs":
                 $("#contentFrame").attr('src', 'HomeFljs.aspx');
                 break;
                 
             default:
                 break;
             }
             ("#contentFrame").contentDocument.location.reload(true);

         }
     }

     function normalNode(scop) {
         switch (scop.id) {
         case "m_phonerefer":
             return '<a href="#"><span><img src="images/home/phonerefer.png" /></span><span><img src="images/trip/point.png" /></span><span>电话咨询</span></a>';
         case "m_streetmail":
             return '<a href="#"><span><img src="images/home/streetmail.png" /></span><span><img src="images/trip/point.png" /></span><span>街道信箱</span></a>';
         case "m_volunteer":
             return '<a href="#"><span><img src="images/home/volunteer.png" /></span><span><img src="images/trip/point.png" /></span><span>志愿者之家</span></a>';
         case "m_interact":
             return '<a href="#"><span><img src="images/home/interact.png" /></span><span><img src="images/trip/point.png" /></span><span>互帮互助</span></a>';
         case "m_fljs":
             return '<a href="#"><span><img src="images/home/fljs.png" /></span><span><img src="images/trip/point.png" /></span><span>锋领集市</span></a>';
             
         default:
             return "";

         }
     }

     function selectedNode(scop) {
         switch (scop.id) {
         case "m_phonerefer":
             return '<a href="#"><span><img src="images/home/phonerefer_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">电话咨询</span></a>';
         case "m_streetmail":
             return '<a href="#"><span><img src="images/home/streetmail_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">街道信箱</span></a>';
         case "m_volunteer":
             return '<a href="#"><span><img src="images/home/volunteer_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">志愿者之家</span></a>';
         case "m_interact":
             return '<a href="#"><span><img src="images/home/interact_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">互帮互助</span></a>';
         case "m_fljs":
             return '<a href="#"><span><img src="images/home/fljs_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">锋领集市</span></a>';
             
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
                   <li id="m_phonerefer" class="sel">
                       <a href="#">
                           <span><img src="images/home/phonerefer_0.png" /></span>
                           <span><img src="images/trip/point_0.png" /></span>
                           <span style="font-weight: bold;color: orange;">电话咨询</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_streetmail" class="sel">
                       <a href="#">
                           <span><img src="images/home/streetmail.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>街道信箱</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_volunteer">
                       <a href="#">
                           <span><img src="images/home/volunteer.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>志愿者之家</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_interact">
                       <a href="#">
                           <span><img src="images/home/interact.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>互帮互助</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_fljs">
                       <a href="#">
                           <span><img src="images/home/fljs.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>锋领集市</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                  
               </ul>
            </div>
        </li>
        <li>
            <div class="container_bg col-sm-8 col-md-8" id="rigthContainer" style="padding-left: 1px;padding-top: 0px; padding-right: 0px; padding-bottom: 0px;">
              

<iframe src="HomePhoneRefer.aspx" id="contentFrame" name="contentFrame" frameborder="0"  marginheight="0" marginwidth="0" scrolling="auto" width="100%" onLoad="iFrameHeight()" ></iframe>
            </div>
        </li>
    </ul>
    </div>
</asp:Content>
