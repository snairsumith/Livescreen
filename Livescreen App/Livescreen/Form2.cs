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
    public partial class Form2 : Form
    {
        Class1 c = new Class1();

        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string filename1 = "18989/";
            string ftpServerIP1 = "ftp://livescreenz.com";  
            FileInfo fileInf = new FileInfo(filename1);
            string uri = "ftp://livescreenz.com" + "/" + fileInf.Name;

            FtpWebRequest reqFTP;
            // Create FtpWebRequest object from the Uri provided

            reqFTP = (FtpWebRequest)FtpWebRequest.Create
            (new Uri("ftp://" + ftpServerIP1 + "/" + fileInf.Name));

            // Provide the WebPermission Credintials
            reqFTP.Credentials = new NetworkCredential("livescreenz","cool@Ftp");

            // By default KeepAlive is true, where the control connection

            // is not closed after a command is executed.
            reqFTP.KeepAlive = false;

            // Specify the command to be executed.
            reqFTP.Method = WebRequestMethods.Ftp.UploadFile;

            // Specify the data transfer type.
            reqFTP.UseBinary = true;

            // Notify the server about the size of the uploaded file

            reqFTP.ContentLength = fileInf.Length;



            int buffLength = 500447300;
            byte[] buff = new byte[buffLength];

            int contentLen;
            // Opens a file stream (System.IO.FileStream) to read the file

            // to be uploaded
            FileStream fs = fileInf.OpenRead();

            try
            {

                // Stream to which the file to be upload is written
                Stream strm = reqFTP.GetRequestStream();

                // Read from the file stream 2kb at a time

                contentLen = fs.Read(buff, 0, buffLength);

                // Till Stream content endswhile (contentLen != 0)
                {

                    // Write Content from the file stream to the FTP Upload

                    // Stream

                    strm.Write(buff, 0, contentLen);

                    contentLen = fs.Read(buff, 0, buffLength);

                }

                // Close the file stream and the Request Stream

                strm.Close();

                fs.Close();

            }

            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Upload Error");
            }
        }

    }
}
