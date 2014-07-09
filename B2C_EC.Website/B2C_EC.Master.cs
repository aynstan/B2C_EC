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
                LoadServices();
                LoadProductBestSelling();
                LoadCompareList();
                LoadWishList();
            }
        }

        public void LoadCompareList()
        {
            if (Session["Compare"] != null)
            {
                CompareAndWish list = (CompareAndWish)Session["Compare"];
                if (list != null)
                {
                    if (list.Products.Count > 0)
                    {
                        rptCompareList.DataSource = list.Products;
                        rptCompareList.Visible = true;
                    }
                    else
                    {
                        rptCompareList.DataSource = null;
                        rptCompareList.Visible = false;
                    }
                    rptCompareList.DataBind();
                }
            }
        }

        public void LoadWishList()
        {
            if (Session["WishList"] != null)
            {
                CompareAndWish list = (CompareAndWish)Session["WishList"];
                if (list != null)
                {
                    if (list.Products.Count > 0)
                    {
                        rptWishList.DataSource = list.Products;
                        rptWishList.Visible = true;
                    }
                    else
                    {
                        rptWishList.DataSource = null;
                        rptWishList.Visible = false;
                    }
                    rptWishList.DataBind();
                }
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
            rptServices.DataSource = (new ProductTypeRepo()).GetAllProductTypeActived();
            rptServices.DataBind();
        }

        public string ShortString(object o)
        {
            string s = o.ToString();
            if (s.Length <= 20)
                return s;
            else
                return s.Substring(0, 18) + "...";
        }

        protected void lbtnAddCart_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            Product product = new ProductRepo().GetById(ToSQL.SQLToInt(lbtn.CommandArgument));
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

        protected void rptCompareList_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Session["Compare"] = null;
            rptCompareList.DataSource = null;
            rptCompareList.DataBind();
        }

        protected void rptCompareList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "RemoveCompare")
            {
                if (Session["Compare"] != null)
                {
                    CompareAndWish list = (CompareAndWish)Session["Compare"];
                    if (list != null)
                    {
                        list.Remove(ToSQL.SQLToInt(e.CommandArgument));
                        Session["Compare"] = list;
                        LoadCompareList();
                    }
                }
            }
        }

        protected void rptWishList_ItemDataBound(object sender, RepeaterItemEventArgs e)
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

        protected void rptWishList_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "RemoveWish")
            {
                if (Session["Compare"] != null)
                {
                    CompareAndWish list = (CompareAndWish)Session["WishList"];
                    if (list != null)
                    {
                        list.Remove(ToSQL.SQLToInt(e.CommandArgument));
                        Session["WishList"] = list;
                        LoadWishList();
                    }
                }
            }
        }

        protected void btnCancelWishList_Click(object sender, EventArgs e)
        {
            Session["WishList"] = null;
            rptWishList.DataSource = null;
            rptWishList.DataBind();
        }
    }
}