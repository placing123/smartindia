// smartadtube.com.demo.querytask
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class querytask : Page
{
	private DataTable dt = new DataTable();

	protected Label lbl_regid;

	protected Button btn_allquery;

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			dt.Columns.Add("srnumber");
			dt.Columns.Add("autoid");
			dt.Columns.Add("regid");
			dt.Columns.Add("slotno");
			dt.Columns.Add("srno");
			dt.Columns.Add("updatetime");
			dt.Rows.Add("1", "demo", "demo", "1", "9", DateTime.Now.ToString("dd-MM-yyyy"));
			dt.Rows.Add("2", "demo", "demo", "1", "6", DateTime.Now.AddDays(-1.0).ToString("dd-MM-yyyy"));
			GridView1.DataSource = dt;
			GridView1.DataBind();
		}
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "newquery")
		{
			base.Response.Redirect("queryresult.aspx");
		}
		else if (e.CommandName == "edittask")
		{
			base.Response.Redirect("resumetask.aspx");
		}
	}

	protected void btn_allquery_Click(object sender, EventArgs e)
	{
		base.Response.Redirect("queryresult.aspx");
	}
}
