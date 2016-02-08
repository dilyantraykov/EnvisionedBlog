namespace EnvisionedBlog.Data.Services.Contracts
{
    using EnvisionedBlog.Data.Models;
    using System.Linq;

    public interface IPostsServices
    {
        IQueryable<Post> GetTop(int count);

        IQueryable<Post> GetLatest(int count);

        IQueryable<Post> GetAll();

        Post GetById(int id);

        void UpdateById(int id, Post updatePost);

        void DeleteById(int id);

        void Create(Post post);
    }
}
