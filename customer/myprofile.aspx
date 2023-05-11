<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="smartadtube.com.customer.myprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">My Profile</h3>
                </div>
            </div>
        </div>
        <!-- END: Subheader -->
        <div class="m-content" style="padding-bottom: 0px;">
            <div class="row">
                 <div class="col-6">
                <div class="m-portlet m-portlet--tab">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <span class="m-portlet__head-icon m--hide">
                                    <i class="la la-gear"></i>
                                </span>
                                <h3 class="m-portlet__head-text">Profile Details</h3>
                            </div>
                        </div>
                    </div>
                    <!--begin::Form-->
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <div class="form-group m-form__group">
                                <label>Registration Id :- </label>
                                <asp:Label ID="lbl_regid" runat="server" ></asp:Label>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Name :- </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_name" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_name" runat="server" class="form-control m-input m-input--air" ></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Email ID :- </label>
                                <asp:Label ID="lbl_emailid" runat="server" ></asp:Label>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Address :- </label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_address" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_address" runat="server" class="form-control m-input m-input--air" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Registration Date :- </label>
                                <asp:Label ID="lbl_regdate" runat="server" ></asp:Label>
                            </div>
                        </div>
                        <div class="m-portlet__foot m-portlet__foot--fit">
                            <div class="m-form__actions">
                                <asp:Button ID="btn_update" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_update_Click" ValidationGroup="v1" />
                            </div>
                        </div>
                    </div>
                    <!--end::Form-->
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
                                <h3 class="m-portlet__head-text">Banking Details</h3>
                            </div>
                        </div>
                    </div>
                    <!--begin::Form-->
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <div class="form-group m-form__group">
                                <label>Account Holder Name </label>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_acname" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_acname" runat="server" class="form-control m-input m-input--air"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                 <label>Account Number </label>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_acnumber" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_acnumber" runat="server" class="form-control m-input m-input--air"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Ifsc Code </label>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_ifsccode" ValidationGroup="v2"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_ifsccode" runat="server" class="form-control m-input m-input--air"></asp:TextBox>
                            </div>
                        </div>
                        <div class="m-portlet__foot m-portlet__foot--fit">
                            <div class="m-form__actions">
                                <asp:Button ID="btn_bankupdate" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_bankupdate_click" ValidationGroup="v2" />
                            </div>
                        </div>
                    </div>
                    <!--end::Form-->
                </div>
            </div>
            </div>
           
        </div>
    </div>
</asp:Content>
