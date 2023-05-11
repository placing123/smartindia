// smartadtube.com.customer.resumereport
using System;
using System.Data;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;

public class resumereport : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private DataSet ds = new DataSet();

	protected Label lbl_taskdataid;

	protected Literal ltEmbed;

	protected TextBox txt_firstname;

	protected TextBox txt_middlename;

	protected TextBox txt_lastname;

	protected TextBox txt_dob;

	protected TextBox txt_gender;

	protected TextBox txt_nationality;

	protected TextBox txt_maritalstatus;

	protected TextBox txt_passport;

	protected TextBox txt_hobbies;

	protected TextBox txt_languageknown;

	protected TextBox txt_address;

	protected TextBox txt_landmark;

	protected TextBox txt_city;

	protected TextBox txt_state;

	protected TextBox txt_pincode;

	protected TextBox txt_mobile;

	protected TextBox txt_emailid;

	protected TextBox txt_sscresult;

	protected TextBox txt_sscuniversity;

	protected TextBox txt_sscyear;

	protected TextBox txt_hscresult;

	protected TextBox txt_hscuniversity;

	protected TextBox txt_hscyear;

	protected TextBox txt_diplomadegree;

	protected TextBox txt_diplomaresult;

	protected TextBox txt_diplomauniversity;

	protected TextBox txt_diplomayear;

	protected TextBox txt_graduationdegree;

	protected TextBox txt_graduationresult;

	protected TextBox txt_graduationuniversity;

	protected TextBox txt_graduationyear;

	protected TextBox txt_postgraduationdegree;

	protected TextBox txt_postgraduationresult;

	protected TextBox txt_postgraduationuniversity;

	protected TextBox txt_postgraduationyear;

	protected TextBox txt_highestleveleducation;

	protected TextBox txt_totalworkyear;

	protected TextBox txt_totalworkmonth;

	protected TextBox txt_totalcompanieswork;

	protected TextBox txt_lastcurrentemploye;

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!base.IsPostBack)
		{
			if (Session["taskdataid"] != null)
			{
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
		ds = mycon.FillDataset("select * from tbl_taskdata with(nolock) where autoid=@0;select * from tbl_resumedata where autoid=@0;select * from tbl_reportdata where autoid=@0", lbl_taskdataid.Text);
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
		if (ds.Tables[2].Rows[0]["fname"].ToString() == "False")
		{
			txt_firstname.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_firstname.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["mname"].ToString() == "False")
		{
			txt_middlename.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_middlename.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["lname"].ToString() == "False")
		{
			txt_lastname.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_lastname.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["dateofbirth"].ToString() == "False")
		{
			txt_dob.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_dob.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["gender"].ToString() == "False")
		{
			txt_gender.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_gender.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["nationality"].ToString() == "False")
		{
			txt_nationality.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_nationality.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["maritalstatus"].ToString() == "False")
		{
			txt_maritalstatus.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_maritalstatus.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["passport"].ToString() == "False")
		{
			txt_passport.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_passport.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["hobbies"].ToString() == "False")
		{
			txt_hobbies.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_hobbies.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["languageknown"].ToString() == "False")
		{
			txt_languageknown.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_languageknown.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["address"].ToString() == "False")
		{
			txt_address.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_address.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["landmark"].ToString() == "False")
		{
			txt_landmark.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_landmark.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["city"].ToString() == "False")
		{
			txt_city.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_city.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["state"].ToString() == "False")
		{
			txt_state.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_state.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["pincode"].ToString() == "False")
		{
			txt_pincode.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_pincode.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["mobile"].ToString() == "False")
		{
			txt_mobile.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_mobile.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["emailid"].ToString() == "False")
		{
			txt_emailid.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_emailid.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["sscresult"].ToString() == "False")
		{
			txt_sscresult.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_sscresult.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["sscboarduniversity"].ToString() == "False")
		{
			txt_sscuniversity.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_sscuniversity.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["sscpassingyear"].ToString() == "False")
		{
			txt_sscyear.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_sscyear.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["hscresult"].ToString() == "False")
		{
			txt_hscresult.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_hscresult.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["hscboarduniversity"].ToString() == "False")
		{
			txt_hscuniversity.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_hscuniversity.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["hscpassingyear"].ToString() == "False")
		{
			txt_hscyear.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_hscyear.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["diplomadegree"].ToString() == "False")
		{
			txt_diplomadegree.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_diplomadegree.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["diplomaresult"].ToString() == "False")
		{
			txt_diplomaresult.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_diplomaresult.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["diplomaboarduniversity"].ToString() == "False")
		{
			txt_diplomauniversity.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_diplomauniversity.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["diplomapassingyear"].ToString() == "False")
		{
			txt_diplomayear.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_diplomayear.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["graduationdegree"].ToString() == "False")
		{
			txt_graduationdegree.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_graduationdegree.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["graduationresult"].ToString() == "False")
		{
			txt_graduationresult.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_graduationresult.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["graduationboarduniversity"].ToString() == "False")
		{
			txt_graduationuniversity.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_graduationuniversity.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["graduationpassingyear"].ToString() == "False")
		{
			txt_graduationyear.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_graduationyear.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["postgraduationdegree"].ToString() == "False")
		{
			txt_postgraduationdegree.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_postgraduationdegree.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["postgraduationresult"].ToString() == "False")
		{
			txt_postgraduationresult.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_postgraduationresult.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["postgraduationboarduniversity"].ToString() == "False")
		{
			txt_postgraduationuniversity.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_postgraduationuniversity.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["postgraduationpassingyear"].ToString() == "False")
		{
			txt_postgraduationyear.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_postgraduationyear.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["highestleveleducation"].ToString() == "False")
		{
			txt_highestleveleducation.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_highestleveleducation.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["totalworkyear"].ToString() == "False")
		{
			txt_totalworkyear.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_totalworkyear.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["totalworkmonth"].ToString() == "False")
		{
			txt_totalworkmonth.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_totalworkmonth.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["totalcompanies"].ToString() == "False")
		{
			txt_totalcompanieswork.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_totalcompanieswork.BorderColor = Color.OrangeRed;
		}
		if (ds.Tables[2].Rows[0]["lastcurrentemployee"].ToString() == "False")
		{
			txt_lastcurrentemploye.BorderColor = Color.ForestGreen;
		}
		else
		{
			txt_lastcurrentemploye.BorderColor = Color.OrangeRed;
		}
	}
}
