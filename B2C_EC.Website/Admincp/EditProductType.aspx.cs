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
    public partial class EditProductType : System.Web.UI.Page
    {
        private ProductTypeRepo productTypeRepo = new ProductTypeRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductType();
            }
        }

        private void LoadProductType()
        {
            ProductType pt = productTypeRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            if (pt != null)
            {
                txtName.Text = ToSQL.EmptyNull(pt.Name);
                txtNote.Text = ToSQL.EmptyNull(pt.Note);
                CKEditorControlDescriptionType.Text = ToSQL.EmptyNull(pt.DescriptionTemplate);
                chkActive.Checked = ToSQL.SQLToBool(pt.IsActive);
            }
            else
            {
                Response.Redirect("~/Admincp/Management-ProductType.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ProductType productType = productTypeRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
            if (productType != null)
            {
                lbMessage.Text = "";
                productType.Name = txtName.Text;
                productType.DescriptionTemplate = CKEditorControlDescriptionType.Text;
                productType.Note = txtNote.Text;
                productType.IsActive = ToSQL.SQLToBool(chkActive.Checked);
                int i = productTypeRepo.UpdateProductType(productType);
                Response.Redirect("~/Admincp/Management-ProductType.aspx");
            }
            else
            {
                Response.Redirect("~/Admincp/Management-ProductType.aspx");
            }
        }
    }
}