<%@ Page Title="海曙智慧社区" Language="C#" MasterPageFile="~/SmartHaiShu/SmartHaiShu.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
    
    SmartHS_url = "index";
    SmartHS_mode = "1";

    $(function () {
        
    });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div style="float: left;">
            <div class="row" style=" padding-left:240px;">
            <div id="carousel1" class="carousel slide pull-left" data-ride="carousel" style="width: 620px;">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel1" data-slide-to="0" class="active"></li>
                <li data-target="#carousel1" data-slide-to="1"></li>
               <%-- <li data-target="#carousel1" data-slide-to="2"></li>--%>
           
              </ol>
    
              <!-- Wrapper for slides -->
              <div class="carousel-inner" style="text-align:center">
                <div class="item active">
                  <img alt="First slide" src="images/53f444b8N7c7db751.jpg" ></img>
                </div>
                <div class="item">
                  <img alt="Second slide" src="images/53f4799dNc363ef75.jpg" ></img>
                </div>
              </div>
    
              <!-- Controls -->
              <a class="left carousel-control" href="#carousel1" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
              </a>
              <a class="right carousel-control" href="#carousel1" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
              </a>
            </div>
        </div>
            <div class="row" style="margin-left: 20px;margin-top: 20px;">
                <div class="panel panel-default">
                    <div class="panel-body">
                <div class="media pull-left" style="margin: 10px;">
                    <a href="Education.aspx?toSub=m_order">
                        <img class="media-object" src="images/index/icon7.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">挂号预约</h5>
                      </div>
                </div>
                 <div class="media pull-left" style="margin: 10px;">
                    <a href="EasyTrip.aspx?toSub=m_record">
                        <img class="media-object" src="images/index/icon9.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">违章查询</h5>
                      </div>
                </div>
                 <div class="media pull-left" style="margin: 10px;">
                    <a href="ConvenienceLive.aspx?toSub=m_fund">
                        <img class="media-object" src="images/index/icon8.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">公积金查询</h5>
                      </div>
                </div>
                 <div class="media pull-left" style="margin: 10px;">
                    <a href="ConvenienceLive.aspx?toSub=m_express">
                        <img class="media-object" src="images/index/icon10.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">快递查询</h5>
                      </div>
                </div>
                <div class="media pull-left" style="margin: 10px;">
                    <a href="ConvenienceLive.aspx?toSub=m_social_security">
                        <img class="media-object" src="images/index/icon11.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">社保查询</h5>
                      </div>
                </div>
                <div class="media pull-left" style="margin: 10px;">
                    <a href="ConvenienceLive.aspx?toSub=m_bank">
                        <img class="media-object" src="images/index/icon12.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">银行网点</h5>
                      </div>
                </div>
                <div class="media pull-left" style="margin: 10px;">
                    <a href="EasyTrip.aspx?toSub=m_metro">
                        <img class="media-object" src="images/index/icon14.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">轨道交通</h5>
                      </div>
                </div>
                <div class="media pull-left" style="margin: 10px;">
                    <a href="EasyTrip.aspx?toSub=m_metro">
                        <img class="media-object" src="images/index/icon13.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">公交查询</h5>
                      </div>
                </div>
                </div>
                </div>
                
        </div>
        </div>
        <div style="float: left;margin-left: 30px;width: 230px; ">
                <div class="panel panel-default">
                    <div class="panel-heading text-center"><h5>社区电话本</h5></div>
                      <div class="panel-body" id="telbook" style="height: 150px;overflow-y:auto;">
           
                      </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading text-center"><h5>通知</h5></div>
                      <div class="panel-body" id="notice" style="height: 390px;overflow-y:auto;">
                          <div class="row">
            <div class="panel-group" id="accordion">
                
                    <div class="panel panel-default">
                        <div class="panel-heading">
                           <%-- <button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse1">
                            停电通知
                            </button>--%>
                            <a data-toggle="collapse"  data-parent="#accordion" data-target="#collapse1"  style="cursor:pointer;color: orangered;" >停电通知</a>
                        </div>
                        <div id="collapse1"  class="panel-collapse collapse in">
                          <div class="panel-body" style="font-size: 12px; padding: 0px;">
                              <ul class="list-group" style="margin-bottom: 0px;">
                                  <li class="list-group-item list-group-item-text">时间：<%=Notice1.Time%></li>
                                  <li class="list-group-item list-group-item-text">线路：<%=Notice1.Line %></li>
                                  <li class="list-group-item">发布时间：<%=Notice1.ReleaseTime.ToString("yyyy-MM-dd") %></li>
                                  <li class="list-group-item" style="height: 120px;overflow-y:auto;">停电范围：<p><%=Notice1.Range %></p></li>
                              </ul>
                          </div>
                        </div>
                      </div>
                    <div class="panel panel-default">
                    <div class="panel-heading" >
                        <%--<button type="button" class="btn btn-warning  btn-link" data-toggle="collapse"  data-parent="#accordion" data-target="#collapse2">
                        停水通知
                        </button>--%>
                        <a data-toggle="collapse"  data-parent="#accordion" data-target="#collapse2"  style="cursor:pointer;color: orangered;">停水通知</a>
                    </div>
                    <div id="collapse2"  class="panel-collapse collapse">
                        <div class="panel-body" style="font-size: 12px;padding: 0px; ">
                            <ul class="list-group" style="margin-bottom: 0px;">
                                <li class="list-group-item list-group-item-text">时间：<%=Notice2.Time %></li>
                                <li class="list-group-item list-group-item-text">停水原因：<%=Notice2.Reason %></li>
                                <li class="list-group-item">发布时间：<%=Notice2.ReleaseTime.ToString("yyyy-MM-dd") %></li>
                                <li class="list-group-item" style="height: 120px;overflow-y:auto;">停水范围：<p><%=Notice2.Range %></p></li>
                            </ul>
                        </div>
                    </div>
                    </div>
                      </div>
                       
                      </div>
                </div>
            </div>
    </div>


    <%--<div class="w">
    <div id="o-slide" style="width:890px;">

        <div class="slide" id="slide" style=" padding-left:220px;">
            <div id="xxx"  >
                <script>
                    var box = new PPTBox();
                    box.width = 670; //宽度
                    box.height = 218; //高度
                    box.autoplayer = 3; //自动播放间隔时间

                    //box.add({"url":"图片地址","title":"悬浮标题","href":"链接地址"})
                    box.add({ "url": "images/53f444b8N7c7db751.jpg", "href": "#", "title": "悬浮提示标题1" })
                    box.add({ "url": "images/53f4799dNc363ef75.jpg", "href": "#", "title": "悬浮提示标题2" })
                    box.add({ "url": "images/53f444b8N7c7db751.jpg", "href": "#", "title": "悬浮提示标题3" })
                    box.add({ "url": "images/53f444b8N7c7db751.jpg", "href": "#", "title": "悬浮提示标题4" })
                    box.show();
                </script>
            </div>
        </div>
       
        <div class="jscroll" id="mscroll">
            <div class="o-list">
                <div class="list" id="mscroll-list" style="position: relative; /*width: 609px;*/ height: 159px; overflow: hidden;">
                    <ul class="lh" style="padding-top: 25px; position: absolute; width: 3654px; height: 159px; top: 0px; left: 0px;">    
                    <li class="item fore1" clstag="homepage|keycount|home2013|09b1">        
                    <a href="#" target="_blank">            
                        <div><img src="images/index/icon7.png" /></div><div class="faster">预约挂号</div>
                    </a>    
                    </li>    
                    <li class="item fore2" clstag="homepage|keycount|home2013|09b2">        
                    <a href="#" target="_blank">            
                        <div><img src="images/index/icon9.png" /></div><div class="faster">违章查询</div>
                    </a>    
                    </li>    
                    <li class="item fore3" clstag="homepage|keycount|home2013|09b3">        
                    <a href="#" target="_blank">            
                        <div><img src="images/index/icon8.png" /></div><div class="faster">公积金查询</div>
                    </a>    
                    </li> 
                    <li class="item fore4" clstag="homepage|keycount|home2013|09b3">        
                    <a href="#" target="_blank">            
                        <div><img src="images/index/icon10.png" /></div><div class="faster">快递查询</div>
                    </a>
                    </li> 
                    <li class="item fore5" clstag="homepage|keycount|home2013|09b3">        
                    <a href="#" target="_blank">            
                        <div><img src="images/index/icon11.png" /></div><div class="faster">社保查询</div>
                    </a>    
                    </li>   
                    <li class="item fore6" clstag="homepage|keycount|home2013|09b3">        
                    <a href="#" target="_blank">            
                        <div><img src="images/index/icon12.png" /></div><div class="faster">银行分布点</div>
                    </a>
                    </li>    
                    <li class="item fore7" clstag="homepage|keycount|home2013|09b3">        
                    <a href="#" target="_blank">            
                        <div><img src="images/index/icon14.png" /></div><div class="faster">轨道交通</div>
                    </a>
                    </li> 
                    <li class="item fore8" clstag="homepage|keycount|home2013|09b3">        
                    <a href="#" target="_blank">            
                        <div><img src="images/index/icon13.png" /></div><div class="faster">公交查询</div>
                    </a>
                    </li>  
                    </ul>
                </div>
            </div>
        </div>

    </div>

        <!--da end-->
        <div id="jdnews" class="m m1">
            <div class="mt">
                <h2> 社区简介</h2>
                <div class="extra" clstag="homepage|keycount|home2013|11a">
            
                </div>
            </div>
            <div class="mc">
            </div>
        </div>
 
        <div data-widget="tabs" class="m _520_a_lifeandjourney_1" id="virtuals-2014">

        </div>

        <!--virtuals end-->
        <span class="clr"></span>--%>
    </div>
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    </script>
</asp:Content>
