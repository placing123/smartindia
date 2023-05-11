// smartadtube.com.demo.Paymentrequest
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Paymentrequest : Page
{
	private DataTable dt = new DataTable();

	protected RequiredFieldValidator RequiredFieldValidator3;

	protected TextBox txt_reqamount;

	protected Button btn_request;

	protected GridView GridView1;

	protected Label lbl_totalpayment;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			dt.Columns.Add("srno");
			dt.Columns.Add("regid");
			dt.Columns.Add("amount");
			dt.Columns.Add("reqdatetime");
			dt.Columns.Add("refno");
			dt.Columns.Add("status");
			dt.Rows.Add("1", "demo", "4756", DateTime.Now.AddDays(-15.0).ToString(), "NHKHBK65867", "Complete");
			GridView1.DataSource = dt;
			GridView1.DataBind();
		}
	}

	protected void btn_request_Click(object sender, EventArgs e)
	{
		decimal pbalance = Convert.ToDecimal(lbl_totalpayment.Text);
		decimal reqamount = Convert.ToDecimal(txt_reqamount.Text);
		if (reqamount >= 2000m)
		{
			if (reqamount <= pbalance)
			{
				txt_reqamount.Text = "";
				base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Request Accepted successfully.');", addScriptTags: true);
			}
			else
			{
				base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Not have enough Balance.');", addScriptTags: true);
			}
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Below RS.2000 amount can not be proceed.');", addScriptTags: true);
		}
	}
}
