
var SmartHS_url = "";
var __area = "";
var __area_comm = "";
var SmartHS_mode = "1";
function init() {
    $('#home-area strong#area').html(__area);
    $('#home-area strong#area_comm').html(__area_comm);
    chose_area();
    $("ul#navitems-2013 li.fore" + SmartHS_mode).addClass('curr');
    fore_tem(SmartHaiShu_BianMing_js);
}

$(function () {
    init();
    if (SmartHS_url == "index") {
        $('.categorys-2014').addClass('hover');
    }
    else {
        $('.categorys-2014').hover(function () {
            $(this).addClass('hover');

        }, function () {
            $(this).removeClass('hover');
        });
    }

    $('.categorys-2014 .item').hover(function () {
        $(this).addClass('hover');
        $(this).find('.item').addClass('hover');
        //        $(window).load(function () {
        //            $("#ccc").mCustomScrollbar();
        //        });
    }, function () {
        $(this).removeClass('hover');
        $(this).find('.item').removeClass('hover');
    });
    $('ul#navitems-2013 li').hover(function () {
        $("ul#navitems-2013 li").removeClass('curr');
        $(this).addClass('curr');
    }, function () {
        $(this).removeClass('curr');
        $("ul#navitems-2013 li.fore" + SmartHS_mode).addClass('curr');
    });
    $('#home-area').hover(function () {
        $('#home-area .dd ul li').removeClass('curr');
    }, function () {
        $("#home-area").removeClass('hover');
        $('#home-area dd.dd_comm').removeClass('curr');

    });
    $('#home-area .dd ul li').hover(function () {
        $('#home-area .dd ul li').removeClass('curr');
        $(this).addClass('curr');
        $('#home-area dd.dd_comm').addClass('curr');
        var i = $(this).find("a").html();
        chose_area_comm(i);
    }, function () {

    });

    community_Introduction(_community);
})
function show_home_area() {
    $('#home-area').addClass('hover');
}
function chose_area() {
    var html = "";
    for (var i = 0; i < area_info.Message.length; i++) {
        html += "<li><a href=\"#\" data-id=\"" + i + "\">" + area_info.Message[i].name + "</a></li> ";
    }
    $('#home-area .dd ul').html(html);
}
function chose_area_comm(__num) {
    var html = "";
    for (var i = 0; i < area_info.Message.length; i++) {
        if (area_info.Message[i].name == __num) {
            for (var j = 0; j < area_info.Message[i].child_community.length; j++) {
                html += "<li><a href=\"#\" data-id=\"" + j + "\">" + area_info.Message[i].child_community[j].community_name + "</a></li> ";
            }
            $('#home-area dd.dd_comm ul').html(html);
            $('#home-area dd.dd_comm ul li a').click(function () {
                var comm = $(this).html();
                $('#home-area strong#area').html(__num);
                $('#home-area strong#area_comm').html(comm);

                $("#home-area").removeClass('hover');
                $('#home-area dd.dd_comm').removeClass('curr');
                $("#HiddenCommunity").attr("value", comm);
                $.ajax({
                    type: 'POST',
                    url: 'CommonInvoke.aspx/SetSelectedCommunity',
                    contentType: "application/json; charset=utf-8",
                    data: "{'street':'" + __num + "', 'community':'" + comm + "'}",
                    success: function (result) {
                        location.href = location.pathname;
                        
                        //location.href = location.pathname + "?Selected=" + encodeURI(__num + "," + comm);
                    }
                });

            });


        }
    }
}

function fore_tem(_json) {

    var _html_js = "";
    for (var i = 0; i < _json.message.length; i++) {
        var _html = "<div class=\"item fore" + i + "\" onmousedown=\"\"><span data-split=\"1\" ><h3 class='master-h2h3'>";
        _html += "<img src=\"images/main/icon_" + _json.message[i].id + ".png\" style=\"position: relative;margin-right: 10px;top: -2px;\"/><a href=\"" + _json.message[i].url + "\">" + _json.message[i].title + "</a>"
                 + "</h3><s></s>"
                 + "</span>"    
                 + "<div class=\"i-mc\">"        
                 + "<div onclick=\"$(this).parent().parent().removeClass('hover')\" class=\"close\">×</div>"        
                 + "<div class=\"subitem\">"
                 + "<dl class=\"fore1\"><dd>";
        var _html_content = "";
        for (var j = 0; j < _json.message[i].content.length; j++) {
            var url = _json.message[i].url + "?toSub=" + _json.message[i].content[j].url;
            _html_content += "<em><a href=\"" + url + "\">" + _json.message[i].content[j].Child_memb + "</a></em>";
        }
        _html += _html_content + "</dd></dl></div></div></div>";
        _html_js += _html;
    }
    $("#_JD_ALLSORT").html(_html_js);
}


function community_Introduction(__num) {
    // $("#jdnews div.mc").html(__num.Message.Introduction);
    $("#telbook").html(__num.Message.TelBook.replace(/\n/g, '<br/>'));
}

