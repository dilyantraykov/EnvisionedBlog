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
    public partial class LatestPosts : System.Web.UI.Page
    {
        [Inject]
        public IPostsServices PostsServices { get; set; }
        
        public IEnumerable<Post> repeaterPost_GetData1()
        {
            return this.PostsServices.GetLatest(10);
        }
    }
}