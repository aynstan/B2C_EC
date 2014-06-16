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

        private bool CheckUser()
        {
            bool result = true;
            if ((new UserRepo().DoesUsernameExist(txtUserName.Text)))
            {
                ltrError.Text += "<li>Username is already exists</li>";
                result = false;
            }
            return result;
        }

        private bool CheckEmail()
        {
            bool result = true;
            if ((new UserRepo().DoesEmailExist(txtEmail.Text)))
            {
                ltrError.Text += "<li>Email is already exists</li>";
                result = false;
            }
            return result;
        }

        private bool ValidationUser()
        {
            bool result = true;
            ltrError.Text = "<ul style='color:red; font-size:13pt;'>";
            if (!CheckUser() || !CheckEmail())
                result = false;
            ltrError.Text += "</ul>";
            return result;
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
            if (ViewState["UserEdit"] == null && !ValidationUser())
            {
                ltrError.Visible = true;
                return;
            }
            if (ViewState["UserEdit"] != null && !CheckEmail())
            {
                ltrError.Visible = true;
                return;
            }
            User user = new User();
            user.FirstName = txtFirstName.Text;
            user.LastName = txtLastName.Text;
            user.Username = txtUserName.Text;
            user.Key = ConfigurationManager.AppSettings["KeyUser"];
            user.Password = Security.Encrypt(user.Key, txtPassword.Text);
            if (user.Address == null)
                user.Address = new Address();
            user.Address.Street1 = txtStreet1.Text;
            user.Address.Street2 = txtStreet2.Text;
            user.Address.City = txtCity.Text;
            user.Address.State = txtState.Text;
            user.Address.Country = txtCountry.Text;
            user.Address.ZipCode = txtZipCode.Text;
            user.Phone = txtPhone.Text;
            user.Email = txtEmail.Text;
            user.IsActive = chkIsActive.Checked;
            if ((new UserRepo()).CreateUser(user) > 0)
            {
                Response.Redirect("~/Admincp/Management-User.aspx");
            }
        }
    }
}