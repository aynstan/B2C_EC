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
    public partial class EditProduct : System.Web.UI.Page
    {
        private ProductRepo productRepo = new ProductRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadManufacturerAndProductType();
                LoadProduct();                
            }
        }

        private void LoadProduct()
        {
            if (Request.QueryString["ID"] != null)
            {
                Product p = productRepo.GetByProductID(ToSQL.SQLToInt(Request.QueryString["ID"]));
                if (p != null)
                {
                    txtID.Text = p.ID.ToString();
                    txtName.Text = p.Name;
                    txtPriceNew.Text = p.Price.ToString();
                    ddlManufacturer.SelectedValue = p.Manufacuturer_ID.ToString();
                    ddlProductType.SelectedValue = p.ProductType_ID.ToString();
                    CKEditorControlDescription.Text = p.Description;
                }
            }
            else
            {
                Response.Redirect("~/Admincp/Management-Products.aspx");
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

        }
    }
}