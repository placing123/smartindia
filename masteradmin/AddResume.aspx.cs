// smartadtube.com.masteradmin.AddResume
using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class AddResume : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected Label lbl_totalresume;

	protected FileUpload FileUpload1;

	protected RegularExpressionValidator RegularExpressionValidator2;

	protected Button btn_add;

	protected Button btn_clear;

	protected HtmlGenericControl div1;

	protected Literal ltEmbed;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			string count = mycon.ExecuteScalar("select count(autoid) from tbl_resume with(nolock)");
			lbl_totalresume.Text = "Total Resumes - " + count;
		}
	}

	public void btn_add_click(object o, EventArgs e)
	{
		if (FileUpload1.HasFile)
		{
			foreach (HttpPostedFile postfiles in FileUpload1.PostedFiles)
			{
				string filetype = Path.GetExtension(postfiles.FileName);
				if (filetype.ToLower() == ".pdf")
				{
					dt = mycon.FillDataTable("insert into tbl_resume (updatetime) values(@0);SELECT @@Identity;", mycon.indianTime().ToString("yyyy-MM-dd hh:mm:ss tt"));
					string pdfpath = base.Server.MapPath("~\\pdfresume\\" + dt.Rows[0][0].ToString() + ".pdf");
					postfiles.SaveAs(pdfpath);
					base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Resume Added successfully.');", addScriptTags: true);
				}
			}
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Please Select Resume File.');", addScriptTags: true);
		}
	}
}
