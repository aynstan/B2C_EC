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
    public partial class Management_ProductPriceHistory : System.Web.UI.Page
    {
        private ProductPriceHistoryRepo productPriceHistoryRepo = new ProductPriceHistoryRepo();
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
            List<ProductType> ProductTypes = new ProductTypeRepo().GetAllProductType();
            ddlProductType.DataSource = ProductTypes;
            ddlProductType.DataBind();
            ddlProductType.Items.Insert(0, new ListItem("(All)", ""));

            List<Manufacturer> Manufacturers = new ManufacturerRepo().GetAllManufacturer();
            ddlManufacturer.DataSource = Manufacturers;
            ddlManufacturer.DataBind();
            ddlManufacturer.Items.Insert(0, new ListItem("(All)", ""));
        }
        protected void btnFilter_Click(object sender, EventArgs e)
        {
            BindItemsList();
        }

        protected void gvProductPriceHistorys_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            ProductPriceHistory productPriceHistory = (ProductPriceHistory)e.Row.DataItem;
            Label lbProductType = (Label)e.Row.FindControl("lbProductType");
            Label lbManufacturer = (Label)e.Row.FindControl("lbManufacturer");
            Label lbProductName = (Label)e.Row.FindControl("lbProductName");
            if (productPriceHistory.Product != null)
            {
                if (lbProductType != null)
                {
                    if (productPriceHistory.Product.ProductType != null)
                    {
                        lbProductType.Text = productPriceHistory.Product.ProductType.Name;
                    }
                }
                if (lbManufacturer != null)
                {
                    if (productPriceHistory.Product.Manufacturer != null)
                    {
                        lbManufacturer.Text = productPriceHistory.Product.Manufacturer.Name;
                    }
                }
                if (lbProductName != null)
                {
                    lbProductName.Text = ToSQL.ShortString(productPriceHistory.Product.Name, 32);
                    lbProductName.ToolTip = productPriceHistory.Product.Name;
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
                    int i = productPriceHistoryRepo.DeleteProductPriceHistory(Id);
                    BindItemsList();
                }
            }
            catch
            {

            }
        }
        private void BindItemsList()
        {
            List<ProductPriceHistory> productPriceHistories = productPriceHistoryRepo.GetManagementProductPriceHistories(ToSQL.SQLToInt(txtProductID.Text),ToSQL.EmptyNull(txtProductName.Text), ToSQL.SQLToInt(ddlProductType.SelectedValue), ToSQL.SQLToInt(ddlManufacturer.SelectedValue));

            this.gvProductPriceHistorys.DataSource = productPriceHistories;
            this.gvProductPriceHistorys.DataBind();
            //this.gvProductPriceHistorys.UseAccessibleHeader = true;
            //this.gvProductPriceHistorys.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
    }
}