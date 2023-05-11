// smartadtube.com.masteradmin.Payout
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class Payout : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected DropDownList ddl_payoutid;

	protected LinkButton btn_addstructure;

	protected GridView GridView1;

	protected Label lbl_payoutid;

	protected TextBox txt_from;

	protected TextBox txt_to;

	protected TextBox txt_rate;

	protected LinkButton lbtn_addrange;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			fillstructure();
		}
	}

	protected void btn_addstructure_Click(object sender, EventArgs e)
	{
		string countstring = mycon.ExecuteScalar("select count(distinct payoutid) from tbl_payout;");
		int count = Convert.ToInt32(countstring) + 1;
		mycon.ExecuteNonQuery("insert into tbl_payout (payoutid,[from],[to],rate) values(@0,@1,@2,@3)", "PSID" + count, "1", "100", "0.05");
		fillstructure();
	}

	public void fillstructure()
	{
		dt = mycon.FillDataTable("select distinct payoutid from tbl_payout with(nolock);");
		ddl_payoutid.DataTextField = "payoutid";
		ddl_payoutid.DataValueField = "payoutid";
		ddl_payoutid.DataSource = dt;
		ddl_payoutid.DataBind();
		fillgrid();
	}

	protected void ddl_payoutid_SelectedIndexChanged(object sender, EventArgs e)
	{
		fillgrid();
	}

	public void fillgrid()
	{
		dt = mycon.FillDataTable("select * from tbl_payout where payoutid=@0;", ddl_payoutid.Text);
		GridView1.DataSource = dt;
		GridView1.DataBind();
		lbl_payoutid.Text = ddl_payoutid.Text;
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "deletepayoutstructure")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label autoid = (Label)GridView1.Rows[index].FindControl("Label1");
			mycon.ExecuteNonQuery("delete from tbl_payout where autoid=@0", autoid.Text);
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Entry Deleted');", addScriptTags: true);
			fillgrid();
		}
	}

	protected void lbtn_addrange_Click(object sender, EventArgs e)
	{
		mycon.ExecuteNonQuery("insert into tbl_payout (payoutid,[from],[to],rate) values(@0,@1,@2,@3)", lbl_payoutid.Text, txt_from.Text, txt_to.Text, txt_rate.Text);
		lbl_payoutid.Text = "";
		txt_from.Text = "";
		txt_to.Text = "";
		txt_rate.Text = "";
		fillgrid();
	}
}
