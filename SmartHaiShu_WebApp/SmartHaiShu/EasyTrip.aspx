<%@ Page Title="便捷出行" Language="C#" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master" AutoEventWireup="true" CodeBehind="EasyTrip.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.EasyTrip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
 <link rel="stylesheet" type="text/css" href="css/style.css" />
 <script type="text/javascript">
     $(document).ready(function() {
         $("#menu_list li ").click(function () {
             menuClick(this);
         } );
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
                 case "m_bus":
                     $("#contentFrame").attr('src', 'TripBusRoute.aspx');
                     break;
                 case "m_metro":
                     $("#contentFrame").attr('src', 'TripMetro.aspx');
                     break;
                 case "m_trip_info":
                     $("#contentFrame").attr('src', 'TripInfo.aspx');
                     break;
                 case "m_bike":
                     $("#contentFrame").attr('src', 'TripBike.aspx');
                     break;
                 case "m_train":
                     $("#contentFrame").attr('src', 'TripTrain.aspx');
                     break;
                 case "m_flight":
                     $("#contentFrame").attr('src', 'TripFlight.aspx');
                     break;
                 case "m_record":
                     $("#contentFrame").attr('src', 'TripRecord.aspx');
                     break;
                 case "m_4s":
                     $("#contentFrame").attr('src', 'Trip4S.aspx');
                     break;
                 case "m_car_school":
                     $("#contentFrame").attr('src', 'TripCarSchool.aspx');
                     break;
                 case "m_car_repair":
                     $("#contentFrame").attr('src', 'TripCarRepair.aspx');
                     break;
                 case "m_car_check":
                     $("#contentFrame").attr('src', 'TripCarCheck.aspx');
                     break;
                 default:
                     break;
             }
             ("#contentFrame").contentDocument.location.reload(true);

         }
     }

     function normalNode(scop) {
         switch (scop.id) {
             case "m_bus":
                 return '<a href="#"><span><img src="images/trip/bus.png" /></span><span><img src="images/trip/point.png" /></span><span>公交路线</span></a>';
             case "m_metro":
                 return '<a href="#"><span><img src="images/trip/metro.png" /></span><span><img src="images/trip/point.png" /></span><span>轨道交通</span></a>';
             case "m_trip_info":
                 return '<a href="#"><span><img src="images/trip/trip_info.png" /></span><span><img src="images/trip/point.png" /></span><span>出行信息</span></a>';
             case "m_bike":
                 return '<a href="#"><span><img src="images/trip/bike.png" /></span><span><img src="images/trip/point.png" /></span><span>公共自行车点位分布</span></a>';
             case "m_train":
                 return '<a href="#"><span><img src="images/trip/train.png" /></span><span><img src="images/trip/point.png" /></span><span>火车班次</span></a>';
             case "m_flight":
                 return '<a href="#"><span><img src="images/trip/flight.png" /></span><span><img src="images/trip/point.png" /></span><span>航班</span></a>';
             case "m_record":
                 return '<a href="#"><span><img src="images/trip/record.png" /></span><span><img src="images/trip/point.png" /></span><span>违章查询</span></a>';
             case "m_4s":
                 return '<a href="#"><span><img src="images/trip/4s.png" /></span><span><img src="images/trip/point.png" /></span><span>汽车4S店</span></a>';
             case "m_car_school":
                 return '<a href="#"><span><img src="images/trip/car_school.png" /></span><span><img src="images/trip/point.png" /></span><span>培训驾校</span></a>';
             case "m_car_repair":
                 return '<a href="#"><span><img src="images/trip/car_repair.png" /></span><span><img src="images/trip/point.png" /></span><span>汽车维修站</span></a>';
             case "m_car_check":
                 return '<a href="#"><span><img src="images/trip/car_check.png" /></span><span><img src="images/trip/point.png" /></span><span>汽车检修站</span></a>';
                
             default:
                 return "";
             
        }
     }

     function selectedNode(scop) {
         switch (scop.id) {
             case "m_bus":
                 return '<a href="#"><span><img src="images/trip/bus_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">公交路线</span></a>';
             case "m_metro":
                 return '<a href="#"><span><img src="images/trip/metro_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">轨道交通</span></a>';
             case "m_trip_info":
                 return '<a href="#"><span><img src="images/trip/trip_info_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">出行信息</span></a>';
             case "m_bike":
                 return '<a href="#"><span><img src="images/trip/bike_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">公共自行车点位分布</span></a>';
             case "m_train":
                 return '<a href="#"><span><img src="images/trip/train_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">火车班次</span></a>';
             case "m_flight":
                 return '<a href="#"><span><img src="images/trip/flight_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">航班</span></a>';
             case "m_record":
                 return '<a href="#"><span><img src="images/trip/record_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">违章查询</span></a>';
             case "m_4s":
                 return '<a href="#"><span><img src="images/trip/4s_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">汽车4S店</span></a>';
             case "m_car_school":
                 return '<a href="#"><span><img src="images/trip/car_school_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">培训驾校</span></a>';
             case "m_car_repair":
                 return '<a href="#"><span><img src="images/trip/car_repair_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">汽车维修站</span></a>';
             case "m_car_check":
                 return '<a href="#"><span><img src="images/trip/car_check_0.png" /></span><span><img src="images/trip/point_0.png" /></span><span style="font-weight: bold;color: orange;">汽车检修站</span></a>';
                
             default:
                 return "";

         }
     }

//     function dyniframesize(down) {
//         var pTar = null;
//         if (document.getElementById) {
//             pTar = document.getElementById(down);
//         }
//         else {
//             eval('pTar = ' + down + ';');
//         }
//         if (pTar && !window.opera) {
//             //begin resizing iframe
//             pTar.style.display = "block";
//             if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight) {
//                 //ns6 syntax
//                 pTar.height = pTar.contentDocument.body.offsetHeight+10 ;
//                 pTar.width = pTar.contentDocument.body.scrollWidth +10;
//             }
//             else if (pTar.Document && pTar.Document.body.scrollHeight) {
//                 //ie5+ syntax
//                 pTar.height = pTar.Document.body.scrollHeight;
//                 pTar.width = pTar.Document.body.scrollWidth;
//             }
//         }
//     } 
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
                   <li id="m_bus" class="sel">
                       <a href="#">
                           <span><img src="images/trip/bus_0.png" /></span>
                           <span><img src="images/trip/point_0.png" /></span>
                           <span style="font-weight: bold;color: orange;">公交路线</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_metro">
                       <a href="#">
                           <span><img src="images/trip/metro.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>轨道交通</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_trip_info">
                       <a href="#">
                           <span><img src="images/trip/trip_info.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>出行信息</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_bike">
                       <a href="#">
                           <span><img src="images/trip/bike.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>公共自行车点位分布</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                  <li id="m_train">
                       <a href="#">
                           <span><img src="images/trip/train.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>火车班次</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_flight">
                       <a href="#">
                           <span><img src="images/trip/flight.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>航班</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_record">
                       <a href="#">
                           <span><img src="images/trip/record.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>违章查询</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   
                   <li id="m_4s">
                       <a href="#">
                           <span><img src="images/trip/4s.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>汽车4S店</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_car_school">
                       <a href="#">
                           <span><img src="images/trip/car_school.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>培训驾校</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_car_repair">
                       <a href="#">
                           <span><img src="images/trip/car_repair.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>汽车维修站</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
                   <li id="m_car_check">
                       <a href="#">
                           <span><img src="images/trip/car_check.png" /></span>
                           <span><img src="images/trip/point.png" /></span>
                           <span>车辆检测站</span>
                       </a>
                   </li>
                   <li class="vline_spliter"> |</li>
               </ul>
            </div>
        </li>
        <li>

             <div class="container_bg col-sm-8 col-md-8" style="padding-left: 1px;padding-top: 0px; padding-right: 0px; padding-bottom: 0px;" id="rigthContainer">
               
<iframe src="TripBusRoute.aspx" id="contentFrame" name="contentFrame" frameborder="0"  marginheight="0" marginwidth="0" scrolling="auto" width="100%" onLoad="iFrameHeight()" ></iframe>
            </div>
        </li>
    </ul>
    </div>
</asp:Content>
