using B2C_EC.Model;
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
    public partial class WishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadWishList();
            }
        }

        private void LoadWishList()
        {
            if (Session["WishList"] != null)
            {
                CompareAndWish list = (CompareAndWish)Session["WishList"];
                if (list == null || list.Products.Count <= 0)
                    Response.Redirect("~/Index.aspx");
                rptProducts.DataSource = list.Products;
                rptProducts.DataBind();
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

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["WishList"] != null && e.CommandName == "Remove")
            {
                CompareAndWish list = (CompareAndWish)Session["WishList"];
                HiddenField hdf = (HiddenField)e.Item.FindControl("hdfProductId");
                if (list != null)
                {
                    list.Remove(ToSQL.SQLToInt(hdf.Value));
                    LoadWishList();
                }
            }
        }

        public string ShortString(object o)
        {
            string s = o.ToString();
            if (s.Length <= 20)
                return s;
            else
                return s.Substring(0, 18) + "...";
        }
    }
}