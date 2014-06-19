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
    public partial class EditCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCustomer();
            }
        }
        private void LoadCustomer()
        {
            Customer customer = new CustomerRepo().GetById(ToSQL.SQLToInt(Request.QueryString["Id"]));
            if (customer != null)
            {
                lbUsername.Text = ToSQL.EmptyNull(customer.Username);
                txtFirstName.Text = ToSQL.EmptyNull(customer.FirstName);
                txtLastName.Text = ToSQL.EmptyNull(customer.LastName);
                txtEmail.Text = ToSQL.EmptyNull(customer.Email);
                txtPhone.Text = ToSQL.EmptyNull(customer.Phone);
                txtDateOfBirth.Text = ToSQL.SQLToDateTime(customer.DateOfBirth).ToShortDateString();
                rdbtnGender.SelectedIndex = ToSQL.SQLToBool(customer.Gender) ? 0 : 1;
                lbDateCreated.Text = ToSQL.EmptyNull(customer.DateCreated);
            }
            else
            {
                Response.Redirect("Management-Customer.aspx");
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Customer customer = new CustomerRepo().GetById(ToSQL.SQLToInt(Request.QueryString["Id"]));
            if (customer != null)
            {
                lbMessage.Text = "";
                if (new CustomerRepo().DoesEmailExist(txtEmail.Text) && !customer.Email.ToLower().Equals(txtEmail.Text.ToLower()) && ToSQL.EmptyNull(txtEmail.Text) != "")
                {
                    lbMessage.Text = "Email already exists!";
                    lbMessage.ForeColor = System.Drawing.Color.Red;
                    txtEmail.Text = "";
                    return;
                }

                customer.FirstName = txtFirstName.Text;
                customer.LastName = txtLastName.Text;
                customer.Email = txtEmail.Text;
                customer.Phone = txtPhone.Text;
                customer.DateOfBirth = ToSQL.SQLToDateTimeNull(txtDateOfBirth.Text);
                customer.Gender = rdbtnGender.SelectedIndex == 0 ? true : false;
                int i = new CustomerRepo().UpdateCustomer(customer);
                Response.Redirect("Management-Customer.aspx");
            }
            else
            {
                Response.Redirect("Management-Customer.aspx");
            }
        }
    }
}