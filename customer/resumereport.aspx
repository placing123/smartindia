<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="resumereport.aspx.cs" Inherits="smartadtube.com.customer.resumereport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
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
                                        
                                        <br />
                                        <h3>PERSONAL DETAILS</h3>
                                        <label>First Name :-</label>
                                        <asp:TextBox ID="txt_firstname" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Enter First Name" autocomplete="off" Enabled="false" ></asp:TextBox>
                                        <label>Middle Name </label>
                                        <asp:TextBox ID="txt_middlename" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Enter Middle Name" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Last Name </label>
                                        <asp:TextBox ID="txt_lastname" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Enter Last Name" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Date Of Birth (DD-MM-YYYY) </label>
                                        <asp:TextBox ID="txt_dob" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Date of Birth" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Gender</label>
                                        <asp:TextBox ID="txt_gender" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Gender" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Nationality</label>
                                        <asp:TextBox ID="txt_nationality" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Nationality" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Marital Status  </label>
                                        <asp:TextBox ID="txt_maritalstatus" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Marital Status" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Passport  </label>
                                        <asp:TextBox ID="txt_passport" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Passport" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Hobbies </label>
                                        <asp:TextBox ID="txt_hobbies" runat="server" MaxLength="200" CssClass="form-control m-input m-input--air" placeholder="Hobbies" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Language Known</label>
                                        <asp:TextBox ID="txt_languageknown" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Language Known" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <h3>COMMUNICATION DETAILS</h3>
                                        <label>Address </label>
                                        <asp:TextBox ID="txt_address" runat="server" MaxLength="200" CssClass="form-control m-input m-input--air" placeholder="Address" TextMode="MultiLine" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Land Mark  </label>
                                        <asp:TextBox ID="txt_landmark" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Land Mark" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>City </label>
                                        <asp:TextBox ID="txt_city" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="City" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>State</label>
                                        <asp:TextBox ID="txt_state" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="State" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Pincode </label>
                                        <asp:TextBox ID="txt_pincode" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Pincode" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Mobile   </label>
                                        <asp:TextBox ID="txt_mobile" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Mobile" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Email ID </label>
                                        <asp:TextBox ID="txt_emailid" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Email ID" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <h3>QUALIFICATION DETAILS</h3>
                                        <label>SSC Result </label>
                                        <asp:TextBox ID="txt_sscresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="SSC Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>SSC Board/University</label>
                                        <asp:TextBox ID="txt_sscuniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="SSC Board/University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>SSC Passing Year</label>
                                        <asp:TextBox ID="txt_sscyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="SSC Passing Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>HSC Result </label>
                                        <asp:TextBox ID="txt_hscresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="HSC Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>HSC Board/University</label>
                                        <asp:TextBox ID="txt_hscuniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="HSC Board/University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>HSC Passing Year</label>
                                        <asp:TextBox ID="txt_hscyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="HSC Passing Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Diploma Degree</label>
                                        <asp:TextBox ID="txt_diplomadegree" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Diploma Degree" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Diploma Result </label>
                                        <asp:TextBox ID="txt_diplomaresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Diploma Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Diploma University</label>
                                        <asp:TextBox ID="txt_diplomauniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Diploma University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Diploma Year</label>
                                        <asp:TextBox ID="txt_diplomayear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Diploma Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Graduation Degree </label>
                                        <asp:TextBox ID="txt_graduationdegree" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Graduation Degree" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Graduation Result </label>
                                        <asp:TextBox ID="txt_graduationresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Graduation Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Graduation University </label>
                                        <asp:TextBox ID="txt_graduationuniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Graduation University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Graduation Year </label>
                                        <asp:TextBox ID="txt_graduationyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Graduation Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Post Graduation Degree </label>
                                        <asp:TextBox ID="txt_postgraduationdegree" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Degree" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Post Graduation Result</label>
                                        <asp:TextBox ID="txt_postgraduationresult" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Result" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Post Graduation University </label>
                                        <asp:TextBox ID="txt_postgraduationuniversity" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Post Graduation University" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Post Graduation Year </label>
                                        <asp:TextBox ID="txt_postgraduationyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Post Graduation Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Highest Level Education</label>
                                        <asp:TextBox ID="txt_highestleveleducation" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Highest Level Education" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <h3>EMPLOYMENT DETAILS</h3>
                                        <label>Total Work Experience</label><br />
                                        <label>Year</label>
                                        <asp:TextBox ID="txt_totalworkyear" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Year" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Month</label>
                                        <asp:TextBox ID="txt_totalworkmonth" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Month" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Total Companies Worked For </label>
                                        <asp:TextBox ID="txt_totalcompanieswork" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Total Companies Worked For" autocomplete="off" Enabled="false"></asp:TextBox>
                                        <label>Last/Current Employer</label>
                                        <asp:TextBox ID="txt_lastcurrentemploye" runat="server" MaxLength="50" CssClass="form-control m-input m-input--air" placeholder="Last/Current Employer" autocomplete="off" Enabled="false"></asp:TextBox>
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
