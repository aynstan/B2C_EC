using B2C_EC.Model.Global;
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
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductDetails();
                LoadCustomer();
            }
        }

        private void LoadCustomer()
        {
            if (Session["Customer"] != null)
            {
                Customer c = (Customer)Session["Customer"];
                if (c != null)
                {
                    lblCustomer.Text = c.FirstName + " " + c.LastName;
                    lblCustomer.Visible = true;
                    txtName.Visible = false;
                }
                else
                {
                    lblCustomer.Visible = false;
                    txtName.Visible = true;
                }
            }
        }

        private void LoadProductDetails()
        {
            //Response.Write(Request.Url.ToString());
            if (Request.QueryString["ProductId"] != null)
            {
                int ProductId = ToSQL.SQLToInt(Request.QueryString["ProductId"]);
                Product p = (new ProductRepo()).GetById(ProductId);
                if (p != null)
                {
                    rptImage.DataSource = (new ProductImageRepo()).ImageProductDefaultToList(ProductId);
                    rptImage.DataBind();
                    rptListImages.DataSource = (new ProductImageRepo()).GetAllImagesByProductId(ProductId);
                    rptListImages.DataBind();
                    ltrDetails.Text = p.Description;
                    lblName.Text = p.Name;
                    lblPrice.Text = p.Price.ToString("$#,###.##");
                    dtlReview.DataSource = p.Reviews.OrderByDescending(r => r.DateCreated);
                    dtlReview.DataBind();
                }
                else
                {
                    Response.Redirect("~/Index.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Not found product!');</script>");
                Response.Redirect("~/Index.aspx");
            }
        }

        private void LoadReview()
        {
            if (Request.QueryString["ProductId"] != null)
            {
                int ProductId = ToSQL.SQLToInt(Request.QueryString["ProductId"]);
                Product p = (new ProductRepo()).GetById(ProductId);
                if (p != null)
                {
                    dtlReview.DataSource = p.Reviews.OrderByDescending(r => r.DateCreated);
                    dtlReview.DataBind();
                }
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            AddCart();
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            AddCart();
        }

        private void AddCart()
        {
            Product product = new ProductRepo().GetById(ToSQL.SQLToInt(Request.QueryString["ProductId"]));
            if (product != null)
            {
                List<Cart> carts = (List<Cart>)Session["Carts"];
                Cart cart = new Cart(carts);
                cart = cart.ConverProductToCart(product);
                cart.Quantity = ToSQL.SQLToInt(txtQuantity.Text);
                carts = cart.Add(cart);

                //int Quantity = ToSQL.SQLToInt(txtQuantity.Text) - 1;
                //if (Quantity > 0)
                //{
                //    var obj = carts.FirstOrDefault(x => x.ProductID == cart.ProductID);
                //    if (obj != null) obj.Quantity = obj.Quantity + Quantity;
                //}

                Session["Carts"] = carts;
                Response.Redirect("Payment.aspx");
            }
        }

        public string SetImage(object O)
        {            
            if (CheckFileShared.CheckImageExist(ToSQL.EmptyNull(O)))
                return "~/Resources/ImagesProduct/" + ToSQL.EmptyNull(O);
            else
                return "~/Resources/ImagesProduct/no-image.png";
        }

        public string SetImage(string s)
        {
            if (CheckFileShared.CheckImageExist(ToSQL.EmptyNull(s)))
                return "Resources/ImagesProduct/" + ToSQL.EmptyNull(s);
            else
                return "Resources/ImagesProduct/no-image.png";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string FullName = "";
            if (Session["Customer"] != null)
            {
                Customer c = (Customer)Session["Customer"];
                FullName = c.FirstName + " " + c.LastName;
            }
            else
            {
                FullName = txtName.Text;
            }
            try
            {
                (new ReviewRepo()).WriteComment(FullName, txtComment.Text, ToSQL.SQLToInt(Request.QueryString["ProductId"]));
                LoadReview();
            }
            catch{
            }
        }
    }
}