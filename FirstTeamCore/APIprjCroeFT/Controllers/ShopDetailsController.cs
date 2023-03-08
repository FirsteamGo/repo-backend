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
    public class ShopDetailsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public ShopDetailsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/ShopDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ShopDetail>>> GetShopDetail()
        {
            return await _context.ShopDetail.ToListAsync();
        }

        // GET: api/ShopDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ShopDetail>> GetShopDetail(int id)
        {
            var shopDetail = await _context.ShopDetail.FindAsync(id);

            if (shopDetail == null)
            {
                return NotFound();
            }

            return shopDetail;
        }

        // PUT: api/ShopDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutShopDetail(int id, ShopDetail shopDetail)
        {
            if (id != shopDetail.商品細項id)
            {
                return BadRequest();
            }

            _context.Entry(shopDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ShopDetailExists(id))
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

        // POST: api/ShopDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ShopDetail>> PostShopDetail(ShopDetail shopDetail)
        {
            _context.ShopDetail.Add(shopDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetShopDetail", new { id = shopDetail.商品細項id }, shopDetail);
        }

        // DELETE: api/ShopDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteShopDetail(int id)
        {
            var shopDetail = await _context.ShopDetail.FindAsync(id);
            if (shopDetail == null)
            {
                return NotFound();
            }

            _context.ShopDetail.Remove(shopDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ShopDetailExists(int id)
        {
            return _context.ShopDetail.Any(e => e.商品細項id == id);
        }
    }
}
