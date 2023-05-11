<%@ Page Title="" Language="C#" MasterPageFile="~/masteradmin/Site1.Master" AutoEventWireup="true" CodeBehind="Payout.aspx.cs" Inherits="smartadtube.com.masteradmin.Payout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
            <!-- BEGIN: Subheader -->
            <div class="m-subheader ">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
                        <h3 class="m-subheader__title ">Payout Structure</h3>
                    </div>
                </div>
            </div>
            <!-- END: Subheader -->
            <div class="m-content" style="padding-bottom:0px;">
                <div class="col-6">
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
                                    <span class="m-portlet__head-icon m--hide">
                                        <i class="la la-gear"></i>
                                    </span>
                                    <h3 class="m-portlet__head-text">Payout Details</h3>
                                </div>
                            </div>
                        </div>
                        <!--begin::Form-->
                        <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                            <div class="m-portlet__body">
                                <table class="table table-bordered m-table m-table--border-brand m-table--head-bg-brand">
                                    <tr>
                                        <td>Payout Structure ID :-
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="ddl_payoutid" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_payoutid_SelectedIndexChanged"></asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btn_addstructure" runat="server" OnClick="btn_addstructure_Click">Add</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-content" style="padding-top:0px;">
                <div class="col-12">
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                            <div class="m-portlet__body">
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand"
                                    GridLines="None" Width="100%" OnRowCommand="GridView1_RowCommand">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="autoid" SortExpression="autoid" Visible="false">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("autoid") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("autoid") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="payoutid" HeaderText="Payout ID" SortExpression="payoutid" />
                                        <asp:BoundField DataField="from" HeaderText="From" SortExpression="from" />
                                        <asp:BoundField DataField="to" HeaderText="To" SortExpression="to" />
                                        <asp:BoundField DataField="rate" HeaderText="Rate" SortExpression="rate" DataFormatString="{0:0.00}" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="deletepayoutstructure">delete</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#716aca" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>
                            <div>
                                <table  class="table table-bordered m-table m-table--border-brand m-table--head-bg-brand">
                                    <tr>
                                        <td><b>Payout ID</b>
                                        </td>
                                        <td><b>From</b>
                                        </td>
                                        <td><b>TO</b>
                                        </td>
                                        <td><b>Rate</b>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbl_payoutid" runat="server"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_from" runat="server" Style="width: 100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_to" runat="server" Style="width: 100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_rate" runat="server" Style="width: 100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="lbtn_addrange" runat="server" Style="width: 100px" OnClick="lbtn_addrange_Click">Add Range</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>
