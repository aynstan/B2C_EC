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
    public partial class AddProductType : System.Web.UI.Page
    {
        private ProductTypeRepo productTypeRepo = new ProductTypeRepo();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            ProductType productType = new ProductType();
            productType.Name = ToSQL.EmptyNull(txtName.Text);
            productType.Note = ToSQL.EmptyNull(txtNote.Text);
            productType.IsActive = true;
            productType.SortId = 0;
            productType.DateCreated = DateTime.Now;
            productType.DescriptionTemplate = CKEditorControlDescriptionType.Text;

            int i = productTypeRepo.CreateProductType(productType);
            Response.Redirect("Management-ProductType.aspx");
        }
    }
}