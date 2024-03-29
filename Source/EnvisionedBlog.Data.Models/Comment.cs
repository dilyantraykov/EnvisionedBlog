﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnvisionedBlog.Data.Models
{
    public class Comment
    {
        public Comment()
        {
            this.PublishDate = DateTime.Now;
        }

        public int Id { get; set; }

        public string Message { get; set; }

        public DateTime PublishDate { get; set; }

        public string AuthorId { get; set; }

        public virtual User Author { get; set; }

        public int PostId { get; set; }

        public virtual Post Post { get; set; }
    }
}
