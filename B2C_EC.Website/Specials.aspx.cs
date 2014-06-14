using B2C_EC.Model;
using B2C_EC.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model.Global;
namespace B2C_EC.Website
{
    public partial class Specials : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductsBySpecials();
            }
        }

        private void LoadProductsBySpecials()
        {
            rptProducts.DataSource = (new ProductRepo()).GetProductNew();
            rptProducts.DataBind();
        }

        protected void rptProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image img = (Image)e.Item.FindControl("imgProduct");
            HiddenField hdf = (HiddenField)e.Item.FindControl("hdfProductId");
            if (img != null && hdf != null)
            {
                ProductImage imageProduct = (new ProductImageRepo()).GetImageDefaultByProductId(Int32.Parse(hdf.Value));
                if (imageProduct != null)
                {
                    img.ImageUrl = "~/Resources/ImagesProduct/" + imageProduct.Image;
                }
            }
        }
        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Add")
            {
                HiddenField hdf = (HiddenField)e.Item.FindControl("hdfProductId");
                Product product = new ProductRepo().GetById(ToSQL.SQLToInt(hdf.Value));
                if (product != null)
                {
                    List<Cart> carts = (List<Cart>)Session["Carts"];
                    Cart cart = new Cart(carts);
                    cart = cart.ConverProductToCart(product);
                    carts = cart.Add(cart);
                    Session["Carts"] = carts;
                    Response.Redirect("ViewCart.aspx");
                }
            }
        }
    }
}