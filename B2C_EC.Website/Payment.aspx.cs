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
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Carts"] == null)
            {
                Response.Redirect("Index.aspx");
            }
            if (!IsPostBack)
            {
                LoadCart();
                LoadCustomer();
            }
        }

        private void LoadCart()
        {
            List<Cart> carts = (List<Cart>)Session["Carts"];
            Cart cart = new Cart(carts);

            grvViewCart.DataKeyNames = new string[] { "ProductID" };
            grvViewCart.DataSource = carts;
            grvViewCart.DataBind();

            cart = new Cart(carts);
            lbTotalQuantity.Text = ToSQL.EmptyNull(cart.TotalQuantity);
            lbTotalPrice.Text = ToSQL.EmptyNull(cart.TotalPrice.ToString("$#,###.##"));
        }

        private void LoadCustomer()
        {
            if (Session["Customer"] != null)
            {
                Customer customer = (Customer) Session["Customer"];
                txtFullName.Text = ToSQL.EmptyNull(customer.FirstName) + " " +ToSQL.EmptyNull(customer.LastName);
                txtPhone.Text = ToSQL.EmptyNull(customer.Phone);
                txtEmail.Text = ToSQL.EmptyNull(customer.Email);
                if (customer.Address != null)
                {
                    Address address = customer.Address;
                    txtStreet.Text = ToSQL.EmptyNull(address.Street1);
                    txtCity.Text = ToSQL.EmptyNull(address.City);
                    txtState.Text = ToSQL.EmptyNull(address.State);
                    txtCountry.Text = ToSQL.EmptyNull(address.Country);
                    txtZipCode.Text = ToSQL.EmptyNull(address.ZipCode);
                }
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            Order order = new Order();
            order.DateCreated = DateTime.Now;
            order.Note = ToSQL.EmptyNull(txtNotes.Text);
            order.OrderStatus_ID = 1;
            if (Session["Customer"] != null)
            {
                order.Customer_ID = ((Customer)Session["Customer"]).ID;
            }
            order.ShippingAddress = new ShippingAddress()
            {
                Name = ToSQL.EmptyNull(txtFullName.Text),
                Email = ToSQL.EmptyNull(txtEmail.Text),
                Phone = ToSQL.EmptyNull(txtPhone.Text),
                Address = new Address()
                {
                    Street1 = ToSQL.EmptyNull(txtStreet.Text),
                    City = ToSQL.EmptyNull(txtCity.Text),
                    State = ToSQL.EmptyNull(txtState.Text),
                    Country = ToSQL.EmptyNull(txtCountry.Text),
                    ZipCode = ToSQL.EmptyNull(txtZipCode.Text),
                }
            };
            order.Payment_ID = tabContainer.ActiveTabIndex + 1;
            List<Cart> carts = (List<Cart>)Session["Carts"];
            List<OrderDetail> orderDetails = new List<OrderDetail>();
            foreach (var item in carts)
            {
                OrderDetail orderDetail = new OrderDetail()
                {
                    Product_ID = item.ProductID,
                    Quantity = item.Quantity,
                    Price = item.Price
                };
                orderDetails.Add(orderDetail);
            }
            order.OrderDetails = orderDetails;
            int i = new OrderRepo().CreateOrder(order);
            Session["Order"] = order;
            Session["Subtotal"] = lbTotalPrice.Text;
            Session["Carts"] = null;
            Response.Redirect("OrderComplete.aspx");
        }
    }
}