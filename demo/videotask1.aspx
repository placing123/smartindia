<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="videotask1.aspx.cs" Inherits="smartadtube.com.demo.videotask1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
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

        function enablenextbtn() {
            //alert("test");
            document.getElementById("ContentPlaceHolder1_btn_next").disabled = false;
        }
        function disablenextbtn() {
            //alert("test");
            document.getElementById("ContentPlaceHolder1_btn_next").disabled = true;
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
                                <div class="m-portlet__body" style="padding-top: 0px">
                                    <div class="m-content" style="padding: 0px 0px 0px 0px">
                                        <div class="row">
                                            <div class="col-xl-12">
                                                <!--Begin::Main Portlet-->

                                                <!--begin: Form Wizard-->
                                                <div class="m-wizard m-wizard--1 m-wizard--success" id="m_wizard">
                                                    <!--begin: Message container -->
                                                    <div class="m-portlet__padding-x">
                                                        <!-- Here you can put a message or alert -->
                                                    </div>
                                                    <!--end: Message container -->
                                                    <!--begin: Form Wizard Head -->
                                                    <div class="m-wizard__head m-portlet__padding-x">
                                                        <!--begin: Form Wizard Progress -->
                                                        <div class="m-wizard__progress">
                                                            <div class="progress">
                                                                <div class="progress-bar" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                                            </div>
                                                        </div>
                                                        <!--end: Form Wizard Progress -->
                                                        <!--begin: Form Wizard Nav -->
                                                        <div class="m-wizard__nav">
                                                            <div class="m-wizard__steps">
                                                                <div class="m-wizard__step m-wizard__step--current" m-wizard-target="m_wizard_form_step_1">
                                                                    <div class="m-wizard__step-info">
                                                                        <a href="#" class="m-wizard__step-number">
                                                                            <span>
                                                                                <span>1</span>
                                                                            </span>
                                                                        </a>
                                                                        <div class="m-wizard__step-line">
                                                                            <span></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="m-wizard__step" m-wizard-target="m_wizard_form_step_2">
                                                                    <div class="m-wizard__step-info">
                                                                        <a href="#" class="m-wizard__step-number">
                                                                            <span>
                                                                                <span>2</span>
                                                                            </span>
                                                                        </a>
                                                                        <div class="m-wizard__step-line">
                                                                            <span></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="m-wizard__step" m-wizard-target="m_wizard_form_step_3">
                                                                    <div class="m-wizard__step-info">
                                                                        <a href="#" class="m-wizard__step-number">
                                                                            <span>
                                                                                <span>3</span>
                                                                            </span>
                                                                        </a>
                                                                        <div class="m-wizard__step-line">
                                                                            <span></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="m-wizard__step" m-wizard-target="m_wizard_form_step_4">
                                                                    <div class="m-wizard__step-info">
                                                                        <a href="#" class="m-wizard__step-number">
                                                                            <span>
                                                                                <span>4</span>
                                                                            </span>
                                                                        </a>
                                                                        <div class="m-wizard__step-line">
                                                                            <span></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="m-wizard__step" m-wizard-target="m_wizard_form_step_5">
                                                                    <div class="m-wizard__step-info">
                                                                        <a href="#" class="m-wizard__step-number">
                                                                            <span>
                                                                                <span>5</span>
                                                                            </span>
                                                                        </a>
                                                                        <div class="m-wizard__step-line">
                                                                            <span></span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="m-wizard__step" m-wizard-target="m_wizard_form_step_6">
                                                                    <div class="m-wizard__step-info">
                                                                        <a href="#" class="m-wizard__step-number">
                                                                            <span>
                                                                                <span>6</span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--end: Form Wizard Nav -->
                                                    </div>
                                                    <!--end: Form Wizard Head -->
                                                    <!--begin: Form Wizard Form-->
                                                    <div class="m-wizard__form">
                                                        <div class="m-form m-form--label-align-left- m-form--state-" id="m_form">
                                                            <!--begin: Form Body -->
                                                            <div class="m-portlet__body">
                                                                <!--begin: Form Wizard Step 1-->
                                                                <div class="m-wizard__form-step m-wizard__form-step--current" id="m_wizard_form_step_1">
                                                                    <div class="row">
                                                                        <div class="col-xl-12 offset-xl-2" style="margin-left: 0px">
                                                                            <div class="m-form__section m-form__section--first">
                                                                                <div class="m-form__heading" style="padding-left: 0px">

                                                                                    <h3 class="m-form__heading-title">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>Q1. 
                                                                                                </td>
                                                                                                <td style="padding-left: 10px">Have you ever used this product?
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </h3>
                                                                                    <table style="width: 80%; margin-left: 30px; margin-top: 30px">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q1yes" runat="server" GroupName="v1" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                                <b>Yes  &nbsp;&nbsp; </b>

                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q1no" runat="server" GroupName="v1" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                                <b>No  &nbsp;&nbsp; </b>

                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end: Form Wizard Step 1-->
                                                                <!--begin: Form Wizard Step 2-->
                                                                <div class="m-wizard__form-step" id="m_wizard_form_step_2">
                                                                    <div class="row">
                                                                        <div class="col-xl-12 offset-xl-2" style="margin-left: 0px">
                                                                            <div class="m-form__section m-form__section--first">
                                                                                <div class="m-form__heading" style="padding-left: 0px">
                                                                                    <h3 class="m-form__heading-title">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>Q2. 
                                                                                                </td>
                                                                                                <td style="padding-left: 10px">Have you ever watched this advertisement before?
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </h3>

                                                                                    <table style="width: 100%; margin-left: 30px; margin-top: 30px">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q2yes" runat="server" GroupName="v2" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                                <b>Yes  &nbsp;&nbsp; </b>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q2no" runat="server" GroupName="v2" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                                <b>No  &nbsp;&nbsp; </b>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q2maybe" runat="server" GroupName="v2" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                                <b>Maybe  &nbsp;&nbsp; </b>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end: Form Wizard Step 2-->
                                                                <!--begin: Form Wizard Step 3-->
                                                                <div class="m-wizard__form-step" id="m_wizard_form_step_3">
                                                                    <div class="row">
                                                                        <div class="col-xl-12 offset-xl-2" style="margin-left: 0px">
                                                                            <div class="m-form__section m-form__section--first">
                                                                                <div class="m-form__heading" style="padding-left: 0px">
                                                                                    <h3 class="m-form__heading-title">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>Q3. 
                                                                                                </td>
                                                                                                <td style="padding-left: 10px">How will you rate this advertisement?
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </h3>

                                                                                    <table style="width: 100%; margin-left: 30px; margin-top: 30px">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q31" runat="server" GroupName="v3" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q32" runat="server" GroupName="v3" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q33" runat="server" GroupName="v3" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q34" runat="server" GroupName="v3" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q35" runat="server" GroupName="v3" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>1
                                                                                            </td>
                                                                                            <td>2
                                                                                            </td>
                                                                                            <td>3
                                                                                            </td>
                                                                                            <td>4
                                                                                            </td>
                                                                                            <td>5
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end: Form Wizard Step 3-->
                                                                <!--begin: Form Wizard Step 4-->
                                                                <div class="m-wizard__form-step" id="m_wizard_form_step_4">
                                                                    <div class="row">
                                                                        <div class="col-xl-12 offset-xl-2" style="margin-left: 0px">
                                                                            <div class="m-form__section m-form__section--first">
                                                                                <div class="m-form__heading" style="padding-left: 0px">
                                                                                    <h3 class="m-form__heading-title">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>Q4. 
                                                                                                </td>
                                                                                                <td style="padding-left: 10px">How will you rate this product if ever used in life?
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </h3>

                                                                                    <table style="width: 100%; margin-left: 30px; margin-top: 30px">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q41" runat="server" GroupName="v4" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q42" runat="server" GroupName="v4" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q43" runat="server" GroupName="v4" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q44" runat="server" GroupName="v4" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q45" runat="server" GroupName="v4" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q4notused" runat="server" GroupName="v4" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>1
                                                                                            </td>
                                                                                            <td>2
                                                                                            </td>
                                                                                            <td>3
                                                                                            </td>
                                                                                            <td>4
                                                                                            </td>
                                                                                            <td>5
                                                                                            </td>
                                                                                            <td>Not Used
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="m-wizard__form-step" id="m_wizard_form_step_5">
                                                                    <div class="row">
                                                                        <div class="col-xl-12 offset-xl-2" style="margin-left: 0px">
                                                                            <div class="m-form__section m-form__section--first">
                                                                                <div class="m-form__heading" style="padding-left: 0px">
                                                                                    <h3 class="m-form__heading-title">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>Q5. 
                                                                                                </td>
                                                                                                <td style="padding-left: 10px">Will you ever use this product in future?
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </h3>

                                                                                    <table style="width: 100%; margin-left: 30px; margin-top: 30px">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q5yes" runat="server" GroupName="v5" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                                <b>Yes  &nbsp;&nbsp; </b>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q5no" runat="server" GroupName="v5" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                                <b>No  &nbsp;&nbsp; </b>
                                                                                            </td>
                                                                                            <td>
                                                                                                <label class="m-radio">
                                                                                                    <asp:RadioButton ID="rbtn_q5maybe" runat="server" GroupName="v5" onclick="enablenextbtn()" />
                                                                                                    <span></span>
                                                                                                </label>
                                                                                                <b>Maybe  &nbsp;&nbsp; </b>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="m-wizard__form-step" id="m_wizard_form_step_6">
                                                                    <div class="row">
                                                                        <div class="col-xl-12 offset-xl-2" style="margin-left: 0px">
                                                                            <div class="m-form__section m-form__section--first">
                                                                                <div class="m-form__heading" style="padding-left: 0px">
                                                                                    <h3 class="m-form__heading-title">
                                                                                        <table>
                                                                                            <tr>
                                                                                                <td>Q6. 
                                                                                                </td>
                                                                                                <td style="padding-left: 10px">Review of current advertisement.(Minimum 45 character)
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </h3>

                                                                                    <table style="width: 100%; margin-left: 30px; margin-top: 30px">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:TextBox ID="txt_q6" runat="server" TextMode="MultiLine" class="form-control m-input m-input--air"></asp:TextBox>
                                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Review Required!" ControlToValidate="txt_q6" ValidationGroup="v1" ForeColor="Red"></asp:RequiredFieldValidator>
                                                                                                <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txt_q6" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{45,}$" runat="server" ErrorMessage="Minimum 45 characters required." ValidationGroup="v1" ForeColor="Red"></asp:RegularExpressionValidator>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <br />
                                                                                                <br />
                                                                                                <div class="g-recaptcha" data-sitekey="6LeRj7YUAAAAABA5yUpSN6bieK9kfgYsvHdgh_Fd" data-callback="enableBtn"></div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--end: Form Wizard Step 4-->
                                                            </div>
                                                            <!--end: Form Body -->

                                                            <!--begin: Form Actions -->
                                                            <div class="m-portlet__foot m-portlet__foot--fit m--margin-top-40">
                                                                <div class="m-form__actions m-form__actions">
                                                                    <div class="row">
                                                                        <div class="col-lg-2"></div>
                                                                        <div class="col-lg-4 m--align-left">
                                                                            <a href="#" class="btn btn-secondary m-btn m-btn--custom m-btn--icon" data-wizard-action="prev" onclick="enablenextbtn()">
                                                                                <span>
                                                                                    <i class="la la-arrow-left"></i>
                                                                                    &nbsp;&nbsp;
                                                                                       
                                                                                    <span>Back</span>
                                                                                </span>
                                                                            </a>
                                                                        </div>

                                                                        <div class="col-lg-4 m--align-right">
                                                                            <%--<a href="#" class="btn btn-primary m-btn m-btn--custom m-btn--icon" data-wizard-action="submit">
                                                                                <span>
                                                                                    <i class="la la-check"></i>
                                                                                    &nbsp;&nbsp;
                                                                                        <span>Submit</span>
                                                                                </span>
                                                                            </a>--%>
                                                                            <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-primary m-btn m-btn--custom m-btn--icon" data-wizard-action="submit" OnClick="btn_submit_Click" ValidationGroup="v1" />

                                                                            <%-- <a href="#" id="btn_next" class="btn btn-warning m-btn m-btn--custom m-btn--icon" data-wizard-action="next">
                                                                                <span>
                                                                                    <span>Save & Continue</span>
                                                                                    &nbsp;&nbsp;
                                                                                       
                                                                                    <i class="la la-arrow-right"></i>
                                                                                </span>
                                                                            </a>--%>
                                                                            <asp:Button ID="btn_next" runat="server" Text="Save & Continue" class="btn btn-warning m-btn m-btn--custom m-btn--icon" data-wizard-action="next" OnClientClick="disablenextbtn()" />
                                                                        </div>
                                                                        <div class="col-lg-2"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!--end: Form Actions -->
                                                        </div>
                                                    </div>
                                                    <!--end: Form Wizard Form-->
                                                </div>
                                                <!--end: Form Wizard-->

                                                <!--End::Main Portlet-->
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../js/wizard.js"></script>
</asp:Content>
