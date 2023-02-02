using prjCoreFT.Models;
using prjCoreFT.ViewModel;
using Microsoft.AspNetCore.Mvc;

namespace prjCoreFT.Controllers
{
    public class MemberController : SuperController
    {
        public IActionResult Info()
        {
            return View();
        }

        public IActionResult Review()
        {
            return View();
        }

        IWebHostEnvironment _environment;

        public MemberController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

        dbFTContext db = new dbFTContext(); //拉到外面給大家共用。

        public IActionResult List(CKeywordViewModel vm)
        {
            IEnumerable<MemberInfo> datas = null;
            //dbDemoContext db = new dbDemoContext();

            if (string.IsNullOrEmpty(vm.txtKeyword))
                datas = from t in db.MemberInfos
                        select t;
            else
                datas = db.MemberInfos.Where(t => t.姓名.Contains(vm.txtKeyword) ||
                t.電話號碼.Contains(vm.txtKeyword) ||
                t.連絡信箱.Contains(vm.txtKeyword) ||
                t.會員帳號.Contains(vm.txtKeyword) ||
                t.會員密碼.Contains(vm.txtKeyword));

            return View(datas);
        }
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(MemberInfo p, IFormFile photo)
        {
            if (!ModelState.IsValid)
            {
                return View(p);
            }
            //dbDemoContext db = new dbDemoContext();
            if (photo != null)
            {
                //先取檔名photoName
                //再取路徑path
                //存到資料庫FimgePath
                //CopyTo，上傳檔案。
                string photoName = Guid.NewGuid().ToString() + ".jpg";
                string path = _environment.WebRootPath + "/images/" + photoName;
                p.照片 = photoName;
                photo.CopyTo(new FileStream(path, FileMode.Create));
                //動態取得資料夾的實體路徑。
            }
            else
            { p.照片 = null; }
            db.MemberInfos.Add(p);
            db.SaveChanges();
            return RedirectToAction("List");
        }

        public ActionResult Delete(int? id)
        {
            if (id != null)
            {
                //dbDemoContext db = new dbDemoContext();

                MemberInfo delMember = db.MemberInfos.FirstOrDefault(t => t.會員id == id);
                //找出要刪除的欄位。tProduct為工廠

                if (delMember != null)
                {
                    db.MemberInfos.Remove(delMember);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("List");
        }

        [HttpPost]
        //限制某個action只接受HttpPost的請求
        //存入資料庫
        public ActionResult Edit(CMemberViewModel p)
        {
            //dbDemoContext db = new dbDemoContext();
            MemberInfo x = db.MemberInfos.FirstOrDefault(t => t.會員id == p.會員編號ID);
            if (x != null)
            {
                if (p.photo != null)
                {
                    //先取檔名photoName
                    //再取路徑path
                    //存到資料庫FimgePath
                    //CopyTo，上傳檔案。
                    string photoName = Guid.NewGuid().ToString() + ".jpg";
                    string path = _environment.WebRootPath + "/images/" + photoName;
                    x.照片 = photoName;
                    p.photo.CopyTo(new FileStream(path, FileMode.Create));
                    //動態取得資料夾的實體路徑。
                }


                x.姓名 = p.姓名;
                x.性別 = p.性別;
                x.出生日期 = p.出生日期;
                x.電話號碼 = p.電話號碼;
                x.連絡信箱 = p.連絡信箱;
                x.會員密碼 = p.會員密碼;
                db.SaveChangesAsync();

                //存入資料庫

            }
            return RedirectToAction("List");

        }

        public ActionResult Edit(int? id)
        {
            if (id != null)
            {
                //dbDemoContext db = new dbDemoContext();
                MemberInfo x = db.MemberInfos.FirstOrDefault(t => t.會員id == id);
                //FirstOrDefault 方法: 傳回序列的第一個項目；如果找不到任何項目，則傳回預設值。

                if (x != null)
                    return View(x);


            }
            return RedirectToAction("List");
        }
    }
}
