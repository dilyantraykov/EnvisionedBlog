namespace EnvisionedBlog.Data
{
    using System;
    using System.Data.Entity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using Models;

    public class EnvisionedBlogDbContext : IdentityDbContext<User>, IEnvisionedBlogDbContext
    {
        public EnvisionedBlogDbContext()
            : base("DefaultConnection", throwIfV1Schema: false)
        {
        }

        public IDbSet<Post> Posts { get; set; }

        public IDbSet<Category> Categories { get; set; }

        public IDbSet<Like> Likes { get; set; }

        public IDbSet<Comment> Comments { get; set; }

        public static EnvisionedBlogDbContext Create()
        {
            return new EnvisionedBlogDbContext();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder
                .Entity<Post>()
                .HasRequired(p => p.Category)
                .WithMany(x => x.Posts)
                .WillCascadeOnDelete(true);

            base.OnModelCreating(modelBuilder);
        }
    }
}
