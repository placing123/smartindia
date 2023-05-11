<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="changepassword.aspx.cs" Inherits="smartadtube.com.demo.changepassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function Validate() {
            var password = document.getElementById("ContentPlaceHolder1_txt_newpassword").value;
            var confirmPassword = document.getElementById("ContentPlaceHolder1_txt_confirmpassword").value;
            if (password != confirmPassword) {
                alert("new Passwords and confirm password does not match.");
                return false;
            }
            return true;
        }
    </script>
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">Change Password</h3>
                </div>
            </div>
        </div>
        <!-- END: Subheader -->
        <div class="m-content" style="padding-bottom: 0px;">
            <div class="col-6">
                <div class="m-portlet m-portlet--tab">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <span class="m-portlet__head-icon m--hide">
                                    <i class="la la-gear"></i>
                                </span>
                                <h3 class="m-portlet__head-text">Password Details</h3>
                            </div>
                        </div>
                    </div>
                    <!--begin::Form-->
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <div class="form-group m-form__group">
                                <label>Old Password :- </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ControlToValidate="txt_oldpassword" ForeColor="Red" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_oldpassword" runat="server" class="form-control m-input m-input--air" placeholder="Old Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>New Password :- </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" ControlToValidate="txt_newpassword" ForeColor="Red" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_newpassword" runat="server" class="form-control m-input m-input--air" placeholder="New Password" TextMode="Password"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Confirm Password :- </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" ControlToValidate="txt_confirmpassword" ForeColor="Red" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_confirmpassword" runat="server" class="form-control m-input m-input--air" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="m-portlet__foot m-portlet__foot--fit">
                            <div class="m-form__actions">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_submit_Click" OnClientClick="if ( Page_ClientValidate() ) { return Validate()}" ValidationGroup="v1" />
                            </div>
                        </div>
                    </div>
                    <!--end::Form-->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
