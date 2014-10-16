<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeInteractionPostPublish.aspx.cs" Inherits="SmartHaiShu_WebApp.SmartHaiShu.HomeInteractionPostPublish" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/style.css" rel="stylesheet" type="text/css" />
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            function postAddFail(error) {
                alert(error + "\r\n发布失败，请重新尝试！");
            }
            function titleCheck() {
                var length = $("#inputTitle").val().length;
                if (length < 4 || length > 32) {
                    $("#titleGroup").addClass("has-error");
                    return false;
                } else {
                    $("#titleGroup").removeClass("has-error");
                    return true;
                }
            }

            function contentCheck() {
                var length = $("#inputContent").val().length;
                if (length < 8 || length > 1000) {
                    $("#contentGroup").addClass("has-error");
                    return false;
                } else {
                    $("#contentGroup").removeClass("has-error");
                    return true;
                }
            }
            function commitPost() {
                if (titleCheck() && contentCheck()) {
//                    $.ajax({
//                        type: 'POST',
//                        url: 'CommonInvoke.aspx/PublishInteractPost',
//                        contentType: "application/json; charset=utf-8",
//                        data: "{'title':'" + text + "','keywords':'" + keywords + "','contenet':'" + contenet + "','dateSpan':" + dateSpan + ",'contactInfo':'" + contactInfo + "','memberId':'" + memberId + "','contenet'}",
//                        success: function (result) {
//                            if (result.d == "1") {
//                               
//                            } else {
//                                
//                            }
//                        },
//                        error: function (result) {
//                        }
//                    });


                    //location.href = "HomeInteractPost.aspx";
                    return true;
                } else {
                    return false;
                }
            }
            function cancel() {
                location.href = "HomeInteractPost.aspx";
                
            }
        </script>
    </head>
    <body>
    
        <div class="container">
            <form class="form-horizontal " role="form" id="formPost" runat="server">
                
                <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
               
                <h4 class="modal-title">互帮互助 -- 我要发布</h4>
              </div>
                
                <div class="modal-body">
                <div class="form-group" id="titleGroup">
                    <label for="inputTitle" class="col-sm-2 control-label"><span class="required-field">*</span>标题</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="inputTitle" name="inputTitle" placeholder="标题" required="" autofocus="true"  maxlength="32" onblur="titleCheck(); "/>
                        <span class="bg-info help-block" id="titleTip">4-32位长度。</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputKeyword" class="col-sm-2 control-label">关键字</label>
                    <div  class="col-sm-6">
                        <input type="text" class="form-control" id="inputKeyword" name="inputKeyword" placeholder=""  maxlength="32"/>
                    </div>
                </div>
                <div class="form-group" id="contentGroup">
                    <label for="inputContent" class="col-sm-2 control-label"><span class="required-field">*</span>详细内容</label>
                    <div class="col-sm-6">
                        <textarea id="inputContent" name="inputContent" rows="4" class="form-control" required="" style="resize: none;" maxlength="500" onblur=" contentCheck(); "></textarea>
                        <span class="bg-info help-block" id="contentTip">请填写详细内容，方便他人直接查看你的详尽信息。8-500位长度。</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactInfo" class="col-sm-2 control-label">联系方式</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" style="width: 300px;" id="contactInfo" name="contactInfo" placeholder="" maxlength="60"/>
                        <span class="bg-info help-block" id="Span1">请留下你的直接联系方式，手机号，qq号，或者微信号。</span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="contactInfo" class="col-sm-2 control-label"><span class="required-field">*</span>有效时间</label>
                    <div style="width: 220px;padding-left: 16px;">
                        <asp:DropDownList runat="server" CssClass="form-control" ID="DropListDateSpan" />
                    </div>
                </div>
               </div>
              <div class="modal-footer">
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-2 text-center">
                    <button type="button" class="btn btn-default col-sm-2" onclick="cancel();">取消</button>
                    <%--<button type="submit" class="btn  btn-primary col-sm-2 " onclick="return commitPost();">确定</button>--%>
                    
                    <asp:Button CssClass="btn  btn-primary col-sm-2" Text="确定" OnClick="PostCommintOnClick" OnClientClick="return commitPost();" runat="server"/>
                    </div>
                </div>  
              </div>
              </div>
              </div>
            </form>      
        </div>
    
    </body>
</html>