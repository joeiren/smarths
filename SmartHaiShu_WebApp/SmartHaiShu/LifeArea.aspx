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

     function dyniframesize(down) {
         var pTar = null;
         if (document.getElementById) {
             pTar = document.getElementById(down);
         }
         else {
             eval('pTar = ' + down + ';');
         }
         if (pTar && !window.opera) {
             //begin resizing iframe
             pTar.style.display = "block";
             if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
                 //ns6 syntax
                 pTar.height = pTar.contentDocument.body.offsetHeight + 10;
                 pTar.width = pTar.contentDocument.body.scrollWidth + 10;
             }
             else if (pTar.Document && pTar.Document.body.scrollHeight) {
                 //ie5+ syntax
                 pTar.height = pTar.Document.body.scrollHeight;
                 pTar.width = pTar.Document.body.scrollWidth;
             }
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
            <div class="container_bg col-sm-8 col-md-8" id="rigthContainer">
                <iframe src ="LifeSpecial.aspx" frameborder="0"  marginheight="0" marginwidth="0" frameborder="0" scrolling="auto" id="contentFrame" name="ifm" onload="javascript:dyniframesize('contentFrame');" width="100%">
</iframe> 
            </div>
        </li>
    </ul>
    </div>
</asp:Content>