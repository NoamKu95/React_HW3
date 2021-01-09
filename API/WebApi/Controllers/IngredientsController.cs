using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DATA.EF;

namespace WebApi.Controllers
{
    public class IngredientsController : ApiController
    {
        // GET api/<controller>
        public dynamic Get()
        {

            KitchenDbContext db = new KitchenDbContext();
            var ingredients = db.Ingredients.Select(x => new
            {
                IngredientName = x.name,
                IngredientImage = x.image,
                IngredientId = x.id,
                Calories = x.calories
            }).ToList();
            return ingredients;
        }

        // GET api/<controller>/5
        public dynamic Get(int id)
        {
            KitchenDbContext db = new KitchenDbContext();
            var i = db.Ingredients.Select(ing => new
            {
                IngredientName = ing.name,
                IngredientImage = ing.image,
                IngredientId = ing.id,
                Calories = ing.calories
            }).SingleOrDefault(x => x.IngredientId == id);

            if (i != null)
            {
                return i;
            }
            return null;
        }

        // POST api/<controller>
        public void Post([FromBody]Ingredient value)
        {
            KitchenDbContext db = new KitchenDbContext();

            Ingredient i = new Ingredient();
            i.name = value.name;
            i.image = value.image;
            i.calories = value.calories;

            db.Ingredients.Add(i);
            db.SaveChanges();
        }
    }
}