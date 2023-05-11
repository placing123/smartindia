<%@ Page Title="" Language="C#" MasterPageFile="~/masteradmin/Site1.Master" AutoEventWireup="true" CodeBehind="resumelist.aspx.cs" Inherits="smartadtube.com.masteradmin.resumelist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="m-grid__item m-grid__item--fluid m-wrapper" style="min-height: 600px">
        <div class="m-content" style="padding-bottom: 0px;">
            <div class="row">

                <div class="col-9">
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title" style="width: 100%">
                                    <div class="m-portlet__head-text">Resume List
                                        <asp:Button ID="btn_update" runat="server" CssClass="btn btn-primary" Text="Final Amount Update" style="margin-left:25px;" OnClick="btn_update_Click" />
                                    </div>
                                    <div class="m-portlet__head-text">
                                        Reg. Id:  
                                    <asp:Label ID="lbl_regid" runat="server" Style="padding-right: 50px;"></asp:Label>
                                        Slot: 
                                    <asp:Label ID="lbl_slotno" runat="server" Style="padding-right: 50px;"></asp:Label>
                                        Amount :
                                    <asp:Label ID="lbl_amount" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand" OnRowCommand="GridView1_RowCommand">
                                <%--<AlternatingRowStyle BackColor="White" />--%>
                                <Columns>
                                    <asp:BoundField DataField="srno1" HeaderText="#" />
                                    <asp:TemplateField Visible="False">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("autoid") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("autoid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="srno" HeaderText="Task Number" />
                                    <asp:BoundField DataField="regid" HeaderText="Reg. ID" />
                                    <asp:BoundField DataField="slotno" HeaderText="Slot" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="resumecheck">Check</asp:LinkButton>
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
