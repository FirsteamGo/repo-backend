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
    public class MemberInfoesController : ControllerBase
    {
        private readonly dbFTContext _context;

        public MemberInfoesController(dbFTContext context)
        {
            _context = context;
        }

        // GET: api/MemberInfoes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<MemberInfo>>> GetMemberInfo()
        {
            return await _context.MemberInfo.ToListAsync();
        }

        // GET: api/MemberInfoes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<MemberInfo>> GetMemberInfo(int id)
        {
            var memberInfo = await _context.MemberInfo.FindAsync(id);

            if (memberInfo == null)
            {
                return NotFound();
            }

            return memberInfo;
        }

        // PUT: api/MemberInfoes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMemberInfo(int id, MemberInfo memberInfo)
        {
            if (id != memberInfo.會員id)
            {
                return BadRequest();
            }

            _context.Entry(memberInfo).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MemberInfoExists(id))
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

        // POST: api/MemberInfoes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<MemberInfo>> PostMemberInfo(MemberInfo memberInfo)
        {
            _context.MemberInfo.Add(memberInfo);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMemberInfo", new { id = memberInfo.會員id }, memberInfo);
        }

        // DELETE: api/MemberInfoes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMemberInfo(int id)
        {
            var memberInfo = await _context.MemberInfo.FindAsync(id);
            if (memberInfo == null)
            {
                return NotFound();
            }

            _context.MemberInfo.Remove(memberInfo);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MemberInfoExists(int id)
        {
            return _context.MemberInfo.Any(e => e.會員id == id);
        }
    }
}
