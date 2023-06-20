using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Member의 요약 설명입니다.
/// </summary>
public class Member
{
    string _conString;

    public Member()
    {
        _conString = System.Configuration.ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
    }

    public DataSet SelectMember()
    {
        SqlConnection con = new SqlConnection(_conString);

        string sql = "SELECT UserID, Password, Name, Phone From Member";
        SqlCommand cmd = new SqlCommand(sql, con);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;

        DataSet ds = new DataSet();
        ad.Fill(ds);

        return ds;
    }

    public DataSet SelectMemberPaging(int startRowIndex, int maximumRows)
    {
        SqlConnection con = new SqlConnection(_conString);

        SqlCommand cmd = new SqlCommand("usp_SelectMemberPaging", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@StartRowIndex", startRowIndex);
        cmd.Parameters.AddWithValue("@MaximumRows", maximumRows);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;

        DataSet ds = new DataSet();
        ad.Fill(ds);

        return ds;
    }

    public int SelectMemberCount()
    {
        SqlConnection con = new SqlConnection(_conString);

        SqlCommand cmd = new SqlCommand("usp_SelectMemberCount", con);
        cmd.CommandType = CommandType.StoredProcedure;

        con.Open();
        int count = (int)cmd.ExecuteScalar();
        con.Close();

        return count;
    }

    public DataSet SelectMemberByUserID(string userID)
    {
        SqlConnection con = new SqlConnection(_conString);

        string sql = "SELECT UserID, Password, Name, Phone From Member WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", userID);

        SqlDataAdapter ad = new SqlDataAdapter();
        ad.SelectCommand = cmd;

        DataSet ds = new DataSet();
        ad.Fill(ds);

        return ds;
    }

    public int InsertMember(string userID, string password, string name, string phone)
    {
        SqlConnection con = new SqlConnection(_conString);

        string sql = "INSERT INTO Member(UserID, Password, Name, Phone) VALUES(@UserID, @Password, @Name, @Phone)";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", userID);
        cmd.Parameters.AddWithValue("@Password", password);
        cmd.Parameters.AddWithValue("@Name", name);
        cmd.Parameters.AddWithValue("@Phone", phone);

        con.Open();
        int count = cmd.ExecuteNonQuery();
        con.Close();

        return count;
    }

    public int UpdateMember(string userID, string password, string name, string phone)
    {
        SqlConnection con = new SqlConnection(_conString);

        string sql = "UPDATE Member SET Password = @Password, Name = @Name, Phone = @Phone WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", userID);
        cmd.Parameters.AddWithValue("@Password", password);
        cmd.Parameters.AddWithValue("@Name", name);
        cmd.Parameters.AddWithValue("@Phone", phone);

        con.Open();
        int count = cmd.ExecuteNonQuery();
        con.Close();

        return count;
    }

    public int DeleteMember(string userID)
    {
        SqlConnection con = new SqlConnection(_conString);

        string sql = "DELETE FROM Member WHERE UserID = @UserID";
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@UserID", userID);

        con.Open();
        int count = cmd.ExecuteNonQuery();
        con.Close();

        return count;
    }
}