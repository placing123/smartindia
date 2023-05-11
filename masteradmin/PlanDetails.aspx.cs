// smartadtube.com.masteradmin.PlanDetails
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class PlanDetails : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected TextBox txt_planname;

	protected TextBox txt_numberoftask;

	protected TextBox txt_totalslot;

	protected DropDownList ddl_strucruteid;

	protected TextBox txt_amount;

	protected TextBox txt_days;

	protected Button btn_submit;

	protected Button btn_clear;

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			fillstructureid();
			fillplan();
		}
	}

	public void fillstructureid()
	{
		dt = mycon.FillDataTable("select distinct payoutid from tbl_payout;");
		ddl_strucruteid.DataTextField = "payoutid";
		ddl_strucruteid.DataValueField = "payoutid";
		ddl_strucruteid.DataSource = dt;
		ddl_strucruteid.DataBind();
	}

	public void fillplan()
	{
		dt = mycon.FillDataTable("select * from tbl_plan;");
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}

	protected void btn_submitplan_Click(object sender, EventArgs e)
	{
		mycon.ExecuteNonQuery("insert into tbl_plan (planname,tasknumbers,slot,payoutid,amount,days) values(@0,@1,@2,@3,@4,@5)", txt_planname.Text, txt_numberoftask.Text, txt_totalslot.Text, ddl_strucruteid.Text, txt_amount.Text, txt_days.Text);
		txt_planname.Text = "";
		txt_numberoftask.Text = "";
		txt_totalslot.Text = "";
		ddl_strucruteid.SelectedIndex = 0;
		txt_amount.Text = "";
		txt_days.Text = "";
		fillplan();
	}
}
