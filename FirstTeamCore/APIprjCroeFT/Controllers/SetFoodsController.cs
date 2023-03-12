using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using APIprjCroeFT.Models;
using Microsoft.AspNetCore.Cors;

namespace APIprjCroeFT.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class SetFoodsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public SetFoodsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/SetFoods
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SetFood>>> GetSetFood()
        {
            return await _context.SetFood.ToListAsync();
        }

        // GET: api/SetFoods/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SetFood>> GetSetFood(int id)
        {
            var setFood = await _context.SetFood.FindAsync(id);

            if (setFood == null)
            {
                return NotFound();
            }

            return setFood;
        }

        // PUT: api/SetFoods/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSetFood(int id, SetFood setFood)
        {
            if (id != setFood.餐廳id)
            {
                return BadRequest();
            }

            _context.Entry(setFood).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SetFoodExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/SetFoods
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<SetFood>> PostSetFood(SetFood setFood)
        {
            _context.SetFood.Add(setFood);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSetFood", new { id = setFood.餐廳id }, setFood);
        }

        // DELETE: api/SetFoods/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSetFood(int id)
        {
            var setFood = await _context.SetFood.FindAsync(id);
            if (setFood == null)
            {
                return NotFound();
            }

            _context.SetFood.Remove(setFood);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SetFoodExists(int id)
        {
            return _context.SetFood.Any(e => e.餐廳id == id);
        }
    }
}
