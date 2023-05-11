<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="videotask.aspx.cs" Inherits="smartadtube.com.customer.videotask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
     <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript">
        function RedirectAfterDelayFn() {
            var seconds = 3;
            var dvCountDown = document.getElementById("CountDown");
            var lblCount = document.getElementById("CountDownLabel");
            dvCountDown.style.display = "block";
            lblCount.innerHTML = seconds;
            setInterval(function () {
                seconds--;
                lblCount.innerHTML = seconds;
                if (seconds == 0) {
                    dvCountDown.style.display = "none";
                    window.location = "dashboard.aspx";
                }
            }, 1000);
        }
        function enableBtn() {
            document.getElementById("ContentPlaceHolder1_btn_submit").disabled = false;
        }

        function disablebtn() {
            //alert("test");
            document.getElementById("ContentPlaceHolder1_btn_submit").disabled = true;
        }

    </script>
    <asp:Label ID="lbl_autoid" runat="server" Visible="false"></asp:Label>
    <div class="m-grid__item m-grid__item--fluid m-wrapper" style="min-height: 600px">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">Video Task</h3>
                    &nbsp;&nbsp;
                     <div id="CountDown" style="display: none; color: limegreen;">
                         Task completed redirect in 
                                                &nbsp;&nbsp;
                                            <span id="CountDownLabel"></span>seconds.  
                     </div>
                </div>
            </div>
        </div>
        <!-- END: Subheader -->
        <div class="m-content" style="padding-bottom: 0px;">
            <div class="container" style="margin: 0px 0px 0px 0px; max-width: 100%;">
                <div class="row">
                    <div class="col-6">
                        <div class="m-portlet m-portlet--tab">
                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <span class="m-portlet__head-icon m--hide">
                                            <i class="la la-gear"></i>
                                        </span>
                                        <h3 class="m-portlet__head-text">Video Details</h3>

                                    </div>
                                </div>
                            </div>
                            <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                                <div class="m-portlet__foot m-portlet__foot--fit">
                                    <div class="m-form__actions">
                                        <video controls width="100%" height="100%" id="video" runat="server" onseeking="myFunction(this.currentTime)"></video>
                                        <script>
                                            var currentpos = 0;

                                            function myFunction(time) {
                                                if (time > currentpos) {
                                                    video.currentTime = currentpos;
                                                }
                                            }

                                            var video = document.getElementsByTagName('video')[0];

                                            function getpos() {
                                                currentpos = video.currentTime;
                                            }
                                            onesecond = setInterval('getpos()', 1000);
                                        </script>
                                        <script>/*<![CDATA[*/
                                            document.querySelector('video').addEventListener('ended', function () {
                                                console.log('Video has ended!');
                                                var div = document.getElementById('div1');
                                                div.style.visibility = 'visible';
                                            }, false);
/*]]>*/</script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6" style="visibility: hidden;" id="div1">
                        <div class="m-portlet m-portlet--tab">
                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <span class="m-portlet__head-icon m--hide">
                                            <i class="la la-gear"></i>
                                        </span>
                                        <h3 class="m-portlet__head-text">Video Question</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="m-form m-form--fit m-form--label-align-right">
                                <div class="m-portlet__body">
                                    <div class="form-group m-form__group">
                                        <b>Question:</b>
                                        <asp:Label ID="lbl_question" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        <table style="width: 100%">
                                            <tr>
                                                <td>
                                                    <b>A.  &nbsp;&nbsp; </b>
                                                    <label class="m-radio">
                                                        <asp:RadioButton ID="rbtn_optiona" runat="server" GroupName="v1" />
                                                        <span></span>
                                                    </label>
                                                </td>
                                                <td>
                                                    <b>B.  &nbsp;&nbsp; </b>
                                                    <label class="m-radio">
                                                        <asp:RadioButton ID="rbtn_optionb" runat="server" GroupName="v1" />
                                                        <span></span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <b>C.  &nbsp;&nbsp; </b>
                                                    <label class="m-radio">
                                                        <asp:RadioButton ID="rbtn_optionc" runat="server" GroupName="v1" />
                                                        <span></span>
                                                    </label>
                                                </td>
                                                <td>
                                                    <b>D.  &nbsp;&nbsp; </b>
                                                    <label class="m-radio">
                                                        <asp:RadioButton ID="rbtn_optiond" runat="server" GroupName="v1" />
                                                        <span></span>
                                                    </label>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <div class="g-recaptcha" data-sitekey="6LeRj7YUAAAAABA5yUpSN6bieK9kfgYsvHdgh_Fd" data-callback="enableBtn"></div>
                                        <br />

                                        <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_submit_click" OnClientClick="this.disabled=true; this.value='Submitting…';" UseSubmitBehavior="false"  />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
