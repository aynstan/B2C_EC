using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using B2C_EC.Model;

namespace HoangQuanMobile.Website.Admincp
{
    public partial class Manage_ProductType : System.Web.UI.Page
    {
        B2C_ECEntities db = new B2C_ECEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductType();
            }
        }

        private void LoadProductType()
        {
           
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            //ProductType p=new ProductType();
            //p.ProductTypeId = txtCatID.Text;
            //p.ProductTypeName = txtCatName.Text;
            //p.IsActive = true;
            //db.ProductTypes.Add(p);
            //db.SaveChanges();
            try
            {             
                LoadProductType();
            }
            catch {
                //Response.Write("<script>alert('Mã loại sản phẩm trùng');</script>");
                Response.Write("<script>alert('Mã loại sản phẩm trùng')</script>");
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {

        }

        protected void gvCategory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCategory.PageIndex = e.NewPageIndex;
            LoadProductType();
        }

        protected void gvCategory_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            
        }

        public void SelectedListManufacturer(string ProductTypeId)
        {
            
        }

        protected void gvCategory_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            SelectedListManufacturer(Server.HtmlDecode(gvCategory.Rows[e.NewSelectedIndex].Cells[0].Text));
            txtCatID.Text = Server.HtmlDecode(gvCategory.Rows[e.NewSelectedIndex].Cells[0].Text);
            txtCatName.Text = Server.HtmlDecode(gvCategory.Rows[e.NewSelectedIndex].Cells[1].Text);
            txtDesc.Text = Server.HtmlDecode(gvCategory.Rows[e.NewSelectedIndex].Cells[2].Text);
            rbtnStatus.Enabled = true;
            btnUpdate.Enabled = true;
        }
    }
}