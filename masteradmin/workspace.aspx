<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="workspace.aspx.cs" Inherits="smartadtube.com.masteradmin.workspace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">Work Space</h3>
                </div>
            </div>
        </div>
        <!-- END: Subheader -->
        <div class="m-content" style="padding-bottom: 0px;">
            <div class="col-12">
                <div class="m-portlet m-portlet--tab">
                    <%--<div class="m-portlet__head">
                        <div class="m-portlet__head-caption">
                            <div class="m-portlet__head-title">
                                <span class="m-portlet__head-icon m--hide">
                                    <i class="la la-gear"></i>
                                </span>
                                <h3 class="m-portlet__head-text">Plan Details</h3>
                            </div>
                        </div>
                    </div>--%>
                    <!--begin::Form-->
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <div class="form-group m-form__group">
                                <table style="width: 100%">
                                    <tr>
                                        <td>Reg.No.
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_regno" runat="server" class="form-control m-input m-input--air"></asp:TextBox>
                                        </td>
                                        <td>Name
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_name" runat="server" class="form-control m-input m-input--air"></asp:TextBox>
                                        </td>
                                        <td>EmailId
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txt_emailid" runat="server" class="form-control m-input m-input--air"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="btn_search" runat="server" Text="Search" class="btn btn-accent" OnClick="btn_search_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--end::Form-->
                </div>
            </div>
        </div>
        <div class="m-content" style="padding-top: 0px;" id="div1" runat="server" visible="false">
            <div class="col-12">
                <div class="m-portlet m-portlet--tab">
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                                <%--<AlternatingRowStyle BackColor="White" />--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="Reg.No." SortExpression="regid">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("regid") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("regid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                    <asp:BoundField DataField="password" HeaderText="Password" SortExpression="password" />
                                    <asp:BoundField DataField="number" HeaderText="Number" SortExpression="number" />
                                    <asp:BoundField DataField="emailid" HeaderText="EmailId" SortExpression="emailid" />
                                    <asp:BoundField DataField="pname" HeaderText="Plan Name" SortExpression="pname" />
                                    <asp:BoundField DataField="regdate" HeaderText="Reg.Date" SortExpression="regdate" />
                                    <asp:TemplateField HeaderText="Status" SortExpression="status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="open">Open</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#716aca" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="m-content" style="padding-top: 0px;" id="div2" runat="server" visible="false">
            <div class="col-12">
                <div class="m-portlet m-portlet--tab">
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <table style="width: 50%" class="table table-bordered m-table m-table--border-brand m-table--head-bg-brand">
                                <tr>
                                    <td>Reg. No.
                                    </td>
                                    <td>
                                        <asp:Label ID="lbl_regid" runat="server" Text="Label"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:GridView ID="grd_slot" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand" OnRowDataBound="grd_slot_RowDataBound">
                                <Columns>
                                    <asp:BoundField DataField="slotnumber" HeaderText="Slot Number" SortExpression="slotnumber" />
                                    <asp:BoundField DataField="startdate" HeaderText="Start Date" SortExpression="startdate" DataFormatString="{0:dd-MM-yyyy}"/>
                                    <asp:BoundField DataField="enddate" HeaderText="End Date" SortExpression="enddate" DataFormatString="{0:dd-MM-yyyy}"/>
                                    <asp:BoundField DataField="totaltask" HeaderText="Total Task" SortExpression="totaltask" />
                                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                    <asp:TemplateField HeaderText="Status" SortExpression="status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#716aca" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                            <br />
                             <asp:GridView ID="grd_payment" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand" >
                                <Columns>
                                    <asp:BoundField DataField="slotnumber" HeaderText="Slot Number" SortExpression="slotnumber" />
                                    <asp:BoundField DataField="startdate" HeaderText="Start Date" SortExpression="startdate" DataFormatString="{0:dd-MM-yyyy}"/>
                                    <asp:BoundField DataField="enddate" HeaderText="End Date" SortExpression="enddate" DataFormatString="{0:dd-MM-yyyy}"/>
                                    <asp:BoundField DataField="totaltask" HeaderText="Total Task" SortExpression="totaltask" />
                                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                   
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#716aca" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                <SortedDescendingHeaderStyle BackColor="#4870BE" />
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</asp:Content>
