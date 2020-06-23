﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CaseCompetitionApp
{
    public partial class AdminAnnounce : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                clearfields();
            }
        }

        protected void btnNewsClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string mainconn = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(mainconn);
                con.Open();
                SqlCommand sqlcomm = new SqlCommand();
                string insertSql = "INSERT INTO [News](Feed) OUTPUT INSERTED.NewsId VALUES (@Feed);";
                SqlCommand cmd = new SqlCommand(insertSql, con);

                cmd.Parameters.AddWithValue("@Feed", txtNews.Text);

                var NewsId = (int)cmd.ExecuteScalar();

                Response.Redirect("AdminAnnounce.aspx");
            }

        }

            protected void btnClear_Click(object sender, EventArgs e)
            {
                clearfields();
            }

            protected void clearfields()
            {
            txtNews.Text = "";
            }
        
    }
}