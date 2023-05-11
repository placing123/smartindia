// smartadtube.com.customer.querytask
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class querytask : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected Label lbl_regid;

	protected Button btn_allquery;

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			try
			{
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
		dt = mycon.FillDataTable("select ROW_NUMBER() over (order by autoid desc) as srnumber,autoid,regid,slotno,srno,updatetime from tbl_taskdata where regid=@0 and query='1' order by autoid desc ", lbl_regid.Text);
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "newquery")
		{
			int index2 = Convert.ToInt32(e.CommandArgument);
			Label taskdataid2 = (Label)GridView1.Rows[index2].FindControl("Label1");
			Session["taskdataid"] = taskdataid2.Text;
			base.Response.Redirect("queryresult.aspx");
		}
		else if (e.CommandName == "edittask")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label taskdataid = (Label)GridView1.Rows[index].FindControl("Label1");
			Session["taskdataid"] = taskdataid.Text;
			base.Response.Redirect("resumetaskedit.aspx");
		}
	}

	protected void btn_allquery_Click(object sender, EventArgs e)
	{
		Session["taskdataid"] = null;
		base.Response.Redirect("queryresult.aspx");
	}
}
