namespace EnvisionedBlog.Web
{
    using EnvisionedBlog.Data.Models;
    using EnvisionedBlog.Data.Services.Contracts;
    using Ninject;
    using System;
    using System.Collections.Generic;
    using System.Linq;

    public partial class Home : System.Web.UI.Page
    {
        [Inject]
        public IPostsServices PostsServices { get; set; }

        [Inject]
        public ICategoriesServices CategoriesServices { get; set; }

        public IEnumerable<Post> repeaterPost_GetData1()
        {
            return this.PostsServices.GetTop(3);
        }

        public IQueryable<Post> lastPosts_GetData2()
        {
            return this.PostsServices.GetAll()
                                    .OrderByDescending(p => p.Likes.Count)
                                    .Take(10);
        }
    }
}