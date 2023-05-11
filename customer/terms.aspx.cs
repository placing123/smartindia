// smartadtube.com.customer.terms
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class terms : Page
{
	private MyCon mycon = new MyCon();

	protected Button btn_terms;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void btn_terms_Click(object sender, EventArgs e)
	{
		mycon.ExecuteNonQuery("update tbl_registration set terms='1' where regid=@0", Session["user"].ToString());
		base.Response.Redirect("dashboard.aspx");
	}
}
