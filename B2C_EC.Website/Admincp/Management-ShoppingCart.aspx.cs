using B2C_EC.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HoangQuanMobile.Website.Admincp
{
    public partial class Management_ShoppingCart : System.Web.UI.Page
    {
        B2C_ECEntities db = new B2C_ECEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadShippingCart();
            }
        }

        private void LoadShippingCart()
        {
            
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void gvOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrders.PageIndex = e.NewPageIndex;
            LoadShippingCart();
        }

        protected void gvOrders_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }

        protected void gvOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }
    }
}