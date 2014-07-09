using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using B2C_EC.Model.Data;
using B2C_EC.Model.Global;

namespace B2C_EC.Website
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VisibleCompareAndWish();
            if (!IsPostBack)
            {
                if (Session["Customer"] != null)
                {
                    Response.Redirect("Index.aspx");
                }
            }
        }

        private void VisibleCompareAndWish()
        {
            ContentPlaceHolder ct = (ContentPlaceHolder)this.Master.Master.FindControl("ContentMain");
            UpdatePanel UpdatePanel1 = (UpdatePanel)ct.FindControl("UpdatePanel1");
            if (UpdatePanel1 != null)
            {
                UpdatePanel1.Visible = false;
            }
            //Repeater rpt1 = (Repeater)ct.FindControl("rptWishList");
            //if (rpt1 != null)
            //{
            //    rpt1.Visible = false;
            //}
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            CustomerRepo customerrepo = new CustomerRepo();
            lbMessage.Text = "";
            if (customerrepo.DoesUsernameExist(txtUsername.Text))
            {
                lbMessage.Text = "Username already exists!";
                lbMessage.ForeColor = System.Drawing.Color.Red;
                txtUsername.Text = "";
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
            customer.Username = txtUsername.Text;            
            customer.Password = Security.Encrypt(ConfigurationManager.AppSettings["KeyCustomer"], txtPassword.Text);
            customer.Key = ConfigurationManager.AppSettings["KeyCustomer"];
            customer.Email = txtEmail.Text;
            customer.Phone = txtPhone.Text;
            customer.DateOfBirth = ToSQL.SQLToDateTimeNull(txtDateOfBirth.Text);
            customer.Gender = rdbtnGender.SelectedIndex == 0 ? true : false;
            customer.DateCreated = DateTime.Now;
            int i = customerrepo.CreateCustomer(customer);
            Session["Customer"] = customer;
            Response.Redirect("CustomerInfo.aspx");
        }
    }
}