using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using AspDotNetStorefrontCore;

namespace WebApplication
{
    /// <summary>
    /// Summary description for WebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService : System.Web.Services.WebService
    {
        SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConn"].ConnectionString);

        [WebMethod]
        public string GetSupplier()
        {
            string SQL = string.Empty;
            SQL = "Select Id,Name from Supplier";
            return Getdatafromdb(SQL);
        }

        [WebMethod]
        public string GetWholeSeller()
        {
            string SQL = string.Empty;
            SQL = "Select id,name from Whole_Seller  ";           
            return Getdatafromdb(SQL);
        }

        [WebMethod]
        public string GetSteeringType()
        {
            string SQL = string.Empty;
            SQL = "Select id ,type from Steering_Type ";
            return Getdatafromdb(SQL);
        }

        [WebMethod]
        public string GetModels()
        {
            string SQL = string.Empty;
            SQL = " Select id, name from Model ";
            return Getdatafromdb(SQL);
        }

        [WebMethod]
        public string GetSFX()
        {
            string SQL = string.Empty;
            SQL = " Select id, name from SFX ";
            return Getdatafromdb(SQL);
        }

        [WebMethod]
        public string GetVariant()
        {
            string SQL = string.Empty;
            SQL = " Select id, name from Variant ";
            return Getdatafromdb(SQL);
        }

        [WebMethod]
        public string GetColor()
        {
            string SQL = string.Empty;
            SQL = " Select id, name from Color ";
            return Getdatafromdb(SQL);
        }

        [WebMethod]
        public string GetQuantitybyMonth(int supplier_id,int whole_seller_id,int steering_type_id,
            int mode_id, int sfx_id, int variant_id , int color_id)
        {
            string SQL = string.Empty;
            SQL = " Select i.Quantity, FORMAT(i.Date, 'MMM yyyy') [Date], i.id " +
                " from Inventory i " +
                " inner join supplier s on s.Id = i.Supplier_id " +
                " inner join Whole_Seller ws on ws.Id = i.Whole_Seller_id " +
                " inner join Steering_Type st on st.Id = i.Steering_Type_id  " +
                " inner join model m on m.id = i.Model_id" +
                " inner join SFX sfx on sfx.id = i.SFX_id" +
                " inner join variant v on v.id = i.Variant_id" +
                " inner join color c on c.id = i.Color_id" +
                " where i.Supplier_id = "+ supplier_id + " " +
                " and i.Whole_Seller_id = " + whole_seller_id + " " +
                " and i.Steering_Type_id = " + steering_type_id + " " +
                " and i.Model_id = " + mode_id + " " +
                " and i.SFX_id = " + sfx_id + " " +
                " and i.Variant_id = " + variant_id + " " +
                " and i.Color_id = " + color_id + " " +
                " order by i.Date ";
            return Getdatafromdb(SQL);
        }


        [WebMethod]
        public void UpdateQuantity(int id,int qty)
        {
            dbconn.Open(); 
            string Sql = "Update Inventory set quantity = "+ qty + " where id = "+id;
            SqlCommand cmd = new SqlCommand(Sql, dbconn);
            cmd.ExecuteNonQuery();
            dbconn.Close();
        }

        public string Getdatafromdb(string SQL)
        {
            Dictionary<string, object> dict = new Dictionary<string, object>();
            dbconn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(SQL, dbconn);
            da.Fill(ds, "Table");
            dbconn.Close();
            foreach (DataTable dt in ds.Tables)
            {
                object[] arr = new object[dt.Rows.Count + 1];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    arr[i] = dt.Rows[i].ItemArray;
                }
                dict.Add(dt.TableName, arr);
            }
            System.Web.Script.Serialization.JavaScriptSerializer json = new System.Web.Script.Serialization.JavaScriptSerializer();
            return json.Serialize(dict);

        }

    }
}
