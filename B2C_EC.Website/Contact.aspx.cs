using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Data;

namespace B2C_EC.Website
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VisibleCompareAndWish();
        }

        private void VisibleCompareAndWish()
        {
            ContentPlaceHolder ct = (ContentPlaceHolder)this.Master.Master.FindControl("ContentMain");
            UpdatePanel UpdatePanel1 = (UpdatePanel)ct.FindControl("UpdatePanel1");
            if (UpdatePanel1 != null)
            {
                UpdatePanel1.Visible = false;
            }
            //Repeater rpt1 = (Repeater)ct.FindControl("rptWishList");
            //if (rpt1 != null)
            //{
            //    rpt1.Visible = false;
            //}
        }

        protected void btnContact_Click(object sender, EventArgs e)
        {
            Model.Contact contact = new Model.Contact();
            contact.FirstName = txtFirstName.Text;
            contact.LastName = txtLastName.Text;
            contact.Email = txtEmail.Text;
            contact.Comment = txtComments.Text;
            contact.DateCreated = DateTime.Now;
            int i = new ContactRepo().CreateContact(contact);
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtComments.Text = "";
            lbMessage.Text = "Sent contact successfully!";
            Response.Redirect("Contact.aspx");
        }
    }
}