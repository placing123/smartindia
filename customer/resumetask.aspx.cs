// smartadtube.com.customer.resumetask
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class resumetask : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	protected Label lbl_autoid;

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
		if (Session["autoid"] != null)
		{
			if (!base.IsPostBack)
			{
				lbl_autoid.Text = Session["autoid"].ToString();
				Page.RegisterStartupScript("key", "<script>disablebtn();</script>");
				dt = mycon.FillDataTable("select * from tbl_taskdata with(nolock) where autoid=@0", lbl_autoid.Text);
				string resumeid = dt.Rows[0]["taskid"].ToString();
				string embed4 = "<object data=\"{0}\" type=\"application/pdf\" width=\"100%\" height=\"640px\">";
				embed4 += "If you are unable to view file, you can download from <a href = \"{0}\">here</a>";
				embed4 += " or download <a target = \"_blank\" href = \"http://get.adobe.com/reader/\">Adobe PDF Reader</a> to view the file.";
				embed4 += "</object>";
				ltEmbed.Text = string.Format(embed4, ResolveUrl("~/pdfresume/" + resumeid + ".pdf"));
				mycon.ExecuteNonQuery("insert into tbl_logs (regid,data) values(@0,@1)", dt.Rows[0]["regid"].ToString(), "-- Resumetask -- Open -- " + mycon.getIpAddress() + " -- " + mycon.indianTime());
			}
		}
		else
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}

	public void btn_submit_click(object o, EventArgs e)
	{
		mycon.ExecuteNonQuery("update tbl_resumedata set fname = @0,mname = @1,lname = @2,dateofbirth = @3,gender = @4,nationality = @5,maritalstatus = @6,passport = @7,hobbies = @8,\n                            languageknown = @9,address = @10,landmark = @11,city = @12,state = @13,pincode = @14,mobile = @15,emailid = @16,sscresult = @17,sscboarduniversity = @18,\n                            sscpassingyear = @19,hscresult = @20,hscboarduniversity = @21,hscpassingyear = @22,diplomadegree=@23,diplomaresult=@24,diplomaboarduniversity=@25,diplomapassingyear=@26,\n                            graduationdegree = @27,graduationresult = @28,graduationboarduniversity = @29,graduationpassingyear = @30,postgraduationdegree = @31,postgraduationresult = @32,\n                            postgraduationboarduniversity = @33,postgraduationpassingyear = @34,highestleveleducation = @35,totalworkyear = @36,totalworkmonth = @37,\r\n                            totalcompanies = @38,lastcurrentemployee = @39 where autoid=@40; update tbl_taskdata set updatetime=@41,[status] = '1' where autoid=@40", txt_firstname.Text, txt_middlename.Text, txt_lastname.Text, txt_dob.Text, txt_gender.Text, txt_nationality.Text, txt_maritalstatus.Text, txt_passport.Text, txt_hobbies.Text, txt_languageknown.Text, txt_address.Text, txt_landmark.Text, txt_city.Text, txt_state.Text, txt_pincode.Text, txt_mobile.Text, txt_emailid.Text, txt_sscresult.Text, txt_sscuniversity.Text, txt_sscyear.Text, txt_hscresult.Text, txt_hscuniversity.Text, txt_hscyear.Text, txt_diplomadegree.Text, txt_diplomaresult.Text, txt_diplomauniversity.Text, txt_diplomayear.Text, txt_graduationdegree.Text, txt_graduationresult.Text, txt_graduationuniversity.Text, txt_graduationyear.Text, txt_postgraduationdegree.Text, txt_postgraduationresult.Text, txt_postgraduationuniversity.Text, txt_postgraduationyear.Text, txt_highestleveleducation.Text, txt_totalworkyear.Text, txt_totalworkmonth.Text, txt_totalcompanieswork.Text, txt_lastcurrentemploye.Text, lbl_autoid.Text, mycon.indianTime().ToString("yyyy-MM-dd HH:mm:ss"));
		base.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:RedirectAfterDelayFn(); ", addScriptTags: true);
		mycon.ExecuteNonQuery("insert into tbl_logs (regid,data) values(@0,@1)", Session["user"].ToString(), "-- Resumetask -- Submit -- " + mycon.getIpAddress() + " -- " + mycon.indianTime());
	}

	protected void btn_saveforquery_Click(object sender, EventArgs e)
	{
		mycon.ExecuteNonQuery("update tbl_resumedata set fname = @0,mname = @1,lname = @2,dateofbirth = @3,gender = @4,nationality = @5,maritalstatus = @6,passport = @7,hobbies = @8,\n                            languageknown = @9,address = @10,landmark = @11,city = @12,state = @13,pincode = @14,mobile = @15,emailid = @16,sscresult = @17,sscboarduniversity = @18,\n                            sscpassingyear = @19,hscresult = @20,hscboarduniversity = @21,hscpassingyear = @22,diplomadegree=@23,diplomaresult=@24,diplomaboarduniversity=@25,diplomapassingyear=@26,\n                            graduationdegree = @27,graduationresult = @28,graduationboarduniversity = @29,graduationpassingyear = @30,postgraduationdegree = @31,postgraduationresult = @32,\n                            postgraduationboarduniversity = @33,postgraduationpassingyear = @34,highestleveleducation = @35,totalworkyear = @36,totalworkmonth = @37,\r\n                            totalcompanies = @38,lastcurrentemployee = @39 where autoid=@40; update tbl_taskdata set updatetime=@41,[status] = '1',query='1' where autoid=@40", txt_firstname.Text, txt_middlename.Text, txt_lastname.Text, txt_dob.Text, txt_gender.Text, txt_nationality.Text, txt_maritalstatus.Text, txt_passport.Text, txt_hobbies.Text, txt_languageknown.Text, txt_address.Text, txt_landmark.Text, txt_city.Text, txt_state.Text, txt_pincode.Text, txt_mobile.Text, txt_emailid.Text, txt_sscresult.Text, txt_sscuniversity.Text, txt_sscyear.Text, txt_hscresult.Text, txt_hscuniversity.Text, txt_hscyear.Text, txt_diplomadegree.Text, txt_diplomaresult.Text, txt_diplomauniversity.Text, txt_diplomayear.Text, txt_graduationdegree.Text, txt_graduationresult.Text, txt_graduationuniversity.Text, txt_graduationyear.Text, txt_postgraduationdegree.Text, txt_postgraduationresult.Text, txt_postgraduationuniversity.Text, txt_postgraduationyear.Text, txt_highestleveleducation.Text, txt_totalworkyear.Text, txt_totalworkmonth.Text, txt_totalcompanieswork.Text, txt_lastcurrentemploye.Text, lbl_autoid.Text, mycon.indianTime().ToString("yyyy-MM-dd HH:mm:ss"));
		base.ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:RedirectAfterDelayFn(); ", addScriptTags: true);
		mycon.ExecuteNonQuery("insert into tbl_logs (regid,data) values(@0,@1)", Session["user"].ToString(), "-- Resumetask -- Saveforquery -- " + mycon.getIpAddress() + " -- " + mycon.indianTime());
	}
}
