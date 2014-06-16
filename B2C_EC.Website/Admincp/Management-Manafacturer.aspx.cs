using B2C_EC.Model;
using B2C_EC.Model.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B2C_EC.Model;
using B2C_EC.Model.Global;
using B2C_EC.Model.Data;

namespace B2C_EC.Website.Admincp
{
    public partial class Management_Manafacturer : System.Web.UI.Page
    {
        private ManufacturerRepo manufactureRepo = new ManufacturerRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindItemsList();
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            BindItemsList();
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton lnk = (LinkButton)sender;
                int Id = ToSQL.SQLToInt(lnk.CommandArgument);
                if (Id > 0)
                {
                    int i = new ManufacturerRepo().DeleteManufacturer(Id);
                    BindItemsList();
                }
            }
            catch
            {

            }
        }

        #region Paging
        #region Private Properties
        private int CurrentPage
        {
            get
            {
                object objPage = ViewState["_CurrentPage"];
                int _CurrentPage = 0;
                if (objPage == null)
                {
                    _CurrentPage = 0;
                }
                else
                {
                    _CurrentPage = (int)objPage;
                }
                return _CurrentPage;
            }
            set { ViewState["_CurrentPage"] = value; }
        }
        private int fistIndex
        {
            get
            {

                int _FirstIndex = 0;
                if (ViewState["_FirstIndex"] == null)
                {
                    _FirstIndex = 0;
                }
                else
                {
                    _FirstIndex = Convert.ToInt32(ViewState["_FirstIndex"]);
                }
                return _FirstIndex;
            }
            set { ViewState["_FirstIndex"] = value; }
        }
        private int lastIndex
        {
            get
            {

                int _LastIndex = 0;
                if (ViewState["_LastIndex"] == null)
                {
                    _LastIndex = 0;
                }
                else
                {
                    _LastIndex = Convert.ToInt32(ViewState["_LastIndex"]);
                }
                return _LastIndex;
            }
            set { ViewState["_LastIndex"] = value; }
        }
        #endregion

        #region PagedDataSource
        PagedDataSource _PageDataSource = new PagedDataSource();
        #endregion

        private void BindItemsList()
        {
            List<Model.Manufacturer> users = manufactureRepo.GetManagementManufacturers(ToSQL.SQLToInt(txtManufacturerID.Text), ToSQL.EmptyNull(txtName.Text), 
                                                                                        ToSQL.EmptyNull(txtPhone.Text),ToSQL.EmptyNull(txtWebsite.Text));
            _PageDataSource.DataSource = users;
            _PageDataSource.AllowPaging = true;
            _PageDataSource.PageSize = 2;
            _PageDataSource.CurrentPageIndex = CurrentPage;
            ViewState["TotalPages"] = _PageDataSource.PageCount;

            //this.lblPageInfo.Text = "Results: " + ProductList.Count.ToString() + "&nbsp;&nbsp;&nbsp;&nbsp;Page " + (CurrentPage + 1) + " of " + _PageDataSource.PageCount + "&nbsp;&nbsp;";

            this.btnPre.Visible = !_PageDataSource.IsFirstPage;
            this.btnNext.Visible = !_PageDataSource.IsLastPage;
            //this.lbtnFirst.Visible = !_PageDataSource.IsFirstPage;
            //this.lbtnLast.Visible = !_PageDataSource.IsLastPage;

            this.gvManufacturers.DataSource = _PageDataSource;
            this.gvManufacturers.DataBind();
            //this.gvManufacturers.UseAccessibleHeader = true;
            //this.gvManufacturers.HeaderRow.TableSection = TableRowSection.TableHeader;
            this.doPaging();
        }
        private void doPaging()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            fistIndex = CurrentPage - 5;
            if (CurrentPage > 5)
            {
                lastIndex = CurrentPage + 5;
            }
            else
            {
                lastIndex = 10;
            }
            if (lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                fistIndex = lastIndex - 10;
            }
            if (fistIndex < 0)
            {
                fistIndex = 0;
            }
            for (int i = fistIndex; i < lastIndex; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }
            this.rptPaging.DataSource = dt;
            this.rptPaging.DataBind();
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            this.BindItemsList();
        }

        protected void btnPre_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            this.BindItemsList();
        }
        protected void lbtnLast_Click(object sender, EventArgs e)
        {
            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            this.BindItemsList();
        }
        protected void lbtnFirst_Click(object sender, EventArgs e)
        {
            CurrentPage = 0;
            this.BindItemsList();
        }

        protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.Equals("Paging"))
            {
                CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
                this.BindItemsList();
            }
        }

        protected void rptPaging_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
            if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkbtnPage.Enabled = false;
                lnkbtnPage.Style.Add("fone-size", "14px");
                lnkbtnPage.Font.Bold = true;
                lnkbtnPage.ForeColor = System.Drawing.ColorTranslator.FromHtml("#000");
            }
        }

        #endregion

    }
}