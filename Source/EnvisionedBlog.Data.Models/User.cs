namespace EnvisionedBlog.Data.Models
{
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;
    using System.Collections.Generic;
    using System.Security.Claims;
    using System.Threading.Tasks;

    public class User : IdentityUser
    {
        private ICollection<Comment> comments;

        public User()
        {
            this.comments = new HashSet<Comment>();
            this.Avatar = "https://telerikacademy.com/Content/Images/apple-touch-icon.png";
        }

        public string FirstName { get; set; }
        
        public string LastName { get; set; }

        public string Avatar { get; set; }

        public string FacebookUrl { get; set; }

        public string LinkedInUrl { get; set; }

        public string GithubUrl { get; set; }

        public virtual ICollection<Comment> Comments { get { return this.comments; } set { this.comments = value; } }

        public ClaimsIdentity GenerateUserIdentity(UserManager<User> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = manager.CreateIdentity(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }

        public Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager)
        {
            return Task.FromResult(GenerateUserIdentity(manager));
        }
    }
}
