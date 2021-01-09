using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DATA.EF;

namespace WebApi.Controllers
{
    public class RecipesController : ApiController
    {
        // GET api/<controller>
        public dynamic Get()
        {
            KitchenDbContext db = new KitchenDbContext();
            var recipes = db.Recipes.Select(x => new
            {
                
                RecipeName = x.name,
                RecipeImage = x.image,
                RecipeId = x.id,
                CookingTime = x.time,
                CookingMethod = x.cookingMethod
            }).ToList();

            return recipes;
        }


        // POST api/<controller>
        public void Post([FromBody]Recipe value)
        {
            KitchenDbContext db = new KitchenDbContext();
            try
            {
                Recipe r = new Recipe();
                r.name = value.name;
                r.image = value.image;
                r.time = value.time;
                r.cookingMethod = value.cookingMethod;

                r.Ingredients = value.Ingredients; //What do we get in "Ingredients" from the client?

                db.Recipes.Add(r);
                db.SaveChanges();
            }
            catch (Exception)
            {

            }
            
        }


    }
}