using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model.Global;

namespace B2C_EC.Website
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Carts"] == null)
                {
                    Response.Redirect("Index.aspx");
                }
                Session["ReferPage"] = Request.UrlReferrer;
                LoadCart();
            }
        }
        private void Init()
        {
            List<Cart> carts = new List<Cart>();
            Cart cart = new Cart(carts);
            cart.ProductID = 1;
            cart.ProductName = "Dell";
            cart.Price = 4.36M;
            carts = cart.Add(cart);

            cart = new Cart(carts);
            cart.ProductID = 2;
            cart.ProductName = "Asus";
            cart.Price = 1.36M;
            carts = cart.Add(cart);

            cart = new Cart(carts);
            cart.ProductID = 3;
            cart.ProductName = "Acer";
            cart.Price = 2.36M;
            carts = cart.Add(cart);

            Session["Carts"] = carts;
        }

        private void LoadCart()
        {
            List<Cart> carts = (List<Cart>)Session["Carts"];
            Cart cart = new Cart(carts);

            grvViewCart.DataKeyNames = new string[] { "ProductID" };
            grvViewCart.DataSource = carts;
            grvViewCart.DataBind();

            cart = new Cart(carts);
            lbTotalProduct.Text = ToSQL.EmptyNull(cart.TotalProduct);
            lbTotalQuantity.Text = ToSQL.EmptyNull(cart.TotalQuantity);
            lbTotalPrice.Text = ToSQL.EmptyNull(cart.TotalPrice.ToString("$#,###.##"));
        }

        protected void grvViewCart_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grvViewCart.EditIndex = e.NewEditIndex;
            LoadCart();
        }
        protected void grvViewCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvViewCart.EditIndex = -1;
            LoadCart();
        }
        protected void grvViewCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //TextBox txtQuantity = (TextBox)grvViewCart.Rows[e.RowIndex].Cells[1].Controls[0];
            TextBox txtQuantity = (TextBox)grvViewCart.Rows[e.RowIndex].Cells[1].FindControl("txtQuantity");
            List<Cart> carts = (List<Cart>)Session["Carts"];
            int ProductID = ToSQL.SQLToInt(grvViewCart.DataKeys[e.RowIndex]["ProductID"]);
            Cart cart = new Cart(carts);
            if (ToSQL.SQLToInt(txtQuantity.Text) > 0)
                carts = cart.Update(ProductID, ToSQL.SQLToInt(txtQuantity.Text));
            Session["Carts"] = carts;
            
            grvViewCart.EditIndex = -1;
            LoadCart();
        }
        protected void grvViewCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Remove")
            {
                List<Cart> carts = (List<Cart>)Session["Carts"];

                for (int i = 0; i < grvViewCart.Rows.Count; i++)
                {
                    CheckBox chkRemove = (CheckBox)grvViewCart.Rows[i].FindControl("chkRemove");
                    if (chkRemove.Checked)
                    {
                        int ProductID = (int)grvViewCart.DataKeys[i]["ProductID"];
                        Cart cart = new Cart(carts);
                        carts = cart.Remove(ProductID);
                    }
                }
                Session["Carts"] = carts;
                LoadCart();
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            string url = (string.IsNullOrEmpty(ToSQL.EmptyNull(Session["ReferPage"]))) ? "index.aspx" : ToSQL.EmptyNull(Session["ReferPage"]);
            Response.Redirect(url);
        }

    }
}