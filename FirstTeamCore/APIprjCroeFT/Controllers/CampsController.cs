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
    public class CampsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public CampsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/Camps
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Camp>>> GetCamp()
        {
            return await _context.Camp.ToListAsync();
        }

        // GET: api/Camps/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Camp>> GetCamp(int id)
        {
            var camp = await _context.Camp.FindAsync(id);

            if (camp == null)
            {
                return NotFound();
            }

            return camp;
        }

        // PUT: api/Camps/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCamp(int id, Camp camp)
        {
            if (id != camp.營區id)
            {
                return BadRequest();
            }

            _context.Entry(camp).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CampExists(id))
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

        // POST: api/Camps
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Camp>> PostCamp(Camp camp)
        {
            _context.Camp.Add(camp);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCamp", new { id = camp.營區id }, camp);
        }

        // DELETE: api/Camps/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCamp(int id)
        {
            var camp = await _context.Camp.FindAsync(id);
            if (camp == null)
            {
                return NotFound();
            }

            _context.Camp.Remove(camp);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CampExists(int id)
        {
            return _context.Camp.Any(e => e.營區id == id);
        }
    }
}
