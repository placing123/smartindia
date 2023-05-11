// smartadtube.com.customer.NeaTask
using System;
using System.Data;
using System.Web.UI;

public class NeaTask : Page
{
	private MyCon mycon = new MyCon();

	private DataTable dt = new DataTable();

	private DataSet ds = new DataSet();

	private DataSet ds1 = new DataSet();

	protected void Page_Load(object sender, EventArgs e)
	{
		try
		{
			if (!base.IsPostBack)
			{
				ds = mycon.FillDataset("select max(slotnumber) from tbl_slots where status='1' and regid=@0;select enddate from tbl_slots where regid=@0 and slotnumber=(select max(slotnumber) from tbl_slots where status='1' and regid=@0);select tasknumbers from tbl_plan where planid=(select planid from tbl_registration where regid=@0)", Session["user"].ToString());
				string activeslot = ds.Tables[0].Rows[0][0].ToString();
				if (activeslot != "")
				{
					DateTime enddate = Convert.ToDateTime(ds.Tables[1].Rows[0][0].ToString());
					DateTime now = mycon.indianTime().Date;
					int tasknumbers = Convert.ToInt32(ds.Tables[2].Rows[0][0].ToString());
					if (enddate >= now)
					{
						ds1 = mycon.FillDataset("select autoid,tasktype from tbl_taskdata where regid=@0 and slotno=@1 and status='0';select count(autoid) from tbl_taskdata where regid=@0 and slotno=@1", Session["user"].ToString(), activeslot);
						if (ds1.Tables[0].Rows.Count > 0)
						{
							string tasktype2 = ds1.Tables[0].Rows[0]["tasktype"].ToString();
							Session["autoid"] = ds1.Tables[0].Rows[0]["autoid"].ToString();
							if (tasktype2 == "resume")
							{
								base.Response.Redirect("resumetask.aspx", endResponse: false);
							}
							else if (tasktype2 == "video")
							{
								base.Response.Redirect("videotask.aspx", endResponse: false);
							}
						}
						else
						{
							string[] tasktypelist = new string[2]
							{
								"resume",
								"video"
							};
							Random rand = new Random();
							int index = rand.Next(tasktypelist.Length);
							string tasktype = tasktypelist[index];
							int srno = Convert.ToInt32(ds1.Tables[1].Rows[0][0].ToString()) + 1;
							string taskid3 = "";
							if (tasknumbers >= srno)
							{
								if (tasktype == "resume")
								{
									taskid3 = mycon.ExecuteScalar("SELECT TOP 1 autoid FROM tbl_resume  where autoid not in (select taskid from tbl_taskdata where regid=@0 and slotno=@1 and tasktype='resume') ORDER BY NEWID()", Session["user"].ToString(), activeslot);
									if (taskid3 != "")
									{
										dt = mycon.FillDataTable("insert into tbl_taskdata (regid,slotno,srno,tasktype,taskid,updatetime,status) values(@0,@1,@2,@3,@4,@5,@6);select @@identity;", Session["user"].ToString(), activeslot, srno.ToString(), tasktype, taskid3, mycon.indianTime().ToString("yyyy-MM-dd hh:mm:ss tt"), "0");
										Session["autoid"] = dt.Rows[0][0].ToString();
										mycon.ExecuteNonQuery("insert into tbl_resumedata (autoid) values(@0)", dt.Rows[0][0].ToString());
										base.Response.Redirect("resumetask.aspx", endResponse: false);
									}
									else
									{
										base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('No more task available please try after sometime.');", addScriptTags: true);
									}
								}
								else if (tasktype == "video")
								{
									taskid3 = mycon.ExecuteScalar("SELECT TOP 1 autoid FROM tbl_video  where autoid not in (select taskid from tbl_taskdata where regid=@0 and slotno=@1 and tasktype='video') ORDER BY NEWID()", Session["user"].ToString(), activeslot);
									if (taskid3 != "")
									{
										dt = mycon.FillDataTable("insert into tbl_taskdata (regid,slotno,srno,tasktype,taskid,updatetime,status) values(@0,@1,@2,@3,@4,@5,@6);select @@identity;", Session["user"].ToString(), activeslot, srno.ToString(), tasktype, taskid3, mycon.indianTime().ToString("yyyy-MM-dd hh:mm:ss tt"), "0");
										Session["autoid"] = dt.Rows[0][0].ToString();
										mycon.ExecuteNonQuery("insert into tbl_videodata (autoid) values(@0)", dt.Rows[0][0].ToString());
										base.Response.Redirect("videotask1.aspx", endResponse: false);
									}
									else
									{
										base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('No more task available please try after sometime.');", addScriptTags: true);
									}
								}
							}
							else
							{
								base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Your current slot task is finished apply for new slot.');", addScriptTags: true);
							}
						}
					}
					else
					{
						mycon.ExecuteNonQuery("\r\n                                declare @slotnumber  varchar(50);\r\n                                declare @count int;\r\n                                declare @regid numeric(18, 0);\r\n                                set @regid = @0;\r\n                                set @slotnumber = @1;\r\n                                declare @rate float;\r\n                                declare @total float;\r\n                                set @count = (select count(autoid) from tbl_taskdata where regid = @regid and status = '1' and slotno = @slotnumber);\r\n                                set @rate = (select rate from tbl_payout where payoutid = (select payoutid from tbl_plan where planid = (select planid from tbl_registration where regid = @regid)) and[from] <= @count and[to] >= @count);\r\n                                set @total= @rate*@count;\r\n                                update tbl_slots set status='2',approval='0',amount=@total where regid=@regid and slotnumber=@slotnumber;\r\n                                delete from tbl_taskdata where regid=@regid and status='0';", Session["user"].ToString(), activeslot);
						base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('Your Active slot has expired please apply for new slot.');", addScriptTags: true);
					}
				}
				else
				{
					base.ClientScript.RegisterStartupScript(GetType(), "myalert", "alert('There is no active slot found please apply for new slot.');", addScriptTags: true);
				}
			}
		}
		catch (Exception)
		{
			base.Response.Redirect("dashboard.aspx");
		}
	}
}
