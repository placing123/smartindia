// smartadtube.com.customer.resumetaskedit
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class resumetaskedit : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private DataSet ds = new DataSet();

	protected Label lbl_taskdataid;

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

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			if (Session["taskdataid"] != null)
			{
				Page.RegisterStartupScript("key", "<script>disablebtn();</script>");
				lbl_taskdataid.Text = Session["taskdataid"].ToString();
				filldata();
			}
			else
			{
				base.Response.Redirect("dashboard.aspx");
			}
		}
	}

	private void filldata()
	{
		ds = mycon.FillDataset("select * from tbl_taskdata with(nolock) where autoid=@0;select * from tbl_resumedata where autoid=@0;", lbl_taskdataid.Text);
		string resumeid = ds.Tables[0].Rows[0]["taskid"].ToString();
		string embed4 = "<object data=\"{0}\" type=\"application/pdf\" width=\"100%\" height=\"640px\">";
		embed4 += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
		embed4 += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
		embed4 += "</object>";
		ltEmbed.Text = string.Format(embed4, ResolveUrl("~/pdfresume/" + resumeid + ".pdf"));
		txt_firstname.Text = ds.Tables[1].Rows[0]["fname"].ToString();
		txt_middlename.Text = ds.Tables[1].Rows[0]["mname"].ToString();
		txt_lastname.Text = ds.Tables[1].Rows[0]["lname"].ToString();
		txt_dob.Text = ds.Tables[1].Rows[0]["dateofbirth"].ToString();
		txt_gender.Text = ds.Tables[1].Rows[0]["gender"].ToString();
		txt_nationality.Text = ds.Tables[1].Rows[0]["nationality"].ToString();
		txt_maritalstatus.Text = ds.Tables[1].Rows[0]["maritalstatus"].ToString();
		txt_passport.Text = ds.Tables[1].Rows[0]["passport"].ToString();
		txt_hobbies.Text = ds.Tables[1].Rows[0]["hobbies"].ToString();
		txt_languageknown.Text = ds.Tables[1].Rows[0]["languageknown"].ToString();
		txt_address.Text = ds.Tables[1].Rows[0]["address"].ToString();
		txt_landmark.Text = ds.Tables[1].Rows[0]["landmark"].ToString();
		txt_city.Text = ds.Tables[1].Rows[0]["city"].ToString();
		txt_state.Text = ds.Tables[1].Rows[0]["state"].ToString();
		txt_pincode.Text = ds.Tables[1].Rows[0]["pincode"].ToString();
		txt_mobile.Text = ds.Tables[1].Rows[0]["mobile"].ToString();
		txt_emailid.Text = ds.Tables[1].Rows[0]["emailid"].ToString();
		txt_sscresult.Text = ds.Tables[1].Rows[0]["sscresult"].ToString();
		txt_sscuniversity.Text = ds.Tables[1].Rows[0]["sscboarduniversity"].ToString();
		txt_sscyear.Text = ds.Tables[1].Rows[0]["sscpassingyear"].ToString();
		txt_hscresult.Text = ds.Tables[1].Rows[0]["hscresult"].ToString();
		txt_hscuniversity.Text = ds.Tables[1].Rows[0]["hscboarduniversity"].ToString();
		txt_hscyear.Text = ds.Tables[1].Rows[0]["hscpassingyear"].ToString();
		txt_diplomadegree.Text = ds.Tables[1].Rows[0]["diplomadegree"].ToString();
		txt_diplomaresult.Text = ds.Tables[1].Rows[0]["diplomaresult"].ToString();
		txt_diplomauniversity.Text = ds.Tables[1].Rows[0]["diplomaboarduniversity"].ToString();
		txt_diplomayear.Text = ds.Tables[1].Rows[0]["diplomapassingyear"].ToString();
		txt_graduationdegree.Text = ds.Tables[1].Rows[0]["graduationdegree"].ToString();
		txt_graduationresult.Text = ds.Tables[1].Rows[0]["graduationresult"].ToString();
		txt_graduationuniversity.Text = ds.Tables[1].Rows[0]["graduationboarduniversity"].ToString();
		txt_graduationyear.Text = ds.Tables[1].Rows[0]["graduationpassingyear"].ToString();
		txt_postgraduationdegree.Text = ds.Tables[1].Rows[0]["postgraduationdegree"].ToString();
		txt_postgraduationresult.Text = ds.Tables[1].Rows[0]["postgraduationresult"].ToString();
		txt_postgraduationuniversity.Text = ds.Tables[1].Rows[0]["postgraduationboarduniversity"].ToString();
		txt_postgraduationyear.Text = ds.Tables[1].Rows[0]["postgraduationpassingyear"].ToString();
		txt_highestleveleducation.Text = ds.Tables[1].Rows[0]["highestleveleducation"].ToString();
		txt_totalworkyear.Text = ds.Tables[1].Rows[0]["totalworkyear"].ToString();
		txt_totalworkmonth.Text = ds.Tables[1].Rows[0]["totalworkmonth"].ToString();
		txt_totalcompanieswork.Text = ds.Tables[1].Rows[0]["totalcompanies"].ToString();
		txt_lastcurrentemploye.Text = ds.Tables[1].Rows[0]["lastcurrentemployee"].ToString();
	}

	public void btn_submit_click(object o, EventArgs e)
	{
		mycon.ExecuteNonQuery("update tbl_resumedata set fname = @0,mname = @1,lname = @2,dateofbirth = @3,gender = @4,nationality = @5,maritalstatus = @6,passport = @7,hobbies = @8,\n                            languageknown = @9,address = @10,landmark = @11,city = @12,state = @13,pincode = @14,mobile = @15,emailid = @16,sscresult = @17,sscboarduniversity = @18,\n                            sscpassingyear = @19,hscresult = @20,hscboarduniversity = @21,hscpassingyear = @22,diplomadegree=@23,diplomaresult=@24,diplomaboarduniversity=@25,diplomapassingyear=@26,\n                            graduationdegree = @27,graduationresult = @28,graduationboarduniversity = @29,graduationpassingyear = @30,postgraduationdegree = @31,postgraduationresult = @32,\n                            postgraduationboarduniversity = @33,postgraduationpassingyear = @34,highestleveleducation = @35,totalworkyear = @36,totalworkmonth = @37,\r\n                            totalcompanies = @38,lastcurrentemployee = @39 where autoid=@40; update tbl_taskdata set updatetime=@41,query='0' where autoid=@40", txt_firstname.Text, txt_middlename.Text, txt_lastname.Text, txt_dob.Text, txt_gender.Text, txt_nationality.Text, txt_maritalstatus.Text, txt_passport.Text, txt_hobbies.Text, txt_languageknown.Text, txt_address.Text, txt_landmark.Text, txt_city.Text, txt_state.Text, txt_pincode.Text, txt_mobile.Text, txt_emailid.Text, txt_sscresult.Text, txt_sscuniversity.Text, txt_sscyear.Text, txt_hscresult.Text, txt_hscuniversity.Text, txt_hscyear.Text, txt_diplomadegree.Text, txt_diplomaresult.Text, txt_diplomauniversity.Text, txt_diplomayear.Text, txt_graduationdegree.Text, txt_graduationresult.Text, txt_graduationuniversity.Text, txt_graduationyear.Text, txt_postgraduationdegree.Text, txt_postgraduationresult.Text, txt_postgraduationuniversity.Text, txt_postgraduationyear.Text, txt_highestleveleducation.Text, txt_totalworkyear.Text, txt_totalworkmonth.Text, txt_totalcompanieswork.Text, txt_lastcurrentemploye.Text, lbl_taskdataid.Text, mycon.indianTime().ToString("yyyy-MM-dd HH:mm:ss"));
		base.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:RedirectAfterDelayFn(); ", addScriptTags: true);
	}
}
