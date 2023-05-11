<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="AddVideo.aspx.cs" Inherits="smartadtube.com.masteradmin.AddVideo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">Add New Video</h3><br />
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
                                        <h3 class="m-portlet__head-text">Video Details</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                                <div class="m-portlet__body">
                                    <div class="form-group m-form__group">
                                        <label>Select Video:-   </label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" /><br />
                                        <asp:RegularExpressionValidator
                                            ID="RegularExpressionValidator2" runat="server" ErrorMessage="Only Video files are allowed!"
                                            ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))(.mp4|.MP4)$"
                                            ControlToValidate="FileUpload1" CssClass="text-red" ForeColor="Red" ValidationGroup="val1"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator runat="server" ErrorMessage="Please Select File" ForeColor="Red" ControlToValidate="FileUpload1" ValidationGroup="val1">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group m-form__group">
                                        <label>Question :-</label>
                                        <%--<asp:RequiredFieldValidator runat="server" ErrorMessage="Question Required" ForeColor="Red" ControlToValidate="txt_question" ValidationGroup="val1">
                                        </asp:RequiredFieldValidator>--%>
                                        <asp:TextBox ID="txt_question" runat="server" CssClass="form-control m-input m-input--air" placeholder="Enter Question"></asp:TextBox>
                                        <br />
                                        <label>Option :-</label>
                                        <table style="width: 100%">
                                            <tr>
                                                <td>A 
                                                    <%--<asp:RequiredFieldValidator runat="server" ErrorMessage="Option A Required" ForeColor="Red" ControlToValidate="txt_optiona" ValidationGroup="val1">
                                                    </asp:RequiredFieldValidator>--%>
                                                </td>
                                                <td>B 
                                                    <%--<asp:RequiredFieldValidator runat="server" ErrorMessage="Option B Required" ForeColor="Red" ControlToValidate="txt_optionb" ValidationGroup="val1">
                                                    </asp:RequiredFieldValidator>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_optiona" runat="server" CssClass="form-control m-input m-input--air" placeholder="Option A"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_optionb" runat="server" CssClass="form-control m-input m-input--air" placeholder="Option B"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>C 
                                                    <%--<asp:RequiredFieldValidator runat="server" ErrorMessage="Option C Required" ForeColor="Red" ControlToValidate="txt_optionc" ValidationGroup="val1">
                                                    </asp:RequiredFieldValidator>--%>
                                                </td>
                                                <td>D 
                                                    <%--<asp:RequiredFieldValidator runat="server" ErrorMessage="Option D Required" ForeColor="Red" ControlToValidate="txt_optiond" ValidationGroup="val1">
                                                    </asp:RequiredFieldValidator>--%>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="txt_optionc" runat="server" CssClass="form-control m-input m-input--air" placeholder="Option C"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txt_optiond" runat="server" CssClass="form-control m-input m-input--air" placeholder="Option D"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <label>Answer :-</label>
                                        <asp:DropDownList ID="ddl_answer" runat="server" CssClass="form-control m-input m-input--air">
                                            <asp:ListItem Selected="True">A</asp:ListItem>
                                            <asp:ListItem>B</asp:ListItem>
                                            <asp:ListItem>C</asp:ListItem>
                                            <asp:ListItem>D</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="m-portlet__foot m-portlet__foot--fit">
                                    <div class="m-form__actions">
                                        <asp:Button ID="btn_add" runat="server" Text="Add Video" class="btn btn-accent" OnClick="btn_add_click" ValidationGroup="val1" />
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
                                        <h3 class="m-portlet__head-text">Video Preview</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                                <div class="m-portlet__body">
                                    <div class="form-group m-form__group">
                                        <%--<asp:Literal ID="ltEmbed" runat="server" />--%>
                                        <%--   <video controls>
                                            <source src="../videofiles/1.mp4" type="video/mp4">
                                            your browser doesn't support this video type
                                        </video>--%>


                                        <video controls width="100%" height="100%" id="video" runat="server" >
                                        </video>

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
