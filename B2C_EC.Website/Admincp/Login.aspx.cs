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
using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Website;

namespace B2C_EC.Website.Admincp
{
    public partial class Login : System.Web.UI.Page
    {
        private UserRepo userRepo = new UserRepo();
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User user = userRepo.GetUserByUsername(txtUserName.Text);
           
            if (user != null)
            {
                string Password = Security.Encrypt(user.Key, txtPass.Text);
                if (user.Password.Equals(Password))
                {
                    if (user.IsActive)
                    {
                        user.LastLogin = DateTime.Now;
                        userRepo.UpdateUser(user);
                        FormsAuthentication.SetAuthCookie(txtUserName.Text, cbRemember.Checked);
                        Response.Redirect("~/Admincp/Index.aspx");
                    }
                    else
                    {
                        lbErrorUser.Text = "This user is locked!";
                    }
                }
                else
                {
                    lbErrorUser.Text = "Username/password provided is incorrect!";
                }
            }
            else
            {
                lbErrorUser.Text = "Username/password provided is incorrect!";
            }
        }
    }
}