using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Data;
using B2C_EC.Website;
using B2C_EC.Model.Global;

namespace B2C_EC.Website.Admincp
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Page.User.Identity.IsAuthenticated == false)
                    Response.Redirect("~/Admincp/Login.aspx");

                User user = new UserRepo().GetUserByUsername(ToSQL.EmptyNull(Page.User.Identity.Name));
                if (user != null && user.LastLogin !=null)
                {
                    lbLastlogin.Text = user.LastLogin.Value.ToString("MM-dd-yyyy hh:mm");
                }
            }
        }
    }
}