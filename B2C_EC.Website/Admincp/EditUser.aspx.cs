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
        UserRepo userRepo = new UserRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUser();
            }
        }

        private void LoadUser()
        {
            if (Request.QueryString["ID"] != null)
            {
                int id = ToSQL.SQLToInt(Request.QueryString["ID"]);
                Model.User u = userRepo.GetById(id);
                if (u != null)
                {
                    //ViewState["UserEdit"] = u;
                    txtID.Text = u.ID.ToString();
                    txtFirstName.Text = u.FirstName;
                    txtLastName.Text = u.LastName;
                    txtUserName.Text = u.Username;
                    txtUserName.Enabled = false;
                    //string pass = "";
                    txtPassword.Attributes["value"] = Security.Decrypt(u.Key, u.Password);
                    txtConfirm.Attributes["value"] = Security.Decrypt(u.Key, u.Password);
                    if (u.Address != null)
                    {
                        txtStreet1.Text = u.Address.Street1;
                        txtStreet2.Text = u.Address.Street2;
                        txtCity.Text = u.Address.City;
                        txtState.Text = u.Address.State;
                        txtCountry.Text = u.Address.Country;
                        txtZipCode.Text = u.Address.ZipCode;
                    }
                    txtEmail.Text = u.Email;
                    txtPhone.Text = u.Phone;
                    chkActive.Checked = ToSQL.SQLToBool(u.IsActive);
                }
            }
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
            if (ViewState["UserEdit"] == null || !CheckEmail())
            {
                ltrError.Visible = true;
                return;
            }
            Model.User user = (Model.User)ViewState["UserEdit"];
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
            user.IsActive = chkActive.Checked;
            if (userRepo.UpdateUser(user) > 0)
                Response.Redirect("~/Admincp/Management-User.aspx");
            else
                lblError.Text = "Please check input data! Try again!";
        }
    }
}