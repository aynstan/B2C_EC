﻿using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Website;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HoangQuanMobile.Website.Account
{
    public partial class Login : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    //Response.Write("<font color=White>" + User.Identity.Name.ToString() + "</font>");
                    //dynamic acc = db.Users.SingleOrDefault(em => em.UserName == User.Identity.Name.ToString());
                    //Response.RedirectToRoute("Trang-Chu", new { ViTri = acc.positionid });
                    Response.Redirect("~/Admincp/");
                }
            }
        }

        #region Kiểm tra tài khoản
        /// <summary>
        /// Hàm kiểm tra tài khoản
        /// </summary>
        /// <param name="user">Tên đăng nhập</param>
        /// <param name="pass">Mật khẩu</param>
        /// <returns>Đúng hoặc sai</returns>
        private bool CheckAccount(string user, string pass)
        {
            bool status = false;//Status là cột trạng thái của nhân viên(còn làm hay hết làm)
            try
            {
                User acc = (new UserRepo()).GetUserByUsername(txtUserName.Text);
                if (acc != null)
                {
                    string Pass = Security.Encrypt(acc.Key, txtPass.Text);
                    return acc.Password.Equals(Pass) ? true : false;
                }
            }
            catch
            {
                Response.Write("<script>alert('Username or password is not correct')</script>");
            }
            return status;
        }
        #endregion

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            bool status = CheckAccount(txtUserName.Text, txtPass.Text);
            byte[] data = Encoding.ASCII.GetBytes(txtPass.Text);
            SHA512 sha5 = new SHA512Managed();
            byte[] result = sha5.ComputeHash(data);
            string chuoiMaHoa = Encoding.ASCII.GetString(result);
            User acc = (new UserRepo()).GetUserByUsername(txtUserName.Text);
            string positionid;
            try
            {
                //positionid = acc.positionid.ToString();
            }
            catch
            {
                Response.Redirect("~/Error.html");
            }
            if (status == false)
            {
                lbErrorUser.Text = "<script>alert('Tên đăng nhập hoặc Mật khẩu không đúng')</script>";
            }
            else if (status == true)
            {
                FormsAuthentication.SetAuthCookie(txtUserName.Text, cbRemember.Checked);
                //Response.RedirectToRoute("Trang-Chu", new { ViTri = acc.positionid });
                Response.Redirect("~/Admincp/Index.aspx");
            }
        }
    }
}