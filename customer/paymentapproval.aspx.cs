// smartadtube.com.customer.paymentapproval
using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public class paymentapproval : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			try
			{
				dt = mycon.FillDataTable("select ROW_NUMBER() over (order by s.slotnumber) as srno, r.regid,s.slotnumber,r.name,r.number,r.emailid,s.amount,s.enddate,s.approval from tbl_registration r inner join tbl_slots s on s.regid=r.regid where s.approval is not null and s.regid=@0 order by s.slotnumber", Session["user"].ToString());
				GridView1.DataSource = dt;
				GridView1.DataBind();
			}
			catch
			{
			}
		}
	}

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Label lbl_status = (Label)e.Row.FindControl("Label1");
			if (lbl_status.Text == "True")
			{
				lbl_status.Text = "Approved";
				lbl_status.ForeColor = Color.Green;
			}
			else
			{
				lbl_status.Text = "Pending";
				lbl_status.ForeColor = Color.Orange;
			}
		}
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "details")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label slotnumner = (Label)GridView1.Rows[index].FindControl("Label2");
			Label status = (Label)GridView1.Rows[index].FindControl("Label1");
			if (status.Text == "Approved")
			{
				Session["slot"] = slotnumner.Text;
				base.Response.Redirect("reportdetails.aspx");
			}
			else
			{
				base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Details will be show after approval.');", addScriptTags: true);
			}
		}
	}
}
