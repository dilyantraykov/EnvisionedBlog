using EnvisionedBlog.Data.Models;
using EnvisionedBlog.Data.Services.Contracts;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EnvisionedBlog.Web
{
    public partial class Categories : System.Web.UI.Page
    {
        [Inject]
        public ICategoriesServices CategoriesServices { get; set; }
        
        public IQueryable<Category> lvCategories_GetData()
        {
            return this.CategoriesServices.GetAll(); ;
        }
    }
}