namespace EnvisionedBlog.Data.Services
{
    using Contracts;
    using System.Linq;
    using EnvisionedBlog.Data.Models;
    using EnvisionedBlog.Data.Repositories;

    public class PostsServices : IPostsServices
    {
        private IRepository<Post> posts;

        public PostsServices(IRepository<Post> posts)
        {
            this.posts = posts;
        }

        public IQueryable<Post> GetAll()
        {
            return this.posts.All();
        }

        public IQueryable<Post> GetTop(int count)
        {
            return this.posts.All().OrderByDescending(x => x.Likes.Count()).Take(count);
        }

        public Post GetById(int id)
        {
            return this.posts.GetById(id);
        }

        public void Create(Post post)
        {
            this.posts.Add(post);
            this.posts.SaveChanges();
        }

        public void UpdateById(int id, Post updatePost)
        {
            var postToUpdate = this.posts.GetById(id);

            postToUpdate.CategoryId = updatePost.CategoryId;
            postToUpdate.Title = updatePost.Title;
            postToUpdate.Content = updatePost.Content;

            this.posts.SaveChanges();
        }

        public void DeleteById(int id)
        {
            this.posts.Delete(id);
            this.posts.SaveChanges();
        }
    }
}
