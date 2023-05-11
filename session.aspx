<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="session.aspx.cs" Inherits="smartadtube.com.session" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Multiple Login Detected Please logout from other devices by pressing below button.
            </h2>
        </div>
        <br />
        <asp:Button ID="btn_clear" runat="server" Text="Clear All Session" OnClick="btn_clear_click" />
    </form>
</body>
</html>
