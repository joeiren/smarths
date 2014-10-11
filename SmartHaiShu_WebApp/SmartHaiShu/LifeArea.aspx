<%@ Page TiTle="社区生活圈" Language="C#" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master"  AutoEventWireup="true" CodeBehind="LifeArea.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.LifeArea" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" type="text/css" href="css/style.css" />
 <script type="text/javascript">
     SmartHS_mode = "3";
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
                 case "m_special":
                     $("#contentFrame").attr('src', 'LifeSpecial.aspx');
                     break;
                 case "m_market":
                     $("#contentFrame").attr('src', 'LifeMarket.aspx');
                     break;
                 case "m_hotel":
                     $("#contentFrame").attr('src', 'LifeHotel.aspx');
                     break;

                 default:
                     break;
             }
             ("#contentFrame").contentDocument.location.reload(true);
         }
     }

     function normalNode(scop) {
         switch (scop.id) {
         case "m_special":
             return '<a href="#"><span><img src="images/trip/bus.png" /></span><span><img src="images/trip/point.png" /></span><span>商家优惠</span></a>';
         case "m_market":
             return '<a href="#"><span><img src="images/trip/metro.png" /></span><span><img src="images/trip/point.png" /></span><span>商场超市</span></a>';
         case "m_hotel":
             return '<a href="#"><span><img src="images/trip/trip_info.png" /></span><span><img src="images/trip/point.png" /></span><span>酒店住宿</span></a>';
             
         default:
             return "";
         }
     }

     function selectedNode(scop) {
         switch (scop.id) {
         case "m_special":
             return '<a href="#"><span><img src="images/trip/bus_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">商家优惠</span></a>';
         case "m_market":
             return '<a href="#"><span><img src="images/trip/metro_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">商场超市</span></a>';
         case "m_hotel":
             return '<a href="#"><span><img src="images/trip/trip_info_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">酒店住宿</span></a>';
             
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
                   <li id="m_special" class="sel">
                       <a href="#">
                           <span><img src="images/trip/bus_0.png" /></span>
                           <span><img src="images/trip/point_0.png" /></span>
                           <span style="font-weight: bold;color: orange;">商家优惠</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_market">
                       <a href="#">
                           <span><img src="images/trip/metro.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>商场超市</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_hotel">
                       <a href="#">
                           <span><img src="images/trip/trip_info.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>酒店住宿</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   
               </ul>
            </div>
        </li>
        <li>
            
             <div class="container_bg col-sm-8 col-md-8" style="padding-left: 1px;padding-top: 0px; padding-right: 0px; padding-bottom: 0px;" id="rigthContainer">
               
                <iframe src="LifeSpecial.aspx" id="contentFrame" name="contentFrame" frameborder="0"  marginheight="0" marginwidth="0" scrolling="auto" width="100%" onLoad="iFrameHeight()" ></iframe>
            </div>
        </li>
    </ul>
    </div>
</asp:Content>