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
    public class RentDetailsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public RentDetailsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/RentDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RentDetail>>> GetRentDetail()
        {
            return await _context.RentDetail.ToListAsync();
        }

        // GET: api/RentDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RentDetail>> GetRentDetail(int id)
        {
            var rentDetail = await _context.RentDetail.FindAsync(id);

            if (rentDetail == null)
            {
                return NotFound();
            }

            return rentDetail;
        }

        // PUT: api/RentDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutRentDetail(int id, RentDetail rentDetail)
        {
            if (id != rentDetail.租賃商店id)
            {
                return BadRequest();
            }

            _context.Entry(rentDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RentDetailExists(id))
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

        // POST: api/RentDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<RentDetail>> PostRentDetail(RentDetail rentDetail)
        {
            _context.RentDetail.Add(rentDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetRentDetail", new { id = rentDetail.租賃商店id }, rentDetail);
        }

        // DELETE: api/RentDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteRentDetail(int id)
        {
            var rentDetail = await _context.RentDetail.FindAsync(id);
            if (rentDetail == null)
            {
                return NotFound();
            }

            _context.RentDetail.Remove(rentDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool RentDetailExists(int id)
        {
            return _context.RentDetail.Any(e => e.租賃商店id == id);
        }
    }
}
