using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using B2C_EC.Model.Global;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

namespace B2C_EC.Website
{
    public class CheckFileShared
    {
        public static bool CheckImageExist(string image)
        {
            if (System.IO.File.Exists(HttpContext.Current.Server.MapPath("~/Resources/ImagesProduct/" + image)))
            {
                return true;
            }
            return false;
        }

        public static string ShortString(string s)
        {
            if (s.Length <= 20)
                return s;
            else
                return s.Substring(0, 18) + "...";
        }

        public static string ShortString(object o)
        {
            string s = ToSQL.EmptyNull(o);
            return ShortString(s);
        }

        public static string UploadAndRsizeImage(HttpPostedFile p)
        {
            Image playbutton;
            try
            {
                playbutton = Image.FromStream(p.InputStream);
            }
            catch (Exception ex)
            {
                return "";
            }
            int wh = 0;
            if (playbutton.Height > playbutton.Width)
                wh = playbutton.Height;
            else
                wh = playbutton.Width;
            using (var bitmap = new Bitmap(wh, wh))
            {
                using (var canvas = Graphics.FromImage(bitmap))
                {
                    canvas.DrawRectangle(new Pen(Brushes.Transparent, wh), 0, 0, wh, wh);
                    //canvas.DrawLine(new Pen(Color.Black), 0, 0, wh, wh);
                    //canvas.DrawLine(new Pen(Color.Black), wh, 0, 0, wh);
                    canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                    if (playbutton.Width > playbutton.Height)
                    {
                        float x = (bitmap.Height / 2) - (playbutton.Height / 2);
                        canvas.DrawImage(playbutton, 0, x, playbutton.Width, playbutton.Height);
                    }
                    else
                    {
                        float x = (bitmap.Width / 2) - (playbutton.Width / 2);
                        canvas.DrawImage(playbutton, x, 0, playbutton.Width, playbutton.Height);
                    }
                    canvas.Save();
                }
                try
                {
                    bitmap.Save(HttpContext.Current.Server.MapPath("~/Resources/ImagesProduct/" + Path.GetFileNameWithoutExtension(p.FileName)) + ".png", ImageFormat.Png);
                    return Path.GetFileNameWithoutExtension(p.FileName) + ".png";
                }
                catch (Exception ex) {
                    return "";
                }
            }
            return "";
        }

        public static HttpCookie GetAndCreateCookies(string Name)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[Name];
            if (cookie == null)
                cookie = new HttpCookie(Name);
            return cookie;
        }

        public string[] GetValuesCookie(string Name)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[Name];
            if (cookie != null)
                return cookie.Values.AllKeys;
            else
                return null;
        }
    }
}