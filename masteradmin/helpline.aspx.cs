// smartadtube.com.masteradmin.helpline
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class helpline : Page
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
		dt = mycon.FillDataTable("select ROW_NUMBER() over (order by autoid ) as srno, autoid,taskdataid,fieldname,updatetime from tbl_help where status='0' order by autoid ");
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "openresume")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label autoid = (Label)GridView1.Rows[index].FindControl("Label1");
			Session["helplineautoid"] = autoid.Text;
			base.Response.Redirect("helplineedit.aspx");
		}
	}
}
