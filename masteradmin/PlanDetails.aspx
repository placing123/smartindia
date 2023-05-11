<%@ Page Title="" Language="C#" MasterPageFile="~/masteradmin/Site1.Master" AutoEventWireup="true" CodeBehind="PlanDetails.aspx.cs" Inherits="smartadtube.com.masteradmin.PlanDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="m-grid__item m-grid__item--fluid m-wrapper">
        <!-- BEGIN: Subheader -->
        <div class="m-subheader ">
            <div class="d-flex align-items-center">
                <div class="mr-auto">
                    <h3 class="m-subheader__title ">Plan Master</h3>
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
                                <h3 class="m-portlet__head-text">Plan Details</h3>
                            </div>
                        </div>
                    </div>
                    <!--begin::Form-->
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <div class="form-group m-form__group">
                                <label>Plan Name</label>
                                <asp:TextBox ID="txt_planname" runat="server" class="form-control m-input m-input--air" placeholder="Enter Plan Name"></asp:TextBox>

                            </div>
                            <div class="form-group m-form__group">
                                <label>Number of Task/Slot</label>
                                <asp:TextBox ID="txt_numberoftask" runat="server" class="form-control m-input m-input--air" placeholder="Enter Number of Task/Slot"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Total Slots</label>
                                <asp:TextBox ID="txt_totalslot" runat="server" class="form-control m-input m-input--air" placeholder="Enter Total Slots"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Select Payout Structure ID</label>
                                <asp:DropDownList ID="ddl_strucruteid" runat="server" CssClass="form-control m-input m-input--air"></asp:DropDownList>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Fees Amount</label>
                                <asp:TextBox ID="txt_amount" runat="server" class="form-control m-input m-input--air" placeholder="Enter Fees Amount"></asp:TextBox>
                            </div>
                            <div class="form-group m-form__group">
                                <label>Plan Days/Slot</label>
                                <asp:TextBox ID="txt_days" runat="server" class="form-control m-input m-input--air" placeholder="Enter Plan Days/Slot"></asp:TextBox>
                            </div>
                        </div>
                        <div class="m-portlet__foot m-portlet__foot--fit">
                            <div class="m-form__actions">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" class="btn btn-accent" OnClick="btn_submitplan_Click" />
                                <asp:Button ID="btn_clear" runat="server" Text="Clear" class="btn btn-secondary" />
                            </div>
                        </div>
                    </div>
                    <!--end::Form-->
                </div>
            </div>
        </div>
        <div class="m-content" style="padding-top:0px;">
            <div class="col-12">
                <div class="m-portlet m-portlet--tab">
                    <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                        <div class="m-portlet__body">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand">
                                <%--<AlternatingRowStyle BackColor="White" />--%>
                                <Columns>
                                    <asp:BoundField DataField="planid" HeaderText="Plan ID" SortExpression="planid" />
                                    <asp:BoundField DataField="planname" HeaderText="Plan Name" SortExpression="planname" />
                                    <asp:BoundField DataField="tasknumbers" HeaderText="Task Numbers" SortExpression="tasknumbers" />
                                    <asp:BoundField DataField="slot" HeaderText="Slots" SortExpression="slot" />
                                    <asp:BoundField DataField="payoutid" HeaderText="Payout Id" SortExpression="payoutid" />
                                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                    <asp:BoundField DataField="days" HeaderText="Days" SortExpression="days" />
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
