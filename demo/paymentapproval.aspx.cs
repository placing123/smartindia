// smartadtube.com.demo.paymentapproval
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class paymentapproval : Page
{
	private DataTable dt = new DataTable();

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			dt.Columns.Add("srno");
			dt.Columns.Add("regid");
			dt.Columns.Add("slotnumber");
			dt.Columns.Add("name");
			dt.Columns.Add("number");
			dt.Columns.Add("emailid");
			dt.Columns.Add("amount");
			dt.Columns.Add("enddate");
			dt.Columns.Add("approval");
			dt.Rows.Add("1", "demo", "1", "demo", "1234567890", "demo@smartadtube.com", "4756", DateTime.Now.AddDays(-15.0).ToString(), "Approved");
			GridView1.DataSource = dt;
			GridView1.DataBind();
		}
	}
}
