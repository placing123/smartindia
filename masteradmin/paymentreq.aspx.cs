// smartadtube.com.masteradmin.paymentreq
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class paymentreq : Page
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

	public void filldata()
	{
		dt = mycon.FillDataTable("select ROW_NUMBER() over (order by p.reqdatetime) as srno, p.autoid,p.regid,p.amount,p.reqdatetime,r.name,r.number,r.emailid,r.acname,r.acnumber,r.ifsccode from tbl_paymentreq p inner join tbl_registration r on r.regid=p.regid where p.status='0'");
		GridView1.DataSource = dt;
		GridView1.DataBind();
	}

	protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName == "paymentdone")
		{
			int index = Convert.ToInt32(e.CommandArgument);
			Label autoid = (Label)GridView1.Rows[index].FindControl("Label1");
			TextBox txt_refno = (TextBox)GridView1.Rows[index].FindControl("txt_refno");
			mycon.ExecuteNonQuery("update tbl_paymentreq set refno=@0,status=1 where autoid=@1", txt_refno.Text, autoid.Text);
			filldata();
		}
	}
}
