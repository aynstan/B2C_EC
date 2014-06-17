using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Global;
using B2C_EC.Model.Data;

namespace B2C_EC.Website.Admincp
{
    public partial class EditManufacturer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadManufacturer();
            }
        }
        private void LoadManufacturer()
        {
            int Id = ToSQL.SQLToInt(Request.QueryString["Id"]);
            if (Id > 0)
            {
                Manufacturer manufacturer = new ManufacturerRepo().GetById(Id);
                if (manufacturer != null)
                {
                    txtName.Text = ToSQL.EmptyNull(manufacturer.Name);
                    txtPhone.Text = ToSQL.EmptyNull(manufacturer.Phone);
                    txtWebsite.Text = ToSQL.EmptyNull(manufacturer.Website);
                    txtNote.Text = ToSQL.EmptyNull(manufacturer.Note);
                    chkActive.Checked = ToSQL.SQLToBool(manufacturer.IsActive);
                    if (manufacturer.Address != null)
                    {
                        txtStreet1.Text = ToSQL.EmptyNull(manufacturer.Address.Street1);
                        txtStreet2.Text = ToSQL.EmptyNull(manufacturer.Address.Street2);
                        txtCity.Text = ToSQL.EmptyNull(manufacturer.Address.City);
                        txtState.Text = ToSQL.EmptyNull(manufacturer.Address.State);
                        txtCountry.Text = ToSQL.EmptyNull(manufacturer.Address.Country);
                        txtZipCode.Text = ToSQL.EmptyNull(manufacturer.Address.ZipCode);
                    }
                }
                else
                {
                    Response.Redirect("Management-Manafacturer.aspx");
                }
            }
            else
            {
                Response.Redirect("Management-Manafacturer.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int Id = ToSQL.SQLToInt(Request.QueryString["Id"]);
            if (Id > 0)
            {
                Manufacturer manufacturer = new ManufacturerRepo().GetById(Id);
                if (manufacturer != null)
                {
                    manufacturer.Name = ToSQL.EmptyNull(txtName.Text);
                    manufacturer.Phone = ToSQL.EmptyNull(txtPhone.Text);
                    manufacturer.Website = ToSQL.EmptyNull(txtWebsite.Text);
                    manufacturer.Note = ToSQL.EmptyNull(txtNote.Text);
                    manufacturer.IsActive = ToSQL.SQLToBool(chkActive.Checked);

                    if (manufacturer.Address == null)
                        manufacturer.Address = new Address();
                    manufacturer.Address.Street1 = ToSQL.EmptyNull(txtStreet1.Text);
                    manufacturer.Address.Street2 = ToSQL.EmptyNull(txtStreet2.Text);
                    manufacturer.Address.City = ToSQL.EmptyNull(txtCity.Text);
                    manufacturer.Address.State = ToSQL.EmptyNull(txtState.Text);
                    manufacturer.Address.Country = ToSQL.EmptyNull(txtCountry.Text);
                    manufacturer.Address.ZipCode = ToSQL.EmptyNull(txtZipCode.Text);

                    int i = new AddressRepo().UpdateAddress(manufacturer.Address);
                    manufacturer.Address_ID = manufacturer.Address.ID;
                    i = new ManufacturerRepo().UpdateManufacturer(manufacturer);

                    Response.Redirect("Management-Manafacturer.aspx");
                }
                else
                {
                    Response.Redirect("Management-Manafacturer.aspx");
                }
            }
            else
            {
                Response.Redirect("Management-Manafacturer.aspx");
            }
        }
    }
}