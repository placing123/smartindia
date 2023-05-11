// smartadtube.com.customer.changepassword
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class changepassword : Page
{
	private MyCon mycon = new MyCon();

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
		try
		{
			string oldpsw = txt_oldpassword.Text;
			string newpsw = txt_newpassword.Text;
			string confirmpsw = txt_confirmpassword.Text;
			string user = Session["user"].ToString();
			if (newpsw == confirmpsw)
			{
				dt = mycon.FillDataTable("select regid from tbl_registration where regid=@0 and password=@1", user, oldpsw);
				if (dt.Rows.Count == 1)
				{
					mycon.ExecuteNonQuery("update tbl_registration set password=@0 where regid=@1", newpsw, user);
					base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Password Successfully Change...');", addScriptTags: true);
					txt_oldpassword.Text = "";
					txt_newpassword.Text = "";
					txt_confirmpassword.Text = "";
				}
				else
				{
					base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Old Password is wrong...');", addScriptTags: true);
				}
			}
			else
			{
				base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('New And Confirm Password not Match...');", addScriptTags: true);
			}
		}
		catch (Exception)
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}
}
