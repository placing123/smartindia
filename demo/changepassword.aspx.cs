// smartadtube.com.demo.changepassword
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class changepassword : Page
{
	private DataTable dt = new DataTable();

	protected RequiredFieldValidator RequiredFieldValidator1;

	protected TextBox txt_oldpassword;

	protected RequiredFieldValidator RequiredFieldValidator3;

	protected TextBox txt_newpassword;

	protected RequiredFieldValidator RequiredFieldValidator2;

	protected TextBox txt_confirmpassword;

	protected Button btn_submit;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	public void btn_submit_Click(object o, EventArgs e)
	{
		string oldpsw = txt_oldpassword.Text;
		string newpsw = txt_newpassword.Text;
		string confirmpsw = txt_confirmpassword.Text;
		if (newpsw == confirmpsw)
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Password Successfully Change...');", addScriptTags: true);
			txt_oldpassword.Text = "";
			txt_newpassword.Text = "";
			txt_confirmpassword.Text = "";
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('New And Confirm Password not Match...');", addScriptTags: true);
		}
	}
}
