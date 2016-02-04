using EnvisionedBlog.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnvisionedBlog.Data.Services.Contracts
{
    public interface ICommentsServices
    {
        IQueryable<Comment> GetCommentsByAuthorId(string authorId);
    }
}
