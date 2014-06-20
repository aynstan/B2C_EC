using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Model.Global;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2C_EC.Website.Admincp
{
    public partial class EditUser : System.Web.UI.Page
    {
        private UserRepo userRepo = new UserRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUser();
            }
        }

        private void LoadUser()
        {
            Model.User u = userRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            if (u != null)
            {
                txtFirstName.Text = u.FirstName;
                txtLastName.Text = u.LastName;
                lblUserName.Text = u.Username;
                txtEmail.Text = u.Email;
                txtPhone.Text = u.Phone;
                if (u.Address != null)
                {
                    txtStreet1.Text = u.Address.Street1;
                    txtStreet2.Text = u.Address.Street2;
                    txtCity.Text = u.Address.City;
                    txtState.Text = u.Address.State;
                    txtCountry.Text = u.Address.Country;
                    txtZipCode.Text = u.Address.ZipCode;
                }
            }
            else
            {
                Response.Redirect("~/Admincp/Management-User.aspx");
            }
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
            Model.User user = userRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            if (user != null)
            {
                lbMessage.Text = "";
                if (userRepo.DoesEmailExist(txtEmail.Text) && !user.Email.ToLower().Equals(txtEmail.Text.ToLower()) && ToSQL.EmptyNull(txtEmail.Text) != "")
                {
                    lbMessage.Text = "Email already exists!";
                    lbMessage.Visible = true;
                    return;
                }
            }
            user.FirstName = txtFirstName.Text;
            user.LastName = txtLastName.Text;
            user.Phone = txtPhone.Text;
            user.Email = txtEmail.Text;
            if (user.Address == null)
                user.Address = new Address();
            user.Address.Street1 = txtStreet1.Text;
            user.Address.Street2 = txtStreet2.Text;
            user.Address.City = txtCity.Text;
            user.Address.State = txtState.Text;
            user.Address.Country = txtCountry.Text;
            user.Address.ZipCode = txtZipCode.Text;
            if (userRepo.UpdateUser(user) > 0)
                Response.Redirect("~/Admincp/Management-User.aspx");
            else
                lbMessage.Text = "Please check input data! Try again!";
        }
    }
}