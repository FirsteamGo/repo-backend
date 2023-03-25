using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using APIprjCroeFT.Models;
using Microsoft.AspNetCore.Cors;
using System.Text.Json;
using APIprjCroeFT.DTO;
using System.Net.Mail;
using System.Net;

namespace APIprjCroeFT.Controllers
{
    [EnableCors("AllowAny")] // 全域 (using Microsoft.AspNetCore.Cors;)
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

        // GET: api/MemberInfoes/5/用 id 撈資料
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




        // 登入頁面使用
        // POST: api/MemberInfoes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<string> PostMemberInfo(MemberInfoDTO MI)
        {
            MemberInfo user = (_context.MemberInfo.FirstOrDefault(t => t.會員帳號.Equals(MI.account) && t.會員密碼.Equals(MI.password)));

            if (user != null && user.會員密碼.Equals(MI.password))
            {
                var result = new
                {
                    user.會員id,
                    user.姓名,
                    user.性別,
                    user.出生日期,
                    user.電話號碼,
                    user.連絡信箱,
                    user.會員帳號,
                    user.會員密碼,
                    user.照片,
                    user.權限,
                    user.建立時間,
                    user.修改時間,
                    user.修改人,
                    //test git 


                };

                string json = JsonSerializer.Serialize(result);

                return json;
            }
            return "帳號或密碼錯誤";




        }

        // 註冊用 post
        [HttpPost("SignUp")]
        public async Task<string> PostMemberInfo(SignupDTO MI)
        {
            MemberInfo mem = new MemberInfo
            {
                照片= MI.照片,
                性別 = MI.性別,
                姓名 = MI.姓名,
                會員帳號 = MI.會員帳號,
                會員密碼 = MI.會員密碼,
                電話號碼 = MI.電話號碼,
                出生日期 = MI.出生日期,
                連絡信箱 = MI.連絡信箱,

            };

            _context.MemberInfo.Add(mem);
            await _context.SaveChangesAsync();

            return "註冊成功";
        }

        // 上傳圖片用 post
        [HttpPost("api/upload")]
        public async Task<IActionResult> Upload()
        {
            var file = Request.Form.Files[0];
            var fileName = file.FileName;
            var filePath = Path.Combine("C:/Users/zhi yuan/Desktop/期末專案/0_期末專案/repo-backend/FirstTeamCore/FirstTeamCore/wwwroot/images", fileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }

            return Ok(new { filePath });
        }


        //// 發送驗證信用 post (有問題)
        //[HttpPost("api/send-email")]
        //public async Task<IActionResult> SendEmail([FromBody] EmailData emailData)
        //{
        //    try
        //    {
        //        var email = emailData.連絡信箱;
        //        var message = "驗證測試";

        //        // create reusable transporter object using the default SMTP transport
        //        var transporter = new SmtpClient("smtp.gmail.com")
        //        {
        //            Port = 587,
        //            Credentials = new NetworkCredential("your-email@gmail.com", "your-email-password"),
        //            EnableSsl = true
        //        };

        //        // create message
        //        var mailMessage = new MailMessage();
        //        mailMessage.From = new MailAddress("your-email@gmail.com");
        //        mailMessage.To.Add(new MailAddress(email));
        //        mailMessage.Subject = "Email Verification";
        //        mailMessage.Body = $"Please verify your email by clicking on the following link: {message}";

        //        // send mail
        //        await transporter.SendMailAsync(mailMessage);

        //        return Ok("Email Sent");
        //    }
        //    catch (Exception ex)
        //    {
        //        return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
        //    }
        //}






        // 修改用 Put
        [HttpPut("Revise/{會員ID}")]
        public async Task<string> PutMemberInfo(int 會員ID, ReviseDTO MI)
        {
            // 添加'Access-Control-Allow-Origin'標頭
            HttpContext.Response.Headers.Add("Access-Control-Allow-Origin", "*");
            
            var memberInfo = _context.MemberInfo.Where(m => m.會員id == 會員ID).First();

            //memberInfo.會員帳號 = MI.會員帳號;
            //memberInfo.會員密碼 = MI.會員密碼;
            MemberInfo mem = new MemberInfo
            {

                姓名 = MI.姓名,
                會員密碼 = MI.會員密碼,
                電話號碼 = MI.電話號碼,
                連絡信箱 = MI.連絡信箱,

            };

            await _context.SaveChangesAsync();

            return "修改成功";
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
