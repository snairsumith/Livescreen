using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Livescreen
{
    public partial class DownloadFiles : Form
    {
        public string pno="";
        Class1 obj = new Class1();
        public DownloadFiles(string phno)
        {
            InitializeComponent();
            pno = phno;
        }

        private void button1_Click(object sender, EventArgs e)
        {
          
        }

        private void DownloadFiles_Load(object sender, EventArgs e)
        {
            dataGridView1.DataSource = obj.GetDownloadeFiles(pno);

        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
