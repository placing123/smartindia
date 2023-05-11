<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="querytask.aspx.cs" Inherits="smartadtube.com.demo.querytask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class="m-grid__item m-grid__item--fluid m-wrapper" style="min-height: 600px">
        <div class="m-content" style="padding-bottom: 0px;">
            <div class="row">

                <div class="col-12">
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title" style="width:100%">
                                    <span class="m-portlet__head-icon m--hide">
                                        <i class="la la-gear"></i>
                                    </span>
                                    <h3 class="m-portlet__head-text">Qery Task Details</h3>
                                    <asp:Label ID="lbl_regid" runat="server" Visible="false"></asp:Label>

                                    <asp:Button id="btn_allquery" runat="server" Text="All Query" CssClass="btn btn-primary" style="float:right;margin-top:20px" OnClick="btn_allquery_Click"/>
                                </div>
                            </div>
                        </div>
                        <div>
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand" OnRowCommand="GridView1_RowCommand" >
                                <%--<AlternatingRowStyle BackColor="White" />--%>
                                <Columns>
                                    <asp:BoundField DataField="srnumber" HeaderText="#" SortExpression="srnumber" />
                                    <asp:TemplateField HeaderText="Taskdata ID" SortExpression="autoid">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("autoid") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("autoid") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="regid" HeaderText="Reg. ID" SortExpression="regid" />
                                    <asp:BoundField DataField="slotno" HeaderText="Slot Number" SortExpression="slotno" />
                                    <asp:BoundField DataField="srno" HeaderText="Sr. No." SortExpression="srno" />
                                    <asp:BoundField DataField="updatetime" HeaderText="Task Date" SortExpression="updatetime" DataFormatString="{0:dd-MM-yyyy}" />
                                     <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtn_edittask" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="edittask">Edit Task</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtn_query" runat="server" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="newquery">New Query</asp:LinkButton>
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
