// smartadtube.com.customer.Paymentrequest
using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Paymentrequest : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected RequiredFieldValidator RequiredFieldValidator3;

	protected TextBox txt_reqamount;

	protected Button btn_request;

	protected GridView GridView1;

	protected Label lbl_totalpayment;

	protected void Page_Load(object sender, EventArgs e)
	{
		try
		{
			if (!base.IsPostBack)
			{
				filllable();
				fillgrid();
			}
		}
		catch (Exception)
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}

	public void filllable()
	{
		dt = mycon.FillDataTable("select pbalance from tbl_registration where regid=@0", Session["user"].ToString());
		lbl_totalpayment.Text = dt.Rows[0]["pbalance"].ToString();
	}

	protected void btn_request_Click(object sender, EventArgs e)
	{
		try
		{
			filllable();
			decimal pbalance = Convert.ToDecimal(lbl_totalpayment.Text);
			decimal reqamount = Convert.ToDecimal(txt_reqamount.Text);
			if (reqamount >= 2000m)
			{
				if (reqamount <= pbalance)
				{
					mycon.ExecuteNonQuery("insert into tbl_paymentreq (regid,amount,reqdatetime) values(@0,@1,@2);update tbl_registration set pbalance=pbalance-@1 where regid=@0", Session["user"].ToString(), reqamount.ToString(), mycon.indianTime().ToString("yyyy-MM-dd hh:mm:ss tt"));
					txt_reqamount.Text = "";
					fillgrid();
					filllable();
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
		catch (Exception)
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}

	public void fillgrid()
	{
		dt = mycon.FillDataTable("select ROW_NUMBER() over (order by reqdatetime) as srno,* from tbl_paymentreq where regid=@0 order by reqdatetime", Session["user"].ToString());
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Label lbl_status = (Label)e.Row.FindControl("Label1");
			if (lbl_status.Text == "0")
			{
				lbl_status.Text = "Pending";
				lbl_status.ForeColor = Color.Orange;
			}
			else if (lbl_status.Text == "1")
			{
				lbl_status.Text = "Complete";
				lbl_status.ForeColor = Color.Green;
			}
		}
	}
}
