// smartadtube.com.masteradmin.workspace
using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class workspace : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected TextBox txt_regno;

	protected TextBox txt_name;

	protected TextBox txt_emailid;

	protected Button btn_search;

	protected HtmlGenericControl div1;

	protected GridView GridView1;

	protected HtmlGenericControl div2;

	protected Label lbl_regid;

	protected GridView grd_slot;

	protected GridView grd_payment;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void btn_search_Click(object sender, EventArgs e)
	{
		if (txt_name.Text != "" || txt_regno.Text != "" || txt_emailid.Text != "")
		{
			dt = mycon.FillDataTable("select *,(select planname from tbl_plan where planid=tbl_registration.planid) as pname from tbl_registration where regid like '%" + txt_regno.Text + "%' and name like '%" + txt_name.Text + "%' and emailid like '%" + txt_emailid.Text + "%'");
			GridView1.DataSource = dt;
			GridView1.DataBind();
			div1.Visible = true;
			div2.Visible = false;
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Please input at least one search field.');", addScriptTags: true);
		}
	}

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Label lbl_status = (Label)e.Row.FindControl("Label1");
			if (lbl_status.Text == "0")
			{
				lbl_status.Text = "Inactive";
				lbl_status.ForeColor = Color.Red;
			}
			else if (lbl_status.Text == "1")
			{
				lbl_status.Text = "Activated";
				lbl_status.ForeColor = Color.Green;
			}
		}
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "open")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label regid = (Label)GridView1.Rows[index].FindControl("Label2");
			lbl_regid.Text = regid.Text;
			dt = mycon.FillDataTable("select *,(select planname from tbl_plan where planid=tbl_registration.planid) as pname from tbl_registration where regid=@0", regid.Text);
			GridView1.DataSource = dt;
			GridView1.DataBind();
			dt = mycon.FillDataTable("select *,(select count(autoid) from tbl_taskdata where regid=tbl_slots.regid and slotno=tbl_slots.slotnumber and status='1') as totaltask from tbl_slots where regid=@0 order by slotnumber", regid.Text);
			grd_slot.DataSource = dt;
			grd_slot.DataBind();
			div2.Visible = true;
		}
	}

	protected void grd_slot_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Label lbl_status = (Label)e.Row.FindControl("Label1");
			if (lbl_status.Text == "0")
			{
				lbl_status.Text = "Inactive";
				lbl_status.ForeColor = Color.Red;
			}
			else if (lbl_status.Text == "1")
			{
				lbl_status.Text = "Activated";
				lbl_status.ForeColor = Color.Green;
			}
			else if (lbl_status.Text == "2")
			{
				lbl_status.Text = "Completed";
				lbl_status.ForeColor = Color.Orange;
			}
		}
	}
}
