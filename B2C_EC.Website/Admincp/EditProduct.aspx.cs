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
                LoadDropDownList();
                LoadProduct();                
            }
        }

        private void LoadProduct()
        {
            Product p = productRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            if (p != null)
            {
                txtName.Text = ToSQL.EmptyNull(p.Name);
                txtPrice.Text = ToSQL.EmptyNull(p.Price.ToString("###.##"));
                ddlManufacturer.SelectedValue = ToSQL.EmptyNull(p.Manufacuturer_ID);
                ddlProductType.SelectedValue = ToSQL.EmptyNull(p.ProductType_ID);
                CKEditorControlDescription.Text = ToSQL.EmptyNull(p.Description);
                gvImages.DataSource = p.ProductImages;
                gvImages.DataBind();
                chkNew.Checked = ToSQL.SQLToBool(p.IsNew);
                chkBestSelling.Checked = ToSQL.SQLToBool(p.IsBestSelling);
                chkSpecial.Checked = ToSQL.SQLToBool(p.IsSpecial);
                chkActive.Checked = ToSQL.SQLToBool(p.IsActive);
            }
            else
            {
                Response.Redirect("~/Admincp/Management-Products.aspx");
            }
        }

        private void ReloadProductImage()
        {
            Product p = productRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            if (p != null)
            {
                gvImages.DataSource = p.ProductImages;
                gvImages.DataBind();
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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Product p = productRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            if (p != null)
            {
                p.Name = ToSQL.EmptyNull(txtName.Text);
                p.Price = ToSQL.SQLToDecimal(txtPrice.Text);
                p.ProductType_ID = ToSQL.SQLToIntNull(ddlProductType.SelectedValue);
                p.Manufacuturer_ID = ToSQL.SQLToIntNull(ddlManufacturer.SelectedValue);
                p.Description = CKEditorControlDescription.Text;
                p.IsActive = ToSQL.SQLToBool(chkActive.Checked);
                p.IsBestSelling = ToSQL.SQLToBool(chkBestSelling.Checked);
                p.IsNew = ToSQL.SQLToBool(chkNew.Checked);
                p.IsSpecial = ToSQL.SQLToBool(chkSpecial.Checked);
                if (fulImageDefault.HasFile)
                {
                    ProductImage image = new ProductImage();
                    string url = CheckFileShared.UploadAndRsizeImage(fulImageDefault.PostedFile);
                    if (url != "")
                    {
                        var pi = p.ProductImages.FirstOrDefault(u => u.IsDefault.Value == true); if (pi != null) pi.IsDefault = false;
                        image.Image = url;
                        image.IsDefault = true;
                        p.ProductImages.Add(image);
                    }
                }
                //HttpFileCollection uploads = Request.Files;
                //for (int fileCount = 0; fileCount < uploads.Count; fileCount++)
                foreach (HttpPostedFile uploadedFile in FileUploadJquery.PostedFiles)
                {
                    ProductImage image = new ProductImage();
                    string url = CheckFileShared.UploadAndRsizeImage(uploadedFile);
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
                    lbMessage.Text = "Please check input data! Try again!";
                }
            }
            else
            {
                Response.Redirect("Management-Products.aspx");
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