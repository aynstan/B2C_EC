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
    public partial class B2C_EC : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WelcomeCustomer();
                LoadServices();
                LoadProductBestSelling();
            }
        }

        private void LoadProductBestSelling()
        {
            rptProductBestSelling.DataSource = new ProductRepo().GetProductBestSelling().Take(5);
            rptProductBestSelling.DataBind();
        }

        protected void rptProductBestSelling_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image imgProduct = (Image) e.Item.FindControl("imgProduct");
            if (imgProduct != null)
            {
                HiddenField HiddenFieldProductId = (HiddenField)e.Item.FindControl("HiddenFieldProductId");
                if (HiddenFieldProductId != null)
                {
                    string imgURL = new ProductImageRepo().GetImageDefaultAllByProductId(ToSQL.SQLToInt(HiddenFieldProductId.Value));
                    imgProduct.ImageUrl = "Resources/ImagesProduct/" + imgURL;
                }
            }
        }

        private void LoadServices()
        {
            rptServices.DataSource = (new ProductTypeRepo()).GetAllProductType();
            rptServices.DataBind();
        }

        private void WelcomeCustomer()
        {
            if (Session["Customer"] != null)
            {
                lnkRegister.Visible = false;
                lnkSignOut.Visible = true;
                lnkSignIn.Visible = false;
                lblMember.Visible = true;
                lblMember.Text = "Welcome, " + ((Customer)Session["Customer"]).FirstName + "!";
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

    }
}