using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Global;
using B2C_EC.Model.Data;
using System.Configuration;
using System.Data.Entity;

namespace B2C_EC.Website
{
    public partial class CustomerInfo : System.Web.UI.Page
    {
        private CustomerRepo customerRepo = new CustomerRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] == null)
            {
                Response.Redirect("Index.aspx");
            }
            if (!IsPostBack)
            {
                LoadDropDownList();
                LoadCustomer();
            }
        }
        private void LoadDropDownList()
        {
            List<CreditCardType> CreditCardTypes = new CreditCardTypeRepo().GetAllCreditCardType();
            ddlTypeCard.DataSource = CreditCardTypes;
            ddlTypeCard.DataBind();
            ddlTypeCard.Items.Insert(0, new ListItem("", ""));
        }
        private void LoadCustomer()
        {
            if (Session["Customer"] != null)
            {
                Customer customer = (Customer)Session["Customer"];
                lbUsername.Text = ToSQL.EmptyNull(customer.Username);
                txtFirstName.Text = ToSQL.EmptyNull(customer.FirstName);
                txtLastName.Text = ToSQL.EmptyNull(customer.LastName);
                txtEmail.Text = ToSQL.EmptyNull(customer.Email);
                txtPhone.Text = ToSQL.EmptyNull(customer.Phone);
                txtDateOfBirth.Text = ToSQL.SQLToDateTime(customer.DateOfBirth).ToShortDateString();
                rdbtnGender.SelectedIndex = ToSQL.SQLToBool(customer.Gender) ? 0 : 1;
                lbDateCreated.Text = ToSQL.EmptyNull(customer.DateCreated);
                if (customer.Address != null)
                {
                    txtStreet1.Text = ToSQL.EmptyNull(customer.Address.Street1);
                    txtStreet2.Text = ToSQL.EmptyNull(customer.Address.Street2);
                    txtCity.Text = ToSQL.EmptyNull(customer.Address.City);
                    txtState.Text = ToSQL.EmptyNull(customer.Address.State);
                    txtCountry.Text = ToSQL.EmptyNull(customer.Address.Country);
                    txtZipCode.Text = ToSQL.EmptyNull(customer.Address.ZipCode);
                }
                if (customer.CreditCard != null)
                {
                    txtCardNum.Text = ToSQL.EmptyNull(customer.CreditCard.CardNumber);
                    txtCVCCode.Text = ToSQL.EmptyNull(customer.CreditCard.SecurityCode);
                    ddlMonth.SelectedValue = ToSQL.EmptyNull(ToSQL.SQLToInt(customer.CreditCard.ExpirationDate.Month));
                    drdYear.SelectedValue = ToSQL.EmptyNull(ToSQL.SQLToInt(customer.CreditCard.ExpirationDate.Year));
                    ddlTypeCard.SelectedValue = ToSQL.EmptyNull(customer.CreditCard.CreditCardType_ID);
                }
            }
        }
        protected void btnGenaral_Click(object sender, EventArgs e)
        {
            Customer customer = (Customer)Session["Customer"];
            customer = customerRepo.GetById(customer.ID);
            customer.FirstName = ToSQL.EmptyNull(txtFirstName.Text);
            customer.LastName = ToSQL.EmptyNull(txtLastName.Text);
            customer.Email = ToSQL.EmptyNull(txtEmail.Text);
            customer.Phone = ToSQL.EmptyNull(txtPhone.Text);
            customer.DateOfBirth = ToSQL.SQLToDateTime(txtDateOfBirth.Text);
            customer.Gender = rdbtnGender.SelectedIndex == 0 ? true : false;

            int i = customerRepo.UpdateCustomer(customer);
            Session["Customer"] = customerRepo.GetById(customer.ID);
            Response.Redirect(Request.Url.PathAndQuery);
            //using (var context = new B2C_ECEntities())
            //{
            //    context.Customers.Find(customer.ID).LastName = "Phong 1989";
            //    context.SaveChanges();
            //}            
        }
        protected void UpdatePassword(object sender, EventArgs e)
        {
            Customer customer = (Customer)Session["Customer"];
            customer = customerRepo.GetById(customer.ID);
            string CurrentPassword = Security.Encrypt(customer.Key, txtCurrentPassword.Text);
            if (customer.Password.Equals(CurrentPassword))
            {
                customer.Password = Security.Encrypt(ConfigurationManager.AppSettings["KeyCustomer"], txtNewPassword.Text);
                customer.Key = ConfigurationManager.AppSettings["KeyCustomer"];
                int i = customerRepo.UpdateCustomer(customer);
                Session["Customer"] = customerRepo.GetById(customer.ID);
                CloseChangePasswordForm(null, null);
            }
            else
            {
                lbChangePassword.Text = "Current password is incorrect!";
                ModalPopupChangePassword.Show();
            }
        }
        protected void CloseChangePasswordForm(object sender, EventArgs e)
        {
            ModalPopupChangePassword.Hide();
        }
        protected void btnAddress_Click(object sender, EventArgs e)
        {
            Customer customer = (Customer)Session["Customer"];
            customer = customerRepo.GetById(customer.ID);
            if (customer.Address == null)
                customer.Address = new Address();
            customer.Address.Street1 = ToSQL.EmptyNull(txtStreet1.Text);
            customer.Address.Street2 = ToSQL.EmptyNull(txtStreet2.Text);
            customer.Address.City = ToSQL.EmptyNull(txtCity.Text);
            customer.Address.State = ToSQL.EmptyNull(txtState.Text);
            customer.Address.Country = ToSQL.EmptyNull(txtCountry.Text);
            customer.Address.ZipCode = ToSQL.EmptyNull(txtZipCode.Text);

            //int i = new AddressRepo().UpdateAddress(customer.Address);
            //customer.Address_ID = customer.Address.ID;
            int i = customerRepo.UpdateCustomer(customer);
            Session["Customer"] = customerRepo.GetById(customer.ID);
        }
        protected void btnCreditCard_Click(object sender, EventArgs e)
        {
            Customer customer = (Customer)Session["Customer"];
            customer = customerRepo.GetById(customer.ID);
            if (customer.CreditCard == null)
            {
                customer.CreditCard = new CreditCard();
                customer.DateCreated = DateTime.Now;
            }
            customer.CreditCard.CardNumber = ToSQL.EmptyNull(txtCardNum.Text);
            customer.CreditCard.SecurityCode = ToSQL.EmptyNull(txtCVCCode.Text);
            customer.CreditCard.ExpirationDate = ToSQL.SQLToDateTime(drdYear.SelectedValue + "/" + ddlMonth.SelectedValue + "/" + "1");
            customer.CreditCard.CreditCardType_ID = ToSQL.SQLToIntNull(ddlTypeCard.SelectedValue);
            customer.CreditCard.Name = ToSQL.EmptyNull(txtFullName.Text);

            int i = customerRepo.UpdateCustomer(customer);
            Session["Customer"] = customerRepo.GetById(customer.ID);
        }
    }
}