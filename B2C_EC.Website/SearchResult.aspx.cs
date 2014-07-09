﻿using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Model.Global;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2C_EC.Website
{
    public partial class SearchResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSearch();
            }
        }

        private void LoadSearch()
        {
            rptProducts.DataSource = (new ProductRepo()).GetListBySearch(ToSQL.EmptyNull(Request.QueryString["key"]));
            rptProducts.DataBind();
        }

        public string ShortString(object o)
        {
            string s = o.ToString();
            if (s.Length <= 20)
                return s;
            else
                return s.Substring(0, 18) + "...";
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
            else if (e.CommandName == "AddCompare")
            {
                CompareAndWish list = (CompareAndWish)Session["Compare"];
                if (list == null)
                    list = new CompareAndWish();
                Product p = (new ProductRepo()).GetById(ToSQL.SQLToInt(e.CommandArgument));
                if (p != null && list.Products.Count <= 3)
                {
                    if (list.Add(p))
                        Response.Write("<script type='text/javascript'>alert('Added!s');</script>");
                    else
                        Response.Write("<script type='text/javascript'>alert('Product is exist in list compare');</script>");
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('You should select between 1 and 4 item!');</script>");
                }
                UpdateCompareList(list.Products);
                Session["Compare"] = list;
            }
            else if (e.CommandName == "AddWishList")
            {
                CompareAndWish list = (CompareAndWish)Session["WishList"];
                if (list == null)
                    list = new CompareAndWish();
                Product p = (new ProductRepo()).GetById(ToSQL.SQLToInt(e.CommandArgument));
                if (p != null)
                {
                    if (!list.Add(p))
                        Response.Write("<script type='text/javascript'>alert('Product is exist in list compare');</script>");
                }
                UpdateWishList(list.Products);
                Session["WishList"] = list;
            }
        }

        protected void rptProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Image img = (Image)e.Item.FindControl("imgProduct");
            HiddenField hdf = (HiddenField)e.Item.FindControl("hdfProductId");
            if (img != null && hdf != null)
            {
                string image = (new ProductImageRepo()).GetImageDefaultAllByProductId(ToSQL.SQLToInt(hdf.Value));
                if (CheckFileShared.CheckImageExist(image))
                    img.ImageUrl = "~/Resources/ImagesProduct/" + image;
                else
                    img.ImageUrl = "~/Resources/ImagesProduct/no-image.png";
            }
        }

        private void UpdateCompareList(List<Product> list)
        {
            ContentPlaceHolder ct = (ContentPlaceHolder)this.Master.Master.FindControl("ContentMain");
            Repeater rpt = (Repeater)ct.FindControl("rptCompareList");
            if (rpt != null)
            {
                rpt.DataSource = list;
                rpt.DataBind();
                rpt.Visible = true;
            }
        }

        private void UpdateWishList(List<Product> list)
        {
            ContentPlaceHolder ct = (ContentPlaceHolder)this.Master.Master.FindControl("ContentMain");
            Repeater rpt = (Repeater)ct.FindControl("rptWishList");
            if (rpt != null)
            {
                rpt.DataSource = list;
                rpt.DataBind();
                rpt.Visible = true;
            }
        }
    }
}