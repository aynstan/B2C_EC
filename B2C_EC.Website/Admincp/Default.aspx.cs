using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace B2C_EC.Website.Admincp
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated == false)
                    Response.Redirect("~/admincp/Login.aspx");
                int PositionID = 1;
                try
                {
                    PositionID = int.Parse(Page.RouteData.Values["ViTri"].ToString());
                }
                catch
                {
                    PositionID = -1;
                }
                if (PositionID == 1 && User.Identity.IsAuthenticated == true)
                {
                    hlQuanLyCL.Visible = true;
                    hlQuanLyNCC.Visible = true;
                    hlQuanLyHD.Visible = true;
                    //hlQuanLyXX.Visible = true;
                    hlQuanLyKH.Visible = true;
                    hlQuanLySP.Visible = true;
                    hlQuanLyDDH.Visible = true;
                    //hlTuVan.Visible = true;
                    //hlQuanLyCL.NavigateUrl = "~/Quan-Ly-Chung-Loai/" + PositionID;
                    //hlQuanLyNCC.NavigateUrl = "~/Quan-Ly-Nha-Cung-Cap/" + PositionID;
                    //hlQuanLyCV.NavigateUrl = "~/Quan-Ly-Chuc-Vu/" + PositionID;
                    //hlQuanLyXX.NavigateUrl = "~/Quan-Ly-Xuat-Xu/" + PositionID;
                    //hlQuanLyNVKH.NavigateUrl = "~/Quan-Ly-Nhan-Vien-Khach-Hang/" + PositionID + "/0";
                    //hlQuanLySP.NavigateUrl = "~/Quan-Ly-San-Pham/" + PositionID + "/0";
                    //hlQuanLyDDH.NavigateUrl = "~/Quan-Ly-Dat-Hang-Thanh-Toan/" + PositionID + "/0";
                    //hlTuVan.NavigateUrl = "~/Quan-Ly-Tu-Van/" + PositionID + "/0";
                }

            }
        }
    }
}