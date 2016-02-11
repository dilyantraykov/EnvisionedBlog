using EnvisionedBlog.Data.Models;
using EnvisionedBlog.Data.Services.Contracts;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EnvisionedBlog.Web
{
    public partial class Sidebar : System.Web.UI.UserControl
    {
        [Inject]
        public IPostsServices PostsServices { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Post> lastPosts_GetData()
        {
            return this.PostsServices.GetAll()
                                    .OrderByDescending(p => p.DateCreated)
                                    .Take(5);
        }
    }
}