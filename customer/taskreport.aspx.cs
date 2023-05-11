// smartadtube.com.customer.taskreport
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class taskreport : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected GridView GridView1;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			try
			{
				dt = mycon.FillDataTable("select regid,slotnumber,\r\n                            (select count(autoid) from tbl_taskdata where regid = tbl_slots.regid and slotno = tbl_slots.slotnumber and status = '1' and tasktype = 'resume') as resumes,\r\n                            (select count(autoid) from tbl_taskdata where regid = tbl_slots.regid and slotno = tbl_slots.slotnumber and status = '1' and tasktype = 'video') as videos\r\n                            from tbl_slots where regid = @0 order by slotnumber", Session["user"].ToString());
				GridView1.DataSource = dt;
				GridView1.DataBind();
			}
			catch
			{
			}
		}
	}
}
