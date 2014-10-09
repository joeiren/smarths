<%@ Page TiTle="便民生活" Language="C#" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master" AutoEventWireup="true" CodeBehind="ConvenienceLive.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.ConvenienceLive" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <link rel="stylesheet" type="text/css" href="css/style.css" />
 <script type="text/javascript">
     $(document).ready(function () {
         $("#menu_list li ").click(function () {
             menuClick(this);
//             if (this.id.indexOf("m_") == 0) {
//                 var selected = $("#menu_list li.sel").first();
//                 if (selected.length != null && selected.length > 0) {
//                     var html = normalNode(selected[0]);
//                     selected.removeClass("sel").empty().append(html);
//                 }
//                 var selHtml = selectedNode(this);
//                 $(this).addClass("sel").empty().append(selHtml);

//                 switch (this.id) {
//                     case "m_price":
//                         $("#contentFrame").attr('src', 'ConvLivePrice.aspx');
//                         break;
//                     case "m_house_keeping":
//                         $("#contentFrame").attr('src', 'ConvLiveHouseKeeping.aspx');
//                         break;
//                     case "m_express":
//                         $("#contentFrame").attr('src', 'ConvLiveExpress.aspx');
//                         break;
//                     case "m_social_security":
//                         $("#contentFrame").attr('src', 'ConvLiveSocialSecurity.aspx');
//                         break;
//                     case "m_fund":
//                         $("#contentFrame").attr('src', 'ConvLiveFund.aspx');
//                         break;
//                     case "m_bank":
//                         $("#contentFrame").attr('src', 'ConvLiveBank.aspx');
//                         break;

//                     default:
//                         break;
//                 }
//                 ("#contentFrame").contentDocument.location.reload(true);

//             }
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
                 case "m_price":
                     $("#contentFrame").attr('src', 'ConvLivePrice.aspx');
                     break;
                 case "m_house_keeping":
                     $("#contentFrame").attr('src', 'ConvLiveHouseKeeping.aspx');
                     break;
                 case "m_express":
                     $("#contentFrame").attr('src', 'ConvLiveExpress.aspx');
                     break;
                 case "m_social_security":
                     $("#contentFrame").attr('src', 'ConvLiveSocialSecurity.aspx');
                     break;
                 case "m_fund":
                     $("#contentFrame").attr('src', 'ConvLiveFund.aspx');
                     break;
                 case "m_bank":
                     $("#contentFrame").attr('src', 'ConvLiveBank.aspx');
                     break;

                 default:
                     break;
             }
             ("#contentFrame").contentDocument.location.reload(true);

         }
     }

     function normalNode(scop) {
         switch (scop.id) {
             case "m_price":
                 return '<a href="#"><span><img src="images/trip/bus.png" /></span><span><img src="images/trip/point.png" /></span><span>物价查询</span></a>';
             case "m_house_keeping":
                 return '<a href="#"><span><img src="images/trip/metro.png" /></span><span><img src="images/trip/point.png" /></span><span>家政维修</span></a>';
             case "m_express":
                 return '<a href="#"><span><img src="images/trip/trip_info.png" /></span><span><img src="images/trip/point.png" /></span><span>快递查询</span></a>';
             case "m_social_security":
                 return '<a href="#"><span><img src="images/trip/bus.png" /></span><span><img src="images/trip/point.png" /></span><span>社保查询</span></a>';
             case "m_fund":
                 return '<a href="#"><span><img src="images/trip/metro.png" /></span><span><img src="images/trip/point.png" /></span><span>公积金查询</span></a>';
             case "m_bank":
                 return '<a href="#"><span><img src="images/trip/trip_info.png" /></span><span><img src="images/trip/point.png" /></span><span>银行网点</span></a>';


             default:
                 return "";
         }
     }

     function selectedNode(scop) {
         switch (scop.id) {
             case "m_price":
                 return '<a href="#"><span><img src="images/trip/bus_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">物价查询</span></a>';
             case "m_house_keeping":
                 return '<a href="#"><span><img src="images/trip/metro_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">家政维修</span></a>';
             case "m_express":
                 return '<a href="#"><span><img src="images/trip/trip_info_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">快递查询</span></a>';
             case "m_social_security":
                 return '<a href="#"><span><img src="images/trip/bus_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">社保查询</span></a>';
             case "m_fund":
                 return '<a href="#"><span><img src="images/trip/metro_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">公积金查询</span></a>';
             case "m_bank":
                 return '<a href="#"><span><img src="images/trip/trip_info_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">银行网点</span></a>';

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
                 pTar.height = pTar.contentDocument.body.offsetHeight;
                 pTar.width = pTar.contentDocument.body.scrollWidth;
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
                   <li id="m_price" class="sel">
                       <a href="#">
                           <span><img src="images/trip/bus_0.png" /></span>
                           <span><img src="images/trip/point_0.png" /></span>
                           <span style="font-weight: bold;color: orange;">物价查询</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_house_keeping">
                       <a href="#">
                           <span><img src="images/trip/metro.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>家政维修</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_express">
                       <a href="#">
                           <span><img src="images/trip/trip_info.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>快递查询</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_social_security">
                       <a href="#">
                           <span><img src="images/trip/metro.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>社保查询</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_fund">
                       <a href="#">
                           <span><img src="images/trip/metro.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>公积金查询</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_bank">
                       <a href="#">
                           <span><img src="images/trip/metro.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>银行网点</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   
               </ul>
            </div>
        </li>
        <li>
            <div class="container_bg col-sm-8 col-md-8" id="rigthContainer">
                <iframe src ="ConvLivePrice.aspx" frameborder="0"  marginheight="0" marginwidth="0" scrolling="auto" id="contentFrame" name="ifm" onload="javascript:dyniframesize('contentFrame');" width="100%">
</iframe> 
            </div>
        </li>
    </ul>
    </div>
</asp:Content>
