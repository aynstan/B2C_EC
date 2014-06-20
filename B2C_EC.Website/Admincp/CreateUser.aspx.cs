using B2C_EC.Model;
using B2C_EC.Model.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2C_EC.Website.Admincp
{
    public partial class CreateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
        public static bool KiemTraTenDangNhap(string TenDangNhap)
        {
            bool check = (new UserRepo()).DoesUsernameExist(TenDangNhap);
            return !check;
        }
        [System.Web.Services.WebMethod]
        public static bool KiemTraEmail(string Email)
        {
            bool check = (new UserRepo()).DoesEmailExist(Email);
            return !check;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            UserRepo userrepo =new UserRepo();
            lbMessage.Text = "";
            if (userrepo.DoesUsernameExist(txtUserName.Text))
            {
                lbMessage.Text = "Username already exists!";
                lbMessage.ForeColor = System.Drawing.Color.Red;
                txtUserName.Text = "";
                return;
            }
            if (userrepo.DoesEmailExist(txtEmail.Text))
            {
                lbMessage.Text = "Email already exists!";
                lbMessage.ForeColor = System.Drawing.Color.Red;
                txtEmail.Text = "";
                return;
            }
            User user = new User();
            user.FirstName = txtFirstName.Text;
            user.LastName = txtLastName.Text;
            user.Username = txtUserName.Text;
            user.Key = ConfigurationManager.AppSettings["KeyUser"];
            user.Password = Security.Encrypt(user.Key, txtPassword.Text);
            user.Phone = txtPhone.Text;
            user.Email = txtEmail.Text;
            user.Address = new Address();
            user.Address.Street1 = txtStreet1.Text;
            user.Address.Street2 = txtStreet2.Text;
            user.Address.City = txtCity.Text;
            user.Address.State = txtState.Text;
            user.Address.Country = txtCountry.Text;
            user.Address.ZipCode = txtZipCode.Text;
            user.DateCreated = DateTime.Now;
            user.IsActive = true;
            user.IsAdmin = false;
            if ((new UserRepo()).CreateUser(user) > 0)
            {
                Response.Redirect("~/Admincp/Management-User.aspx");
            }
        }
    }
}