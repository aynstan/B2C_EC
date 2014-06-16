using System;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Global;
using B2C_EC.Model.Data;

namespace B2C_EC.Website.Admincp
{
    public partial class CreateCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            CustomerRepo customerrepo = new CustomerRepo();
            lbMessage.Text = "";
            if (customerrepo.DoesUsernameExist(txtUserName.Text))
            {
                lbMessage.Text = "Username already exists!";
                lbMessage.ForeColor = System.Drawing.Color.Red;
                txtUserName.Text = "";
                return;
            }
            if (customerrepo.DoesEmailExist(txtEmail.Text))
            {
                lbMessage.Text = "Email already exists!";
                lbMessage.ForeColor = System.Drawing.Color.Red;
                txtEmail.Text = "";
                return;
            }
            Model.Customer customer = new Model.Customer();
            customer.FirstName = txtFirstName.Text;
            customer.LastName = txtLastName.Text;
            customer.Username = txtUserName.Text;
            customer.Password = Security.Encrypt(ConfigurationManager.AppSettings["KeyCustomer"], txtPassword.Text);
            customer.Key = ConfigurationManager.AppSettings["KeyCustomer"];
            customer.Email = txtEmail.Text;
            customer.Phone = txtPhone.Text;
            customer.DateOfBirth = ToSQL.SQLToDateTimeNull(txtDateOfBirth.Text);
            customer.Gender = rdbtnGender.SelectedIndex == 0 ? true : false;
            customer.DateCreated = DateTime.Now;
            int i = customerrepo.CreateCustomer(customer);
            Response.Redirect("Management-Customer.aspx");
        }
    }
}