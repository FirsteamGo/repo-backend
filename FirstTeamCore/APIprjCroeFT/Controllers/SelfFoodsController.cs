using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using APIprjCroeFT.Models;

namespace APIprjCroeFT.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SelfFoodsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public SelfFoodsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/SelfFoods
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SelfFood>>> GetSelfFood()
        {
            return await _context.SelfFood.ToListAsync();
        }

        // GET: api/SelfFoods/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SelfFood>> GetSelfFood(int id)
        {
            var selfFood = await _context.SelfFood.FindAsync(id);

            if (selfFood == null)
            {
                return NotFound();
            }

            return selfFood;
        }

        // PUT: api/SelfFoods/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSelfFood(int id, SelfFood selfFood)
        {
            if (id != selfFood.自選飲食id)
            {
                return BadRequest();
            }

            _context.Entry(selfFood).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SelfFoodExists(id))
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

        // POST: api/SelfFoods
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<SelfFood>> PostSelfFood(SelfFood selfFood)
        {
            _context.SelfFood.Add(selfFood);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSelfFood", new { id = selfFood.自選飲食id }, selfFood);
        }

        // DELETE: api/SelfFoods/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSelfFood(int id)
        {
            var selfFood = await _context.SelfFood.FindAsync(id);
            if (selfFood == null)
            {
                return NotFound();
            }

            _context.SelfFood.Remove(selfFood);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SelfFoodExists(int id)
        {
            return _context.SelfFood.Any(e => e.自選飲食id == id);
        }
    }
}
