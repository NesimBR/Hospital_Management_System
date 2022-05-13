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
    public partial class Doktorlar : Form
    {
        public Doktorlar()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server=.;Database = Hastane;Integrated Security=true");
        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Doktorlar_Load(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;
        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorSil";
            komut.Parameters.AddWithValue("DoktorNo", textBox1.Text);
            komut.ExecuteNonQuery();
            con.Close();
            Dgetir();
        }

        private void label10_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorAdd";
            komut.Parameters.AddWithValue("AdSoyad", textBox2.Text);
            komut.Parameters.AddWithValue("TCNo", textBox3.Text);
            komut.Parameters.AddWithValue("UzmanlikAlani", textBox4.Text);
            komut.Parameters.AddWithValue("Unvan", textBox5.Text);
            komut.Parameters.AddWithValue("Telefon", maskedTextBox1.Text);
            komut.Parameters.AddWithValue("Adres", textBox6.Text);
            komut.Parameters.AddWithValue("DogumTarihi", SqlDbType.Date).Value = dateTimePicker1.Value.Date;
            komut.Parameters.AddWithValue("PoliklinikNo", textBox7.Text);
            komut.ExecuteNonQuery();
            con.Close();
            Dgetir();
        }
        public void Dgetir()
        {
            if (dataGridView1.Visible == false)
            {
                dataGridView1.Visible = true;
            }
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorG";
            SqlDataAdapter dp = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Dgetir();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;
        }

        private void button10_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void button9_Click(object sender, EventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
            this.Hide();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorGA";
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
            komut.CommandText = "DoktorGZ";
            SqlDataAdapter dp = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "DoktorY";
            komut.Parameters.AddWithValue("DoktorNo", textBox1.Text);
            komut.Parameters.AddWithValue("AdSoyad", textBox2.Text);
            komut.Parameters.AddWithValue("TCNo", textBox3.Text);
            komut.Parameters.AddWithValue("UzmanlikAlani", textBox4.Text);
            komut.Parameters.AddWithValue("Unvan", textBox5.Text);
            komut.Parameters.AddWithValue("Telefon", maskedTextBox1.Text);
            komut.Parameters.AddWithValue("Adres", textBox6.Text);
            komut.Parameters.AddWithValue("DogumTarihi", SqlDbType.Date).Value = dateTimePicker1.Value.Date;
            komut.Parameters.AddWithValue("PoliklinikNo", textBox7.Text);

            komut.ExecuteNonQuery();
            con.Close();
            Dgetir();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sectim = dataGridView1.SelectedCells[0].RowIndex;
            textBox1.Text = dataGridView1.Rows[sectim].Cells[0].Value.ToString();
            textBox9.Text = dataGridView1.Rows[sectim].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sectim].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[sectim].Cells[2].Value.ToString();
            textBox4.Text = dataGridView1.Rows[sectim].Cells[3].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sectim].Cells[4].Value.ToString();
            maskedTextBox1.Text = dataGridView1.Rows[sectim].Cells[5].Value.ToString();
            textBox6.Text = dataGridView1.Rows[sectim].Cells[6].Value.ToString();
            dateTimePicker1.Value= Convert.ToDateTime(dataGridView1.Rows[sectim].Cells[7].Value.ToString());
            textBox7.Text = dataGridView1.Rows[sectim].Cells[8].Value.ToString();

        }

        private void button12_Click(object sender, EventArgs e)
        {
            Doktorlar NewForm = new Doktorlar();
            NewForm.Show();
            this.Dispose(false);
        }
    }
}
