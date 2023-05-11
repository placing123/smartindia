// smartadtube.com.session
using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class session : Page
{
	private MyCon mycon = new MyCon();

	protected HtmlForm form1;

	protected Button btn_clear;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void btn_clear_click(object sender, EventArgs e)
	{
		if (Session["user"] != null)
		{
			mycon.ExecuteNonQuery("update tbl_registration set logincode=@0 where regid=@1", "", Session["user"].ToString());
		}
		Session.Clear();
		base.Response.Redirect("default.aspx");
	}
}
