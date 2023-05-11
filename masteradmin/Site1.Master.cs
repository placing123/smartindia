// smartadtube.com.masteradmin.Site1
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Site1 : MasterPage
{
	protected Label lbl_type;

	protected Label lbl_user;

	protected Button btn_logout;

	protected ContentPlaceHolder ContentPlaceHolder1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (base.IsPostBack)
		{
			return;
		}
		if (base.Session["user"] == null && lbl_user.Text == "")
		{
			base.Response.Redirect("Default.aspx");
			return;
		}
		if (lbl_user.Text == "" && base.Session["user"] != null)
		{
			lbl_user.Text = base.Session["user"].ToString();
			lbl_type.Text = base.Session["type"].ToString();
			base.Session["user"] = lbl_user.Text;
			base.Session["type"] = lbl_type.Text;
		}
		else
		{
			base.Session.RemoveAll();
			base.Session["user"] = lbl_user.Text;
			base.Session["type"] = lbl_type.Text;
		}
		if (base.Session["type"].ToString() != "master")
		{
			base.Response.Redirect("Default.aspx");
		}
	}

	public void btn_logout_click(object sender, EventArgs e)
	{
		base.Session.Clear();
		base.Response.Redirect("Default.aspx");
	}
}
