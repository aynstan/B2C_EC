using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;

namespace HoangQuanMobile.Website.Admincp
{
    public partial class Management_Order : System.Web.UI.Page
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
            gvOrders.DataSource = db.Orders.ToList();
            gvOrders.DataBind();
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

        protected void gvOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void gvOrders_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

        }
    }
}