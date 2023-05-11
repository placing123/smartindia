// smartadtube.com.customer.videotask
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class videotask : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private DataSet ds = new DataSet();

	protected Label lbl_autoid;

	protected HtmlVideo video;

	protected Label lbl_question;

	protected RadioButton rbtn_optiona;

	protected RadioButton rbtn_optionb;

	protected RadioButton rbtn_optionc;

	protected RadioButton rbtn_optiond;

	protected Button btn_submit;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["autoid"] != null)
		{
			Page.RegisterStartupScript("key", "<script>disablebtn();</script>");
			if (!base.IsPostBack)
			{
				lbl_autoid.Text = Session["autoid"].ToString();
				ds = mycon.FillDataset("select * from tbl_taskdata with(nolock) where autoid=@0;select * from tbl_video where autoid=(select taskid from tbl_taskdata with(nolock) where autoid=@0)", lbl_autoid.Text);
				string videoid = ds.Tables[0].Rows[0]["taskid"].ToString();
				string question = ds.Tables[1].Rows[0]["question"].ToString();
				string optiona = ds.Tables[1].Rows[0]["optiona"].ToString();
				string optionb = ds.Tables[1].Rows[0]["optionb"].ToString();
				string optionc = ds.Tables[1].Rows[0]["optionc"].ToString();
				string optiond = ds.Tables[1].Rows[0]["optiond"].ToString();
				video.Attributes["src"] = "../videofiles/" + videoid + ".mp4";
				lbl_question.Text = question;
				rbtn_optiona.Text = optiona;
				rbtn_optionb.Text = optionb;
				rbtn_optionc.Text = optionc;
				rbtn_optiond.Text = optiond;
				if (question == "")
				{
					base.Response.Redirect("videotask1.aspx");
				}
			}
		}
		else
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}

	public void btn_submit_click(object o, EventArgs e)
	{
		string ans2 = "";
		if (rbtn_optiona.Checked)
		{
			ans2 = "A";
		}
		else if (rbtn_optionb.Checked)
		{
			ans2 = "B";
		}
		else if (rbtn_optionc.Checked)
		{
			ans2 = "C";
		}
		else
		{
			if (!rbtn_optiond.Checked)
			{
				base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Select an answer.');", addScriptTags: true);
				return;
			}
			ans2 = "D";
		}
		string currectans = mycon.ExecuteScalar("select answer from tbl_video where autoid=(select taskid from tbl_taskdata with(nolock) where autoid=@0)", lbl_autoid.Text);
		if (ans2 == currectans)
		{
			mycon.ExecuteNonQuery(" update tbl_taskdata set updatetime=@0,[status] = '1' where autoid=@1", mycon.indianTime().ToString("yyyy-MM-dd HH:mm:ss"), lbl_autoid.Text);
			base.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:RedirectAfterDelayFn(); ", addScriptTags: true);
		}
		else
		{
			base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Wrong answer please watch video again for correct answer.');", addScriptTags: true);
		}
	}
}
