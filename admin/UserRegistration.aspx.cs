// smartadtube.com.admin.UserRegistration
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class UserRegistration : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected HtmlGenericControl div1;

	protected Label lbl_regid;

	protected RequiredFieldValidator RequiredFieldValidator1;

	protected TextBox txt_name;

	protected RequiredFieldValidator RequiredFieldValidator2;

	protected TextBox txt_mobilenumber;

	protected RequiredFieldValidator RequiredFieldValidator3;

	protected TextBox txt_emailid;

	protected TextBox txt_address;

	protected DropDownList ddl_planid;

	protected Button btn_submit;

	protected Button btn_clear;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			fillplan();
		}
	}

	public void fillplan()
	{
		dt = mycon.FillDataTable("select planname,planid from tbl_plan;");
		ddl_planid.DataTextField = "planname";
		ddl_planid.DataValueField = "planid";
		ddl_planid.DataSource = dt;
		ddl_planid.DataBind();
	}

	public void btn_submit_click(object sender, EventArgs e)
	{
		Random generator = new Random();
		string password = generator.Next(0, 999999).ToString("D6");
		dt = mycon.FillDataTable("select * from tbl_plan where planid=@0;", ddl_planid.SelectedValue.ToString());
		int planslot = Convert.ToInt32(dt.Rows[0]["slot"].ToString());
		dt = mycon.FillDataTable("insert into tbl_registration (name,password,number,emailid,address,planid,regdate) values(@0,@1,@2,@3,@4,@5,@6);SELECT @@Identity;", txt_name.Text, password, txt_mobilenumber.Text, txt_emailid.Text, txt_address.Text, ddl_planid.SelectedValue.ToString(), mycon.indianTime().ToString("yyyy-MM-dd HH:mm:ss"));
		string regid = dt.Rows[0][0].ToString();
		lbl_regid.Text = regid;
		div1.Visible = true;
		for (int i = 0; i < planslot; i++)
		{
			mycon.ExecuteNonQuery("insert into tbl_slots (slotnumber,regid) values(@0,@1)", (i + 1).ToString(), regid);
		}
		cleartext();
	}

	public void cleartext()
	{
		txt_name.Text = "";
		txt_mobilenumber.Text = "";
		txt_emailid.Text = "";
		txt_address.Text = "";
		ddl_planid.SelectedIndex = 0;
	}

	protected void btn_clear_Click(object sender, EventArgs e)
	{
		cleartext();
	}
}
