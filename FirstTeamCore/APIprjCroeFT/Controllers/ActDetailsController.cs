using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using APIprjCroeFT.Models;
using Microsoft.AspNetCore.Cors;
using APIprjCroeFT.DTO;

namespace APIprjCroeFT.Controllers
{
    [EnableCors("AllowAny")]
    [Route("api/[controller]")]
    [ApiController]
    public class ActDetailsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public ActDetailsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/ActDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<ActDTO>>> GetActDetail()
        {
            return await _context.ActDetail.Include(a => a.營區).Select(ad => new ActDTO
            {
                活動id = ad.活動id,
                活動方式 = ad.活動方式,
                活動種類=ad.活動種類,
                活動名稱 = ad.活動名稱,
                活動介紹 = ad.活動介紹,
                活動圖片 = ad.活動圖片,
                門票價格 = ad.門票價格,

                營區id = ad.營區id,
                地區 = ad.營區.地區,
                縣市 = ad.營區.縣市,
                營區名稱 = ad.營區.營區名稱,
                營區地址 = ad.營區.營區地址,
                營區介紹 = ad.營區.營區介紹,
                容納人數 = ad.營區.容納人數,
            }).ToListAsync();
        }

        // GET: api/ActDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<ActDetail>> GetActDetail(int id)
        {
            var actDetail = await _context.ActDetail.FindAsync(id);

            if (actDetail == null)
            {
                return NotFound();
            }

            return actDetail;
        }

        // PUT: api/ActDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutActDetail(int id, ActDetail actDetail)
        {
            if (id != actDetail.活動id)
            {
                return BadRequest();
            }

            _context.Entry(actDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ActDetailExists(id))
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

        // POST: api/ActDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<ActDetail>> PostActDetail(ActDetail actDetail)
        {
            _context.ActDetail.Add(actDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetActDetail", new { id = actDetail.活動id }, actDetail);
        }

        // DELETE: api/ActDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteActDetail(int id)
        {
            var actDetail = await _context.ActDetail.FindAsync(id);
            if (actDetail == null)
            {
                return NotFound();
            }

            _context.ActDetail.Remove(actDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool ActDetailExists(int id)
        {
            return _context.ActDetail.Any(e => e.活動id == id);
        }
    }
}
