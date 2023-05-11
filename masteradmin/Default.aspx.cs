// smartadtube.com.masteradmin.Default
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Default : Page
{
	protected TextBox txt_userid;

	protected RequiredFieldValidator RequiredFieldValidator1;

	protected TextBox txt_password;

	protected RequiredFieldValidator RequiredFieldValidator2;

	protected Button btn_login;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void btn_login_Click(object sender, EventArgs e)
	{
		if (txt_userid.Text == "admin" && txt_password.Text == "master")
		{
			Session["user"] = txt_userid.Text;
			Session["type"] = "master";
			base.Response.Redirect("AdminPanel.aspx");
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Login Failed!!! Try again.');", addScriptTags: true);
		}
	}
}
