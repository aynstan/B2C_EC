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
    public partial class Management_OrderDetails : System.Web.UI.Page
    {
        private OrderRepo orderRepo = new OrderRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrder();
            }
        }
        private void SetButton(int orderStatusID)
        {
            if(orderStatusID.Equals(Const.Pendding))
            {
                btnSubmit.Visible = true;
                btnCancel.Visible = true;
            }
            else if(orderStatusID.Equals(Const.Submitted))
            {
                btnShipping.Visible = true;
                btnCancel.Visible = true;
            }
            else if (orderStatusID.Equals(Const.Shipping))
            {
                btnComplete.Visible = true;
                btnCancel.Visible = true;
            }
            else if (orderStatusID.Equals(Const.Cancelled))
            {
                btnRemake.Visible = true;
            }
        }
        private void LoadOrder()
        {
            Order order = orderRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            if (order != null)
            {
                lbOrderID.Text = ToSQL.EmptyNull(order.ID);
                if (order.OrderStatu != null)
                {
                    lbOrderStatus.Text = ToSQL.EmptyNull(order.OrderStatu.Name);
                    SetButton(order.OrderStatus_ID);
                }
                lbCreatedDate.Text = ToSQL.EmptyNull(order.DateCreated.ToString("yyyy-MM-dd HH:mm"));
                if (order.Customer != null)
                {
                    lbCustomer.Text = ToSQL.EmptyNull(order.Customer.FirstName + " " + order.Customer.LastName);
                }
                if (order.Payment != null)
                {
                    lbPaymentType.Text = ToSQL.EmptyNull(order.Payment.Name);
                }
                txtNote.Text = ToSQL.EmptyNull(order.Note);
                if (order.ShippingAddress != null)
                {
                    lbName.Text = ToSQL.EmptyNull(order.ShippingAddress.Name);
                    lbEmail.Text = ToSQL.EmptyNull(order.ShippingAddress.Email);
                    lbPhone.Text = ToSQL.EmptyNull(order.ShippingAddress.Phone);
                    if (order.ShippingAddress.Address != null)
                    {
                        lbAddress.Text = ToSQL.EmptyNull(new AddressRepo().GetToString(order.ShippingAddress.Address));
                    }
                }
                if (order.OrderDetails != null)
                {
                    grvOrderProduct.DataSource = order.OrderDetails;
                    grvOrderProduct.DataBind();
                    lbSubtotal.Text = ToSQL.EmptyNull(order.OrderDetails.Sum(o => o.Quantity * o.Price).ToString("$#,###.00"));
                }
            }
            else
            {
                Response.Redirect("~/Admincp/Management-Order.aspx");
            }
        }

        protected void grvOrderProduct_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                OrderDetail orderDetail = (OrderDetail)e.Row.DataItem;
                if (orderDetail != null)
                {
                    Image imgProduct = (Image)e.Row.FindControl("imgProduct");
                    if (imgProduct != null)
                    {
                        string image = (new ProductImageRepo()).GetImageDefaultAllByProductId(ToSQL.SQLToInt(orderDetail.Product_ID));
                        if (CheckFileShared.CheckImageExist(image))
                            imgProduct.ImageUrl = "~/Resources/ImagesProduct/" + image;
                        else
                            imgProduct.ImageUrl = "~/Resources/ImagesProduct/no-image.png";
                    }
                    Label lbProductName = (Label)e.Row.FindControl("lbProductName");
                    if (lbProductName != null)
                    {
                        lbProductName.Text = orderDetail.Product.Name;
                    }
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {           
            int orderStatusID = Const.Submitted;
            ChangeOrderStatus(orderStatusID);
        }

        protected void btnShipping_Click(object sender, EventArgs e)
        {
            int orderStatusID = Const.Shipping;
            ChangeOrderStatus(orderStatusID);
        }

        protected void btnComplete_Click(object sender, EventArgs e)
        {
            int orderStatusID = Const.Completed;
            ChangeOrderStatus(orderStatusID);
        }

        protected void btnRemake_Click(object sender, EventArgs e)
        {
            int orderStatusID = Const.Pendding;
            ChangeOrderStatus(orderStatusID);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            int orderStatusID = Const.Cancelled;
            ChangeOrderStatus(orderStatusID);
        }
        private void ChangeOrderStatus(int orderStatusID)
        {
            int orderID = ToSQL.SQLToInt(Request.QueryString["ID"]);
            int i = orderRepo.UpdateStatus(orderID, orderStatusID);
            OrderHistory orderHis = new OrderHistory();
            orderHis.Order_ID = orderID;
            orderHis.OrderStatus_ID = orderStatusID;
            orderHis.DateCreated = DateTime.Now;
            int x = new OrderHistoryRepo().CreateOrderHistory(orderHis);
            Response.Redirect("~/Admincp/Management-Order.aspx");
        }
    }
}