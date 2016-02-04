using EnvisionedBlog.Data.Services.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EnvisionedBlog.Data.Models;
using EnvisionedBlog.Data.Repositories;

namespace EnvisionedBlog.Data.Services
{
    public class CommentsServices : ICommentsServices
    {
        private IRepository<Comment> comments;

        public CommentsServices(IRepository<Comment> comments)
        {
            this.comments = comments;
        }

        public IQueryable<Comment> GetCommentsByAuthorId(string authorId)
        {
            return this.comments.All().Where(c => c.AuthorId == authorId);
        }
    }
}
