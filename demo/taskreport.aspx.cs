// smartadtube.com.demo.taskreport
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class taskreport : Page
{
	private DataTable dt = new DataTable();

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			try
			{
				dt.Columns.Add("regid");
				dt.Columns.Add("slotnumber");
				dt.Columns.Add("resumes");
				dt.Columns.Add("videos");
				dt.Rows.Add("demo", "1", "2218", "2314");
				GridView1.DataSource = dt;
				GridView1.DataBind();
			}
			catch
			{
			}
		}
	}
}
