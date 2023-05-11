// smartadtube.com.masteradmin.resumecheck
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public class resumecheck : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private DataSet ds = new DataSet();

	protected Label lbl_taskdataid;

	protected Literal ltEmbed;

	protected RadioButtonList rbtn_firstname;

	protected TextBox txt_firstname;

	protected RadioButtonList rbtn_middlename;

	protected TextBox txt_middlename;

	protected RadioButtonList rbtn_lastname;

	protected TextBox txt_lastname;

	protected RadioButtonList rbtn_dob;

	protected TextBox txt_dob;

	protected RadioButtonList rbtn_gender;

	protected TextBox txt_gender;

	protected RadioButtonList rbtn_nationality;

	protected TextBox txt_nationality;

	protected RadioButtonList rbtn_maritalstatus;

	protected TextBox txt_maritalstatus;

	protected RadioButtonList rbtn_passport;

	protected TextBox txt_passport;

	protected RadioButtonList rbtn_hobbies;

	protected TextBox txt_hobbies;

	protected RadioButtonList rbtn_languageknown;

	protected TextBox txt_languageknown;

	protected RadioButtonList rbtn_address;

	protected TextBox txt_address;

	protected RadioButtonList rbtn_landmark;

	protected TextBox txt_landmark;

	protected RadioButtonList rbtn_city;

	protected TextBox txt_city;

	protected RadioButtonList rbtn_state;

	protected TextBox txt_state;

	protected RadioButtonList rbtn_pincode;

	protected TextBox txt_pincode;

	protected RadioButtonList rbtn_mobile;

	protected TextBox txt_mobile;

	protected RadioButtonList rbtn_emailid;

	protected TextBox txt_emailid;

	protected RadioButtonList rbtn_sscresult;

	protected TextBox txt_sscresult;

	protected RadioButtonList rbtn_sscuniversity;

	protected TextBox txt_sscuniversity;

	protected RadioButtonList rbtn_sscyear;

	protected TextBox txt_sscyear;

	protected RadioButtonList rbtn_hscresult;

	protected TextBox txt_hscresult;

	protected RadioButtonList rbtn_hscuniversity;

	protected TextBox txt_hscuniversity;

	protected RadioButtonList rbtn_hscyear;

	protected TextBox txt_hscyear;

	protected RadioButtonList rbtn_diplomadegree;

	protected TextBox txt_diplomadegree;

	protected RadioButtonList rbtn_diplomaresult;

	protected TextBox txt_diplomaresult;

	protected RadioButtonList rbtn_diplomauniversity;

	protected TextBox txt_diplomauniversity;

	protected RadioButtonList rbtn_diplomayear;

	protected TextBox txt_diplomayear;

	protected RadioButtonList rbtn_graduationdegree;

	protected TextBox txt_graduationdegree;

	protected RadioButtonList rbtn_graduationresult;

	protected TextBox txt_graduationresult;

	protected RadioButtonList rbtn_graduationuniversity;

	protected TextBox txt_graduationuniversity;

	protected RadioButtonList rbtn_graduationyear;

	protected TextBox txt_graduationyear;

	protected RadioButtonList rbtn_postgraduationdegree;

	protected TextBox txt_postgraduationdegree;

	protected RadioButtonList rbtn_postgraduationresult;

	protected TextBox txt_postgraduationresult;

	protected RadioButtonList rbtn_postgraduationuniversity;

	protected TextBox txt_postgraduationuniversity;

	protected RadioButtonList rbtn_postgraduationyear;

	protected TextBox txt_postgraduationyear;

	protected RadioButtonList rbtn_highestleveleducation;

	protected TextBox txt_highestleveleducation;

	protected RadioButtonList rbtn_totalworkyear;

	protected TextBox txt_totalworkyear;

	protected RadioButtonList rbtn_totalworkmonth;

	protected TextBox txt_totalworkmonth;

	protected RadioButtonList rbtn_totalcompanieswork;

	protected TextBox txt_totalcompanieswork;

	protected RadioButtonList rbtn_lastcurrentemploye;

	protected TextBox txt_lastcurrentemploye;

	protected Button btn_submit;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (Session["taskdataid"] != null)
		{
			lbl_taskdataid.Text = Session["taskdataid"].ToString();
			filldata();
		}
		else
		{
			base.Response.Redirect("paymentapproval.aspx");
		}
	}

	private void filldata()
	{
		ds = mycon.FillDataset("select taskid from tbl_taskdata with(nolock) where autoid=@0;select * from tbl_resumedata where autoid=@0;", lbl_taskdataid.Text);
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

	protected void btn_submit_click(object sender, EventArgs e)
	{
		string firstname = (!(rbtn_firstname.SelectedItem.Text == "Approve")) ? "1" : "0";
		string middlename = (!(rbtn_middlename.SelectedItem.Text == "Approve")) ? "1" : "0";
		string lastname = (!(rbtn_lastname.SelectedItem.Text == "Approve")) ? "1" : "0";
		string dob = (!(rbtn_dob.SelectedItem.Text == "Approve")) ? "1" : "0";
		string gender = (!(rbtn_gender.SelectedItem.Text == "Approve")) ? "1" : "0";
		string nationality = (!(rbtn_nationality.SelectedItem.Text == "Approve")) ? "1" : "0";
		string maritalstatus = (!(rbtn_maritalstatus.SelectedItem.Text == "Approve")) ? "1" : "0";
		string passport = (!(rbtn_passport.SelectedItem.Text == "Approve")) ? "1" : "0";
		string hobbies = (!(rbtn_hobbies.SelectedItem.Text == "Approve")) ? "1" : "0";
		string languageknown = (!(rbtn_languageknown.SelectedItem.Text == "Approve")) ? "1" : "0";
		string address = (!(rbtn_address.SelectedItem.Text == "Approve")) ? "1" : "0";
		string landmark = (!(rbtn_landmark.SelectedItem.Text == "Approve")) ? "1" : "0";
		string city = (!(rbtn_city.SelectedItem.Text == "Approve")) ? "1" : "0";
		string state = (!(rbtn_state.SelectedItem.Text == "Approve")) ? "1" : "0";
		string pincode = (!(rbtn_pincode.SelectedItem.Text == "Approve")) ? "1" : "0";
		string mobile = (!(rbtn_mobile.SelectedItem.Text == "Approve")) ? "1" : "0";
		string emailid = (!(rbtn_emailid.SelectedItem.Text == "Approve")) ? "1" : "0";
		string sscresult = (!(rbtn_sscresult.SelectedItem.Text == "Approve")) ? "1" : "0";
		string sscuniversity = (!(rbtn_sscuniversity.SelectedItem.Text == "Approve")) ? "1" : "0";
		string sscyear = (!(rbtn_sscyear.SelectedItem.Text == "Approve")) ? "1" : "0";
		string hscresult = (!(rbtn_hscresult.SelectedItem.Text == "Approve")) ? "1" : "0";
		string hscuniversity = (!(rbtn_hscuniversity.SelectedItem.Text == "Approve")) ? "1" : "0";
		string hscyear = (!(rbtn_hscyear.SelectedItem.Text == "Approve")) ? "1" : "0";
		string diplomadegree = (!(rbtn_diplomadegree.SelectedItem.Text == "Approve")) ? "1" : "0";
		string diplomaresult = (!(rbtn_diplomaresult.SelectedItem.Text == "Approve")) ? "1" : "0";
		string diplomauniversity = (!(rbtn_diplomauniversity.SelectedItem.Text == "Approve")) ? "1" : "0";
		string diplomayear = (!(rbtn_diplomayear.SelectedItem.Text == "Approve")) ? "1" : "0";
		string graduationdegree = (!(rbtn_graduationdegree.SelectedItem.Text == "Approve")) ? "1" : "0";
		string graduationresult = (!(rbtn_graduationresult.SelectedItem.Text == "Approve")) ? "1" : "0";
		string graduationuniversity = (!(rbtn_graduationuniversity.SelectedItem.Text == "Approve")) ? "1" : "0";
		string graduationyear = (!(rbtn_graduationyear.SelectedItem.Text == "Approve")) ? "1" : "0";
		string postgraduationdegree = (!(rbtn_postgraduationdegree.SelectedItem.Text == "Approve")) ? "1" : "0";
		string postgraduationresult = (!(rbtn_postgraduationresult.SelectedItem.Text == "Approve")) ? "1" : "0";
		string postgraduationuniversity = (!(rbtn_postgraduationuniversity.SelectedItem.Text == "Approve")) ? "1" : "0";
		string postgraduationyear = (!(rbtn_postgraduationyear.SelectedItem.Text == "Approve")) ? "1" : "0";
		string highestleveleducation = (!(rbtn_highestleveleducation.SelectedItem.Text == "Approve")) ? "1" : "0";
		string totalworkyear = (!(rbtn_totalworkyear.SelectedItem.Text == "Approve")) ? "1" : "0";
		string totalworkmonth = (!(rbtn_totalworkmonth.SelectedItem.Text == "Approve")) ? "1" : "0";
		string totalcompanieswork = (!(rbtn_totalcompanieswork.SelectedItem.Text == "Approve")) ? "1" : "0";
		string lastcurrentemploye = (!(rbtn_lastcurrentemploye.SelectedItem.Text == "Approve")) ? "1" : "0";
		dt = mycon.FillDataTable("select autoid from tbl_reportdata where autoid=@0", lbl_taskdataid.Text);
		if (dt.Rows.Count == 0)
		{
			mycon.ExecuteNonQuery("insert into tbl_reportdata (autoid) values(@0)", lbl_taskdataid.Text);
		}
		mycon.ExecuteNonQuery("update tbl_reportdata set fname = @0,mname = @1,lname = @2,dateofbirth = @3,gender = @4,nationality = @5,maritalstatus = @6,passport = @7,hobbies = @8,\n                            languageknown = @9,address = @10,landmark = @11,city = @12,state = @13,pincode = @14,mobile = @15,emailid = @16,sscresult = @17,sscboarduniversity = @18,\n                            sscpassingyear = @19,hscresult = @20,hscboarduniversity = @21,hscpassingyear = @22,diplomadegree=@23,diplomaresult=@24,diplomaboarduniversity=@25,diplomapassingyear=@26,\n                            graduationdegree = @27,graduationresult = @28,graduationboarduniversity = @29,graduationpassingyear = @30,postgraduationdegree = @31,postgraduationresult = @32,\n                            postgraduationboarduniversity = @33,postgraduationpassingyear = @34,highestleveleducation = @35,totalworkyear = @36,totalworkmonth = @37,\r\n                            totalcompanies = @38,lastcurrentemployee = @39 where autoid=@40; update tbl_taskdata set [status] = '2' where autoid=@40", firstname, middlename, lastname, dob, gender, nationality, maritalstatus, passport, hobbies, languageknown, address, landmark, city, state, pincode, mobile, emailid, sscresult, sscuniversity, sscyear, hscresult, hscuniversity, hscyear, diplomadegree, diplomaresult, diplomauniversity, diplomayear, graduationdegree, graduationresult, graduationuniversity, graduationyear, postgraduationdegree, postgraduationresult, postgraduationuniversity, postgraduationyear, highestleveleducation, totalworkyear, totalworkmonth, totalcompanieswork, lastcurrentemploye, lbl_taskdataid.Text);
		base.Response.Redirect("resumelist.aspx");
	}
}
