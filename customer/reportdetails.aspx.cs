// smartadtube.com.customer.reportdetails
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class reportdetails : Page
{
	private MyCon myCon = new MyCon();

	private DataTable dt = new DataTable();

	protected Label lbl_regid;

	protected Label lbl_slotno;

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["user"] != null)
		{
			if (!base.IsPostBack)
			{
				lbl_slotno.Text = Session["slot"].ToString();
				lbl_regid.Text = Session["user"].ToString();
				filldata();
			}
		}
		else
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}

	private void filldata()
	{
		dt = myCon.FillDataTable("select ROW_NUMBER() over (order by autoid) as srno1,autoid,regid,slotno,srno from tbl_taskdata where regid=@0 and status=2 and slotno=@1 order by autoid", lbl_regid.Text, lbl_slotno.Text);
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "openresume")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label autoid = (Label)GridView1.Rows[index].FindControl("Label1");
			Session["taskdataid"] = autoid.Text;
			base.Response.Redirect("resumereport.aspx");
		}
	}
}
