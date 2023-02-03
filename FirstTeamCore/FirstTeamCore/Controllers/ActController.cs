using prjCoreFT.Models;
using prjCoreFT.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace prjCoreFT.Controllers
{
    public class ActController : SuperController
    {
        public IWebHostEnvironment _environment;

        public dbFTContext db = new dbFTContext();
        public ActController(IWebHostEnvironment p)
        {
            _environment = p;
        }

        public IActionResult ActList(string txtKeyword)
        {

            IEnumerable<ActDetail> datas = null;
            
            if (string.IsNullOrEmpty(txtKeyword))
                datas = db.ActDetails.Include(s => s.營區);
            else
                datas = db.ActDetails.Include(s => s.營區).Where(t => t.活動名稱.Contains(txtKeyword));

            return View(datas.ToList());
            
        }

        public IActionResult ActCreate()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ActCreate(ActDetail p, IFormFile photo)
        {
            if (photo != null)
            {
                string photoName = Guid.NewGuid().ToString() + ".jpg";
                string path = _environment.WebRootPath + "/images/" + photoName;
                p.活動圖片 = photoName;
                photo.CopyTo(new FileStream(path, FileMode.Create));
            }
            
            db.ActDetails.Add(p);
            db.SaveChanges();
            return RedirectToAction("ActList");
        }
        public IActionResult ActEdit(int? id)
        {
            if (id != null)
            {
                
                ActDetail x = db.ActDetails.FirstOrDefault(t => t.活動id == id);
                if (x != null)
                    return View(x);

            }
            return RedirectToAction("ActList"); //刪除後回傳給List
        }
        [HttpPost]
        //存入資料庫
        public ActionResult ActEdit(ActEditMetadata p)  
        {
            
            ActDetail x = db.ActDetails.FirstOrDefault(t => t.活動id == p.活動id);
            if (x != null)
            {
                if (p.photo != null)
                {
                    string photoName = Guid.NewGuid().ToString() + ".jpg";
                    string path = _environment.WebRootPath + "/images/" + photoName;
                    x.活動圖片 = photoName;
                    p.photo.CopyTo(new FileStream(path, FileMode.Create));
                }


                x.活動方式 = p.活動方式;
                x.活動種類 = p.活動種類;
                x.活動名稱 = p.活動名稱;
                x.開始日期 = p.開始日期;
                x.結束日期 = p.結束日期;
                x.預計人數 = p.預計人數;
                x.活動介紹 = p.活動介紹;
                x.門票價格 = p.門票價格;
                
                db.SaveChangesAsync();
            }
            return RedirectToAction("ActList");
        }

        public IActionResult Delete(int? id)
        {
            if (id != null)
            {
                
                ActDetail delAct = db.ActDetails.FirstOrDefault(t => t.活動id == id);
                if (delAct != null)
                {
                    db.ActDetails.Remove(delAct);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("ActList");
        }
    }
}
