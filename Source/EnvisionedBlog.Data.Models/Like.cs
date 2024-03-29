﻿namespace EnvisionedBlog.Data.Models
{
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class Like
    {
        public int Id { get; set; }

        public bool Value { get; set; }

        public string AuthorId { get; set; }
        
        public virtual User Author { get; set; }

        public int PostId { get; set; }
        
        public virtual Post Post { get; set; }
    }
}