<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="resumecheck.aspx.cs" Inherits="smartadtube.com.masteradmin.resumecheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">Resume Details</h3>
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
                                        <asp:Label ID="lbl_taskdataid" runat="server" Visible="false"></asp:Label>
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
                                        <asp:RadioButtonList ID="rbtn_firstname" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_firstname" runat="server" CssClass="form-control m-input m-input--air" placeholder="Enter First Name" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Middle Name </label>
                                        <asp:RadioButtonList ID="rbtn_middlename" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_middlename" runat="server" CssClass="form-control m-input m-input--air" placeholder="Enter Middle Name" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Last Name </label>
                                        <asp:RadioButtonList ID="rbtn_lastname" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_lastname" runat="server" CssClass="form-control m-input m-input--air" placeholder="Enter Last Name" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Date Of Birth (DD-MM-YYYY) </label>
                                        <asp:RadioButtonList ID="rbtn_dob" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_dob" runat="server" CssClass="form-control m-input m-input--air" placeholder="Date of Birth" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Gender</label>
                                        <asp:RadioButtonList ID="rbtn_gender" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_gender" runat="server" CssClass="form-control m-input m-input--air" placeholder="Gender" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Nationality</label>
                                        <asp:RadioButtonList ID="rbtn_nationality" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_nationality" runat="server" CssClass="form-control m-input m-input--air" placeholder="Nationality" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Marital Status  </label>
                                        <asp:RadioButtonList ID="rbtn_maritalstatus" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_maritalstatus" runat="server" CssClass="form-control m-input m-input--air" placeholder="Marital Status" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Passport  </label>
                                        <asp:RadioButtonList ID="rbtn_passport" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_passport" runat="server" CssClass="form-control m-input m-input--air" placeholder="Passport" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Hobbies </label>
                                        <asp:RadioButtonList ID="rbtn_hobbies" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_hobbies" runat="server" CssClass="form-control m-input m-input--air" placeholder="Hobbies" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Language Known</label>
                                        <asp:RadioButtonList ID="rbtn_languageknown" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_languageknown" runat="server" CssClass="form-control m-input m-input--air" placeholder="Language Known" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <h3>COMMUNICATION DETAILS</h3>
                                        <label>Address </label>
                                        <asp:RadioButtonList ID="rbtn_address" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_address" runat="server" CssClass="form-control m-input m-input--air" placeholder="Address" TextMode="MultiLine" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Land Mark  </label>
                                        <asp:RadioButtonList ID="rbtn_landmark" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_landmark" runat="server" CssClass="form-control m-input m-input--air" placeholder="Land Mark" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>City </label>
                                        <asp:RadioButtonList ID="rbtn_city" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_city" runat="server" CssClass="form-control m-input m-input--air" placeholder="City" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>State</label>
                                        <asp:RadioButtonList ID="rbtn_state" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_state" runat="server" CssClass="form-control m-input m-input--air" placeholder="State" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Pincode </label>
                                        <asp:RadioButtonList ID="rbtn_pincode" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_pincode" runat="server" CssClass="form-control m-input m-input--air" placeholder="Pincode" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Mobile   </label>
                                        <asp:RadioButtonList ID="rbtn_mobile" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_mobile" runat="server" CssClass="form-control m-input m-input--air" placeholder="Mobile" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Email ID </label>
                                        <asp:RadioButtonList ID="rbtn_emailid" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_emailid" runat="server" CssClass="form-control m-input m-input--air" placeholder="Email ID" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <h3>QUALIFICATION DETAILS</h3>
                                        <label>SSC Result </label>
                                        <asp:RadioButtonList ID="rbtn_sscresult" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_sscresult" runat="server" CssClass="form-control m-input m-input--air" placeholder="SSC Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>SSC Board/University</label>
                                        <asp:RadioButtonList ID="rbtn_sscuniversity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_sscuniversity" runat="server" CssClass="form-control m-input m-input--air" placeholder="SSC Board/University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>SSC Passing Year</label>
                                        <asp:RadioButtonList ID="rbtn_sscyear" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_sscyear" runat="server" CssClass="form-control m-input m-input--air" placeholder="SSC Passing Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>HSC Result </label>
                                        <asp:RadioButtonList ID="rbtn_hscresult" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_hscresult" runat="server" CssClass="form-control m-input m-input--air" placeholder="HSC Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>HSC Board/University</label>
                                        <asp:RadioButtonList ID="rbtn_hscuniversity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_hscuniversity" runat="server" CssClass="form-control m-input m-input--air" placeholder="HSC Board/University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>HSC Passing Year</label>
                                        <asp:RadioButtonList ID="rbtn_hscyear" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_hscyear" runat="server" CssClass="form-control m-input m-input--air" placeholder="HSC Passing Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Diploma Degree</label>
                                        <asp:RadioButtonList ID="rbtn_diplomadegree" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_diplomadegree" runat="server" CssClass="form-control m-input m-input--air" placeholder="Diploma Degree" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Diploma Result </label>
                                        <asp:RadioButtonList ID="rbtn_diplomaresult" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_diplomaresult" runat="server" CssClass="form-control m-input m-input--air" placeholder="Diploma Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Diploma University</label>
                                        <asp:RadioButtonList ID="rbtn_diplomauniversity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_diplomauniversity" runat="server" CssClass="form-control m-input m-input--air" placeholder="Diploma University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Diploma Year</label>
                                        <asp:RadioButtonList ID="rbtn_diplomayear" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_diplomayear" runat="server" CssClass="form-control m-input m-input--air" placeholder="Diploma Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Graduation Degree </label>
                                        <asp:RadioButtonList ID="rbtn_graduationdegree" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_graduationdegree" runat="server" CssClass="form-control m-input m-input--air" placeholder="Graduation Degree" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Graduation Result </label>
                                        <asp:RadioButtonList ID="rbtn_graduationresult" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_graduationresult" runat="server" CssClass="form-control m-input m-input--air" placeholder="Graduation Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Graduation University </label>
                                        <asp:RadioButtonList ID="rbtn_graduationuniversity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_graduationuniversity" runat="server" CssClass="form-control m-input m-input--air" placeholder="Graduation University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Graduation Year </label>
                                        <asp:RadioButtonList ID="rbtn_graduationyear" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_graduationyear" runat="server" CssClass="form-control m-input m-input--air" placeholder="Graduation Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Post Graduation Degree </label>
                                        <asp:RadioButtonList ID="rbtn_postgraduationdegree" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_postgraduationdegree" runat="server" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Degree" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Post Graduation Result</label>
                                        <asp:RadioButtonList ID="rbtn_postgraduationresult" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_postgraduationresult" runat="server" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Post Graduation University </label>
                                        <asp:RadioButtonList ID="rbtn_postgraduationuniversity" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_postgraduationuniversity" runat="server" CssClass="form-control m-input m-input--air" placeholder="Post Graduation University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Post Graduation Year </label>
                                        <asp:RadioButtonList ID="rbtn_postgraduationyear" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_postgraduationyear" runat="server" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Highest Level Education</label>
                                        <asp:RadioButtonList ID="rbtn_highestleveleducation" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_highestleveleducation" runat="server" CssClass="form-control m-input m-input--air" placeholder="Highest Level Education" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <h3>EMPLOYMENT DETAILS</h3>
                                        <label>Total Work Experience</label><br />
                                        <label>Year</label>
                                        <asp:RadioButtonList ID="rbtn_totalworkyear" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_totalworkyear" runat="server" CssClass="form-control m-input m-input--air" placeholder="Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Month</label>
                                        <asp:RadioButtonList ID="rbtn_totalworkmonth" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_totalworkmonth" runat="server" CssClass="form-control m-input m-input--air" placeholder="Month" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Total Companies Worked For </label>
                                        <asp:RadioButtonList ID="rbtn_totalcompanieswork" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_totalcompanieswork" runat="server" CssClass="form-control m-input m-input--air" placeholder="Total Companies Worked For" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <label>Last/Current Employer</label>
                                        <asp:RadioButtonList ID="rbtn_lastcurrentemploye" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                            <asp:ListItem Selected="True" style="color: green">Approve</asp:ListItem>
                                            <asp:ListItem style="color: red">DisApprove</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:TextBox ID="txt_lastcurrentemploye" runat="server" CssClass="form-control m-input m-input--air" placeholder="Last/Current Employer" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_submit_click" OnClientClick="this.disabled=true; this.value='Submitting…';" UseSubmitBehavior="false" />
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
