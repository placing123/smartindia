// smartadtube.com.demo.myprofile
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class myprofile : Page
{
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
		if (!base.IsPostBack)
		{
			lbl_regid.Text = "demo";
			txt_name.Text = "demo";
			lbl_emailid.Text = "demo@smartadtube.com";
			txt_address.Text = "demo";
			txt_acname.Text = "demo";
			txt_acnumber.Text = "123456";
			txt_ifsccode.Text = "demo1234";
			lbl_regdate.Text = DateTime.Now.AddDays(-25.0).ToString();
		}
	}

	public void btn_update_Click(object o, EventArgs e)
	{
		base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Details Updated.');", addScriptTags: true);
	}

	public void btn_bankupdate_click(object o, EventArgs e)
	{
		base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Bank details Updated.');", addScriptTags: true);
	}
}
