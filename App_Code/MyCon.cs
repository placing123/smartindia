// MyCon
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;

public class MyCon
{
	public SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["myconnection"].ToString());

	private SqlCommand cmd = new SqlCommand();

	public string qurey;

	public string falge;

	public SqlCommand cmd1 = new SqlCommand();

	public void ExecuteNonQuery(string strQury)
	{
		if (con.State == ConnectionState.Closed)
		{
			con.Open();
		}
		cmd = new SqlCommand(strQury, con);
		cmd.ExecuteNonQuery();
		con.Close();
	}

	public void ExecuteNonQuery(string strQury, params string[] parameterValues)
	{
		if (con.State == ConnectionState.Closed)
		{
			con.Open();
		}
		cmd = new SqlCommand(strQury, con);
		for (int i = 0; i < parameterValues.Length; i++)
		{
			cmd.Parameters.Add("@" + i, SqlDbType.VarChar).Value = parameterValues[i].ToString();
		}
		cmd.CommandTimeout = 120;
		cmd.ExecuteNonQuery();
		con.Close();
	}

	public DataTable FillDataTable(string strQury)
	{
		DataTable dt = new DataTable();
		cmd = new SqlCommand(strQury, con);
		cmd.CommandText = strQury;
		cmd.CommandTimeout = 120;
		SqlDataAdapter da = new SqlDataAdapter(cmd);
		dt.Clear();
		da.Fill(dt);
		return dt;
	}

	public DataTable FillDataTable(string strQury, params string[] parameterValues)
	{
		DataTable dt = new DataTable();
		cmd = new SqlCommand(strQury, con);
		for (int i = 0; i < parameterValues.Length; i++)
		{
			cmd.Parameters.Add("@" + i, SqlDbType.VarChar).Value = parameterValues[i].ToString();
		}
		cmd.CommandText = strQury;
		SqlDataAdapter da = new SqlDataAdapter(cmd);
		dt.Clear();
		da.Fill(dt);
		return dt;
	}

	public DataSet FillDataset(string strQury)
	{
		DataSet ds = new DataSet();
		cmd = new SqlCommand(strQury, con);
		cmd.CommandText = strQury;
		cmd.CommandTimeout = 120;
		SqlDataAdapter da = new SqlDataAdapter(cmd);
		ds.Clear();
		da.Fill(ds);
		return ds;
	}

	public DataSet FillDataset(string strQury, params string[] parameterValues)
	{
		DataSet ds = new DataSet();
		cmd = new SqlCommand(strQury, con);
		for (int i = 0; i < parameterValues.Length; i++)
		{
			cmd.Parameters.Add("@" + i, SqlDbType.VarChar).Value = parameterValues[i].ToString();
		}
		cmd.CommandText = strQury;
		SqlDataAdapter da = new SqlDataAdapter(cmd);
		ds.Clear();
		da.Fill(ds);
		return ds;
	}

	public string ExecuteScalar(string str)
	{
		if (con.State == ConnectionState.Closed)
		{
			con.Open();
		}
		cmd = new SqlCommand(str, con);
		str = Convert.ToString(cmd.ExecuteScalar());
		con.Close();
		return str;
	}

	public string ExecuteScalar(string str, params string[] parameterValues)
	{
		if (con.State == ConnectionState.Closed)
		{
			con.Open();
		}
		cmd = new SqlCommand(str, con);
		for (int i = 0; i < parameterValues.Length; i++)
		{
			cmd.Parameters.Add("@" + i, SqlDbType.VarChar).Value = parameterValues[i].ToString();
		}
		str = Convert.ToString(cmd.ExecuteScalar());
		con.Close();
		return str;
	}

	public DateTime indianTime()
	{
		TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
		return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
	}

	public bool send(string emailId, string subject, string message)
	{
		string Email = ConfigurationManager.AppSettings["Email"].ToString();
		MailMessage mail = new MailMessage(Email, emailId);
		mail.Subject = subject;
		mail.Body = message;
		mail.IsBodyHtml = true;
		SmtpClient smtp = new SmtpClient();
		smtp.Send(mail);
		return true;
	}

	public string getIpAddress()
	{
		string ipAddress2 = HttpContext.Current.Request.UserHostAddress;
		HttpRequest currentRequest = HttpContext.Current.Request;
		ipAddress2 = currentRequest.ServerVariables["HTTP_X_FORWARDED_FOR"];
		if (ipAddress2 == null || ipAddress2.ToLower() == "unknown")
		{
			ipAddress2 = currentRequest.ServerVariables["REMOTE_ADDR"];
		}
		return ipAddress2;
	}
}
