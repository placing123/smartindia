<%@ Page Title="" Language="C#" MasterPageFile="~/customer/Site1.Master" AutoEventWireup="true" CodeBehind="paymentapproval.aspx.cs" Inherits="smartadtube.com.customer.paymentapproval" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="m-grid__item m-grid__item--fluid m-wrapper" style="min-height: 600px">
        <div class="m-content" style="padding-bottom: 0px;">
            <div class="row">

                <div class="col-12">
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
                                    <span class="m-portlet__head-icon m--hide">
                                        <i class="la la-gear"></i>
                                    </span>
                                    <h3 class="m-portlet__head-text">Payment Approval Details</h3>
                                </div>
                            </div>
                        </div>
                        <div>
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                                <%--<AlternatingRowStyle BackColor="White" />--%>
                                <Columns>
                                    <asp:BoundField DataField="srno" HeaderText="#" SortExpression="srno" />
                                    <asp:BoundField DataField="regid" HeaderText="Reg. ID" SortExpression="regid" />
                                    <asp:TemplateField HeaderText="Slot Number" SortExpression="slotnumber">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("slotnumber") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("slotnumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                    <asp:BoundField DataField="number" HeaderText="Number" SortExpression="number" />
                                    <asp:BoundField DataField="emailid" HeaderText="Email ID" SortExpression="emailid" />
                                    <asp:BoundField DataField="amount" HeaderText="Slot Amount" SortExpression="tasknumbers" />
                                    <asp:BoundField DataField="enddate" HeaderText="End Date" SortExpression="enddate" DataFormatString="{0:dd-MM-yyyy}" />
                                    <asp:TemplateField HeaderText="Status" SortExpression="status">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("approval") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("approval") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="details">Details</asp:LinkButton>
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
    </div>
</asp:Content>
