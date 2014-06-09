using B2C_EC.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HoangQuanMobile.Website.Admincp
{
    public partial class Management_Product : System.Web.UI.Page
    {
        B2C_ECEntities db = new B2C_ECEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllProductType();
                LoadAllProduct();
            }
        }

        private void LoadAllProduct()
        {
            gvProducts.DataSource = db.Products.ToList();
            gvProducts.DataBind();
        }

        private void LoadAllProductType()
        {
            ddlLoaiSanPham.DataSource = db.ProductTypes.ToList();
            ddlLoaiSanPham.DataBind();
            if (ddlLoaiSanPham.Items.Count > 0)
                ddlLoaiSanPham.SelectedIndex = 0;
        }

        protected void ddlLoaiSanPham_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void gvProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            LoadAllProduct();
            gvProducts.PageIndex = e.NewPageIndex;
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
        }

        protected void gvProducts_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }
    }
}