using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Model.Global;

namespace B2C_EC.Website
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WelcomeCustomer();
            }
        }

        private void WelcomeCustomer()
        {
            if (Session["Customer"] != null)
            {
                lnkRegister.Visible = false;
                lnkSignOut.Visible = true;
                lnkSignIn.Visible = false;
                lblMember.Visible = true;
                lblMember.Text = "Welcome, " + "<a href='CustomerInfo.aspx'>" + ((Customer)Session["Customer"]).FirstName + "!</a>";
            }
        }

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session["Customer"] = null;
            Response.Redirect("Index.aspx");
        }

        protected void Login(object sender, EventArgs e)
        {
            Customer customer = new CustomerRepo().GetCustomerByUsername(txtUsername.Text);
            if (customer != null)
            {
                string Password = Security.Encrypt(customer.Key, txtPassword.Text);
                if (customer.Password.Equals(Password))
                {
                    Session["Customer"] = customer;
                    WelcomeCustomer();
                    Response.Redirect(Request.Url.PathAndQuery);
                }
                else
                {
                    lbLogin.Text = "Username/password provided is incorrect!";
                    txtUsername.Attributes["value"] = "";
                    txtPassword.Attributes["value"] = "";
                    ModalPopupLogin.Show();
                }
            }
            else
            {
                lbLogin.Text = "Username/password provided is incorrect!";
                txtUsername.Attributes["value"] = "";
                txtPassword.Attributes["value"] = "";
                ModalPopupLogin.Show();
            }
        }
        protected void CloseLoginForm(object sender, EventArgs e)
        {
            ModalPopupLogin.Hide();
        }

        protected void lnksms_Click(object sender, EventArgs e)
        {
            if (txtNewsletter.Text.Length > 0)
            {
                bool DoesEmailExist = new NewsletterRepo().DoesEmailExist(txtNewsletter.Text);
                if (!DoesEmailExist)
                {
                    NewsLetter news = new NewsLetter();
                    news.Email = txtNewsletter.Text;
                    news.IsActive = true;
                    news.DateCreated = DateTime.Now;
                    new NewsletterRepo().CreateNewsLetter(news);
                }
                Response.Redirect("Newsletter.aspx");
            }
        }

        protected void btnSearch_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/SearchResult.aspx?key=" + txtSearch.Text);
        }
    }
}