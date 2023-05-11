<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="smartadtube.com.masteradmin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login Page</title>
    <meta name="description" content="Latest updates and statistic charts">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.16/webfont.js"></script>
    <script>
        WebFont.load({
            google: { "families": ["Poppins:300,400,500,600,700", "Roboto:300,400,500,600,700"] },
            active: function () {
                sessionStorage.fonts = true;
            }
        });
    </script>
    <link href="css/vendors.bundle.css" rel="stylesheet" />
    <link href="css/style.bundle.css" rel="stylesheet" />
    <%--<link rel="shortcut icon" href="images/favicon.ico" />--%>

    <style type="text/css">
        img.logo_class {
    border-radius: 45px;
    margin-top: 2px;
}
    </style>
</head>
<body class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
    <!-- begin:: Page -->
    <div class="m-grid m-grid--hor m-grid--root m-page">
        <div class="m-grid__item m-grid__item--fluid m-grid m-grid--hor m-login m-login--signin m-login--2 m-login-2--skin-2" id="m_login" style="background-image: url(images/bg-3.jpg);">
            <div class="m-grid__item m-grid__item--fluid	m-login__wrapper">
                <div class="m-login__container">
                    <div class="m-login__logo">
                        <a href="#">
                            <%--<img src="images/logo-1.png">--%><img src="../images/logo.png" width="150" class="logo_class"  />
                        </a>
                    </div>
                    <div class="m-login__signin">
                        <div class="m-login__head">
                            <h3 class="m-login__title">Sign In To Admin
								</h3>
                        </div>
                        <form class="m-login__form m-form" runat="server">
                            <div class="form-group m-form__group">
                                <asp:TextBox ID="txt_userid" runat="server" class="form-control m-input" placeholder="User ID" autocomplete="off"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Required" ForeColor="Red" ControlToValidate="txt_userid"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group m-form__group">
                                <asp:TextBox ID="txt_password" runat="server" class="form-control m-input m-login__form-input--last" placeholder="Password" autocomplete="off" TextMode="Password"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Required" ForeColor="Red" ControlToValidate="txt_password"></asp:RequiredFieldValidator>
                            </div>
                            <div class="row m-login__form-sub">
                                <div class="col m--align-left m-login__form-left">
                                    <label class="m-checkbox  m-checkbox--focus">
                                        <input type="checkbox" name="remember">
                                        Remember me
                                        <span></span>
                                    </label>
                                </div>
                                <div class="col m--align-right m-login__form-right">
                                    <a href="javascript:;" id="m_login_forget_password1" class="m-link">Forget Password ?
										</a>
                                </div>
                            </div>
                            <div class="m-login__form-action">
                                <%--<button id="m_login_signin_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary">
                                    Sign In
								
                                </button>--%>
                                <asp:Button ID="btn_login" runat="server" Text="Sign In" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary" OnClick="btn_login_Click" />
                            </div>
                        </form>
                    </div>
                    <div class="m-login__signup">
                        <div class="m-login__head">
                            <h3 class="m-login__title">Sign Up
								</h3>
                            <div class="m-login__desc">
                                Enter your details to create your account:
							
                            </div>
                        </div>
                        <form class="m-login__form m-form" action="">
                            <div class="form-group m-form__group">
                                <input class="form-control m-input" type="text" placeholder="Fullname" name="fullname">
                            </div>
                            <div class="form-group m-form__group">
                                <input class="form-control m-input" type="text" placeholder="Email" name="email" autocomplete="off">
                            </div>
                            <div class="form-group m-form__group">
                                <input class="form-control m-input" type="password" placeholder="Password" name="password">
                            </div>
                            <div class="form-group m-form__group">
                                <input class="form-control m-input m-login__form-input--last" type="password" placeholder="Confirm Password" name="rpassword">
                            </div>
                            <div class="row form-group m-form__group m-login__form-sub">
                                <div class="col m--align-left">
                                    <label class="m-checkbox m-checkbox--focus">
                                        <input type="checkbox" name="agree">
                                        I Agree the
										
                                        <a href="#" class="m-link m-link--focus">terms and conditions
											</a>
                                        .
										
                                        <span></span>
                                    </label>
                                    <span class="m-form__help"></span>
                                </div>
                            </div>
                            <div class="m-login__form-action">
                                <button id="m_login_signup_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air  m-login__btn">
                                    Sign Up
								
                                </button>
                                &nbsp;&nbsp;
								
                                <button id="m_login_signup_cancel" class="btn btn-outline-focus m-btn m-btn--pill m-btn--custom  m-login__btn">
                                    Cancel
								
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="m-login__forget-password">
                        <div class="m-login__head">
                            <h3 class="m-login__title">Forgotten Password ?
								</h3>
                            <div class="m-login__desc">
                                Enter your email to reset your password:
							
                            </div>
                        </div>
                        <form class="m-login__form m-form" action="">
                            <div class="form-group m-form__group">
                                <input class="form-control m-input" type="text" placeholder="Email" name="email" id="m_email" autocomplete="off">
                            </div>
                            <div class="m-login__form-action">
                                <button id="m_login_forget_password_submit" class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air  m-login__btn m-login__btn--primaryr">
                                    Request
								
                                </button>
                                &nbsp;&nbsp;
								
                                <button id="m_login_forget_password_cancel" class="btn btn-outline-focus m-btn m-btn--pill m-btn--custom m-login__btn">
                                    Cancel
								
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="m-login__account">
                        <span class="m-login__account-msg">Don't have an account yet ?
							</span>
                        &nbsp;&nbsp;
						
                        <a href="javascript:;" id="m_login_signup1" class="m-link m-link--light m-login__account-link">Sign Up
							</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/vendors.bundle.js"></script>
    <script src="js/scripts.bundle.js"></script>
    <script src="js/login.js"></script>
</body>
</html>
