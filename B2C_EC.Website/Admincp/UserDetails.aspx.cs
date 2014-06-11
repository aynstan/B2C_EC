using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Data;

namespace B2C_EC.Website.Admincp
{
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            User user;
            if (ViewState["User"] != null)
            {
                user = (User)ViewState["User"];
            }
            else
            {
                user = new User();
            }
            if (user != null)
            {
                user.FirstName = txtFirstName.Text;
                user.LastName = txtLastName.Text;
                user.Username = txtUserName.Text;
                user.Password = Security.Decrypt(txtKeys.Text, txtPassword.Text);
                if (user.Address == null)
                    user.Address = new Address();
            }
        }
    }
}