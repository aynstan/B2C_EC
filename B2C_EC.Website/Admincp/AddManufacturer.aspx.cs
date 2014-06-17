using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model.Global;
using B2C_EC.Model;
using B2C_EC.Model.Data;

namespace B2C_EC.Website.Admincp
{
    public partial class AddManufacturer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Manufacturer manufacturer = new Manufacturer();
            manufacturer.Name = ToSQL.EmptyNull(txtName.Text);
            manufacturer.Phone = ToSQL.EmptyNull(txtPhone.Text);
            manufacturer.Website = ToSQL.EmptyNull(txtWebsite.Text);
            manufacturer.Note = ToSQL.EmptyNull(txtNote.Text);
            manufacturer.IsActive = true;
            manufacturer.Address = new Address()
            {
                Street1 = ToSQL.EmptyNull(txtStreet1.Text),
                Street2 = ToSQL.EmptyNull(txtStreet2.Text),
                City = ToSQL.EmptyNull(txtCity.Text),
                State = ToSQL.EmptyNull(txtState.Text),
                Country = ToSQL.EmptyNull(txtCountry.Text),
                ZipCode = ToSQL.EmptyNull(txtZipCode.Text)
            };
            int i = new ManufacturerRepo().CreateManufacturer(manufacturer);
            Response.Redirect("Management-Manafacturer.aspx");
        }
    }
}