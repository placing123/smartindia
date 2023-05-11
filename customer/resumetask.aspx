<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="resumetask.aspx.cs" Inherits="smartadtube.com.customer.resumetask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
            document.getElementById("ContentPlaceHolder1_btn_saveforquery").disabled = false;
        }

        function disablebtn() {
            //alert("test");
            document.getElementById("ContentPlaceHolder1_btn_submit").disabled = true;
            document.getElementById("ContentPlaceHolder1_btn_saveforquery").disabled = true;
        }
    </script>
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">Resume Task</h3>
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
                                        <h3 class="m-portlet__head-text">Resume Preview</h3>

                                    </div>
                                </div>
                            </div>
                            <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                                <div class="m-portlet__foot m-portlet__foot--fit">
                                    <div class="m-form__actions">
                                        <asp:Literal ID="ltEmbed" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="m-portlet m-portlet--tab">
                            <div class="m-portlet__head">
                                <div class="m-portlet__head-caption">
                                    <div class="m-portlet__head-title">
                                        <span class="m-portlet__head-icon m--hide">
                                            <i class="la la-gear"></i>
                                        </span>
                                        <h3 class="m-portlet__head-text">Resume Data</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                                <div class="m-portlet__body" style="padding-top: 5px;">
                                    <div class="form-group m-form__group" style="max-height: 670px; overflow: auto">
                                        WIRTE <b>NA </b>IF DATA IS NOT PRESENT IN THE RESUME/CV.<br />
                                        <br />
                                        <h3>PERSONAL DETAILS</h3>
                                        <label>First Name :-</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_firstname" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_firstname" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Enter First Name" autocomplete="off"></asp:TextBox>
                                        <label>Middle Name </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_middlename" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_middlename" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Enter Middle Name" autocomplete="off"></asp:TextBox>
                                        <label>Last Name </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_lastname" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_lastname" runat="server" MaxLength="50"  CssClass="form-control m-input m-input--air" placeholder="Enter Last Name" autocomplete="off"></asp:TextBox>
                                        <label>Date Of Birth (DD-MM-YYYY) </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_dob" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_dob" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Date of Birth" autocomplete="off"></asp:TextBox>
                                        <label>Gender</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_gender" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_gender" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Gender" autocomplete="off"></asp:TextBox>
                                        <label>Nationality</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_nationality" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_nationality" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Nationality" autocomplete="off"></asp:TextBox>
                                        <label>Marital Status  </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_maritalstatus" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_maritalstatus" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Marital Status" autocomplete="off"></asp:TextBox>
                                        <label>Passport  </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_passport" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_passport" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Passport" autocomplete="off"></asp:TextBox>
                                        <label>Hobbies </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_hobbies" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_hobbies" runat="server" MaxLength="200" CssClass="form-control m-input m-input--air" placeholder="Hobbies" autocomplete="off"></asp:TextBox>
                                        <label>Language Known</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_languageknown" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_languageknown" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Language Known" autocomplete="off"></asp:TextBox>
                                        <h3>COMMUNICATION DETAILS</h3>
                                        <label>Address </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_address" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_address" runat="server" MaxLength="200" CssClass="form-control m-input m-input--air" placeholder="Address" TextMode="MultiLine" autocomplete="off"></asp:TextBox>
                                        <label>Land Mark  </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_landmark" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_landmark" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Land Mark" autocomplete="off"></asp:TextBox>
                                        <label>City </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_city" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_city" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="City" autocomplete="off"></asp:TextBox>
                                        <label>State</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_state" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_state" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="State" autocomplete="off"></asp:TextBox>
                                        <label>Pincode </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_pincode" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_pincode" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Pincode" autocomplete="off"></asp:TextBox>
                                        <label>Mobile   </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_mobile" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_mobile" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Mobile" autocomplete="off"></asp:TextBox>
                                        <label>Email ID </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_emailid" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_emailid" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Email ID" autocomplete="off"></asp:TextBox>
                                        <h3>QUALIFICATION DETAILS</h3>
                                        <label>SSC Result </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_sscresult" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_sscresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="SSC Result" autocomplete="off"></asp:TextBox>
                                        <label>SSC Board/University</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_sscuniversity" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_sscuniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="SSC Board/University" autocomplete="off"></asp:TextBox>
                                        <label>SSC Passing Year</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_sscyear" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_sscyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="SSC Passing Year" autocomplete="off"></asp:TextBox>
                                        <label>HSC Result </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_hscresult" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_hscresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="HSC Result" autocomplete="off"></asp:TextBox>
                                        <label>HSC Board/University</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_hscuniversity" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_hscuniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="HSC Board/University" autocomplete="off"></asp:TextBox>
                                        <label>HSC Passing Year</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_hscyear" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_hscyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="HSC Passing Year" autocomplete="off"></asp:TextBox>
                                        <label>Diploma Degree</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_diplomadegree" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_diplomadegree" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Diploma Degree" autocomplete="off"></asp:TextBox>
                                        <label>Diploma Result </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_diplomaresult" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_diplomaresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Diploma Result" autocomplete="off"></asp:TextBox>
                                        <label>Diploma University</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_diplomauniversity" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_diplomauniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Diploma University" autocomplete="off"></asp:TextBox>
                                        <label>Diploma Year</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_diplomayear" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_diplomayear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Diploma Year" autocomplete="off"></asp:TextBox>
                                        <label>Graduation Degree </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_graduationdegree" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_graduationdegree" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Graduation Degree" autocomplete="off"></asp:TextBox>
                                        <label>Graduation Result </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_graduationresult" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_graduationresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Graduation Result" autocomplete="off"></asp:TextBox>
                                        <label>Graduation University </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_graduationuniversity" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_graduationuniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Graduation University" autocomplete="off"></asp:TextBox>
                                        <label>Graduation Year </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_graduationyear" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_graduationyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Graduation Year" autocomplete="off"></asp:TextBox>
                                        <label>Post Graduation Degree </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_postgraduationdegree" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_postgraduationdegree" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Degree" autocomplete="off"></asp:TextBox>
                                        <label>Post Graduation Result</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_postgraduationresult" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_postgraduationresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Result" autocomplete="off"></asp:TextBox>
                                        <label>Post Graduation University </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_postgraduationuniversity" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_postgraduationuniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Post Graduation University" autocomplete="off"></asp:TextBox>
                                        <label>Post Graduation Year </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_postgraduationyear" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_postgraduationyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Year" autocomplete="off"></asp:TextBox>
                                        <label>Highest Level Education</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_highestleveleducation" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_highestleveleducation" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Highest Level Education" autocomplete="off"></asp:TextBox>
                                        <h3>EMPLOYMENT DETAILS</h3>
                                        <label>Total Work Experience</label><br />
                                        <label>Year</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_totalworkyear" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_totalworkyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Year" autocomplete="off"></asp:TextBox>
                                        <label>Month</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_totalworkmonth" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_totalworkmonth" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Month" autocomplete="off"></asp:TextBox>
                                        <label>Total Companies Worked For </label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_totalcompanieswork" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_totalcompanieswork" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Total Companies Worked For" autocomplete="off"></asp:TextBox>
                                        <label>Last/Current Employer</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_lastcurrentemploye" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_lastcurrentemploye" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Last/Current Employer" autocomplete="off"></asp:TextBox>
                                        <br />
                                          <div class="g-recaptcha" data-sitekey="6LeRj7YUAAAAABA5yUpSN6bieK9kfgYsvHdgh_Fd" data-callback="enableBtn"></div>
                                        <br />
                                        <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_submit_click" OnClientClick="if ( Page_ClientValidate() ) { this.disabled=true; this.value='Submitting…';}" UseSubmitBehavior="false" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btn_saveforquery" runat="server" Text="Save for query" class="btn btn-primary"  OnClientClick="if ( Page_ClientValidate() ) { this.disabled=true; this.value='Submitting…';}" UseSubmitBehavior="false" OnClick="btn_saveforquery_Click" />

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
