using prjCoreFT.Models;
using prjCoreFT.ViewModel;
using Microsoft.AspNetCore.Mvc;

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
                datas = from t in db.ActDetails
                        select t;
            else
                datas = db.ActDetails.Where(t => t.活動名稱.Contains(txtKeyword));

            return View(datas);
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
        public ActionResult ActEdit(CActViewModel p)  
        {
            
            ActDetail x = db.ActDetails.FirstOrDefault(t => t.活動id == p.活動編號);
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
                x.建立人 = p.建立人;
                x.建立時間 = p.建立時間;
                x.修改人 = p.修改人;
                x.修改時間 = p.修改時間;
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
