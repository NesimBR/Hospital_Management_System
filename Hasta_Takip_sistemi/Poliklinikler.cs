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
    public partial class Poliklinikler : Form
    {



        public Poliklinikler()
        {
            InitializeComponent();
        }



        private void label2_Click(object sender, EventArgs e)
        {

        }




        SqlConnection con = new SqlConnection("Server=.;Database = Hastane;Integrated Security=true");
        private void Poliklinikler_Load(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;  

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PoliklinikAdd";
            komut.Parameters.AddWithValue("PoliklinikAdi", textBox2.Text);
            komut.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            komut.Parameters.AddWithValue("PoliklinikBaskani", textBox4.Text);
            komut.Parameters.AddWithValue("PoliklinikBasHemsire", textBox5.Text);
            komut.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
            komut.ExecuteNonQuery();
            con.Close();
            Pgetir();
           
        }
     
        public void Pgetir()
        {
            if (dataGridView1.Visible == false)
            {
                dataGridView1.Visible = true;
            }
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PoliklinikG";
            SqlDataAdapter dp = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
        }
     
        private void button5_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            Pgetir();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if(dataGridView1.Visible == false)
            {
                dataGridView1.Visible = true;
            }

           
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PoliklinikNoAra";
            komut.Parameters.AddWithValue("PoliklinikNo", textBox7.Text);
            SqlDataAdapter dp = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            dataGridView1.DataSource = dt;
            


        }

        private void button11_Click(object sender, EventArgs e)
        {

            con.Open();
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;

            komut.CommandType=CommandType.StoredProcedure;
            komut.CommandText = "PAra";

            komut.Parameters.AddWithValue("PNO",textBox7.Text);
            komut.Parameters.AddWithValue("PAdi",textBox8.Text);

            
            SqlDataAdapter dp = new SqlDataAdapter(komut);
            DataTable dt = new DataTable();
            dp.Fill(dt);
            
            dataGridView1.DataSource = dt; 

            textBox7.Clear();
            textBox8.Clear();   
            

        }

        private void button4_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = false;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;
            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "PoliklinikGA";
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
            komut.CommandText = "PoliklinikGZ";
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
            komut.CommandText = "PoliklinikSil";
            komut.Parameters.AddWithValue("PoliklinikNo", textBox9.Text);
            komut.ExecuteNonQuery();
            con.Close();
            Pgetir();
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
            komut.CommandText = "PoliklinikY";
            komut.Parameters.AddWithValue("PoliklinikNo", textBox1.Text);
            komut.Parameters.AddWithValue("PoliklinikAdi", textBox2.Text);
            komut.Parameters.AddWithValue("PoliklinikUzmanSayisi", textBox3.Text);
            komut.Parameters.AddWithValue("PoliklinikBaskani", textBox4.Text);
            komut.Parameters.AddWithValue("PoliklinikBasHemsire", textBox5.Text);
            komut.Parameters.AddWithValue("YatakSayisi", textBox6.Text);
         
            komut.ExecuteNonQuery();
            con.Close();
            Pgetir();
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
            textBox6.Text = dataGridView1.Rows[sectim].Cells[5].Value.ToString();
        }

        private void button12_Click(object sender, EventArgs e)
        {
            Poliklinikler NewForm = new Poliklinikler();
            NewForm.Show();
            this.Dispose(false);
        }
    }
}
