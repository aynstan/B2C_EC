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
                LoadReview();
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
            int ProductId = ToSQL.SQLToInt(Request.QueryString["ProductId"]);
            List<Review> Reviews = new ReviewRepo().GetByProductId(ProductId);
            rptReview.DataSource = Reviews;
            rptReview.DataBind();
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if(AddCart())
                Response.Redirect("ViewCart.aspx");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            if(AddCart())
                Response.Redirect("Payment.aspx");
        }

        private bool AddCart()
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
                return true;
            }
            return false;
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
                Review r = new Review();
                r.FullName = FullName;
                r.Comment = txtComment.Text;
                r.DateCreated = DateTime.Now;
                r.Product_ID = ToSQL.SQLToInt(Request.QueryString["ProductId"]);
                int i = new ReviewRepo().CreateReview(r);
                Response.Redirect(Request.Url.PathAndQuery + "#divreview");
            }
            catch
            {
            }
        }
    }
}