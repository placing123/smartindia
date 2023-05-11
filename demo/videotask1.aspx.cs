// smartadtube.com.demo.videotask1
using System;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public class videotask1 : Page
{
	protected Label lbl_autoid;

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
		if (!base.IsPostBack)
		{
			Page.RegisterStartupScript("key", "<script>disablebtn();disablenextbtn();</script>");
			string[] videoidarray = new string[5]
			{
				"1061",
				"1055",
				"1531",
				"234",
				"1541"
			};
			Random rand = new Random();
			int index = rand.Next(videoidarray.Length);
			string videoid = videoidarray[index];
			video.Attributes["src"] = "../videofiles/" + videoid + ".mp4";
		}
	}

	protected void btn_submit_Click(object sender, EventArgs e)
	{
		base.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:RedirectAfterDelayFn(); ", addScriptTags: true);
	}
}
