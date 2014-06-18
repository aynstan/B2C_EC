using B2C_EC.Model.Global;
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
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductDetails();
            }
        }

        private void LoadProductDetails()
        {
            if (Request.QueryString["ProductId"] != null)
            {
                int ProductId = ToSQL.SQLToInt(Request.QueryString["ProductId"]);                
                Product p = (new ProductRepo()).GetById(ProductId);
                if (p != null)
                {
                    rptListImages.DataSource = (new ProductImageRepo()).GetAllImagesByProductId(ProductId);
                    rptListImages.DataBind();
                    ltrDetails.Text = p.Description;
                    lblName.Text = p.Name;
                    lblPrice.Text = p.Price.ToString("#,###.## $");
                }
                else
                {                   
                    Response.Redirect("~/Index.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Not found product!');</script>");
                Response.Redirect("~/Index.aspx");
            }
        }
    }
}