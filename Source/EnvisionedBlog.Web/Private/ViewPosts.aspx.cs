namespace EnvisionedBlog.Web.Private
{
    using Data.Models;
    using Data.Services.Contracts;
    using Ninject;
    using System;
    using System.Linq;
    using System.Linq.Dynamic;
    using Microsoft.AspNet.Identity;
    using System.Web.ModelBinding;
    using System.Web.UI.WebControls;

    public partial class ViewPosts : System.Web.UI.Page
    {
        [Inject]
        public IPostsServices PostsServices { get; set; }

        [Inject]
        public ICategoriesServices CategoriesServices { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Post> lvPosts_GetData([QueryString]string orderBy)
        {
            var result = this.PostsServices.GetAll();

            // TODO: validate orderBy or create dictionary

            result = string.IsNullOrEmpty(orderBy) ? result.OrderBy(x => x.Id) : result.OrderBy(orderBy + " Ascending");

            return result;
        }

        public IQueryable<Category> ddlCategories_GetData()
        {
            return this.CategoriesServices.GetAll();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void lvPosts_UpdateItem(int id)
        {
            var post = new Post();

            TryUpdateModel(post);

            this.PostsServices.UpdateById(id, post);
        }

        public void lvPosts_DeleteItem(int id)
        {
            this.PostsServices.DeleteById(id);

            this.Response.Redirect(this.Request.RawUrl);
        }

        public void lvPosts_InsertItem()
        {
            var postToInsert = new Post();
            TryUpdateModel(postToInsert);

            postToInsert.AuthorId = Page.User.Identity.GetUserId();
            postToInsert.DateCreated = DateTime.UtcNow;

            this.PostsServices.Create(postToInsert);
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            this.lvPosts.InsertItemPosition = System.Web.UI.WebControls.InsertItemPosition.LastItem;
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            this.lvPosts.InsertItemPosition = System.Web.UI.WebControls.InsertItemPosition.None;
        }

        protected void Unnamed_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.Value.Length >= 3;
        }
    }
}