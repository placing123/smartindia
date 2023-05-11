// smartadtube.com.customer.queryresult
using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class queryresult : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected HtmlGenericControl div1;

	protected Label lbl_regid;

	protected Label lbl_taskdataid;

	protected DropDownList ddl_field;

	protected Button btn_request;

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			try
			{
				if (Session["taskdataid"] != null)
				{
					lbl_taskdataid.Text = Session["taskdataid"].ToString();
					div1.Visible = true;
				}
				else
				{
					div1.Visible = false;
				}
				lbl_regid.Text = Session["user"].ToString();
				filldata();
			}
			catch
			{
			}
		}
	}

	private void filldata()
	{
		dt = mycon.FillDataTable("select top 100 ROW_NUMBER() over (order by h.updatetime desc) as srno, h.* from tbl_help h inner join tbl_taskdata t on t.autoid=h.taskdataid where t.regid=@0 order by h.updatetime desc", lbl_regid.Text);
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}

	protected void btn_request_Click(object sender, EventArgs e)
	{
		string count = mycon.ExecuteScalar("select count(h.autoid) from tbl_help h inner join tbl_taskdata t on t.autoid=h.taskdataid where t.regid=@0 and cast( h.updatetime as Date)= cast(@1 as date)", lbl_regid.Text, mycon.indianTime().ToString("yyyy-MM-dd"));
		if (Convert.ToInt32(count) < 10)
		{
			mycon.ExecuteNonQuery("insert into tbl_help (taskdataid,fieldname,updatetime) values(@0,@1,@2)", lbl_taskdataid.Text, ddl_field.Text, mycon.indianTime().ToString("yyyy-MM-dd hh:mm:ss tt"));
			filldata();
			lbl_taskdataid.Text = "";
			Session["taskdataid"] = null;
			div1.Visible = false;
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Query Submitted');", addScriptTags: true);
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Query limit is over.');", addScriptTags: true);
		}
	}

	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.DataRow)
		{
			Label lbl_status = (Label)e.Row.FindControl("Label1");
			if (lbl_status.Text == "False")
			{
				lbl_status.Text = "Pending";
				lbl_status.ForeColor = Color.Orange;
			}
			else if (lbl_status.Text == "True")
			{
				lbl_status.Text = "Complete";
				lbl_status.ForeColor = Color.Green;
			}
		}
	}
}
