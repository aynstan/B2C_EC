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
            int ProductId = ToSQL.SQLToInt(Request.QueryString["ProductId"]);
            rptListImages.DataSource = (new ProductImageRepo()).GetAllImagesByProductId(ProductId);
            rptListImages.DataBind();
            Product p = (new ProductRepo()).GetByProductID(ProductId);
            ltrDetails.Text = p.Description;
        }
    }
}