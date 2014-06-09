using B2C_EC.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HoangQuanMobile.Website.Admincp
{
    public partial class Management_Manufacturer : System.Web.UI.Page
    {
        B2C_ECEntities db = new B2C_ECEntities();
        //Manufacturer manufacture;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadListManufacturer();
                btnInsert.Enabled = true;
                btnUpdate.Enabled = false;
            }
        }

        private void LoadListManufacturer()
        {
            
        }

        protected void gvManufacturer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {            
            
        }

        protected void gvManufacturer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ManufacturerId = int.Parse(Server.HtmlDecode(gvManufacturer.Rows[e.RowIndex].Cells[0].Text));
            Manufacturer m = db.Manufacturers.Where(mm => mm.ID == ManufacturerId).FirstOrDefault();
            if (m != null)
            {
                try
                {
                    db.Manufacturers.Remove(m);
                    db.SaveChanges();
                    lblMessage.Text = "Xóa thành công!";
                }
                catch
                {

                }
                LoadListManufacturer();
            }
            
        }

        protected void gvManufacturer_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {            
            string ManufacturerId = Server.HtmlDecode(gvManufacturer.Rows[e.NewSelectedIndex].Cells[0].Text);
            SelectedListPoductType(ManufacturerId);
            txtManuID.Text = Server.HtmlDecode(gvManufacturer.Rows[e.NewSelectedIndex].Cells[0].Text);
            txtManuID.Enabled = false;
            txtManuName.Text = Server.HtmlDecode(gvManufacturer.Rows[e.NewSelectedIndex].Cells[1].Text);
            txtAddress.Text = Server.HtmlDecode(gvManufacturer.Rows[e.NewSelectedIndex].Cells[2].Text);
            txtPhone.Text = Server.HtmlDecode(gvManufacturer.Rows[e.NewSelectedIndex].Cells[3].Text);
            txtWebsite.Text = Server.HtmlDecode(gvManufacturer.Rows[e.NewSelectedIndex].Cells[4].Text);
            txtNote.Text = Server.HtmlDecode(gvManufacturer.Rows[e.NewSelectedIndex].Cells[5].Text);
            btnInsert.Enabled = false;
            btnUpdate.Enabled = true;
        }

        private void SelectedListPoductType(string p)
        {
            
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                
            }
            catch
            {
                lblMessage.Text = "Mã nhà sản xuất đã tồn tại!";
            }           
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtManuID.Text))
            {
                lblMessage.Text = "Chưa chọn nhà sản xuất!";
            }
            else
            {
                lblMessage.Text = txtManuID.Text;
                //btnInsert.Enabled = true;
                //btnUpdate.Enabled = false;
            }
        }
    }
}