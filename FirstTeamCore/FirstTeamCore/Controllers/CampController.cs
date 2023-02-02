using prjCoreFT.Models;
using prjCoreFT.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace prjCoreFT.Controllers
{
    public class CampController : SuperController
    {
        public IWebHostEnvironment _environment;

        public dbFTContext db = new dbFTContext();
        public CampController(IWebHostEnvironment p)
        {
            _environment = p;
        }

//---------------------------------------------------------------------營區管理
        public IActionResult CampList(string txtKeyword)
        {
            IEnumerable<Camp> datas = null;

            if (string.IsNullOrEmpty(txtKeyword))
                datas = from t in db.Camps
                        select t;
            else
                datas = db.Camps.Where(t => t.營區名稱.Contains(txtKeyword));

            return View(datas);
        }

        public IActionResult CampCreate()
        {
            return View();
        }
        [HttpPost]
        public IActionResult CampCreate(Camp p)
        {
            //if (photo != null)
            //{
            //    string photoName = Guid.NewGuid().ToString() + ".jpg";
            //    string path = _Camp.WebRootPath + "/images/" + photoName;
            //    p.營區圖片 = photoName;
            //    photo.CopyTo(new FileStream(path, FileMode.Create));
            //}

            db.Camps.Add(p);
            db.SaveChanges();
            return RedirectToAction("CampList");
        }

        public IActionResult CampEdit(int? id)
        {
            if (id != null)
            {

                Camp x = db.Camps.FirstOrDefault(t => t.營區id == id);
                if (x != null)
                    return View(x);

            }
            return RedirectToAction("CampList"); 
        }

        [HttpPost]
        public ActionResult CampEdit(CCampViewModel p)  
        {

            Camp x = db.Camps.FirstOrDefault(t => t.營區id == p.營區編號);
            if (x != null)
            {
                //if (p.photo != null)
                //{
                //    string photoName = Guid.NewGuid().ToString() + ".jpg";
                //    string path = _environment.WebRootPath + "/images/" + photoName;
                //    x.活動圖片 = photoName;
                //    p.photo.CopyTo(new FileStream(path, FileMode.Create));
                //}


                x.營區名稱 = p.營區名稱;
                x.營區地址 = p.營區地址;
                x.地區 = p.地區;
                x.縣市 = p.縣市;
                x.營區介紹 = p.營區介紹;
                x.容納人數 = p.容納人數;
                x.建立人 = p.建立人;
                x.建立時間 = p.建立時間;
                x.修改人 = p.修改人;
                x.修改時間 = p.修改時間;
                db.SaveChangesAsync();
            }
            return RedirectToAction("CampList");
        }

        public IActionResult Delete(int? id)
        {
            if (id != null)
            {

                Camp delCamp = db.Camps.FirstOrDefault(t => t.營區id == id);
                if (delCamp != null)
                {
                    db.Camps.Remove(delCamp);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("CampList");
        }

//----------------------------------------------------------------------------------營區細項
        public IActionResult CampDetailList(string txtKeyword)
        {
            IEnumerable<CampDetail> datas = null;

            if (string.IsNullOrEmpty(txtKeyword))
                datas = from t in db.CampDetails
                        select t;
            else
                datas = db.CampDetails.Where(t => t.詳細內容.Contains(txtKeyword));

            return View(datas);
        }

        public IActionResult CampDetailCreate()
        {
            return View();
        }
        [HttpPost]
        public IActionResult CampDetailCreate(CampDetail p, IFormFile photo)
        {
            if (photo != null)
            {
                string photoName = Guid.NewGuid().ToString() + ".jpg";
                string path = _environment.WebRootPath + "/images/" + photoName;
                p.圖片 = photoName;
                photo.CopyTo(new FileStream(path, FileMode.Create));
            }

            db.CampDetails.Add(p);
            db.SaveChanges();
            return RedirectToAction("CampDetailList");
        }

        public IActionResult CampDetailEdit(int? id)
        {
            if (id != null)
            {

                CampDetail x = db.CampDetails.FirstOrDefault(t => t.營區細項id == id);
                if (x != null)
                    return View(x);

            }
            return RedirectToAction("CampDetailList"); 
        }

        [HttpPost]
        public ActionResult CampDetailEdit(CCampDetailModel p) 
        {

            CampDetail x = db.CampDetails.FirstOrDefault(t => t.營區細項id == p.營區細項編號);
            if (x != null)
            {
                if (p.photo != null)
                {
                    string photoName = Guid.NewGuid().ToString() + ".jpg";
                    string path = _environment.WebRootPath + "/images/" + photoName;
                    x.圖片 = photoName;
                    p.photo.CopyTo(new FileStream(path, FileMode.Create));
                }


                x.營區id = p.營區編號;
                x.活動id = p.活動編號;
                x.露營形式id = p.項目id;
                x.詳細內容 = p.詳細內容;
                x.單價 = p.單價;
                x.建立人 = p.建立人;
                x.建立時間 = p.建立時間;
                x.修改人 = p.修改人;
                x.修改時間 = p.修改時間;
                db.SaveChangesAsync();
            }
            return RedirectToAction("CampDetailList");
        }

        public IActionResult CampDetailDelete(int? id)
        {
            if (id != null)
            {

                CampDetail delCampDetails = db.CampDetails.FirstOrDefault(t => t.營區細項id== id);
                if (delCampDetails != null)
                {
                    db.CampDetails.Remove(delCampDetails);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("CampDetailList");
        }

//---------------------------------------------------------------------------營區型式

        public IActionResult CampStyleList(string txtKeyword)
        {
            IEnumerable<CampStyle> datas = null;

            if (string.IsNullOrEmpty(txtKeyword))
                datas = from t in db.CampStyles
                        select t;
            else
                datas = db.CampStyles.Where(t => t.項目內容.Contains(txtKeyword));

            return View(datas);
        }

        public IActionResult CampStyleCreate()
        {
            return View();
        }

        [HttpPost]
        public IActionResult CampStyleCreate(CampStyle p)
        {
            //if (photo != null)
            //{
            //    string photoName = Guid.NewGuid().ToString() + ".jpg";
            //    string path = _Camp.WebRootPath + "/images/" + photoName;
            //    p.營區圖片 = photoName;
            //    photo.CopyTo(new FileStream(path, FileMode.Create));
            //}

            db.CampStyles.Add(p);
            db.SaveChanges();
            return RedirectToAction("CampStyleList");
        }

        public IActionResult CampStyleEdit(int? id)
        {
            if (id != null)
            {

                CampStyle x = db.CampStyles.FirstOrDefault(t => t.露營形式id == id);
                if (x != null)
                    return View(x);

            }
            return RedirectToAction("CampStyleList");
        }

        [HttpPost]
        public ActionResult CampStyleEdit(CCampStyleViewModel p)
        {

            CampStyle x = db.CampStyles.FirstOrDefault(t => t.露營形式id == p.露營形式id);
            if (x != null)
            {
                //if (p.photo != null)
                //{
                //    string photoName = Guid.NewGuid().ToString() + ".jpg";
                //    string path = _environment.WebRootPath + "/images/" + photoName;
                //    x.活動圖片 = photoName;
                //    p.photo.CopyTo(new FileStream(path, FileMode.Create));
                //}

                x.露營形式id = p.露營形式id;
                x.項目內容 = p.項目內容;
                x.建立人 = p.建立人;
                x.建立時間 = p.建立時間;
                x.修改人 = p.修改人;
                x.修改時間 = p.修改時間;
                db.SaveChangesAsync();
            }
            return RedirectToAction("CampStyleList");
        }

        public IActionResult CampStyleDelete(int? id)
        {
            if (id != null)
            {

                CampStyle delCampStyle = db.CampStyles.FirstOrDefault(t => t.露營形式id == id);
                if (delCampStyle != null)
                {
                    db.CampStyles.Remove(delCampStyle);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("CampStyleList");
        }
    }
}
