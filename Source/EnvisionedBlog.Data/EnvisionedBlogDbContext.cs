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

        public IDbSet<Article> Articles { get; set; }

        public IDbSet<Category> Categories { get; set; }

        public IDbSet<Like> Likes { get; set; }

        public static EnvisionedBlogDbContext Create()
        {
            return new EnvisionedBlogDbContext();
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder
                .Entity<Article>()
                .HasRequired(p => p.Category)
                .WithMany(x => x.Articles)
                .WillCascadeOnDelete(true);

            base.OnModelCreating(modelBuilder);
        }
    }
}
