// smartadtube.com.masteradmin.paymentapproval
using System;
using System.Data;
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
			filldata();
		}
	}

	private void filldata()
	{
		dt = mycon.FillDataTable("select ROW_NUMBER() over (order by s.enddate) as srno, r.regid,r.name,r.number,r.emailid,s.amount,s.enddate,s.slotid,s.slotnumber from tbl_registration r inner join tbl_slots s on s.regid=r.regid where s.approval='0' order by s.enddate");
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "approved")
		{
			int index2 = Convert.ToInt32(e.CommandArgument);
			Label slotid = (Label)GridView1.Rows[index2].FindControl("Label1");
			Label regid2 = (Label)GridView1.Rows[index2].FindControl("Label2");
			Label amount = (Label)GridView1.Rows[index2].FindControl("Label3");
			mycon.ExecuteNonQuery("update tbl_registration set pbalance=pbalance+@0 where regid=@1;update tbl_slots set approval='1' where slotid=@2", amount.Text, regid2.Text, slotid.Text);
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Payment Approved');", addScriptTags: true);
			filldata();
		}
		if (e.CommandName == "editresume")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label slotnumber = (Label)GridView1.Rows[index].FindControl("Label4");
			Label regid = (Label)GridView1.Rows[index].FindControl("Label2");
			Session["resumeregid"] = regid.Text;
			Session["resumeslotnumber"] = slotnumber.Text;
			base.Response.Redirect("resumelist.aspx");
		}
	}
}
