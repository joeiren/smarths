<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LifeHotel.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.LifeHotel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>酒店住宿</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
      <div id="container1" class="container ">
        <ul class="nav nav-pills" role="tablist">
          <li class="active"><a href="#star" role="tab" data-toggle="tab">星级酒店</a></li>
          <li><a href="#flower" role="tab" data-toggle="tab">花级酒店</a></li>
  
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
          <div class="tab-pane fade in active" id="star">
              <div class="row ">
                <div class="panel-group" id="accordion">
                
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link " data-toggle="collapse"  data-parent="#accordion" data-target="#collapse1">
                            宁波香溢大酒店 
                            </button>
                            <span class="pull-right"><small><mark>浙江省宁波市海曙区西河街158号</mark></small></span>
                        </div>
                        <div id="collapse1"  class="panel-collapse collapse in">
                          <div class="panel-body" style="font-size: 12px; height: 240px;overflow-y:auto; border-color:#bcebf1;">
                             <p>
                            
                           宁波香溢大酒店是香溢联号企业中的一家三星级酒店，地处宁波市中心北斗河畔，距三江口商业闹市区2公里，离火车站仅5分钟车程，距机场约20分钟车程，交通十分便捷。酒店占地面积2800平方米，总建筑面积20000平方米，宏大的室外停车场占地1000平方米，主楼高十一层，整个建筑设计别致，内部装饰高雅，设施齐全。酒店拥有各式客房105间（套），客房宽敞明亮，高贵典雅，中央空调系统、国际国内电话、卫星电视节目、VOD电视点播系统、迷你吧，一应俱全，商务楼层均设有Internet接口。
    香溢中餐厅由专业厨师主理，以本地特色为主，荟萃南北风味，鲜活水产每天新鲜抵运，典雅的用餐环境，精致的菜肴，给你一个迥然不同的美食新感受。
    酒店设备配套齐全，设有大、中、小会议室、多功能厅、酒吧、美容美发中心、棋牌室、桑拿中心、精品商场，是商务旅游的理想下榻之处。
                          </p>
                           <!-- Table -->
                           <table class="table table-bordered table-striped table-condensed">  
                                  <thead> </thead>  
                                  <tbody>  
                                    <tr>  
                                      <td>新芝路-公交车站</td> <td>途经公交车：2路日, 26路, 118路, 510路, 809路, 821路</td>
                                    </tr>
                                    <tr>
                                        <td>联系电话</td><td>0574-87262999  </td>
                                    </tr>
                                </tbody>
                          </table>
                        
                          </div>
                        </div>
                      </div>
                      
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse2">
                            宁波万豪酒店
                            </button>
                            <span class="pull-right"><small><mark>宁波市海曙区和义路188号</mark></small></span>
                        </div>
                        <div id="collapse2"  class="panel-collapse collapse">
                          <div class="panel-body" style="font-size: 12px; height: 240px;overflow-y:auto; border-color:#bcebf1;">
                          <p>
                            座落于宁波繁华市中心的宁波万豪酒店，邻近姚江，靠近宁波市政府，中山公园和宁波市最大的商业区—天一广场，客房包括各类江景客房及套房，其中包括行政楼层、江景套房、大使套房、总统套房。客房设施完备，高速上网系统、电话留言、连接电源及数据接口、宽屏液晶电视以及卫星频道、保险箱、茶及咖啡自制设备等。餐饮设施一应俱全，拥有三个开放厨房的万豪咖啡厅（西餐厅），拥有江景包房的翡翠轩中餐厅，以及供应各式高档日式料理的寿司吧江户银，带给您时尚高贵的别样体验。
                          </p>
                           <!-- Table -->
                           <table class="table table-bordered table-striped table-condensed">  
                                  <thead> </thead>  
                                  <tbody>  
                                    <tr>  
                                      <td>厂堂街-公交车站</td> <td> 途经公交车：806路</td>
                                    </tr>
                                    <tr>
                                        <td>联系电话</td><td>0574-87108888  </td>
                                    </tr>
                                </tbody>
                          </table>

                          </div>
                        </div>
                      </div>
                      
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse3">
                            宁波大酒店
                            </button>
                            <span class="pull-right"><small><mark>中山东路145号</mark></small></span>
                        </div>
                        <div id="collapse3"  class="panel-collapse collapse">
                          <div class="panel-body" style="font-size: 12px; height: 240px;overflow-y:auto;border-color:#bcebf1;">
                          <p>
                           宁波大酒店是由宁波长江发展商城有限公司投资建造的四星级旅游涉外酒店，地处宁波市最繁华的中山东路中心位置，位于高档的中央商业区，屹北半球 著名的三江口、滨江花园之畔。
    酒店主楼28层，建筑面积3.6万平方米，拥有总统套房、欧、美、日、中式花园套房，高级商务行政房和各式标准房等300间（套），配有各类会议室及配套服务设施，能满足不同客人的需求，酒店设有大型美食城和设备先进、设施齐全的夜总会。同时还将为宾客提供翻译、钟点秘、旅游等多种配套服务。是浙江省最大的会议中心之一。
                          </p>
                           <!-- Table -->
                           <table class="table table-bordered table-striped table-condensed">  
                                  <thead> </thead>  
                                  <tbody>  
                                    <tr>  
                                      <td>宁波电台-公交车站</td> <td> 途经公交车：10路内环空调, 10路外环空调, 350路, 783路空调, 789路空调</td>
                                    </tr>
                                    <tr>
                                        <td>联系电话</td><td>0574-87108888  </td>
                                    </tr>
                                </tbody>
                          </table>
                          </div>
                        </div>
                      </div>
                      
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse4">
                            宁波海俱大酒店
                            </button>
                            <span class="pull-right"><small><mark>宁波市海曙区马园路218号</mark></small></span>
                        </div>
                        <div id="collapse4"  class="panel-collapse collapse">
                          <div class="panel-body" style="font-size: 12px; height: 240px;overflow-y:auto; border-color:#bcebf1;">
                           <p>
                           宁波海俱大酒店座落于宁波海曙区市中心繁华地段，交通便利，距天一广场、天一阁、月湖公园、汽车南站、火车南站5分钟内车程，距机场20分钟。酒店典雅时尚，设施完善，拥有各种豪华客房，独立的淋浴房，房内免费宽带接入和私人保险箱。餐厅拥有300人就餐及各类包厢，主理宁波地方菜。酒店配有商务中心、咖啡厅、日本料理、美容美发、KTV、桑拿、棋牌室及会议厅等服务项目，以及完备的安全监控系统和卫星电视，是您旅游开会、商务活动、休闲娱乐的理想场所。 2006年开业。2006年装修。 
                          </p>
                           <!-- Table -->
                           <table class="table table-bordered table-striped table-condensed">  
                                  <thead> </thead>  
                                  <tbody>  
                                    <tr>  
                                      <td>马园社区-公交车站</td> <td> 途经公交车：10路内环空调, 10路外环空调, 345路, 510路, 783路空调, 789路空调, 804路, 821路, 965路</td>
                                    </tr>
                                    <tr>
                                        <td>联系电话</td><td>0574-87076886  </td>
                                    </tr>
                                </tbody>
                          </table>
                          </div>
                        </div>
                      </div>
                      
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse5">
                            新姚丰宾馆
                            </button>
                             <span class="pull-right"><small><mark>宁波市海曙机场路姚丰段</mark></small></span>
                        </div>
                        <div id="collapse5"  class="panel-collapse collapse">
                          <div class="panel-body" style="font-size: 12px; height: 240px;overflow-y:auto; border-color:#bcebf1;">
                              <p>
                           
                           新姚丰宾馆按三星标准营建，宾馆座落于宁波市海曙区西端机场路上，宾馆环境优雅，交通便利，西邻宁波机场，南邻杭甬高速公路出口处，汽车客运中心，西面溪口风景区，梁祝文化主题公园，河姆渡遗址，必经之路。 
　　各具风格的客房百米间左右。网络各民的餐厅及包厢，芥蒂宁波海鲜特色，备有先进的音响灯泡设备的多功能会议室，富有专业经验的服务人员为您成功兴办各类活动提供有力保障。
                          </p>
                           <!-- Table -->
                           <table class="table table-bordered table-striped table-condensed">  
                                  <thead> </thead>  
                                  <tbody>  
                                    <tr>  
                                      <td></td> <td></td>
                                    </tr>
                                    <tr>
                                        <td>联系电话</td><td>  </td>
                                    </tr>
                                </tbody>
                          </table>
                          </div>
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
          <div class="tab-pane fade in" id="flower">
             
            <div class="row ">
                <div class="panel-group" id="accordion1">
                
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link " data-toggle="collapse"  data-parent="#accordion1" data-target="#collapse1a">
                            锦江之星天一店 
                            </button>
                            <span class="pull-right"><small><mark>江东区中山东路501号</mark></small></span>
                        </div>
                        <div id="collapse1a"  class="panel-collapse collapse in">
                          <div class="panel-body" style="font-size: 12px; height: 240px;overflow-y:auto; border-color:#bcebf1;">
                             <p>
                            
                          锦江之星天一店位于宁波市中山东路501号，邻近彩虹北路与中山东路交叉口，周围交通便捷，餐饮娱乐集中，商务繁华，距最繁华的天一广场仅1公里（5分钟车程/步行10分钟）。
    锦江之星天一店拥有干净整洁的标准房、商务房共120间，提供24小时热水、空调、电视、电话、和免费宽带上网。按照锦江之星标准服务，配备高档舒适的专用安睡宝床上用品、独立卫浴、标准的席梦思、床具及配套家具。酒店配套餐饮星连心茶餐厅，提供营养健康丰盛的特色早餐，早中晚专家营养美食。锦江之星天一店配有高效的红外线、110连网的报警系统、24小时监控设备,门锁采用电子感应门锁，更具安全性。
                          </p>
                           
                        
                          </div>
                        </div>
                      </div>
                      
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion1" data-target="#collapse2a">
                            南苑e家城南店
                            </button>
                            <span class="pull-right"><small><mark>宁波市海曙区环城西路南段756号</mark></small></span>
                        </div>
                        <div id="collapse2a"  class="panel-collapse collapse">
                          <div class="panel-body" style="font-size: 12px; height: 240px;overflow-y:auto; border-color:#bcebf1;">
                          <p>
                          南苑e家城南店，是一家已全面覆盖wifi无线网络的时尚主题酒店，座落于杭甬高速宁波段塘出口处，和宁波火车站、宁波汽车南站均只有八分钟车程，至宁波栎社机场也可在片刻钟内到达。宁波南苑e家（城南店）是一家时尚主题酒店，拥有客房102间：有单人房、大床房、双床房、套房等多种房型供您选择。房间布局简约精致、卫浴设施豪华舒适、服务个性温馨。每个房间都是一个时尚多彩、个性鲜明的主题空间。现代的建筑装修风格、规范的南苑服务模式、客户需求的准确定位，必将引领甬城商务酒店的时尚先河。
                          </p>
                           
                          </div>
                        </div>
                      </div>
                      
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion1" data-target="#collapse3a">
                            宁波南苑e家（天一店）
                            </button>
                            <span class="pull-right"><small><mark>海曙区长春路90号</mark></small></span>
                        </div>
                        <div id="collapse3a"  class="panel-collapse collapse">
                          <div class="panel-body" style="font-size: 12px; height: 240px;overflow-y:auto;border-color:#bcebf1;">
                          <p>
                         南苑e家天一店是南苑e家商务连锁旅店的直营店。旅店拥有单人间、标准间、套房等多种时尚标准客房115间，配备数字电视、国际互联网、国内国际直播电话、中央空调等设施为您开展商务、休闲活动提供便利。旅店另提供自动售货机、商务中心、快递、旅游预订等多项温馨服务，特别是环境幽雅的餐厅为您提供各类中西式美食和咖啡。旅店精致、时尚的客房设施及南苑模式的优良服务竭诚为您营造一个经济、精致、惊喜的温馨商务之家。
    旅店位于宁波市中心长春路90号，临近天下闻名的第一藏书楼天一阁，极具独特的文化意境、幽静宜人，距离天一广场2公里商业氛围浓厚，闹中取静。距离宁波火车南站和宁波海关不足1公里，交通极其方便。
                          </p>
                           
                          </div>
                        </div>
                      </div>
              
                </div>
            </div>     
            <div class="row text-center">
                <ul class="pagination pagination-sm " id="Ul1">
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

</div>
        
    </div>
    
    </form>
       <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</body>
</html>
