// smartadtube.com.demo.queryresult
using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class queryresult : Page
{
	private DataTable dt = new DataTable();

	protected HtmlGenericControl div1;

	protected Label lbl_regid;

	protected Label lbl_taskdataid;

	protected DropDownList ddl_field;

	protected Button btn_request;

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			dt.Columns.Add("srno");
			dt.Columns.Add("taskdataid");
			dt.Columns.Add("fieldname");
			dt.Columns.Add("fieldvalue");
			dt.Columns.Add("updatetime");
			dt.Columns.Add("status");
			dt.Rows.Add("1", "demo", "Land Mark", "", DateTime.Now.AddDays(-1.0).ToString("dd-MM-yyyy"), "False");
			dt.Rows.Add("2", "demo", "Diploma Degree", "Diploma in IT", DateTime.Now.AddDays(-2.0).ToString("dd-MM-yyyy"), "True");
			GridView1.DataSource = dt;
			GridView1.DataBind();
		}
	}

	protected void btn_request_Click(object sender, EventArgs e)
	{
		base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Query Submitted');", addScriptTags: true);
	}

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Label lbl_status = (Label)e.Row.FindControl("Label1");
			if (lbl_status.Text == "False")
			{
				lbl_status.Text = "Pending";
				lbl_status.ForeColor = Color.Orange;
			}
			else if (lbl_status.Text == "True")
			{
				lbl_status.Text = "Complete";
				lbl_status.ForeColor = Color.Green;
			}
		}
	}
}
