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
    public partial class Management_OrderHistory : System.Web.UI.Page
    {
        private OrderHistoryRepo orderHistoryRepo = new OrderHistoryRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindItemsList();
                LoadDropDownList();
            }
        }
        private void LoadDropDownList()
        {
            List<OrderStatu> orderStatus = new OrderStatusRepo().GetAllOrderStatu();
            ddlOrderStatus.DataSource = orderStatus;
            ddlOrderStatus.DataBind();
            ddlOrderStatus.Items.Insert(0, new ListItem("(All)", ""));
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            BindItemsList();
        }

        protected void gvOrderHistories_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                OrderHistory orderHistory = (OrderHistory)e.Row.DataItem;
                Label lbOrderStatus = (Label)e.Row.FindControl("lbOrderStatus");

                if (lbOrderStatus != null)
                    {
                        if (orderHistory.OrderStatu != null)
                        {
                            lbOrderStatus.Text = orderHistory.OrderStatu.Name;
                        }
                    }
            }
        }
        protected void lnkRemove_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = (LinkButton)sender;
                int Id = ToSQL.SQLToInt(lnk.CommandArgument);
                if (Id > 0)
                {
                    int i = orderHistoryRepo.DeleteOrderHistory(Id);
                    BindItemsList();
                }
            }
            catch
            {

            }
        }
        private void BindItemsList()
        {
            List<OrderHistory> orderHistories = orderHistoryRepo.GetManagementOrderHistories(ToSQL.SQLToInt(txtOrderID.Text), ToSQL.SQLToInt(ddlOrderStatus.SelectedValue));

            this.gvOrderHistories.DataSource = orderHistories;
            this.gvOrderHistories.DataBind();
            this.gvOrderHistories.UseAccessibleHeader = true;
            this.gvOrderHistories.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}