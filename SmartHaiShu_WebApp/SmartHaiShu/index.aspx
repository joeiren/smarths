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
    <div class="container-fluid" style="padding-top: 0px;">
        <div style="float: left;" class="col-md-9">
            <div class="row" style=" padding-left:200px;" >
                <div id="carousel1" class="carousel slide pull-left" data-ride="carousel" style="width: 100%">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel1" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel1" data-slide-to="1"></li>
                    <li data-target="#carousel1" data-slide-to="2"></li>
                  </ol>
    
                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" style="text-align:center">
                    <div class="item active">                      
                        <img alt="First slide" src="images/index02.jpg" />
                    </div>
                    <div class="item">
                      <img alt="Second slide" src="images/index01.jpg" />
                    </div>
                    <div class="item">
                        <img alt="Third slide" src="images/index03.jpg" />
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
            <div class="row" style="margin-left: -30px;margin-top: 20px;">
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
                 <%--<div class="media pull-left" style="margin: 10px;">
                    <a href="ConvenienceLive.aspx?toSub=m_fund">
                        <img class="media-object" src="images/index/icon8.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">公积金查询</h5>
                      </div>
                </div>--%>
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
                    <a href="EasyTrip.aspx?toSub=m_bus">
                        <img class="media-object" src="images/index/icon13.png" alt="">
                      </a>
                      <div class="media-body">
                        <h5 class="media-heading text-center">公交查询</h5>
                      </div>
                </div>
                </div>
                </div>    
            </div>
            <div class="row" style="margin-left: -30px;">
                 <div class="panel panel-default panel-body" >
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="images/test/itpubcms%20(27).jpg" alt=""/>
                          </a>
                          <div class="media-body">
                            <ul class="list-group" style="margin-bottom: 0px;">
                                <li class="list-group-item list-group-item-info"><strong>互帮互助</strong><span class="badge" style="background-color:lightsalmon"><a href="HomeInteraction.aspx?toSub=m_interact">更多</a></span></li>
                                <asp:Repeater ID="RepeaterPost" runat="server">
                                    <ItemTemplate>
                                    <li class="list-group-item" style="height: 35px;"><span class="col-md-6"><strong><%#Eval("Title") %></strong></span>
                                        <span class="bg-success col-md-4"><%#Eval("ReleaseTime")%>  </span> 
                                        <span class="badge" style="background-color:slateblue"><%#Eval("DateSpan")%></span> 
                                    </li>    
                                    </ItemTemplate>
                               </asp:Repeater>
                            </ul>
                          </div>
                        </div>
      
                </div>
            </div>
            
            <div class="row" style="margin-left: -30px;">
                 <div class="panel panel-default panel-body" >
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="images/test/itpubcms%20(34).jpg" alt=""/>
                          </a>
                          <div class="media-body">
                            <ul class="list-group" style="margin-bottom: 0px;">
                              <li class="list-group-item list-group-item-info"><strong>轨道交通 - 1号线</strong><span class="badge" style="background-color:lightsalmon"><a href="EasyTrip.aspx?toSub=m_metro">查看</a></span></li>
                              
                            </ul>
                            <div class="modal-body">
                            <img src="images/trip/line1.png" />
                          </div>
                          </div>
                        </div>
                </div>
            </div>
            <div class="row" style="margin-left: -30px;">
                 <div class="panel panel-default panel-body" >
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="images/test/itpubcms%20(99).jpg" alt=""/>
                          </a>
                          <div class="media-body">
                            <ul class="list-group" style="margin-bottom: 0px;">
                              <li class="list-group-item list-group-item-info"><strong>货比三家</strong><span class="badge" style="background-color:lightsalmon"><a href="ConvenienceLive.aspx?toSub=m_price">更多</a></span></li>
                              <asp:Repeater ID="RepeaterFood" runat="server">
                                    <ItemTemplate>
                                    <li class="list-group-item " style="height: 35px;">
                                        <span class="col-md-3"><strong><%#Eval("Category") %> -- <%#Eval("Food") %> </strong></span>
                                        <span  class="col-md-4" style="font-size: 14px;">价格：<span class="bg-success"><%#Eval("Price")%></span>  <%#Eval("Unit")%>  </span>
                                        <span  style="font-size: 14px;">物价监测点：<%#Eval("Site")%>  </span> 
                                        <span class="badge" style="background-color:red"><%#Eval("Count")%></span> 
                                        
                                    </li>   
                                    </ItemTemplate>
                               </asp:Repeater>
                            </ul>
                          </div>
                        </div>
                </div>
            </div>

            <div class="row" style="margin-left: -30px;">
                 <div class="panel panel-default panel-body" >
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="images/test/itpubcms%20(76).jpg" alt=""/>
                          </a>
                          <div class="media-body">
                            <ul class="list-group" style="margin-bottom: 0px;">
                              <li class="list-group-item list-group-item-info"><strong>学校讯息</strong><span class="badge" style="background-color:lightsalmon"><a href="Education.aspx?toSub=m_school">更多</a></span></li>
                              <asp:Repeater ID="RepeaterScholl" runat="server">
                                    <ItemTemplate>
                                    <li class="list-group-item"  style="height: 35px;"><span class="col-sm-4"><%#Eval("Name") %> </span>
                                        <span class="bg-success "><%#Eval("Address")%>  </span> 
                                        <span class="badge" style="background-color:slateblue"><%#Eval("Type")%></span> 
                                    </li>
                                    </ItemTemplate>
                               </asp:Repeater>
                            </ul>
                          </div>
                        </div>
                </div>
            </div>
            
            <div class="row" style="margin-left: -30px;">
                 <div class="panel panel-default panel-body" >
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="images/test/itpubcms%20(82).jpg" alt=""/>
                          </a>
                          <div class="media-body">
                            <ul class="list-group" style="margin-bottom: 0px;">
                              <li class="list-group-item list-group-item-info"><strong>幼儿园讯息</strong><span class="badge" style="background-color:lightsalmon"><a href="Education.aspx?toSub=m_kindergarten">更多</a></span></li>
                               <asp:Repeater ID="RepeaterKindergarten" runat="server">
                                    <ItemTemplate>
                                    <li class="list-group-item"><%#Eval("Name") %> 
                                        <span class="bg-success pull-right"><%#Eval("Address")%>  </span> 
                                        <%--<span class="badge" style="background-color:slateblue"><%#Eval("Type")%></span> --%>
                                    </li>    
                                    </ItemTemplate>
                               </asp:Repeater>
                            </ul>
                          </div>
                        </div>
                </div>
            </div>
            <div class="row" style="margin-left: -30px;">
                 <div class="panel panel-default panel-body" >
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="images/test/itpubcms%20(63).jpg" alt=""/>
                          </a>
                          <div class="media-body">
                            <ul class="list-group" style="margin-bottom: 0px;">
                              <li class="list-group-item list-group-item-info"><strong>银行网点</strong><span class="badge" style="background-color:lightsalmon"><a href="ConvenienceLive.aspx?toSub=m_bank">更多</a></span></li>
                               <asp:Repeater ID="RepeaterBank" runat="server">
                                    <ItemTemplate>
                                    <li class="list-group-item"><%#Eval("Name") %> 
                                        <span class="bg-success pull-right"><%#Eval("Address")%>  </span> 
                                        <%--<span class="badge" style="background-color:slateblue"><%#Eval("Type")%></span> --%>
                                    </li>    
                                    </ItemTemplate>
                               </asp:Repeater>
                            </ul>
                          </div>
                        </div>
                </div>
            </div>
            
            <div class="row" style="margin-left: -30px;">
                 <div class="panel panel-default panel-body" >
                        <div class="media">
                            <a class="pull-left" href="#">
                                <img class="media-object" src="images/test/itpubcms%20(54).jpg" alt=""/>
                          </a>
                          <div class="media-body">
                            <ul class="list-group" style="margin-bottom: 0px;">
                              <li class="list-group-item list-group-item-info"><strong>商场超市</strong><span class="badge" style="background-color:lightsalmon"><a href="LifeArea.aspx?toSub=m_market">更多</a></span></li>
                              <asp:Repeater ID="RepeaterMarket" runat="server">
                                    <ItemTemplate>
                                    <li class="list-group-item"><%#Eval("Name") %> 
                                        <span class="bg-success pull-right"><%#Eval("Address")%>  </span> 
                                        <%--<span class="badge" style="background-color:slateblue"><%#Eval("Type")%></span> --%>
                                    </li>    
                                    </ItemTemplate>
                               </asp:Repeater>
                            </ul>
                          </div>
                        </div>
                </div>
            </div>
        </div>
        <div <%--style="float: left;margin-left: 30px;width: 230px; "--%> class="pull-right col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading text-center"><h5>社区电话本</h5></div>
                      <div class="panel-body" id="telbook" style="height: 150px;overflow-y:auto;">
                      </div>
                </div>
                
                <div class="panel panel-default">
                <div class="panel-heading">
	                <a href="EasyTrip.aspx?toSub=m_trip_info"  style="cursor:pointer;" >出行信息</a>
                    <span class="badge" style="background-color:red"><%=TripCount%></span> 
                </div>
                <div id="Div1"  class="panel-collapse collapse in">
                    <div class="panel-body" style="font-size: 12px; padding: 0px;">
	                    <ul class="list-group" style="margin-bottom: 0px;">
	                        <asp:Repeater ID="RepeaterTrip" runat="server">
	                            <ItemTemplate>
		                            <li class="list-group-item list-group-item-text"><%#Eval("Title")%> </li>
                                </ItemTemplate>
		                    </asp:Repeater>
	                    </ul>
                    </div>
                </div>
                </div>

                <div class="panel panel-default">
                <div class="panel-heading">
	                <a data-toggle="collapse"  data-parent="#accordion" data-target="#collapse1"  style="cursor:pointer;" >物价信息</a>
                    <span class="badge" style="background-color:red"><%=FoodCount%></span> 
                </div>
                <div id="Div2"  class="panel-collapse collapse in">
                    <div class="panel-body" style="font-size: 12px; padding: 0px;">
	                    <ul class="list-group" style="margin-bottom: 0px;">
	                        <asp:Repeater ID="RepeaterFoodInfo" runat="server">
	                            <ItemTemplate>
		                            <li class="list-group-item list-group-item-text"><%#Eval("Title")%> </li>
                                </ItemTemplate>
		                    </asp:Repeater>
	                    </ul>
                    </div>
                </div>
                </div>
                
                
                <div class="panel panel-default">
                <div class="panel-heading">
	                <a href="LifeArea.aspx?toSub=m_special" style="cursor:pointer;">惠生活</a>
                    <span class="badge" style="background-color:red"><%=FavorableCount%></span> 
                </div>
                <div id="Div3"  class="panel-collapse collapse in">
                    <div class="panel-body" style="font-size: 12px; padding: 0px;">
	                    <ul class="list-group" style="margin-bottom: 0px;">
	                        <asp:Repeater ID="RepeaterFavorable" runat="server">
	                            <ItemTemplate>
		                            <li class="list-group-item list-group-item-text"><%#Eval("Title")%> </li>
                                </ItemTemplate>
		                    </asp:Repeater>
	                    </ul>
                    </div>
                </div>
                </div>
                
                <div class="panel panel-default">
                <div class="panel-heading">
	                <a href="Education.aspx?toSub=m_edu_info"  style="cursor:pointer;" >教育资讯</a>
                    <span class="badge" style="background-color:red"><%=EducationCount%></span> 
                </div>
                <div id="Div4"  class="panel-collapse collapse in">
                    <div class="panel-body" style="font-size: 12px; padding: 0px;">
	                    <ul class="list-group" style="margin-bottom: 0px;">
	                        <asp:Repeater ID="RepeaterEducation" runat="server">
	                            <ItemTemplate>
		                            <li class="list-group-item list-group-item-text"><%#Eval("Title")%> </li>
                                </ItemTemplate>
		                    </asp:Repeater>
	                    </ul>
                    </div>
                </div>
                </div>
                
                <div class="panel panel-default">
                <div class="panel-heading">
	                <a href="Education.aspx?toSub=m_health"  style="cursor:pointer;" >医疗卫生讯息</a>
                    <span class="badge" style="background-color:red"><%=HealthCount%></span> 
                </div>
                <div id="Div5"  class="panel-collapse collapse in">
                    <div class="panel-body" style="font-size: 12px; padding: 0px;">
	                    <ul class="list-group" style="margin-bottom: 0px;">
	                        <asp:Repeater ID="RepeaterHealth" runat="server">
	                            <ItemTemplate>
		                            <li class="list-group-item list-group-item-text"><%#Eval("Title")%> </li>
                                </ItemTemplate>
		                    </asp:Repeater>
	                    </ul>
                    </div>
                </div>
                </div>

                <div class="panel panel-default">
                <div class="panel-heading">
	                <a data-toggle="collapse"  data-parent="#accordion" data-target="#collapse1"  style="cursor:pointer;" >停电通知</a>
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
                <a data-toggle="collapse"  data-parent="#accordion" data-target="#collapse2"  style="cursor:pointer;">停水通知</a>
                </div>
                <div id="collapse2"  class="panel-collapse collapse in">
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
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>

</asp:Content>
