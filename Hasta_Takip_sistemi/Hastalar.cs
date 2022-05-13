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
    public partial class Hastalar : Form
    {
        public Hastalar()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=.;Database = Hastane;Integrated Security=true");

        private void Hastalar_Load(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DoktorNoSec";
            SqlDataReader dr; 

            con.Open();
            dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                comboBox1.Items.Add(dr["DoktorNo"]);

            }
            con.Close();
           
        }

        private void button9_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
            this.Hide();
        }

        private void button10_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaY";
            komut.Parameters.AddWithValue("HastaNo", textBox1.Text);
            komut.Parameters.AddWithValue("HastaAdSoyad", textBox2.Text);
            komut.Parameters.AddWithValue("HastaTCNo", textBox3.Text);
            komut.Parameters.AddWithValue("HastaDogumTarihi", SqlDbType.Date).Value = dateTimePicker1.Value.Date;
            komut.Parameters.AddWithValue("boy", textBox4.Text);
            komut.Parameters.AddWithValue("yas", textBox5.Text);
            komut.Parameters.AddWithValue("OdaNo", textBox6.Text);
            komut.Parameters.AddWithValue("Recete", textBox13.Text);
            komut.Parameters.AddWithValue("RaporDurumu", textBox7.Text);
            komut.Parameters.AddWithValue("RandevuTarihi", SqlDbType.Date).Value = dateTimePicker2.Value.Date;
            komut.Parameters.AddWithValue("DoktorNo", comboBox1.Text);

            komut.ExecuteNonQuery();
            con.Close();
            Hgetir();
        }
        public void Hgetir()
        {
            if (dataGridView1.Visible == false)
            {
                dataGridView1.Visible = true;
            }
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaTG";
            SqlDataAdapter dp = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;

        }

        private void button5_Click(object sender, EventArgs e)
        {
            Hgetir();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaTGA";
            SqlDataAdapter dp = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button7_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaTGZ";
            SqlDataAdapter dp = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;

        }

        private void button8_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaSill";
            komut.Parameters.AddWithValue("HastaNo", textBox11.Text);
            komut.ExecuteNonQuery();
            con.Close();
            Hgetir();
        }

        private void button12_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "HastaAdd";
            komut.Parameters.AddWithValue("HastaAdSoyad", textBox2.Text);
            komut.Parameters.AddWithValue("HastaTCNo", textBox3.Text);
            komut.Parameters.AddWithValue("HastaDogumTarihi", SqlDbType.Date).Value = dateTimePicker1.Value.Date;
            komut.Parameters.AddWithValue("boy", textBox4.Text);
            komut.Parameters.AddWithValue("yas", textBox5.Text);
            komut.Parameters.AddWithValue("OdaNo", textBox6.Text);
            komut.Parameters.AddWithValue("Recete", textBox13.Text);
            komut.Parameters.AddWithValue("RaporDurumu", textBox7.Text);
            komut.Parameters.AddWithValue("RandevuTarihi", SqlDbType.Date).Value = dateTimePicker2.Value.Date;
            komut.Parameters.AddWithValue("DoktorNo", comboBox1.Text);
            komut.ExecuteNonQuery();
            con.Close();
            Hgetir();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sectim = dataGridView1.SelectedCells[0].RowIndex;
            textBox1.Text = dataGridView1.Rows[sectim].Cells[0].Value.ToString();
            textBox11.Text = dataGridView1.Rows[sectim].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sectim].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[sectim].Cells[2].Value.ToString();
            dateTimePicker1.Value = Convert.ToDateTime(dataGridView1.Rows[sectim].Cells[3].Value.ToString());
            textBox4.Text = dataGridView1.Rows[sectim].Cells[4].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sectim].Cells[5].Value.ToString();
            textBox6.Text = dataGridView1.Rows[sectim].Cells[6].Value.ToString();
            textBox13.Text = dataGridView1.Rows[sectim].Cells[7].Value.ToString();
            textBox7.Text = dataGridView1.Rows[sectim].Cells[8].Value.ToString();
            dateTimePicker2.Value = Convert.ToDateTime(dataGridView1.Rows[sectim].Cells[9].Value.ToString());
            comboBox1.Text = dataGridView1.Rows[sectim].Cells[10].Value.ToString();
        }

        private void button13_Click(object sender, EventArgs e)
        {
            Hastalar NewForm = new Hastalar();
            NewForm.Show();
            this.Dispose(false);
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}
