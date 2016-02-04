namespace EnvisionedBlog.Data.Migrations
{
    using EnvisionedBlog.Migrations;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using System;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System.Diagnostics;
    using System.Data.Entity.Validation;
    public sealed class Configuration : DbMigrationsConfiguration<EnvisionedBlogDbContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            AutomaticMigrationDataLossAllowed = true;
        }

        protected override void Seed(EnvisionedBlogDbContext context)
        {
            if (context.Posts.Any())
            {
                return;
            }

            var rand = new Random();
            var passwordHash = new PasswordHasher();
            var seed = new SeedData();

            seed.Users.ForEach(x => context.Users.Add(x));
            context.SaveChanges();

            var role = context.Roles.Add(new IdentityRole("Administrator"));
            var roleId = role.Id;
            var administrator = seed.Users[0];
            administrator.Roles.Add(new IdentityUserRole()
            {
                RoleId = roleId,
                UserId = administrator.Id
            });
            context.SaveChanges();

            seed.Categories.ForEach(x => context.Categories.Add(x));
            context.SaveChanges();

            seed.Comments.ForEach(x =>
            {
                x.Author = seed.Users[rand.Next(0, seed.Users.Count)];
                x.Post = seed.Posts[rand.Next(0, seed.Posts.Count)];
                context.Comments.Add(x);
            });

            seed.Posts.ForEach(x =>
            {
                x.Author = seed.Users[rand.Next(0, seed.Users.Count)];
                context.Posts.Add(x);
            });
            try
            {
                context.SaveChanges();
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var eve in ex.EntityValidationErrors)
                {
                    Debug.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Debug.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
        }
    }
}
