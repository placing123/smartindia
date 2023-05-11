// smartadtube.com.admin.Default
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
		if (txt_userid.Text == "user1" && txt_password.Text == "123")
		{
			Session["user"] = txt_userid.Text;
			Session["type"] = "admin";
			base.Response.Redirect("AdminPanel.aspx");
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Login Failed!!! Try again.');", addScriptTags: true);
		}
	}
}
