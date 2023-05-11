// smartadtube.com.masteradmin.helplineedit
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class helplineedit : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private DataSet ds = new DataSet();

	protected Label lbl_helplineautoid;

	protected Literal ltEmbed;

	protected Label lbl_fieldname;

	protected RequiredFieldValidator RequiredFieldValidator1;

	protected TextBox txt_fieldvalue;

	protected Button btn_submit;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			if (Session["helplineautoid"] != null)
			{
				lbl_helplineautoid.Text = Session["helplineautoid"].ToString();
				filldata();
			}
			else
			{
				base.Response.Redirect("adminpanel.aspx");
			}
		}
	}

	private void filldata()
	{
		ds = mycon.FillDataset("select taskid from tbl_taskdata where autoid =(select taskdataid from tbl_help where autoid=@0);select fieldname from tbl_help where autoid=@0", lbl_helplineautoid.Text);
		string resumeid = ds.Tables[0].Rows[0]["taskid"].ToString();
		string embed4 = "<object data=\"{0}\" type=\"application/pdf\" width=\"100%\" height=\"640px\">";
		embed4 += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
		embed4 += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
		embed4 += "</object>";
		ltEmbed.Text = string.Format(embed4, ResolveUrl("~/pdfresume/" + resumeid + ".pdf"));
		lbl_fieldname.Text = ds.Tables[1].Rows[0]["fieldname"].ToString();
	}

	protected void btn_submit_click(object sender, EventArgs e)
	{
		mycon.ExecuteNonQuery("update tbl_help set fieldvalue=@0,status='1' where autoid=@1", txt_fieldvalue.Text, lbl_helplineautoid.Text);
		Session["helplineautoid"] = null;
		base.Response.Redirect("helpline.aspx");
	}
}
