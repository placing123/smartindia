// smartadtube.com.demo.AdminPanel
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class AdminPanel : Page
{
	protected Label lbl_enddate;

	protected void Page_Load(object sender, EventArgs e)
	{
		lbl_enddate.Text = DateTime.Now.AddDays(5.0).ToString("dd-MM-yyyy");
	}
}
