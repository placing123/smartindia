<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="smartadtube.com.admin.UserRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">User Registration</h3>
                </div>
            </div>
        </div>
       
        <!-- END: Subheader -->
        <div class="m-content">
            <div class="col-6">
                <div class="m-portlet m-portlet--tab">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <span class="m-portlet__head-icon m--hide">
                                    <i class="la la-gear"></i>
                                </span>
                                <h3 class="m-portlet__head-text">User Details</h3>
                            </div>
                        </div>
                    </div>
                     <div class="alert alert-brand alert-dismissible fade show" role="alert" id="div1" visible="false" runat="server">
												<button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
												<strong>
													Registration Success!
												</strong>
												 Registration ID :-<asp:Label ID="lbl_regid" runat="server" Text="Label"></asp:Label>
											</div>
                    <!--begin::Form-->
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <div class="form-group m-form__group">
                                <label>Name</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_name" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                <asp:TextBox ID="txt_name" runat="server" CssClass="form-control m-input m-input--air" placeholder="Enter Name"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Mobile Number</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_mobilenumber" ValidationGroup="v1"></asp:RequiredFieldValidator>

                                <asp:TextBox ID="txt_mobilenumber" runat="server" CssClass="form-control m-input m-input--air" placeholder="Enter Mobile Number"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>EmailID</label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_emailid" ValidationGroup="v1"></asp:RequiredFieldValidator>

                                <asp:TextBox ID="txt_emailid" runat="server" class="form-control m-input m-input--air" placeholder="Enter EmailID"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Address</label>
                                <asp:TextBox ID="txt_address" runat="server" class="form-control m-input m-input--air" placeholder="Enter Address" TextMode="MultiLine"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Select Plan</label>
                                <asp:DropDownList ID="ddl_planid" runat="server" CssClass="form-control m-input m-input--air"></asp:DropDownList>
                            </div>
                        </div>
                        <div class="m-portlet__foot m-portlet__foot--fit">
                            <div class="m-form__actions">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_submit_click" ValidationGroup="v1" />
                                <asp:Button ID="btn_clear" runat="server" Text="Clear" class="btn btn-secondary" OnClick="btn_clear_Click" />
                            </div>
                        </div>
                    </div>
                    <!--end::Form-->
                </div>
            </div>
        </div>
    </div>
</asp:Content>
