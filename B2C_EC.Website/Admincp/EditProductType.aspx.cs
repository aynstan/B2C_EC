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
    public partial class EditProductType : System.Web.UI.Page
    {
        ProductTypeRepo productTypeRepo = new ProductTypeRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductType();
            }
        }

        private void LoadProductType()
        {
            if (Request.QueryString["ID"] != null)
            {
                ProductType pt = productTypeRepo.GetById(ToSQL.SQLToInt(Request.QueryString["ID"]));
                if (pt != null)
                {
                    txtID.Text = pt.ID.ToString();
                    txtName.Text = pt.Name;
                    txtSortID.Text = ToSQL.EmptyNull(pt.SortId);
                    txtNote.Text = pt.Note;
                    chkActive.Checked = ToSQL.SQLToBool(pt.IsActive);
                }
                else
                {
                    Response.Redirect("~/Admincp/Management-ProductType.aspx");
                }
            }
            else
            {
                Response.Redirect("~/Admincp/Management-ProductType.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
    }
}