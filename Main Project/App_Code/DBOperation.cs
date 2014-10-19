using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for DBOperation
/// </summary>
public class DBOperations
{

    public string getConnectionString()
    {

        //return ("Data Source=.;Initial Catalog=Livescreen;User Id=sa;Password=sqladmin;");
        return ("Data Source=184.154.49.162;Initial Catalog=live;User Id=livedb;Password=X2ala#58;");
      
    }

    public int executeQuery(string strQuery)
    {
        int result = 0;
        try
        {
            using (SqlConnection sqlConn = new SqlConnection(getConnectionString()))
            {
                sqlConn.Open();
                using (SqlCommand sqlCmd = new SqlCommand(strQuery, sqlConn))
                {
                    result = sqlCmd.ExecuteNonQuery();
                    sqlConn.Close();
                }
            }
        }
        catch (Exception exp)
        {

        }
        return (result);
    }

    public DataTable GetDatatable(string strQuery)
    {
        using (SqlConnection sqlConn = new SqlConnection(getConnectionString()))
        {
            try
            {
                {
                    SqlDataAdapter sqlAdp = new SqlDataAdapter(strQuery, sqlConn);
                    DataTable dtResult = new DataTable();
                    sqlAdp.Fill(dtResult);
                    return (dtResult);
                }
            }
            catch (Exception exp)
            {

                return (null);

            }
        }
    }



    public string TransactionSQL(string[] queries)
    {
        using (SqlConnection con = new SqlConnection(getConnectionString()))
        {

            con.Open();
            bool flag = true;
            using (SqlTransaction trans = con.BeginTransaction())
            {
                foreach (string str in queries)
                {
                    if (str != null)

                        if (str.Trim() != "")
                        {
                            try
                            {
                                SqlCommand com = new SqlCommand(str, con);
                                com.Transaction = trans;

                                if (com.ExecuteNonQuery() < 1)
                                {
                                    flag = false;
                                    trans.Rollback();
                                    con.Close();
                                    break;
                                }
                            }
                            catch (Exception exp)
                            {


                                flag = false;
                                trans.Rollback();
                                con.Close();
                                break;
                            }
                        }
                }
                if (flag)
                {
                    trans.Commit();
                    con.Close();
                    return ("success");
                }
                else
                {
                    return ("failure");
                }
            }
        }
        //return ("");
    }







    public string Insert(string QueryString)//Function to insert data into database
    {
        try
        {
            using (SqlConnection objConn = new SqlConnection(getConnectionString()))
            {
                objConn.Open();
                using (SqlCommand objcmd = new SqlCommand(QueryString, objConn))
                {
                    if (objcmd.ExecuteNonQuery() > 0)
                    {
                        objConn.Close();
                        return "success";
                    }
                    else
                        return "failed";
                }

            }
        }
        catch (Exception ex)
        {
            return ex.Message;
        }

    }
    //delete
    public string DeleteRecord(string QueryString)
    {
        try
        {
            using (SqlConnection Conn = new SqlConnection(getConnectionString()))
            {
                Conn.Open();
                using (SqlCommand cmd = new SqlCommand(QueryString, Conn))
                {
                    cmd.CommandText = QueryString;
                    cmd.ExecuteNonQuery();
                }
                Conn.Close();
            }
            return ("Delete Success");
        }
        catch (Exception ex)
        {

            throw ex;
        }


    }

    public string GetValue(string strQuery)
    {
        string result = "";
        try
        {
            using (SqlConnection sqlConn = new SqlConnection(getConnectionString()))
            {
                sqlConn.Open();
                using (SqlCommand sqlCmd = new SqlCommand(strQuery, sqlConn))
                {
                    object objResult = sqlCmd.ExecuteScalar();
                    sqlConn.Close();
                    if (objResult != null)
                    {
                        result = objResult.ToString();
                    }
                }
            }
        }
        catch (Exception exp)
        {

        }
        return (result);
    }

    public string Update(string QueryString)//Function for Update data in database
    {
        try
        {
            using (SqlConnection objConn = new SqlConnection(getConnectionString()))
            {
                objConn.Open();
                using (SqlCommand cmd = new SqlCommand(QueryString, objConn))
                {
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        objConn.Close();
                        return "success";
                    }
                    else
                        return "failed";
                }
            }
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
    }


    //Amarnath (27.07.2010) - to execute the sql transaction
    public string SQLTransaction(string queries)
    {
        SqlConnection con = new SqlConnection(getConnectionString());
        SqlTransaction trans = null;
        con.Open();
        trans = con.BeginTransaction();
        SqlCommand com = new SqlCommand(queries, con);
        com.Transaction = trans;

        try
        {
            if (com.ExecuteNonQuery() > 1)
            {
                trans.Commit();
                return ("success");
            }
            else
            {
                trans.Rollback();
                return ("failed");
            }
        }
        catch (Exception ex)
        {

            return ex.Message;
        }
        finally
        {
            con.Close();
        }
    }

    

}