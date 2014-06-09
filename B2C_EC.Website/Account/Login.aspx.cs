using B2C_EC.Model;
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
        B2C_ECEntities db = new B2C_ECEntities();
        //SalesPhoneOnlineEntitiesDatabase db2 = new SalesPhoneOnlineEntitiesDatabase();
        
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
                User acc = (new UserRepo()).GetUserByLogin(txtUser.Text);
                if (acc != null)
                {
                    string Pass = Security.Encrypt(acc.Keys, txtPass.Text);
                    return acc.Password.Equals(Pass) ? true : false;
                }
            }
            catch
            {
                Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không đúng')</script>");
            }
            return status;
        }
        #endregion

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool status = CheckAccount(txtUser.Text, txtPass.Text);
            byte[] data = Encoding.ASCII.GetBytes(txtPass.Text);
            SHA512 sha5 = new SHA512Managed();
            byte[] result = sha5.ComputeHash(data);
            string chuoiMaHoa = Encoding.ASCII.GetString(result);
            User acc = (new UserRepo()).GetUserByLogin(txtUser.Text);
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
                lbLoiUser.Text = "<script>alert('Tên đăng nhập hoặc Mật khẩu không đúng')</script>";
            }
            else if (status == true)
            {
                FormsAuthentication.SetAuthCookie(txtUser.Text, cbRemember.Checked);
                //Response.RedirectToRoute("Trang-Chu", new { ViTri = acc.positionid });
                Response.Redirect("~/Admincp/Default.aspx");
            }
        }
    }
}