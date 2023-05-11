// smartadtube.com.Login
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class Login : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private Random random = new Random();

	protected HtmlForm form1;

	protected RequiredFieldValidator RequiredFieldValidator1;

	protected TextBox txt_regid;

	protected RequiredFieldValidator RequiredFieldValidator2;

	protected TextBox txt_password;

	protected Button btn_login;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	public void btn_login_click(object o, EventArgs e)
	{
		if (txt_regid.Text == "demo" && txt_password.Text == "demo")
		{
			base.Response.Redirect("demo/dashboard.aspx");
		}
		try
		{
			int id = Convert.ToInt32(txt_regid.Text);
		}
		catch (Exception)
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Invalid Userid');", addScriptTags: true);
			return;
		}
		dt = mycon.FillDataTable("select regid,status from tbl_registration where regid=@0 and password=@1", txt_regid.Text, txt_password.Text);
		if (dt.Rows.Count == 1)
		{
			if (dt.Rows[0]["status"].ToString() == "0")
			{
				base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Your id is not currently active.');", addScriptTags: true);
			}
			else if (dt.Rows[0]["status"].ToString() == "1")
			{
				string logincode = random.Next(10000000, 99999999).ToString();
				Session["user"] = dt.Rows[0]["regid"].ToString();
				Session["logincode"] = logincode;
				Session["type"] = "customer";
				mycon.ExecuteNonQuery("update tbl_registration set logincode=@0 where regid=@1;insert into tbl_logs (regid,data) values(@1,@2)", logincode, dt.Rows[0]["regid"].ToString(), "-- Login -- " + mycon.getIpAddress() + " -- " + mycon.indianTime());
				base.Response.Redirect("customer/dashboard.aspx");
			}
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('ID and password do not match.');", addScriptTags: true);
		}
	}
}
