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
    public class CampDetailsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public CampDetailsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/CampDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<CampDTO>>> GetCampDetail()
        {
            return await _context.CampDetail.Include(a => a.活動).Include(b => b.營區).Include(c => c.露營形式).Select(camp => new CampDTO
            {
                營區細項id = camp.營區細項id,
                營區id = camp.營區.營區id,
                露營形式id = camp.露營形式.露營形式id,
                營區名稱 = camp.營區.營區名稱,
                營區介紹 = camp.營區.營區介紹,
                營區地址 = camp.營區.營區地址,
                地區 = camp.營區.地區,
                縣市 = camp.營區.縣市,
                容納人數 = camp.營區.容納人數,
                詳細內容 = camp.詳細內容,
                項目內容 = camp.露營形式.項目內容,
                單價 = camp.單價,
                圖片 =camp.圖片,

                活動id = camp.活動.活動id,
                活動方式 = camp.活動.活動方式,
                活動種類 = camp.活動.活動種類,
                活動名稱 = camp.活動.活動名稱,
                預計人數 = camp.活動.預計人數,
                活動介紹 = camp.活動.活動介紹,
                門票價格 = camp.活動.門票價格,
                活動圖片 = camp.活動.活動圖片,

            }).ToListAsync();
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
