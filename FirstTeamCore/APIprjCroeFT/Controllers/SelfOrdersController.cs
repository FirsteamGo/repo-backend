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
    public class SelfOrdersController : ControllerBase
    {
        private readonly dbFTContext _context;

        public SelfOrdersController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/SelfOrders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SelfOrder>>> GetSelfOrder()
        {
            return await _context.SelfOrder.ToListAsync();
        }

        // GET: api/SelfOrders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SelfOrder>> GetSelfOrder(int id)
        {
            var selfOrder = await _context.SelfOrder.FindAsync(id);

            if (selfOrder == null)
            {
                return NotFound();
            }

            return selfOrder;
        }

        // PUT: api/SelfOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSelfOrder(int id, SelfOrder selfOrder)
        {
            if (id != selfOrder.自選訂單id)
            {
                return BadRequest();
            }

            _context.Entry(selfOrder).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SelfOrderExists(id))
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

        // POST: api/SelfOrders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<SelfOrder>> PostSelfOrder(SelfOrder selfOrder)
        {
            _context.SelfOrder.Add(selfOrder);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSelfOrder", new { id = selfOrder.自選訂單id }, selfOrder);
        }

        // DELETE: api/SelfOrders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSelfOrder(int id)
        {
            var selfOrder = await _context.SelfOrder.FindAsync(id);
            if (selfOrder == null)
            {
                return NotFound();
            }

            _context.SelfOrder.Remove(selfOrder);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SelfOrderExists(int id)
        {
            return _context.SelfOrder.Any(e => e.自選訂單id == id);
        }
    }
}
