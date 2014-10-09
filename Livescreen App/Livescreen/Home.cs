using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IO;
using Microsoft.Win32;
using System.Diagnostics;
using System.Windows;
using System.Resources;
using System.Runtime.InteropServices;
using System.Management;
using System.Net;
namespace Livescreen
{
    public partial class Home : Form
    {
       // SqlConnection con = new SqlConnection("Data Source=184.154.49.162;Initial Catalog=edu_livescreenz;User ID=educkshetra;Password=peaches_louis_1987");
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Livescreen;User Id=sa;Password=$umith;");
        public string Phno, name;
        int i = 0;
        string ScreenPath;
        private static bool TipsShowing;

        private Form m_InstanceRef = null;
        public Form InstanceRef
        {

            get
            {

                return m_InstanceRef;

            }
            set
            {

                m_InstanceRef = value;

            }

        }
        [StructLayout(LayoutKind.Sequential)]
        public struct ProcessEntry32
        {
            public uint dwSize;
            public uint cntUsage;
            public uint th32ProcessID;
            public IntPtr th32DefaultHeapID;
            public uint th32ModuleID;
            public uint cntThreads;
            public uint th32ParentProcessID;
            public int pcPriClassBase;
            public uint dwFlags;
            [MarshalAs(UnmanagedType.ByValTStr, SizeConst = 256)]
            public string szExeFile;
        };


        [DllImport("KERNEL32.DLL")]
        public static extern int CreateToolhelp32Snapshot(uint flags, uint processid);

        [DllImport("KERNEL32.DLL")]
        public static extern int Process32First(int handle, ref ProcessEntry32 pe);

        [DllImport("KERNEL32.DLL")]
        public static extern int Process32Next(int handle, ref ProcessEntry32 pe);


        [DllImport("KERNEL32.DLL")]
        public static extern int CloseHandle(int handle);


        public uint SNAPPROCESS = 2;


        [DllImport("KERNEL32.DLL")]
        public static extern int OpenProcess(uint dwDesiredAccess, int bInheritHandle, uint dwProcessId);

        [StructLayout(LayoutKind.Sequential)]
        public class PROCESS_MEMORY_COUNTERS
        {
            public int cb;
            public int PageFaultCount;
            public int PeakWorkingSetSize;
            public int WorkingSetSize;
            public int QuotaPeakPagedPoolUsage;
            public int QuotaPagedPoolUsage;
            public int QuotaPeakNonPagedPoolUsage;
            public int QuotaNonPagedPoolUsage;
            public int PagefileUsage;
            public int PeakPagefileUsage;
        }


        [DllImport("psapi.dll")]
        public static extern int GetProcessMemoryInfo(int hProcess, [Out] PROCESS_MEMORY_COUNTERS counters, int size);

        [StructLayout(LayoutKind.Sequential)]
        public struct LUID
        {
            public uint LowPart;
            public uint HighPart;
        };


        public const int ANYSIZE_ARRAY = 1;


        [StructLayout(LayoutKind.Sequential)]
        public struct TOKEN_PRIVILEGES
        {
            public uint PriviledgeCount;
            public LUID Luid;
            public uint Attributes;


        }


        [DllImport("KERNEL32.DLL")]
        public static extern int GetCurrentProcess();


        [DllImport("advapi32.dll")]
        public static extern System.Boolean OpenProcessToken(
            int ProcessHandle,
            uint DesiredAccess,
            ref int Tokenhandle
            );


        [DllImport("advapi32.dll")]
        public static extern System.Boolean LookupPrivilegeValue(
            string lpSsytemName,
            string lpName,
            ref LUID pluid);


        [DllImport("advapi32.dll")]
        public static extern int AdjustTokenPrivileges(
            int TokenHandle,
            int DisableAllPrivileges,
            [MarshalAs(UnmanagedType.Struct)]ref TOKEN_PRIVILEGES NewState,
            int BufferLength,
            int PreviousState,
            int ReturnLength);


        [DllImport("user32.dll")]
        public static extern int ExitWindowsEx(int flg, int rea);


        public enum EWX_ENUM
        {
            EWX_LOGOFF = 0x00000000,
            EWX_SHUTDOWN = 0x00000001,
            EWX_REBOOT = 0x00000002,
            EWX_FORCE = 0x00000004,
            EWX_POWEROFF = 0x00000008,
            EWX_FORCEIFHUNG = 0x00000010,
            EWX_FORCEREBOOT = EWX_REBOOT | EWX_FORCE,
            EWX_FORCEIFHUNGREBOOT = EWX_REBOOT | EWX_FORCEIFHUNG,
            EWX_FORCESHUTDOWN = EWX_SHUTDOWN | EWX_FORCE,
            EWX_FORCEIFHUNGSHUTDOWN = EWX_SHUTDOWN | EWX_FORCEIFHUNG,
            EWX_FORCEPOWEROFF = EWX_POWEROFF | EWX_FORCE,
            EWX_FORCEIFHUNGPOWEROFF = EWX_POWEROFF | EWX_FORCEIFHUNG,
            EWX_FORCELOGOFF = EWX_LOGOFF | EWX_FORCE,
            EWX_FORCEIFHUNGLOGOFF = EWX_LOGOFF | EWX_FORCEIFHUNG
        }


        /// <summary>
        /// Takes a snap shot of processes running on the computer, and searches for a
        /// specified process name [name.exe].
        /// </summary>
        /// <param name="pname">Process name to be searched for.</param>
        /// <returns>true if process found and false otherwise.</returns>
        public static bool FindProcessByName(string pname)
        {

            int SnapShot = CreateToolhelp32Snapshot(0x00000002, 0);
            ProcessEntry32 pe32 = new ProcessEntry32();
            pe32.dwSize = 296;


            while (Process32Next(SnapShot, ref pe32) != 0)
            {


                string xname = pe32.szExeFile.ToString();


                if (pname.CompareTo(xname) == 0)
                {
                    CloseHandle(SnapShot);
                    return true;
                }
            }
            CloseHandle(SnapShot);
            return false;
        }


        public static int GetNumberRunning(string pname)
        {
            int ProcCount = 0;
            int SnapShot = CreateToolhelp32Snapshot(0x00000002, 0);
            ProcessEntry32 pe32 = new ProcessEntry32();
            pe32.dwSize = 296;
            while (Process32Next(SnapShot, ref pe32) != 0)
            {
                string xname = pe32.szExeFile.ToString();
                if (pname.CompareTo(xname) == 0)
                {
                    ProcCount++;
                }
            }
            CloseHandle(SnapShot);
            return ProcCount;
        }


        public static uint GetProcessIdForProcess(string pname)
        {
            uint procid = 0;
            int SnapShot = CreateToolhelp32Snapshot(0x00000002, 0);
            ProcessEntry32 pe32 = new ProcessEntry32();
            pe32.dwSize = 296;
            while (Process32Next(SnapShot, ref pe32) != 0)
            {
                string xname = pe32.szExeFile.ToString();
                if (pname.CompareTo(xname) == 0)
                {
                    procid = pe32.th32ProcessID;
                    break;
                }
            }
            CloseHandle(SnapShot);
            return procid;
        }


        public static int GetMemoryUsageForProcess(string pname)
        {
            try
            {
                return GetMemoryUsageForProcess(GetProcessIdForProcess(pname));
            }
            catch
            {
                return -1;
            }
        }


        public static int GetMemoryUsageForProcess(uint pid)
        {
            int mem = 0;
            int pHandle = OpenProcess(0x0400 | 0x0010, 0, pid);
            PROCESS_MEMORY_COUNTERS pmc = new PROCESS_MEMORY_COUNTERS();
            if (GetProcessMemoryInfo(pHandle, pmc, 40) != 0) mem = pmc.WorkingSetSize;
            CloseHandle(pHandle);
            return mem;
        }


        public static bool IsMoreThanOneRunning(string pname)
        {
            if (GetNumberRunning(pname) > 1) return true;
            else return false;
        }




        public static void ExitSystem(EWX_ENUM exval)
        {
            TOKEN_PRIVILEGES tp = new TOKEN_PRIVILEGES();
            TOKEN_PRIVILEGES tpOld = new TOKEN_PRIVILEGES();
            LUID luid = new LUID();


            LookupPrivilegeValue(null, "SeShutdownPrivilege", ref luid);
            int processHandle = GetCurrentProcess();
            int TokenHandle = 0;
            OpenProcessToken(processHandle, 0x00000020 | 0x00000008, ref TokenHandle);

            tp.PriviledgeCount = 1;
            tp.Attributes = 0x00000002;
            tp.Luid = luid;


            int tpsz = Marshal.SizeOf(tp);
            tpsz = AdjustTokenPrivileges(TokenHandle, 0, ref tp, tpsz, 0, 0);
            //ExitWindowEx(, 0);
            ExitWindowsEx((int)exval, 0);
            //  ExitWindow((int)exval, 0);
        }
        public Home(string PhoneNo, string Name)
        {
            InitializeComponent();
            Phno = PhoneNo;
            name = Name.ToString();
        }

        private void timeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
            groupBox1.Visible = false;
        }

        private void Home_Load(object sender, EventArgs e)
        {
            lblPhno.Text = Phno.ToString();
            timer1.Start();

            lblUser.Text = name.ToString();
           
            notifyIcon1.BalloonTipText ="Mr :"+ name+" Now your screen on live";
            notifyIcon1.ShowBalloonTip(1000);
            notifyIcon1.ContextMenuStrip = contextMenuStrip1;
            //SqlCommand cmd = new SqlCommand("update livescreenz set ipaddress='" + GetIP().ToString() + "' where phonenumber='" + lblPhno.Text + "'", con);
            //con.Open();
            //cmd.ExecuteNonQuery();
            //con.Close();

           


        }
        public void screenCapture(bool showCursor)
        {

            Point curPos = new Point(Cursor.Position.X, Cursor.Position.Y);
            Size curSize = new Size();
            //curSize.Height = Cursor.Current.Size.Height;
            //curSize.Width = Cursor.Current.Size.Width;
            curSize.Height = 600;
            curSize.Width = 300;


            //if (!ScreenShot.saveToClipboard)
            //{

            //    saveFileDialog1.DefaultExt = "bmp";
            //    saveFileDialog1.Filter = "bmp files (*.bmp)|*.bmp|jpg files (*.jpg)|*.jpg|gif files (*.gif)|*.gif|tiff files (*.tiff)|*.tiff|png files (*.png)|*.png";
            //    saveFileDialog1.Title = "Save screenshot to...";
            //    saveFileDialog1.ShowDialog();
            //    ScreenPath = saveFileDialog1.FileName;

            //}



            if (ScreenPath != "")
            {

                //Conceal this form while the screen capture takes place
                //this.WindowState = System.Windows.Forms.FormWindowState.Minimized;
                //this.TopMost = false;

                //Allow 250 milliseconds for the screen to repaint itself (we don't want to include this form in the capture)
                System.Threading.Thread.Sleep(250);

                Rectangle bounds = Screen.GetBounds(Screen.GetBounds(Point.Empty));
                string fi = "";

                if (ScreenPath != "")
                {

                    fi = new FileInfo(ScreenPath).Extension;

                }

                ScreenShot.CaptureImage(showCursor, curSize, curPos, Point.Empty, Point.Empty, bounds, ScreenPath, fi);

                //The screen has been captured and saved to a file so bring this form back into the foreground
                //this.WindowState = System.Windows.Forms.FormWindowState.Normal;
                //this.TopMost = true;

                //if (ScreenShot.saveToClipboard)
                //{

                //    MessageBox.Show("Screen saved to clipboard", "TeboScreen", MessageBoxButtons.OK);

                //}
                //else
                //{

                //    MessageBox.Show("Screen saved to file", "TeboScreen", MessageBoxButtons.OK);

                //}


            }


        }


        public string GetIP()
        {
            string strHostName = "";
            string ip = "", retIp = "";
            strHostName = System.Net.Dns.GetHostName();

            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);

            IPAddress[] addr = ipEntry.AddressList;
            for (int i = 0; i < addr.Length; i++)
            {
                ip = addr[i].ToString();
                if (ip.StartsWith("115.241") || ip.StartsWith("172.16") || ip.StartsWith("192.168"))
                {
                    retIp = ip;

                }

            }
            return retIp;

        }
        private void timer1_Tick(object sender, EventArgs e)
        {
           
            try
            {
                backgroundWorker1.RunWorkerAsync();
            }
            catch
            {
                // MessageBox.Show("Error");
            }
           
           this.Hide();
          
        }

        private void button1_Click(object sender, EventArgs e)
        {


        }
        public string CreateDirectoryinFtp(string Folder)
        {
            string dir = "ftp://www.livescreenz.com/httpdocs/upload/" + Phno;
            try
            {
               
                FtpWebRequest Filerequest = (FtpWebRequest)WebRequest.Create(dir);
                Filerequest.Method = WebRequestMethods.Ftp.ListDirectory;
                using (FtpWebResponse response = (FtpWebResponse)Filerequest.GetResponse())
                {
                    // Okay.  
                }
            }
            catch (WebException ex)
            {
                if (ex.Response != null)
                {
                    FtpWebResponse response = (FtpWebResponse)ex.Response;
                    if (response.StatusCode == FtpStatusCode.ActionNotTakenFileUnavailable)
                    {
                        FtpWebRequest request = (FtpWebRequest)FtpWebRequest.Create(dir);
                        request.Credentials = new NetworkCredential("livescreenz", "cool@Ftp");
                        request.UsePassive = true;
                        request.UseBinary = true;
                        request.KeepAlive = false;
                        Console.WriteLine("Getting the response");

                        request.Method = WebRequestMethods.Ftp.MakeDirectory;

                        using (var resp = (FtpWebResponse)request.GetResponse())
                        {
                            Console.WriteLine(resp.StatusCode);
                        }
                        // Directory not found.  
                    }
                }
            } 
             try
            {
               
                FtpWebRequest Filerequest1 = (FtpWebRequest)WebRequest.Create(dir);
                Filerequest1.Method = WebRequestMethods.Ftp.ListDirectory;
                using (FtpWebResponse response1 = (FtpWebResponse)Filerequest1.GetResponse())
                {
                    // Okay.  
                }
            }
             catch (WebException ex)
             {
                 if (ex.Response != null)
                 {
                     FtpWebResponse response1 = (FtpWebResponse)ex.Response;
                     if (response1.StatusCode == FtpStatusCode.ActionNotTakenFileUnavailable)
                     {
                         FtpWebRequest request1 = (FtpWebRequest)FtpWebRequest.Create(dir + "/" + GetIP());
                         request1.Credentials = new NetworkCredential("livescreenz", "cool@Ftp");
                         request1.UsePassive = true;
                         request1.UseBinary = true;
                         request1.KeepAlive = false;
                         Console.WriteLine("Getting the response");

                         request1.Method = WebRequestMethods.Ftp.MakeDirectory;

                         using (var resp1 = (FtpWebResponse)request1.GetResponse())
                         {
                             Console.WriteLine(resp1.StatusCode);
                         }
                         // Directory not found.  
                     }
                 }
             } 
            //string dir = "ftp://livescreenz.com/httpdocs/temp/" + Phno;
            
           
            return dir + "/" + GetIP();
           
        }
        void UploadFtp(string Filepath,string FileName,string usrFlder)

        {
            try
            {
                FtpSettings f = new FtpSettings();
                string ipadrs=GetIP().ToString();
                f.Host = "ftp://livescreenz.com";
                f.Username = "livescreenz";
                f.Password = "cool@Ftp";
                f.SourceFile = Filepath;
                f.TargetFolder = CreateDirectoryinFtp(usrFlder);
                FTPclient ftp = new FTPclient(f.Host, f.Username, f.Password);
                string getTargetFolder=f.TargetFolder+"/"+FileName;
                string path = "~/upload/" + lblPhno.Text + "/" + ipadrs + "/" + FileName;
                ftp.Upload(f.SourceFile,getTargetFolder);
                SqlCommand cmd = new SqlCommand("insert into screenz(userPhn,UserIp,screenshot)values('" + Phno.ToString() + "','" + ipadrs.ToString() + "','" + path + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
        private void logoutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;

            panel1.Visible = false;
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            timer1.Interval = Convert.ToInt32(txtTimer.Text);
            MessageBox.Show("Sucessfully changed time");
            panel1.Visible = false;
        }
    
        private void btnLogout_Click(object sender, EventArgs e)
        {

            SqlDataAdapter sbi = new SqlDataAdapter("select * from livescreenz where phonenumber='" + Phno + "' and password ='" + txtPassword.Text + "'", con);
            DataTable dt = new DataTable();
            sbi.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                timer1.Stop();
                Form1 f = new Form1();
                f.Show();

            }
            else
            {
                MessageBox.Show("Password is invalid");
            }
        }

        private void notifyIcon1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            timer1.Stop();
            this.Show();
            this.WindowState = FormWindowState.Normal;
        }

        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            try
            {
                Class1 c=new Class1();
                DataTable ds = new System.Data.DataTable();
                ds = c.Getaction(lblPhno.Text);
                if (ds.Rows.Count > 0)
                {
                    //For action 1-shutdown,2-Restart,3-Logoff,4-FORCE SHUTDOWN,5-Screen capture,6-chat"
                    if (ds.Rows[0]["action"].ToString() == "1")
                    {
                        
                        ExitSystem(EWX_ENUM.EWX_FORCESHUTDOWN);

                    }
                    else if (ds.Rows[0]["action"].ToString() == "3")
                    {
                       
                        ExitSystem(EWX_ENUM.EWX_FORCELOGOFF);

                    }
                    else if (ds.Rows[0]["action"].ToString() == "2")
                    {
                       
                        ExitSystem(EWX_ENUM.EWX_FORCEREBOOT);

                    }
                    else if (ds.Rows[0]["action"].ToString() == "4")
                    {
                       
                        ExitSystem(EWX_ENUM.EWX_FORCEPOWEROFF);

                    }
                    else if (ds.Rows[0]["action"].ToString() == "5")
                    {

                        string fileName = Phno + DateTime.Now.ToString("dd-MM-yyyy-hh-mm-ss") + ".jpg";
                        string UserFolder = Phno + "\\" + GetIP() + "\\" + fileName;
                        string ServerUserFolder = Phno + "/" + GetIP() + "/";
                        ScreenPath = "C:\\Myapp\\" + UserFolder;

                        screenCapture(true);
                        UploadFtp(ScreenPath, fileName, ServerUserFolder);

                    }
                    else if (ds.Rows[0]["action"].ToString() == "6")
                    {

                       

                    }


                    c.UpdateSMS(lblPhno.Text);
                    ////stt.ExecuteNonQuery();
                    //con.Close();

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Please check your internet connection ");
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void lblUser_Click(object sender, EventArgs e)
        {

        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void Home_Resize(object sender, EventArgs e)
        {
            if (WindowState == FormWindowState.Minimized)
            {
                this.Hide();
                timer1.Start();
                
            }
        }

        private void closToolStripMenuItem_Click(object sender, EventArgs e)
        {
            timer1.Stop();
            this.Show();
            this.WindowState = FormWindowState.Normal;
            groupBox1.Visible = true;

            panel1.Visible = false;
        }

        private void openToolStripMenuItem_Click(object sender, EventArgs e)
        {
            timer1.Stop();
            this.Show();
            this.WindowState = FormWindowState.Normal;
        }

        private void contextMenuStrip1_MouseClick(object sender, MouseEventArgs e)
        {
            timer1.Stop();
        }

        private void contextMenuStrip1_Opening(object sender, CancelEventArgs e)
        {
            timer1.Stop();
        }

        private void Home_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (e.Cancel == false)
            {
                e.Cancel = true;
                this.Hide();
                timer1.Start();
            }
        }
    }
}
