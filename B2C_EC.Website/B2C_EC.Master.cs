using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Data;

namespace B2C_EC.Website
{
    public partial class B2C_EC : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Customer"] != null)
                {
                    LoadCustomer();
                }

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
                    string imgURL = new ImagesProductRepo().GetImageURLDefaultByProductId(Convert.ToInt32(HiddenFieldProductId.Value));
                    imgProduct.ImageUrl = "Resources/ImagesProduct/" + imgURL;
                }
            }
        }

        private void LoadServices()
        {
            rptServices.DataSource = (new ProductTypeRepo()).GetAllProductType();
            rptServices.DataBind();
        }

        private void LoadCustomer()
        {
            ModalPopupExtender1.Hide();
            lnkRegister.Visible = false;
            lnkSignOut.Visible = true;
            lnkSignIn.Visible = false;
            lblMember.Text = "Chào, Customer!";
        }

        protected void lnkSignOut_Click(object sender, EventArgs e)
        {
            Session["Customer"] = null;
        }

        protected void Login(object sender, EventArgs e)
        {
            if (txtUsername.Text == "1" && txtPassword.Text == "1")
            {
                Session["Customer"] = 1;
                lnkRegister.Visible = false;
                lnkSignOut.Visible = true;
                lnkSignIn.Visible = false;
                lblMember.Visible = true;
                lblMember.Text = "Chào, Customer!";
            }
        }

    }
}