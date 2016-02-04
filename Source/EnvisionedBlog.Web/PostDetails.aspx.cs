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

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public Post fvDetails_GetItem([QueryString]string id)
        {
            // TODO: validate id

            return this.PostsServices.GetById(int.Parse(id));
        }
    }
}