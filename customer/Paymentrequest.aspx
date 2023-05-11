<%@ Page Title="" Language="C#" MasterPageFile="~/customer/Site1.Master" AutoEventWireup="true" CodeBehind="Paymentrequest.aspx.cs" Inherits="smartadtube.com.customer.Paymentrequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function isNumberKey(evt) {

            var charCode = (evt.which) ? evt.which : evt.keyCode;
            //if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 189)

            if ((charCode != 45 || $(element).val().indexOf('-') != -1) && (charCode != 46 || $(element).val().indexOf('.') != -1) && (charCode < 48 || charCode > 57) && charCode != 8 && charCode != 9 && charCode != 37 && charCode != 38 && charCode != 39 && charCode != 40)
                return false;
            return true;
        }
        function isKeyDisable(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            //if (charCode > 31 && (charCode < 48 || charCode > 57) && charCode != 189)

            if (charCode != 9)
                return false;
            return true;
        }
    </script>
    <div class="m-grid__item m-grid__item--fluid m-wrapper" style="min-height: 600px">
        <div class="m-content" style="padding-bottom: 0px;">
            <div class="row">

                <div class="col-6">
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-portlet__head">
                            <div class="m-portlet__head-caption">
                                <div class="m-portlet__head-title">
                                    <span class="m-portlet__head-icon m--hide">
                                        <i class="la la-gear"></i>
                                    </span>
                                    <h3 class="m-portlet__head-text">Payment Request Details</h3>
                                </div>
                            </div>
                        </div>
                        <!--begin::Form-->
                        <div class="m-form m-form--fit m-form--label-align-right" runat="server">
                            <div class="m-portlet__body">
                                <div class="form-group m-form__group">
                                    <label>Requested Amount </label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required!" ForeColor="Red" ControlToValidate="txt_reqamount" ValidationGroup="v1"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txt_reqamount" runat="server" class="form-control m-input m-input--air" onkeypress="return isNumberKey(event)"></asp:TextBox>
                                </div>
                            </div>
                            <div class="m-portlet__foot m-portlet__foot--fit">
                                <div class="m-form__actions">
                                    <asp:Button ID="btn_request" runat="server" Text="Submit" class="btn btn-accent" ValidationGroup="v1" OnClick="btn_request_Click" />
                                </div>
                            </div>
                        </div>
                        <!--end::Form-->
                        <div>
                              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" CssClass="table table-bordered m-table m-table--border-brand m-table--head-bg-brand" OnRowDataBound="GridView1_RowDataBound">
                                <%--<AlternatingRowStyle BackColor="White" />--%>
                                <Columns>
                                    <asp:BoundField DataField="srno" HeaderText="#" SortExpression="srno" />
                                    <asp:BoundField DataField="regid" HeaderText="Reg. ID" SortExpression="regid" />
                                    <asp:BoundField DataField="amount" HeaderText="Amount" SortExpression="amount" />
                                    <asp:BoundField DataField="reqdatetime" HeaderText="Req. Date" SortExpression="reqdatetime" DataFormatString="{0:dd-MM-yyyy}" />
                                    <asp:BoundField DataField="refno" HeaderText="Ref. Number" SortExpression="refno" />
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
                        </div>
                    </div>
                </div>
                <div class="col-4">
                    <div class="m-portlet m-portlet--tab">
                        <div class="m-widget24">
                            <div class="m-widget24__item">
                                <h4 class="m-widget24__title">Permanent Balance</h4>
                                <br>
                                <span class="m-widget24__desc"></span>
                                <span class="m-widget24__stats m--font-brand">₹
                                    <asp:Label ID="lbl_totalpayment" runat="server"></asp:Label>
                                </span>
                                <div class="m--space-10"></div>
                                <div class="progress m-progress--sm">
                                    <div class="progress-bar m--bg-brand" role="progressbar" style="width: 70%;" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                                <span class="m-widget24__change"></span>
                                <span class="m-widget24__number"></span>
                            </div>
                        </div>
                    </div>

                    <div class="m-portlet m-portlet--tab" style="padding:15px 15px 15px 15px;">
                            Note:- Minimun Requested amount is ₹ 2000.
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
