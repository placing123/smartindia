// smartadtube.com.customer.videotask1
using NReco.VideoInfo;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class videotask1 : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private DataSet ds = new DataSet();

	protected Label lbl_autoid;

	protected Label lbl_duration;

	protected HtmlVideo video;

	protected RadioButton rbtn_q1yes;

	protected RadioButton rbtn_q1no;

	protected RadioButton rbtn_q2yes;

	protected RadioButton rbtn_q2no;

	protected RadioButton rbtn_q2maybe;

	protected RadioButton rbtn_q31;

	protected RadioButton rbtn_q32;

	protected RadioButton rbtn_q33;

	protected RadioButton rbtn_q34;

	protected RadioButton rbtn_q35;

	protected RadioButton rbtn_q41;

	protected RadioButton rbtn_q42;

	protected RadioButton rbtn_q43;

	protected RadioButton rbtn_q44;

	protected RadioButton rbtn_q45;

	protected RadioButton rbtn_q4notused;

	protected RadioButton rbtn_q5yes;

	protected RadioButton rbtn_q5no;

	protected RadioButton rbtn_q5maybe;

	protected TextBox txt_q6;

	protected Button btn_submit;

	protected Button btn_next;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["autoid"] != null)
		{
			Page.RegisterStartupScript("key", "<script>disablebtn();disablenextbtn();</script>");
			if (!base.IsPostBack)
			{
				lbl_autoid.Text = Session["autoid"].ToString();
				ds = mycon.FillDataset("select * from tbl_taskdata with(nolock) where autoid=@0;select * from tbl_video where autoid=(select taskid from tbl_taskdata with(nolock) where autoid=@0);", lbl_autoid.Text);
				string videoid = ds.Tables[0].Rows[0]["taskid"].ToString();
				video.Attributes["src"] = "../videofiles/" + videoid + ".mp4";
				mycon.ExecuteNonQuery("insert into tbl_logs (regid,data) values(@0,@1)", ds.Tables[0].Rows[0]["regid"].ToString(), "-- Videotask -- Open -- " + mycon.getIpAddress() + " -- " + mycon.indianTime());
			}
		}
		else
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}

	protected void btn_submit_Click(object sender, EventArgs e)
	{
		string q11 = (!rbtn_q1yes.Checked) ? "No" : "Yes";
		string q10 = rbtn_q2yes.Checked ? "Yes" : ((!rbtn_q2no.Checked) ? "Maybe" : "No");
		string q9 = rbtn_q31.Checked ? "1" : (rbtn_q32.Checked ? "2" : (rbtn_q33.Checked ? "3" : ((!rbtn_q34.Checked) ? "5" : "4")));
		string q8 = rbtn_q41.Checked ? "1" : (rbtn_q42.Checked ? "2" : (rbtn_q43.Checked ? "3" : (rbtn_q44.Checked ? "4" : ((!rbtn_q45.Checked) ? "Not Used" : "5"))));
		string q7 = rbtn_q5yes.Checked ? "Yes" : ((!rbtn_q5no.Checked) ? "Maybe" : "No");
		string q6 = txt_q6.Text;
		mycon.ExecuteNonQuery(" update tbl_taskdata set updatetime=@0,[status] = '1' where autoid=@1;update tbl_videodata set q1=@2,q2=@3,q3=@4,q4=@5,q5=@6,q6=@7 where autoid=@1;", mycon.indianTime().ToString("yyyy-MM-dd HH:mm:ss"), lbl_autoid.Text, q11, q10, q9, q8, q7, q6);
		base.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:RedirectAfterDelayFn(); ", addScriptTags: true);
		FFProbe ffProbe = new FFProbe();
		MediaInfo videoInfo = ffProbe.GetMediaInfo(base.Server.MapPath(video.Attributes["src"]));
		int min = videoInfo.Duration.Minutes;
		int sec = videoInfo.Duration.Seconds;
		mycon.ExecuteNonQuery("insert into tbl_logs (regid,data) values(@0,@1)", Session["user"].ToString(), "-- Videotask -- Submit -- min -- " + min + "  -- sec -- " + sec + " -- " + mycon.getIpAddress() + " -- " + mycon.indianTime());
	}

	public static double Convert100NanosecondsToMilliseconds(double nanoseconds)
	{
		return nanoseconds * 0.0001;
	}
}
