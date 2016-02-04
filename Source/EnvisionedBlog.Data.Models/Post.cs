namespace EnvisionedBlog.Data.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Post
    {
        private ICollection<Like> likes;
        private ICollection<Comment> comments;

        public Post()
        {
            this.likes = new HashSet<Like>();
            this.comments = new HashSet<Comment>();
        }

        public int Id { get; set; }

        public string Content { get; set; }

        public string Title { get; set; }

        public DateTime DateCreated { get; set; }

        [Required]
        public string AuthorId { get; set; }
        
        public virtual User Author { get; set; }

        [Required]
        public int CategoryId { get; set; }
        
        public virtual Category Category { get; set; }

        public virtual ICollection<Like> Likes { get { return this.likes; } set { this.likes = value; } }

        public virtual ICollection<Comment> Comments { get { return this.comments; } set { this.comments = value; } }
    }
}