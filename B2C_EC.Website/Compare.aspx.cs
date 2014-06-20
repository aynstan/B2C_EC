using B2C_EC.Model;
using B2C_EC.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                List<Product> list = (List<Product>)Session["Compare"];
                dtlCompare.DataSource = list;
                dtlCompare.DataBind();
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
    }
}