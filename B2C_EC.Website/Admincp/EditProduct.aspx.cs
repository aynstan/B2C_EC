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
                Product p = productRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
                if (p != null)
                {
                    txtID.Text = p.ID.ToString();
                    txtName.Text = p.Name;
                    txtPriceNew.Text = p.Price.ToString();
                    ddlManufacturer.SelectedValue = p.Manufacuturer_ID.ToString();
                    ddlProductType.SelectedValue = p.ProductType_ID.ToString();
                    CKEditorControlDescription.Text = p.Description;
                    gvImages.DataSource = p.ProductImages;
                    gvImages.DataBind();
                }
            }
            else
            {
                Response.Redirect("~/Admincp/Management-Products.aspx");
            }
        }

        private void ReloadProductImage()
        {
            if (Request.QueryString["ID"] != null)
            {
                Product p = productRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
                if (p != null)
                {
                    gvImages.DataSource = p.ProductImages;
                    gvImages.DataBind();
                }
            }
        }

        private void LoadManufacturerAndProductType()
        {
            ddlManufacturer.DataSource = (new ManufacturerRepo()).GetAllManufacturer();
            ddlManufacturer.DataBind();
            ddlProductType.DataSource = (new ProductTypeRepo()).GetAllProductType();
            ddlProductType.DataBind();
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Product p = new Product();
            if (Request.QueryString["ID"] != null)
            {
                p = productRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            }
            if (p.ID == 0)
            {
                lblError.Text = "Please check input data! Try again!";
                return;
            }
            p.Name = txtName.Text;
            p.Price = ToSQL.SQLToDecimal(txtPriceNew.Text);
            p.ProductType_ID = ToSQL.SQLToInt(ddlProductType.SelectedValue);
            p.Manufacuturer_ID = ToSQL.SQLToInt(ddlManufacturer.SelectedValue);
            p.Description = CKEditorControlDescription.Text;
            p.IsActive = chkActive.Checked;
            p.IsBestSelling = chkBestSelling.Checked;
            p.IsNew = chkNew.Checked;
            p.IsSpecial = chkSpecial.Checked;
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
            //HttpFileCollection uploads = Request.Files;
            //for (int fileCount = 0; fileCount < uploads.Count; fileCount++)
            foreach (HttpPostedFile uploadedFile in FileUploadJquery.PostedFiles)
            {
                //HttpPostedFile uploadedFile = uploads[i];
                ProductImage image = new ProductImage();
                string url = "";//UploadImage(fulImageDefault.PostedFile);
                try
                {
                    uploadedFile.SaveAs(Server.MapPath("~/Resources/ImagesProduct/" + uploadedFile.FileName));
                    url = uploadedFile.FileName;
                }
                catch { }
                if (url != "")
                {
                    image.Image = url;
                    image.IsDefault = false;
                    p.ProductImages.Add(image);
                }
            }
            if (productRepo.UpdateProduct(p) > 0)
            {
                Response.Redirect("~/Admincp/Management-Products.aspx");
            }
            else
            {
                lblError.Text = "Please check input data! Try again!";
            }
        }

        protected void gvImages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id = Int32.Parse(e.Keys[0].ToString());
                (new ProductImageRepo()).DeleteProductImage(id);
                ReloadProductImage();
            }
            catch { }
        }
    }
}