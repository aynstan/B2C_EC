using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Model.Global;

namespace B2C_EC.Website.Admincp
{
    public partial class Management_OrderStatus : System.Web.UI.Page
    {
        private OrderStatusRepo orderStatusRepo = new OrderStatusRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<OrderStatu> orderStatus = orderStatusRepo.GetAllOrderStatu();

                this.gvOrderStatus.DataSource = orderStatus;
                this.gvOrderStatus.DataBind();
            }
        }
    }
}