namespace EnvisionedBlog.Web
{
    using EnvisionedBlog.Data.Models;
    using EnvisionedBlog.Data.Services.Contracts;
    using Ninject;
    using System;
    using System.Web.ModelBinding;

    public partial class ViewPost : System.Web.UI.Page
    {
        [Inject]
        public IPostsServices PostsServices { get; set; }

        protected void Page_Render(object sender, EventArgs e)
        {
        }
        
        public Post fvDetails_GetItem([QueryString]string id)
        {
            int projectId;
            if (!int.TryParse(this.Request.QueryString["id"], out projectId))
            {
                this.Response.Redirect("/");
            }

            var post = this.PostsServices.GetById(projectId);
            this.Title = post.Title;
            this.PostTitle.Text = post.Title;
            return post;
        }
    }
}