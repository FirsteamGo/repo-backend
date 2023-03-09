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
    public class CampDetailsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public CampDetailsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/CampDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CampDetail>>> GetCampDetail()
        {
            return await _context.CampDetail.ToListAsync();
        }

        // GET: api/CampDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<CampDetail>> GetCampDetail(int id)
        {
            var campDetail = await _context.CampDetail.FindAsync(id);

            if (campDetail == null)
            {
                return NotFound();
            }

            return campDetail;
        }

        // PUT: api/CampDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCampDetail(int id, CampDetail campDetail)
        {
            if (id != campDetail.營區細項id)
            {
                return BadRequest();
            }

            _context.Entry(campDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CampDetailExists(id))
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

        // POST: api/CampDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<CampDetail>> PostCampDetail(CampDetail campDetail)
        {
            _context.CampDetail.Add(campDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCampDetail", new { id = campDetail.營區細項id }, campDetail);
        }

        // DELETE: api/CampDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteCampDetail(int id)
        {
            var campDetail = await _context.CampDetail.FindAsync(id);
            if (campDetail == null)
            {
                return NotFound();
            }

            _context.CampDetail.Remove(campDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool CampDetailExists(int id)
        {
            return _context.CampDetail.Any(e => e.營區細項id == id);
        }
    }
}
