namespace EnvisionedBlog.Data.Migrations
{
    using Models;
    using EnvisionedBlog.Migrations;
    using System.Data.Entity.Migrations;
    using System.Linq;

    public sealed class Configuration : DbMigrationsConfiguration<EnvisionedBlog.Data.EnvisionedBlogDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(EnvisionedBlog.Data.EnvisionedBlogDbContext context)
        {
            if (context.Articles.Any())
            {
                return;
            }

            var user = new User()
            {
                UserName = "Kon"
            };

            context.Users.Add(user);

            context.SaveChanges();

            var seed = new SeedData(user);

            seed.Categories.ForEach(x => context.Categories.Add(x));

            seed.Articles.ForEach(x => context.Articles.Add(x));

            context.SaveChanges();
        }
    }
}
