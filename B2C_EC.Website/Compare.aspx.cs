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
    public partial class Compare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCompareList();
            }
        }

        private void LoadCompareList()
        {
            if (Session["Compare"] != null)
            {
                CompareAndWish list = (CompareAndWish)Session["Compare"];
                if (list == null || list.Products.Count == 0)
                    Response.Redirect("~/Index.aspx");
                dtlCompare.DataSource = list.Products;
                dtlCompare.DataBind();
                rptComapre.DataSource = list.Products;
                rptComapre.DataBind();
            }
            else
            {
                Response.Redirect("~/Index.aspx");
            }
        }

        protected void dtlCompare_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            try
            {
                Product p = (Product)e.Item.DataItem;
                Image img = (Image)e.Item.FindControl("imgProduct");
                img.ImageUrl = "~/Resources/ImagesProduct/" + (new ProductImageRepo()).GetImageDefaultAllByProductId(p.ID);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void dtlCompare_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Remove" && Session["Compare"] != null)
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

        protected void rptComapre_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                Product p = (Product)e.Item.DataItem;
                Image img = (Image)e.Item.FindControl("imgProduct");
                img.ImageUrl = "~/Resources/ImagesProduct/" + (new ProductImageRepo()).GetImageDefaultAllByProductId(p.ID);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void rptComapre_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Remove" && Session["Compare"] != null)
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
}