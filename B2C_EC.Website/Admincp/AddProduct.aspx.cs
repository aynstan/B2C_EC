using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Model.Global;
using System;
using System.Collections.Generic;
using System.IO;
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
                LoadDropDownList();
            }
        }
        private void LoadDropDownList()
        {
            ddlManufacturer.DataSource = (new ManufacturerRepo()).GetAllManufacturer();
            ddlManufacturer.DataBind();
            ddlManufacturer.Items.Insert(0, new ListItem("", ""));

            ddlProductType.DataSource = (new ProductTypeRepo()).GetAllProductType();
            ddlProductType.DataBind();
            ddlProductType.Items.Insert(0, new ListItem("", ""));
        }
        private string UploadImage(HttpPostedFile PostedFile)
        {
            try
            {
                PostedFile.SaveAs(Server.MapPath("~/Resources/ImagesProduct/" + PostedFile.FileName));
                return PostedFile.FileName;
            }
            catch
            {
                return "";
            }
        }

        protected void ddlProductType_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProductType productType = new ProductTypeRepo().GetById(ToSQL.SQLToInt(ddlProductType.SelectedValue));
            if (productType != null)
            {
                CKEditorControlDescription.Text = productType.DescriptionTemplate;
            }
            else
            {
                CKEditorControlDescription.Text = "";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Product p = new Product();
            p.Name = txtName.Text;
            p.Price = ToSQL.SQLToDecimal(txtPriceNew.Text);
            p.ProductType_ID = ToSQL.SQLToIntNull(ddlProductType.SelectedValue);
            p.Manufacuturer_ID = ToSQL.SQLToIntNull(ddlManufacturer.SelectedValue);
            p.Description = CKEditorControlDescription.Text;
            p.IsActive = true;
            p.IsBestSelling = chkBestSelling.Checked;
            p.IsNew = chkNew.Checked;
            p.IsSpecial = chkSpecial.Checked;
            p.DateCreated = DateTime.Now;
            if (fulImageDefault.HasFile)
            {
                ProductImage image = new ProductImage();
                string url = UploadImage(fulImageDefault.PostedFile);
                if (url != "")
                {
                    image.Image = url;
                    image.IsDefault = true;
                    p.ProductImages.Add(image);
                }
            }
            HttpFileCollection uploads = Request.Files;
            //for (int fileCount = 0; fileCount < uploads.Count; fileCount++)
            foreach (HttpPostedFile uploadedFile in FileUploadJquery.PostedFiles)
            {
                ProductImage image = new ProductImage();
                string url = UploadImage(uploadedFile);
                if (url != "")
                {
                    image.Image = url;
                    image.IsDefault = false;
                    p.ProductImages.Add(image);
                }
            }
            if (productRepo.CreateProduct(p) > 0)
            {
                Response.Redirect("~/Admincp/Management-Products.aspx");
            }
            else
            {
                lbMessage.Text = "Please check input data! Try again!";
            }
        }
    }
}