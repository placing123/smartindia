<%@ Page Title="" Language="C#" MasterPageFile="~/masteradmin/Site1.Master" AutoEventWireup="true" CodeBehind="helplineedit.aspx.cs" Inherits="smartadtube.com.masteradmin.helplineedit" %>
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
                                        <asp:Label ID="lbl_helplineautoid" runat="server" Visible="false"></asp:Label>
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
                                        <asp:Label ID="lbl_fieldname" runat="server"></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please insert some value" ControlToValidate="txt_fieldvalue" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:TextBox ID="txt_fieldvalue" runat="server" CssClass="form-control m-input m-input--air" placeholder="Enter Field Value" autocomplete="off"></asp:TextBox>
                                        <br />
                                        <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_submit_click" OnClientClick="if ( Page_ClientValidate() ) { this.disabled=true; this.value='Submitting…';}" UseSubmitBehavior="false" />
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
