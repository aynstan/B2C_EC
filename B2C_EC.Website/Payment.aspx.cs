using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model.Global;

namespace B2C_EC.Website
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Carts"] == null)
                {
                    Response.Redirect("Index.aspx");
                }
                LoadCart();
            }
        }

        private void LoadCart()
        {
            List<Cart> carts = (List<Cart>)Session["Carts"];
            Cart cart = new Cart(carts);

            grvViewCart.DataKeyNames = new string[] { "ProductID" };
            grvViewCart.DataSource = carts;
            grvViewCart.DataBind();

            cart = new Cart(carts);
            lbTotalQuantity.Text = ToSQL.EmptyNull(cart.TotalQuantity);
            lbTotalPrice.Text = ToSQL.EmptyNull(cart.TotalPrice.ToString("$#,###.##"));
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            string ss = "";
            ss = "dâdadad";
        }
    }
}