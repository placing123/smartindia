// smartadtube.com.demo.Site1
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Site1 : MasterPage
{
	protected Label lbl_type;

	protected Label lbl_user;

	protected Label lbl_logincode;

	protected Label lbl_username;

	protected Button btn_logout;

	protected ContentPlaceHolder ContentPlaceHolder1;

	protected void Page_Load(object sender, EventArgs e)
	{
		lbl_username.Text = "demo";
	}

	protected void btn_logout_click(object sender, EventArgs e)
	{
		base.Session.Clear();
		base.Response.Redirect("~/Default.aspx");
	}
}
