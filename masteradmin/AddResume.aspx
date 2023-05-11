﻿<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="AddResume.aspx.cs" Inherits="smartadtube.com.masteradmin.AddResume" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">Add New Resume</h3><br />
                    <asp:Label ID="lbl_totalresume" runat="server"></asp:Label>
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
                                        <h3 class="m-portlet__head-text">Resume Details</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                                <div class="m-portlet__body">
                                    <div class="form-group m-form__group">
                                        <label>Select Resume:-   </label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true"/><br />
                                           <asp:RegularExpressionValidator
                    id="RegularExpressionValidator2" runat="server"
                    ErrorMessage="Only PDF files are allowed!"
                    ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.pdf|.PDF)$"
                    ControlToValidate="FileUpload1" CssClass="text-red" ForeColor="Red" ValidationGroup="val1"></asp:RegularExpressionValidator>
                                       <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select File" ForeColor="Red" ControlToValidate="FileUpload1" ValidationGroup="val1">
    </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="m-portlet__foot m-portlet__foot--fit">
                                    <div class="m-form__actions">
                                        <asp:Button ID="btn_add" runat="server" Text="Add Resume" class="btn btn-accent" OnClick="btn_add_click" ValidationGroup="val1" />
                                        <asp:Button ID="btn_clear" runat="server" Text="Clear" class="btn btn-secondary" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6" id="div1" runat="server" visible="false">
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
                                <div class="m-portlet__body">
                                    <div class="form-group m-form__group">
                                        <%--<iframe id="pdfiframe" runat="server" style="width: 100%; height: 500px;" frameborder="0"></iframe>--%>
                                        <asp:Literal ID="ltEmbed" runat="server" />
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
