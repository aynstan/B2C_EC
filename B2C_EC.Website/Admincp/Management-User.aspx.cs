using B2C_EC.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2C_EC.Website.Admincp
{
    public partial class Management_User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAllUsers();
            }
        }

        private void LoadAllUsers()
        {
            gvUsers.DataSource = (new UserRepo()).GetAllUsers();
            gvUsers.DataBind();
        }
    }
}