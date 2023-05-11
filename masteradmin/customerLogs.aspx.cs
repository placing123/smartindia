// smartadtube.com.masteradmin.customerLogs
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class customerLogs : Page
{
	private MyCon myCon = new MyCon();

	private DataTable dt = new DataTable();

	protected TextBox txt_regid;

	protected Button btn_search;

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void btn_search_Click(object sender, EventArgs e)
	{
		if (txt_regid.Text != "")
		{
			dt = myCon.FillDataTable("select * from tbl_logs where regid=@0 order by id", txt_regid.Text);
			GridView1.DataSource = dt;
			GridView1.DataBind();
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Please enter Reg. ID');", addScriptTags: true);
		}
	}
}
