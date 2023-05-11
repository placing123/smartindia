// smartadtube.com.customer.AdminPanel
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class AdminPanel : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private DataSet ds = new DataSet();

	protected Label lbl_type;

	protected Label lbl_user;

	protected Label lbl_logincode;

	protected Label lbl_totaltask;

	protected Label lbl_slot;

	protected Label lbl_tbalance;

	protected Label lbl_enddate;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["user"] != null)
		{
			if (!base.IsPostBack)
			{
				string userid = Session["user"].ToString();
				dt = mycon.FillDataTable("declare @slotnumber  varchar(50);\r\n                            declare @count int;\r\n                            declare @regid varchar(50);\r\n                            declare @enddate datetime;\r\n                            declare @rate varchar(50);\r\n                            set @regid = @0;\r\n                            set @slotnumber = (select max(slotnumber) from tbl_slots where regid = @regid and status!= '0')\r\n                            set @count = (select count(autoid) from tbl_taskdata where regid = @regid and status = '1' and slotno = @slotnumber);\r\n                            set @enddate = (select enddate from tbl_slots where regid = @regid and slotnumber = @slotnumber)\r\n                            set @rate = (select rate from tbl_payout where payoutid = (select payoutid from tbl_plan where planid = (select planid from tbl_registration where regid = @regid)) and[from] <= @count and[to] >= @count);\r\n                            select @slotnumber as slot,@count as taskcount,@enddate as enddate,@rate as rate; ", userid);
				lbl_totaltask.Text = dt.Rows[0]["taskcount"].ToString();
				lbl_slot.Text = dt.Rows[0]["slot"].ToString();
				lbl_enddate.Text = Convert.ToDateTime(dt.Rows[0]["enddate"].ToString()).ToString("dd-MM-yyyy");
				string rate = dt.Rows[0]["rate"].ToString();
				if (rate == "")
				{
					rate = "0";
				}
				lbl_tbalance.Text = (Convert.ToDecimal(lbl_totaltask.Text) * Convert.ToDecimal(rate)).ToString("0.00");
				dt = mycon.FillDataTable("select terms from tbl_registration where regid=@0", userid);
				if (dt.Rows[0]["terms"].ToString() != "True")
				{
					base.Response.Redirect("terms.aspx");
				}
			}
		}
		else
		{
			base.Response.Redirect("~/Default.aspx");
		}
	}
}
