using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Hasta_Takip_sistemi
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=.;Database = Hastane;Integrated Security=true");
        private void Form1_Load(object sender, EventArgs e)
        {
           panel1.Visible = false;  
        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "AddKullanici";
            komut.Parameters.AddWithValue("KullaniciAdi", textBox3.Text);
            komut.Parameters.AddWithValue("sifre", textBox4.Text);
            komut.Parameters.AddWithValue("Mail", textBox5.Text);
            komut.Parameters.AddWithValue("Telefon", textBox6.Text);
            komut.ExecuteNonQuery();
            con.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            panel1.Visible = true;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "Kullanicilist";
            komut.Parameters.AddWithValue("KullaniciAdi", textBox1.Text);
            komut.Parameters.AddWithValue("sifre", textBox2.Text);
            con.Open();
            SqlDataReader dr;

            con.Open();
            dr = komut.ExecuteReader();

            if (dr.Read())
            {
                Form2 form = new Form2();
                form.ShowDialog();
                this.Hide();


            }
            else
            {
                MessageBox.Show("Hatalı Giriş");
                textBox1.Clear();   
                textBox2.Clear();   
            }
            con.Close();
        }
    }
}
