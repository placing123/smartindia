// smartadtube.com.masteradmin.AddVideo
using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class AddVideo : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected Label lbl_totalresume;

	protected FileUpload FileUpload1;

	protected RegularExpressionValidator RegularExpressionValidator2;

	protected TextBox txt_question;

	protected TextBox txt_optiona;

	protected TextBox txt_optionb;

	protected TextBox txt_optionc;

	protected TextBox txt_optiond;

	protected DropDownList ddl_answer;

	protected Button btn_add;

	protected Button btn_clear;

	protected HtmlGenericControl div1;

	protected HtmlVideo video;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			string count = mycon.ExecuteScalar("select count(autoid) from tbl_video with(nolock)");
			lbl_totalresume.Text = "Total Videos - " + count;
		}
	}

	public void btn_add_click(object o, EventArgs e)
	{
		if (FileUpload1.HasFile)
		{
			foreach (HttpPostedFile postfiles in FileUpload1.PostedFiles)
			{
				string filetype = Path.GetExtension(postfiles.FileName);
				if (filetype.ToLower() == ".mp4")
				{
					dt = mycon.FillDataTable("insert into tbl_video (question,optiona,optionb,optionc,optiond,answer) values(@0,@1,@2,@3,@4,@5);SELECT @@Identity;", txt_question.Text, txt_optiona.Text, txt_optionb.Text, txt_optionc.Text, txt_optiond.Text, ddl_answer.Text);
					string videopath = base.Server.MapPath("~\\videofiles\\" + dt.Rows[0][0].ToString() + ".mp4");
					postfiles.SaveAs(videopath);
					cleartext();
					base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Video Added successfully.');", addScriptTags: true);
				}
			}
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Please Select Video File.');", addScriptTags: true);
		}
	}

	public void cleartext()
	{
		txt_question.Text = "";
		txt_optiona.Text = "";
		txt_optionb.Text = "";
		txt_optionc.Text = "";
		txt_optiond.Text = "";
		ddl_answer.SelectedIndex = 0;
	}
}
