using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Livescreen
{
    public partial class ChatWindow : Form
    {
        string phno = "", roomId = "";
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=Livescreen;User Id=sa;Password=$umith;");
        public ChatWindow(string phoneNo)
        {
            InitializeComponent();
            phno = phoneNo;
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if(e.KeyChar==(char)Keys.Enter)

            {
                InsertChat();
            }
        }
        void InsertChat()
        {
          string  Query = "INSERT INTO chat_tbl (userphn,message,roomId) VALUES ('" + phno  + "','" + textBox1.Text + "','" + roomId + "')";
          SqlCommand cmd = new SqlCommand(Query, con);
          con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        void BindChat()
        {
            listBox1.Items.Clear();
            string sql = "select userphn,message from chat_tbl where roomId='" + roomId + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    listBox1.Items.Add(dt.Rows[i]["userphn"].ToString() + " : " + dt.Rows[i]["message"].ToString());
                }
            }
        }
        public void GetCharoomId()
        {
            string sql = "select max(room_id)as roomId from Chat_RoomTbl where ReciverId='" + phno + "'";
            SqlDataAdapter sda = new SqlDataAdapter(sql, con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
           roomId= dt.Rows[0]["roomId"].ToString();
            
        }
        private void button1_Click(object sender, EventArgs e)
        {
            InsertChat();
        }

        private void ChatWindow_Load(object sender, EventArgs e)
        {

        }
    }
}
