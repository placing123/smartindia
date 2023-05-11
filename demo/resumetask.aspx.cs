// smartadtube.com.demo.resumetask
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public class resumetask : Page
{
	protected Literal ltEmbed;

	protected RequiredFieldValidator RequiredFieldValidator1;

	protected TextBox txt_firstname;

	protected RequiredFieldValidator RequiredFieldValidator2;

	protected TextBox txt_middlename;

	protected RequiredFieldValidator RequiredFieldValidator3;

	protected TextBox txt_lastname;

	protected RequiredFieldValidator RequiredFieldValidator4;

	protected TextBox txt_dob;

	protected RequiredFieldValidator RequiredFieldValidator5;

	protected TextBox txt_gender;

	protected RequiredFieldValidator RequiredFieldValidator6;

	protected TextBox txt_nationality;

	protected RequiredFieldValidator RequiredFieldValidator7;

	protected TextBox txt_maritalstatus;

	protected RequiredFieldValidator RequiredFieldValidator8;

	protected TextBox txt_passport;

	protected RequiredFieldValidator RequiredFieldValidator9;

	protected TextBox txt_hobbies;

	protected RequiredFieldValidator RequiredFieldValidator10;

	protected TextBox txt_languageknown;

	protected RequiredFieldValidator RequiredFieldValidator11;

	protected TextBox txt_address;

	protected RequiredFieldValidator RequiredFieldValidator12;

	protected TextBox txt_landmark;

	protected RequiredFieldValidator RequiredFieldValidator13;

	protected TextBox txt_city;

	protected RequiredFieldValidator RequiredFieldValidator14;

	protected TextBox txt_state;

	protected RequiredFieldValidator RequiredFieldValidator15;

	protected TextBox txt_pincode;

	protected RequiredFieldValidator RequiredFieldValidator16;

	protected TextBox txt_mobile;

	protected RequiredFieldValidator RequiredFieldValidator17;

	protected TextBox txt_emailid;

	protected RequiredFieldValidator RequiredFieldValidator18;

	protected TextBox txt_sscresult;

	protected RequiredFieldValidator RequiredFieldValidator19;

	protected TextBox txt_sscuniversity;

	protected RequiredFieldValidator RequiredFieldValidator20;

	protected TextBox txt_sscyear;

	protected RequiredFieldValidator RequiredFieldValidator21;

	protected TextBox txt_hscresult;

	protected RequiredFieldValidator RequiredFieldValidator22;

	protected TextBox txt_hscuniversity;

	protected RequiredFieldValidator RequiredFieldValidator23;

	protected TextBox txt_hscyear;

	protected RequiredFieldValidator RequiredFieldValidator33;

	protected TextBox txt_diplomadegree;

	protected RequiredFieldValidator RequiredFieldValidator38;

	protected TextBox txt_diplomaresult;

	protected RequiredFieldValidator RequiredFieldValidator39;

	protected TextBox txt_diplomauniversity;

	protected RequiredFieldValidator RequiredFieldValidator40;

	protected TextBox txt_diplomayear;

	protected RequiredFieldValidator RequiredFieldValidator24;

	protected TextBox txt_graduationdegree;

	protected RequiredFieldValidator RequiredFieldValidator25;

	protected TextBox txt_graduationresult;

	protected RequiredFieldValidator RequiredFieldValidator26;

	protected TextBox txt_graduationuniversity;

	protected RequiredFieldValidator RequiredFieldValidator27;

	protected TextBox txt_graduationyear;

	protected RequiredFieldValidator RequiredFieldValidator28;

	protected TextBox txt_postgraduationdegree;

	protected RequiredFieldValidator RequiredFieldValidator29;

	protected TextBox txt_postgraduationresult;

	protected RequiredFieldValidator RequiredFieldValidator30;

	protected TextBox txt_postgraduationuniversity;

	protected RequiredFieldValidator RequiredFieldValidator31;

	protected TextBox txt_postgraduationyear;

	protected RequiredFieldValidator RequiredFieldValidator32;

	protected TextBox txt_highestleveleducation;

	protected RequiredFieldValidator RequiredFieldValidator34;

	protected TextBox txt_totalworkyear;

	protected RequiredFieldValidator RequiredFieldValidator35;

	protected TextBox txt_totalworkmonth;

	protected RequiredFieldValidator RequiredFieldValidator36;

	protected TextBox txt_totalcompanieswork;

	protected RequiredFieldValidator RequiredFieldValidator37;

	protected TextBox txt_lastcurrentemploye;

	protected Button btn_submit;

	protected Button btn_saveforquery;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			Page.RegisterStartupScript("key", "<script>disablebtn();</script>");
			string resumeid = "10007";
			string embed4 = "<object data=\"{0}\" type=\"application/pdf\" width=\"100%\" height=\"640px\">";
			embed4 += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
			embed4 += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
			embed4 += "</object>";
			ltEmbed.Text = string.Format(embed4, ResolveUrl("~/pdfresume/" + resumeid + ".pdf"));
		}
	}

	public void btn_submit_click(object o, EventArgs e)
	{
		base.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:RedirectAfterDelayFn(); ", addScriptTags: true);
	}

	protected void btn_saveforquery_Click(object sender, EventArgs e)
	{
		base.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:RedirectAfterDelayFn(); ", addScriptTags: true);
	}
}
