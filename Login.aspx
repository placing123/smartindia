<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="smartadtube.com.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login V3</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">

    <style type="text/css">
        img.logo_class {
    border-radius: 45px;
    margin-top: 2px;
}
    </style>
</head>
<body>
    <style>
        .login100-form-btn{
            background:#fff;
        }
        .login100-form-btn:hover
        {
            background: -webkit-linear-gradient(bottom, #7579ff, #b224ef);
        }
    </style>
    <form id="form1" runat="server">
        <div class="limiter">
            <div class="container-login100" style="background-image: url('images/bg-01.jpg');">
                <div class="wrap-login100">
                    <div class="login100-form validate-form">
                       <!-- <span class="login100-form-logo">
                            <a href="Default.aspx" >
                                <img src="images/logo.png" width="100"   class="m--img-rounded m--marginless m--img-centered" /></a>
                        </span>  -->
                         <a href="Default.aspx" >
                                <img src="images/logo.png" width="100"   class="m--img-rounded m--marginless m--img-centered" /></a>
                       
                        <span class="login100-form-title p-b-34 p-t-27">Log in
                        </span>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ForeColor="Red" ControlToValidate="txt_regid"></asp:RequiredFieldValidator>
                        <div class="wrap-input100 validate-input" data-validate="Enter username" style="margin-bottom:10px;">
                            <asp:TextBox ID="txt_regid" runat="server" placeholder="Username" class="input100"></asp:TextBox>
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ForeColor="Red" ControlToValidate="txt_password"></asp:RequiredFieldValidator>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <asp:TextBox ID="txt_password" runat="server" class="input100" placeholder="Password" TextMode="Password"></asp:TextBox>
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                        </div>

                        <div class="contact100-form-checkbox">
                            <input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
                            <label class="label-checkbox100" for="ckb1">
                                Remember me
                            </label>
                        </div>

                        <div class="container-login100-form-btn">
                            <asp:Button ID="btn_login" runat="server" Text="Login" class="login100-form-btn" OnClick="btn_login_click"/>
                        </div>

                        <div class="text-center p-t-90">
                            <a class="txt1" href="#">Forgot Password?
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div id="dropDownSelect1"></div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <div>
        </div>
    </form>
</body>
</html>
