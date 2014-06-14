using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Model.Global;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2C_EC.Website.Admincp
{
    public partial class AddProduct : System.Web.UI.Page
    {
        private ProductRepo productRepo = new ProductRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadManufacturerAndProductType();
            }
        }

        private void LoadManufacturerAndProductType()
        {
            ddlManufacturer.DataSource = (new ManufacturerRepo()).GetAllManufacturer();
            ddlManufacturer.DataBind();
            ddlProductType.DataSource = (new ProductTypeRepo()).GetAllProductType();
            ddlProductType.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Product p = new Product();
            p.Name = txtName.Text;
            p.Price = ToSQL.SQLToDecimal(txtPriceNew.Text);
            p.ProductType_ID = ToSQL.SQLToInt(ddlProductType.SelectedValue);
            p.Manufacuturer_ID = ToSQL.SQLToInt(ddlManufacturer.SelectedValue);
            p.Description = CKEditorControlDescription.Text;
            p.IsActive = chkActive.Checked;
            p.IsBestSelling = chkBestSelling.Checked;
            p.IsNew = chkNew.Checked;
            p.IsSpecial = chkSpecial.Checked;
            if (productRepo.CreateProduct(p) > 0)
            {
                Response.Redirect("~/Admincp/Management-Products.aspx");
            }
            else
            {
                lblError.Text = "Please check input data! Try again!";
            }
        }
    }
}