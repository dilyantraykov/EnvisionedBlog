namespace EnvisionedBlog.Data.Services.Contracts
{
    using Models;

    public interface ILikesServices
    {
        Like GetByAuthorIdAndPostdId(string userId, int postId);

        void ChangeLike(string userId, int postId);

        void CreateLike(Like like);
    }
}
