// smartadtube.com.customer.myprofile
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class myprofile : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected Label lbl_regid;

	protected RequiredFieldValidator RequiredFieldValidator1;

	protected TextBox txt_name;

	protected Label lbl_emailid;

	protected RequiredFieldValidator RequiredFieldValidator2;

	protected TextBox txt_address;

	protected Label lbl_regdate;

	protected Button btn_update;

	protected RequiredFieldValidator RequiredFieldValidator3;

	protected TextBox txt_acname;

	protected RequiredFieldValidator RequiredFieldValidator4;

	protected TextBox txt_acnumber;

	protected RequiredFieldValidator RequiredFieldValidator5;

	protected TextBox txt_ifsccode;

	protected Button btn_bankupdate;

	protected void Page_Load(object sender, EventArgs e)
	{
		try
		{
			if (!base.IsPostBack)
			{
				dt = mycon.FillDataTable("select * from tbl_registration where regid=@0", Session["user"].ToString());
				if (dt.Rows.Count > 0)
				{
					lbl_regid.Text = dt.Rows[0]["regid"].ToString();
					txt_name.Text = dt.Rows[0]["name"].ToString();
					lbl_emailid.Text = dt.Rows[0]["emailid"].ToString();
					txt_address.Text = dt.Rows[0]["address"].ToString();
					txt_acname.Text = dt.Rows[0]["acname"].ToString();
					txt_acnumber.Text = dt.Rows[0]["acnumber"].ToString();
					txt_ifsccode.Text = dt.Rows[0]["ifsccode"].ToString();
					lbl_regdate.Text = Convert.ToDateTime(dt.Rows[0]["regdate"].ToString()).ToString("dd-MM-yyyy");
				}
			}
		}
		catch (Exception)
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}

	public void btn_update_Click(object o, EventArgs e)
	{
		if (lbl_regid.Text != "")
		{
			mycon.ExecuteNonQuery("update tbl_registration set name=@0,address=@1 where regid=@2", txt_name.Text, txt_address.Text, lbl_regid.Text);
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Details Updated.');", addScriptTags: true);
		}
	}

	public void btn_bankupdate_click(object o, EventArgs e)
	{
		if (lbl_regid.Text != "")
		{
			mycon.ExecuteNonQuery("update tbl_registration set acname=@0,acnumber=@1,ifsccode=@2 where regid=@3", txt_acname.Text, txt_acnumber.Text, txt_ifsccode.Text, lbl_regid.Text);
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Bank details Updated.');", addScriptTags: true);
		}
	}
}
