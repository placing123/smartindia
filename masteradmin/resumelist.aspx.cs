// smartadtube.com.masteradmin.resumelist
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class resumelist : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected Button btn_update;

	protected Label lbl_regid;

	protected Label lbl_slotno;

	protected Label lbl_amount;

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			if (Session["resumeregid"] != null && Session["resumeslotnumber"] != null)
			{
				lbl_regid.Text = Session["resumeregid"].ToString();
				lbl_slotno.Text = Session["resumeslotnumber"].ToString();
				filldata();
			}
			else
			{
				base.Response.Redirect("paymentapproval.aspx");
			}
		}
	}

	private void filldata()
	{
		dt = mycon.FillDataTable("select ROW_NUMBER() over (order by autoid) as srno1,* from tbl_taskdata where regid=@0 and slotno=@1 and status=1 and tasktype='resume' order by autoid", lbl_regid.Text, lbl_slotno.Text);
		GridView1.DataSource = dt;
		GridView1.DataBind();
		dt = mycon.FillDataTable("declare @slotnumber  varchar(50);\r\n                            declare @count int;\r\n                            declare @regid varchar(50);\r\n                            declare @rate varchar(50);\r\n                            set @regid = @0;\r\n                            set @slotnumber = @1;\r\n                            set @count = (select count(autoid) from tbl_taskdata where regid = @regid and status = '1' and slotno = @slotnumber);\r\n                            set @rate = (select rate from tbl_payout where payoutid = (select payoutid from tbl_plan where planid = (select planid from tbl_registration where regid = @regid)) and[from] <= @count and[to] >= @count);\r\n                            select @count as taskcount,@rate as rate;  ", lbl_regid.Text, lbl_slotno.Text);
		lbl_amount.Text = (Convert.ToDecimal(dt.Rows[0]["taskcount"].ToString()) * Convert.ToDecimal(dt.Rows[0]["rate"].ToString())).ToString("0.00");
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "resumecheck")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label autoid = (Label)GridView1.Rows[index].FindControl("Label1");
			Session["taskdataid"] = autoid.Text;
			base.Response.Redirect("resumecheck.aspx");
		}
	}

	protected void btn_update_Click(object sender, EventArgs e)
	{
		mycon.ExecuteNonQuery("update tbl_slots set  amount=@0 where regid=@1 and slotnumber=@2", lbl_amount.Text, lbl_regid.Text, lbl_slotno.Text);
		base.Response.Redirect("paymentapproval.aspx");
	}
}
