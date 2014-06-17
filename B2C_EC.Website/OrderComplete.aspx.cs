using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model.Global;
using B2C_EC.Model;
using B2C_EC.Model.Data;

namespace B2C_EC.Website
{
    public partial class OrderComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Order"] != null)
            {
                Order order = (Order)Session["Order"];
                if (order.ShippingAddress != null)
                {
                    lbFullName.Text = ToSQL.EmptyNull(order.ShippingAddress.Name);
                    lbEmail.Text = ToSQL.EmptyNull(order.ShippingAddress.Email);
                    lbPhone.Text = ToSQL.EmptyNull(order.ShippingAddress.Phone);
                    lbShippingAddress.Text = new AddressRepo().GetToString(order.ShippingAddress.Address);
                }
                lbOrderID.Text = ToSQL.EmptyNull(order.ID);
                lbDateCreated.Text = ToSQL.EmptyNull(order.DateCreated.ToShortDateString());
                Model.Payment payment = new PaymentRepo().GetById(order.Payment_ID);
                lbPaymentType.Text = ToSQL.EmptyNull(payment.Name);
            }
            if (Session["Subtotal"] != null)
            {
                lbTotalPrice.Text = ToSQL.EmptyNull(Session["Subtotal"]);
            }
        }
    }
}