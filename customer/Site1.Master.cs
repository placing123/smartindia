// smartadtube.com.customer.Site1
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Site1 : MasterPage
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected Label lbl_type;

	protected Label lbl_user;

	protected Label lbl_logincode;

	protected Label lbl_username;

	protected Button btn_logout;

	protected ContentPlaceHolder ContentPlaceHolder1;

	protected void Page_Load(object sender, EventArgs e)
	{
		string logincode2 = "";
		if (base.Session["user"] != null)
		{
			lbl_user.Text = base.Session["user"].ToString();
			lbl_type.Text = base.Session["type"].ToString();
			lbl_logincode.Text = base.Session["logincode"].ToString();
		}
		else
		{
			base.Response.Redirect("~/Default.aspx");
		}
		if (base.Session["type"].ToString() != "customer")
		{
			base.Response.Redirect("~/Default.aspx");
		}
		dt = mycon.FillDataTable("select name from tbl_registration where regid=@0", lbl_user.Text);
		lbl_username.Text = dt.Rows[0]["name"].ToString();
		dt = mycon.FillDataTable("select logincode from tbl_registration where regid=@0", lbl_user.Text);
		logincode2 = dt.Rows[0]["logincode"].ToString();
		if (logincode2 != lbl_logincode.Text)
		{
			base.Response.Redirect("~/session.aspx");
		}
	}

	protected void btn_logout_click(object sender, EventArgs e)
	{
		mycon.ExecuteNonQuery("insert into tbl_logs (regid,data) values(@0,@1)", lbl_user.Text, "-- Logout -- " + mycon.getIpAddress() + " -- " + mycon.indianTime());
		base.Session.Clear();
		base.Response.Redirect("~/Default.aspx");
	}
}
