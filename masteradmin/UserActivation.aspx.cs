// smartadtube.com.masteradmin.UserActivation
using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class UserActivation : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected TextBox txt_regno;

	protected Button btn_search;

	protected GridView GridView1;

	protected HtmlGenericControl div1;

	protected Label lbl_days;

	protected Label lbl_regid;

	protected Label lbl_name;

	protected Label lbl_emailid;

	protected Label lbl_password;

	protected DropDownList ddl_slot;

	protected Label lbl_status;

	protected Button btn_active;

	protected void Page_Load(object sender, EventArgs e)
	{
	}

	protected void btn_search_Click(object sender, EventArgs e)
	{
		dt = mycon.FillDataTable("select regid,name,number,emailid,password,(select days from tbl_plan where planid=tbl_registration.planid) as days from tbl_registration where regid=@0", txt_regno.Text);
		GridView1.DataSource = dt;
		GridView1.DataBind();
		div1.Visible = false;
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (!(e.CommandName == "open"))
		{
			return;
		}
		int index = Convert.ToInt32(e.CommandArgument);
		Label regid = (Label)GridView1.Rows[index].FindControl("Label1");
		Label name = (Label)GridView1.Rows[index].FindControl("Label2");
		Label days = (Label)GridView1.Rows[index].FindControl("Label3");
		Label emailid = (Label)GridView1.Rows[index].FindControl("Label4");
		Label password = (Label)GridView1.Rows[index].FindControl("Label5");
		lbl_regid.Text = regid.Text;
		lbl_name.Text = name.Text;
		lbl_days.Text = days.Text;
		lbl_emailid.Text = emailid.Text;
		lbl_password.Text = password.Text;
		dt = mycon.FillDataTable("select slotnumber,status,slotid from tbl_slots where regid=@0 order by slotnumber", regid.Text);
		div1.Visible = true;
		ddl_slot.DataTextField = "slotnumber";
		ddl_slot.DataValueField = "slotid";
		ddl_slot.DataSource = dt;
		ddl_slot.DataBind();
		if (dt.Rows.Count > 0)
		{
			if (dt.Rows[0]["status"].ToString() == "0")
			{
				lbl_status.Text = "Not Active";
				lbl_status.ForeColor = Color.Purple;
			}
			else if (dt.Rows[0]["status"].ToString() == "1")
			{
				lbl_status.Text = "Active";
				lbl_status.ForeColor = Color.Green;
			}
			else if (dt.Rows[0]["status"].ToString() == "2")
			{
				lbl_status.Text = "Completed";
				lbl_status.ForeColor = Color.Orange;
			}
			else
			{
				lbl_status.Text = dt.Rows[0]["status"].ToString();
				lbl_status.ForeColor = Color.Black;
			}
		}
	}

	protected void ddl_slot_SelectedIndexChanged(object sender, EventArgs e)
	{
		lbl_status.Text = mycon.ExecuteScalar("select status from tbl_slots where regid=@0 and slotnumber=@1", lbl_regid.Text, ddl_slot.SelectedItem.ToString());
		if (lbl_status.Text == "0")
		{
			lbl_status.Text = "Not Active";
			lbl_status.ForeColor = Color.Purple;
		}
		else if (lbl_status.Text == "1")
		{
			lbl_status.Text = "Active";
			lbl_status.ForeColor = Color.Green;
		}
		else if (lbl_status.Text == "2")
		{
			lbl_status.Text = "Completed";
			lbl_status.ForeColor = Color.Orange;
		}
		else
		{
			lbl_status.ForeColor = Color.Black;
		}
	}

	public void btn_active_click(object sender, EventArgs e)
	{
		if (lbl_status.Text == "Not Active")
		{
			StreamReader fp = File.OpenText(base.Server.MapPath("~/masteradmin/mail/") + "workload.html");
			string htmlstring = fp.ReadToEnd();
			fp.Close();
			htmlstring = htmlstring.Replace("X-regid", lbl_regid.Text);
			htmlstring = htmlstring.Replace("X-password", lbl_password.Text);
			mycon.send(lbl_emailid.Text, "Workload (Smart Ad Tube) Slot " + ddl_slot.SelectedItem.ToString(), htmlstring);
			mycon.ExecuteNonQuery("update tbl_slots set status=1,startdate=@0,enddate=@1 where slotid=@2;update tbl_registration set status=1 where regid=@3", mycon.indianTime().AddDays(1.0).ToString("yyyy-MM-dd HH:mm:ss"), mycon.indianTime().AddDays(Convert.ToInt32(lbl_days.Text)).ToString("yyyy-MM-dd"), ddl_slot.Text, lbl_regid.Text);
			lbl_status.Text = "Active";
			lbl_status.ForeColor = Color.Green;
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Slot is Already Active');", addScriptTags: true);
		}
	}
}
