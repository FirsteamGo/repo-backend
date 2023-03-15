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
    public class SetOrderDetailsController : ControllerBase
    {
        private readonly dbFTContext _context;

        public SetOrderDetailsController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/SetOrderDetails
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SetOrderDetailDTO>>> GetSetOrderDetail()
        {
            return await _context.SetOrderDetail.Include(a=>a.餐廳).Include(b=>b.營區細項).ThenInclude(s=>s.活動).Include(f => f.營區細項).ThenInclude(t=>t.露營形式).Include(g=>g.營區細項).ThenInclude(h=>h.營區).Select(set=> new SetOrderDetailDTO
            {
                套裝行程id=set.套裝行程id, 套裝方案=set.套裝方案, 套裝細項=set.套裝細項, 套裝行程價格 = set.套裝行程價格, 營區名稱=set.營區細項.營區.營區名稱, 地區 = set.營區細項.營區.地區, 縣市 = set.營區細項.營區.縣市, 活動圖片 = set.營區細項.活動.活動圖片, 活動名稱 = set.營區細項.活動.活動名稱, 項目內容= set.營區細項.露營形式.項目內容
            }).ToListAsync();
        }

        // GET: api/SetOrderDetails/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SetOrderDetail>> GetSetOrderDetail(int id)
        {
            var setOrderDetail = await _context.SetOrderDetail.FindAsync(id);

            if (setOrderDetail == null)
            {
                return NotFound();
            }

            return setOrderDetail;
        }

        // PUT: api/SetOrderDetails/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSetOrderDetail(int id, SetOrderDetail setOrderDetail)
        {
            if (id != setOrderDetail.套裝行程id)
            {
                return BadRequest();
            }

            _context.Entry(setOrderDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SetOrderDetailExists(id))
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

        // POST: api/SetOrderDetails
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<SetOrderDetail>> PostSetOrderDetail(SetOrderDetail setOrderDetail)
        {
            _context.SetOrderDetail.Add(setOrderDetail);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetSetOrderDetail", new { id = setOrderDetail.套裝行程id }, setOrderDetail);
        }

        // DELETE: api/SetOrderDetails/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSetOrderDetail(int id)
        {
            var setOrderDetail = await _context.SetOrderDetail.FindAsync(id);
            if (setOrderDetail == null)
            {
                return NotFound();
            }

            _context.SetOrderDetail.Remove(setOrderDetail);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SetOrderDetailExists(int id)
        {
            return _context.SetOrderDetail.Any(e => e.套裝行程id == id);
        }
       
    }
}
