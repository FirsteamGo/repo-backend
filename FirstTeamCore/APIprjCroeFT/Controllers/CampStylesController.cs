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
    public class CampStylesController : ControllerBase
    {
        private readonly dbFTContext _context;

        public CampStylesController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/CampStyles
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CampStyle>>> GetCampStyle()
        {
            return await _context.CampStyle.ToListAsync();
        }

        // GET: api/CampStyles/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CampStyle>> GetCampStyle(int id)
        {
            var campStyle = await _context.CampStyle.FindAsync(id);

            if (campStyle == null)
            {
                return NotFound();
            }

            return campStyle;
        }

        // PUT: api/CampStyles/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCampStyle(int id, CampStyle campStyle)
        {
            if (id != campStyle.露營形式id)
            {
                return BadRequest();
            }

            _context.Entry(campStyle).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CampStyleExists(id))
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

        // POST: api/CampStyles
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CampStyle>> PostCampStyle(CampStyle campStyle)
        {
            _context.CampStyle.Add(campStyle);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCampStyle", new { id = campStyle.露營形式id }, campStyle);
        }

        // DELETE: api/CampStyles/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCampStyle(int id)
        {
            var campStyle = await _context.CampStyle.FindAsync(id);
            if (campStyle == null)
            {
                return NotFound();
            }

            _context.CampStyle.Remove(campStyle);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CampStyleExists(int id)
        {
            return _context.CampStyle.Any(e => e.露營形式id == id);
        }
    }
}
