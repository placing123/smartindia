<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="queryresult.aspx.cs" Inherits="smartadtube.com.demo.queryresult" %>

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
                                    <h3 class="m-portlet__head-text">Rquery Details</h3>
                                </div>
                            </div>
                        </div>
                        <!--begin::Form-->
                        <div class="m-form m-form--fit m-form--label-align-right" runat="server" id="div1">
                            <div class="m-portlet__body">
                                <div class="form-group m-form__group">
                                    <table>
                                        <tr>
                                            <td style="width: 99px">
                                                <label>Taskdata id</label>
                                                :<br />
                                            </td>
                                            <td>
                                                <asp:Label ID="lbl_regid" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="lbl_taskdataid" runat="server" Text="demo"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 99px">
                                                <label>Query Field :</label>

                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddl_field" runat="server" CssClass="search-box" Style="width: 220px">
                                                    <asp:ListItem Value="First Name">First Name</asp:ListItem>
                                                    <asp:ListItem Value="Middle Name">Middle Name</asp:ListItem>
                                                    <asp:ListItem Value="Last Name">Last Name</asp:ListItem>
                                                    <asp:ListItem Value="Date Of Birth">Date Of Birth</asp:ListItem>
                                                    <asp:ListItem Value="Gender">Gender</asp:ListItem>
                                                    <asp:ListItem Value="Nationality">Nationality</asp:ListItem>
                                                    <asp:ListItem Value="Marital Status">Marital Status</asp:ListItem>
                                                    <asp:ListItem Value="Passport">Passport</asp:ListItem>
                                                    <asp:ListItem Value="Hobbies">Hobbies</asp:ListItem>
                                                    <asp:ListItem Value="Language Known">Language Known</asp:ListItem>
                                                    <asp:ListItem Value="Address ">Address </asp:ListItem>
                                                    <asp:ListItem Value="Land Mark">Land Mark</asp:ListItem>
                                                    <asp:ListItem Value="City">City</asp:ListItem>
                                                    <asp:ListItem Value="State">State</asp:ListItem>
                                                    <asp:ListItem Value="Pincode">Pincode</asp:ListItem>
                                                    <asp:ListItem Value="Mobile">Mobile</asp:ListItem>
                                                    <asp:ListItem Value="Email ID">Email ID</asp:ListItem>
                                                    <asp:ListItem Value="SSC Result">SSC Result</asp:ListItem>
                                                    <asp:ListItem Value="SSC Board/University">SSC Board/University</asp:ListItem>
                                                    <asp:ListItem Value="SSC Passing Year">SSC Passing Year</asp:ListItem>
                                                    <asp:ListItem Value="HSC Result">HSC Result</asp:ListItem>
                                                    <asp:ListItem Value="HSC Board/University">HSC Board/University</asp:ListItem>
                                                    <asp:ListItem Value="HSC Passing Year">HSC Passing Year</asp:ListItem>
                                                    <asp:ListItem Value="Diploma Degree">Diploma Degree</asp:ListItem>
                                                    <asp:ListItem Value="Diploma Result">Diploma Result</asp:ListItem>
                                                    <asp:ListItem Value="Diploma University">Diploma University</asp:ListItem>
                                                    <asp:ListItem Value="Diploma Year">Diploma Year</asp:ListItem>
                                                    <asp:ListItem Value="Graduation Degree">Graduation Degree</asp:ListItem>
                                                    <asp:ListItem Value="Graduation Result">Graduation Result</asp:ListItem>
                                                    <asp:ListItem Value="Graduation University">Graduation University</asp:ListItem>
                                                    <asp:ListItem Value="Graduation Year">Graduation Year</asp:ListItem>
                                                    <asp:ListItem Value="Post Graduation Degree">Post Graduation Degree</asp:ListItem>
                                                    <asp:ListItem Value="Post Graduation Result">Post Graduation Result</asp:ListItem>
                                                    <asp:ListItem Value="Post Graduation University">Post Graduation University</asp:ListItem>
                                                    <asp:ListItem Value="Post Graduation Year">Post Graduation Year</asp:ListItem>
                                                    <asp:ListItem Value="Highest Level Education">Highest Level Education</asp:ListItem>
                                                    <asp:ListItem Value="Total Work Experience-Year">Total Work Experience-Year</asp:ListItem>
                                                    <asp:ListItem Value="Total Work Experience-Month">Total Work Experience-Month</asp:ListItem>
                                                    <asp:ListItem Value="Total Companies Worked For">Total Companies Worked For</asp:ListItem>
                                                    <asp:ListItem Value="Last/Current Employer">Last/Current Employer</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
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
                                    <asp:BoundField DataField="taskdataid" HeaderText="Taskdata Id" SortExpression="taskdataid" />
                                    <asp:BoundField DataField="fieldname" HeaderText="Field Name" SortExpression="fieldname" />
                                    <asp:BoundField DataField="fieldvalue" HeaderText="Field Value" SortExpression="fieldvalue" />
                                    <asp:BoundField DataField="updatetime" HeaderText="Req. Datetime" SortExpression="updatetime" DataFormatString="{0:dd-MM-yyyy hh:mm:ss tt}" />
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
            </div>
        </div>
    </div>
</asp:Content>
