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
    public class SetOrdersController : ControllerBase
    {
        private readonly dbFTContext _context;

        public SetOrdersController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/SetOrders
        [HttpGet]
        public async Task<ActionResult<IEnumerable<SetOrder>>> GetSetOrder()
        {
            return await _context.SetOrder.ToListAsync();
        }

        // GET: api/SetOrders/5
        [HttpGet("{id}")]
        public async Task<ActionResult<SetOrder>> GetSetOrder(int id)
        {
            var setOrder = await _context.SetOrder.FindAsync(id);

            if (setOrder == null)
            {
                return NotFound();
            }

            return setOrder;
        }

        // PUT: api/SetOrders/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutSetOrder(int id, SetOrder setOrder)
        {
            if (id != setOrder.套裝訂單id)
            {
                return BadRequest();
            }

            _context.Entry(setOrder).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!SetOrderExists(id))
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

        // POST: api/SetOrders
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<string> PostSetOrder(SetOrderDTO sd)
        {
            SetOrder SetOD = new SetOrder { 
             套裝訂單id = sd.套裝訂單id,
             套裝行程id = sd.套裝行程id,
             會員id = sd.會員id,
             套裝訂單編號 = sd.套裝訂單編號,
             入住時間 = sd.入住時間,
             退住時間 = sd.退住時間,
             預計人數 = sd.預計人數,
             合計總價 = sd.合計總價,
             評論 = sd.評論,
             評分 = sd.評分,
                };
            _context.SetOrder.Add(SetOD);
            await _context.SaveChangesAsync();

            return "註冊成功";
        }

        // DELETE: api/SetOrders/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteSetOrder(int id)
        {
            var setOrder = await _context.SetOrder.FindAsync(id);
            if (setOrder == null)
            {
                return NotFound();
            }

            _context.SetOrder.Remove(setOrder);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool SetOrderExists(int id)
        {
            return _context.SetOrder.Any(e => e.套裝訂單id == id);
        }
    }
}
