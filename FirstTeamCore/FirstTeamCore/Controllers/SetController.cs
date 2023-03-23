using prjCoreFT.Models;
using prjCoreFT.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace prjCoreFT.Controllers
{
    public class SetController : SuperController
    {
        IWebHostEnvironment _environment; //全域變數_environment
        public SetController(IWebHostEnvironment p)
        {
            _environment = p;
        }



        //<!-- ======= 自選飲食 ======= -->
        dbFTContext db = new dbFTContext();
        //查詢
        public IActionResult SetFood(CKeywordViewModel vm)
        {
            IEnumerable<SetFood> datas = null;
            if (string.IsNullOrEmpty(vm.txtKeyword))
            {
                datas = from t in db.SetFoods
                        select t;
            }
            else
            {
                datas = db.SetFoods.Where(t => t.餐廳名.Contains(vm.txtKeyword) ||
                t.地址.Contains(vm.txtKeyword) || t.餐點細項.Contains(vm.txtKeyword));
            }

            return View(datas);
        }


        public IActionResult FoodCreate()
        {
            return View();
        }
        [HttpPost]
        public IActionResult FoodCreate(SetFood p)
        {

            db.SetFoods.Add(p);
            db.SaveChanges();
            return RedirectToAction("SetFood");
        }


        public IActionResult FoodDelete(int? id)
        {
            if (id != null)
            {

                SetFood delSetFood = db.SetFoods.FirstOrDefault(t => t.餐廳id == id);
                if (delSetFood != null)
                {
                    db.SetFoods.Remove(delSetFood);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("SetFood");
        }


        //第一步找資料
        public IActionResult FoodEdit(int? id)
        {
            if (id != null)
            {

                SetFood x = db.SetFoods.FirstOrDefault(t => t.餐廳id == id);
                if (x != null)
                    return View(x);

            }
            return RedirectToAction("SetFood"); //刪除後回傳給List
        }
        [HttpPost]
        //存入資料庫
        public IActionResult FoodEdit(CSetFoodViewModel p)  //使用CSelfFoodViewModel
        {

            SetFood x = db.SetFoods.FirstOrDefault(t => t.餐廳id == p.餐廳ID);
            if (x != null)
            {               
                x.餐廳名 = p.餐廳名;
                x.餐廳電話 = p.餐廳電話;
                x.地址 = p.地址;
                x.餐點細項 = p.餐點細項;
                db.SaveChangesAsync();
            }
            return RedirectToAction("SetFood");
        }




        //---------------餐廳---------------


        public IActionResult SetOrder(CKeywordViewModel vm)
        {
            IEnumerable<SetOrder> datas = null;
            if (string.IsNullOrEmpty(vm.txtKeyword))
            {
                datas = db.SetOrders.Include(s => s.套裝行程).ThenInclude(a => a.餐廳).Include(s => s.會員);
            }
            else
            {
                datas = db.SetOrders.Include(s => s.套裝行程).ThenInclude(a => a.餐廳).Include(s => s.會員).Where(t => t.評分.Equals(vm.txtKeyword) ||
                t.評論.Contains(vm.txtKeyword) || t.合計總價.Equals(vm.txtKeyword) || t.入住時間.Equals(vm.txtKeyword) || t.退住時間.Equals(vm.txtKeyword) || t.預計人數.Equals(vm.txtKeyword));
            }
            //var dbFT = db.SetOrders.Include(s => s.套裝行程).ThenInclude(a => a.餐廳).Include(s => s.會員);
            return View(datas.ToList());

        }
        public IActionResult SetOrderCreate()
        {
            CSetOrderViewModel vm = new CSetOrderViewModel();
            
            IEnumerable<SetOrderDetail> sod = db.SetOrderDetails;
            IEnumerable<MemberInfo> m = db.MemberInfos;
           
            vm.套裝行程表單 = sod;
            vm.會員表單 = m;
            return View(vm);
        }
        [HttpPost]
        public IActionResult SetOrderCreate(InputViewModel.CSetOrderInput a)
        {

            SetOrder p = new SetOrder();
            //SetOrder p = db.SetOrders;
            p.套裝行程id = a.套裝行程id;
            p.會員id = a.會員id;
            
            p.入住時間 = a.入住時間;
            p.退住時間 = a.退住時間;
            p.預計人數 = a.預計人數;
            p.合計總價 = a.合計總價;
            p.評分 = a.評分;
            p.評論 = a.評論;
            db.SetOrders.Add(p);
            db.SaveChanges();
            return RedirectToAction("SetOrder");
        }


        public IActionResult SetOrderDelete(int? id)
        {
            if (id != null)
            {

                SetOrder delSetOrder = db.SetOrders.FirstOrDefault(t => t.套裝訂單id == id);
                if (delSetOrder != null)
                {
                    db.SetOrders.Remove(delSetOrder);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("SetOrder");
        }



        public IActionResult SetOrderEdit(int? id)
        {
            SetOrder x = db.SetOrders.Include(s => s.套裝行程).ThenInclude(a => a.餐廳).Include(s => s.會員).FirstOrDefault(t => t.套裝訂單id == id);
            IEnumerable<SetOrderDetail> s = db.SetOrderDetails;
            IEnumerable<MemberInfo> m = db.MemberInfos;
            if (id != null)
            {
                if (x != null)
                {
                    CSetOrderViewModel vm = new CSetOrderViewModel();
                    vm.套裝行程表單 = s;
                    vm.Product = x;
                    vm.會員表單 = m;
                    return View(vm);
                }
            }
            return RedirectToAction("SetOrder"); 
        }
        [HttpPost]
        //存入資料庫
        public IActionResult SetOrderEdit(InputViewModel.CSetOrderInput p)  
        {

            SetOrder x = db.SetOrders.FirstOrDefault(t => t.套裝訂單id == p.套裝訂單id);
            if (x != null)
            {
                x.套裝行程id = p.套裝行程id;
                x.會員id = p.會員id;
                
                x.入住時間 = p.入住時間;
                x.退住時間 = p.退住時間;
                x.合計總價 = p.合計總價;
                x.預計人數 = p.預計人數;
                x.評論 = p.評論;
                x.評論 = p.評論;
                x.評分 = p.評分;
                db.SaveChangesAsync();
            }
            return RedirectToAction("SetOrder");
        }

        //---------------訂單---------------        
        public IActionResult SetDetail(CKeywordViewModel vm)
        {

            IEnumerable<SetOrderDetail> datas = null;
            if (string.IsNullOrEmpty(vm.txtKeyword))
            {
                datas = db.SetOrderDetails.Include(s => s.營區細項).ThenInclude(a => a.活動).Include(s=>s.營區細項).ThenInclude(a=>a.露營形式).Include(s => s.營地).Include(s => s.餐廳);
            }
            else
            {
                datas = db.SetOrderDetails.Include(s => s.營區細項).ThenInclude(a => a.活動).Include(s => s.營區細項).ThenInclude(a => a.露營形式).Include(s => s.營地).Include(s => s.餐廳).Where(t => t.套裝方案.Contains(vm.txtKeyword) || t.套裝細項.Contains(vm.txtKeyword) || t.套裝行程價格.Equals(vm.txtKeyword));
            }
            return View(datas.ToList());


            //var dbFTContext = db.SetOrderDetails.Include(s => s.營區細項).ThenInclude(a => a.活動).Include(s => s.營地).Include(s => s.餐廳).Where(t => t.套裝方案.Contains(vm.txtKeyword) || t.套裝細項.Contains(vm.txtKeyword) || t.套裝行程價格.Equals(vm.txtKeyword));
            //return View(dbFTContext.ToList());

        }
        public IActionResult SetOrderDetailCreate()
        {
            CSetOrderDetailViewModel vm = new CSetOrderDetailViewModel();
            IEnumerable<Camp> camp = db.Camps;
            IEnumerable<CampDetail> campDetails = db.CampDetails;
            IEnumerable<SetFood> setFoods = db.SetFoods;
            IEnumerable<ActDetail> actDetails = db.ActDetails; //
            vm.活動表單 = actDetails;   //
            vm.營區表單 = camp;
            vm.營區細節表單 = campDetails;
            vm.套裝餐廳表單 = setFoods;
            
            return View(vm);
        }
        [HttpPost]

        public IActionResult SetOrderDetailCreate(InputViewModel.CSetOrderDetailInput p)
        {
            CampDetail z = db.CampDetails.FirstOrDefault(s=>s.活動id==p.活動ID);
            
            SetOrderDetail x = new SetOrderDetail();
            x.餐廳id = p.餐廳ID;
            x.營地id = p.營地ID;
            x.營區細項id = z.營區細項id;
            x.套裝行程價格 = p.套裝行程價格;
            x.套裝方案 = p.套裝方案;
            x.套裝細項 = p.套裝細項;
            db.SetOrderDetails.Add(x);
            db.SaveChanges();
            return RedirectToAction("SetDetail");
        }


        public IActionResult SetOrderDetailDelete(int? id)
        {
            if (id != null)
            {

                SetOrderDetail delSetOrderDetail = db.SetOrderDetails.FirstOrDefault(t => t.套裝行程id == id);
                if (delSetOrderDetail != null)
                {
                    db.SetOrderDetails.Remove(delSetOrderDetail);
                    db.SaveChangesAsync();
                }
            }
            return RedirectToAction("SetDetail");
        }



        public IActionResult SetOrderDetailEdit(int? id)
        {
            CSetOrderDetailViewModel vm = new CSetOrderDetailViewModel(); 
            if (id != null)
            {
                SetOrderDetail x = db.SetOrderDetails.FirstOrDefault(t => t.套裝行程id == id);
                IEnumerable<Camp> camp = db.Camps;
                IEnumerable<CampDetail> campDetails = db.CampDetails;
                IEnumerable<SetFood> setFoods = db.SetFoods;
                IEnumerable<ActDetail> actDetails = db.ActDetails; //
                vm.活動表單 = actDetails;   //
                vm.營區表單 = camp;
                vm.營區細節表單 = campDetails;
                vm.套裝餐廳表單 = setFoods;
                vm.Product = x;
                
                if (x != null)
                    return View(vm);

            }
            return RedirectToAction("SetDetail"); //刪除後回傳給List
        }
        [HttpPost]
        //存入資料庫
        public IActionResult SetOrderDetailEdit(InputViewModel.CSetOrderDetailInput p)
        {
            
            SetOrderDetail x = db.SetOrderDetails.FirstOrDefault(t => t.套裝行程id == p.套裝行程ID);
            if (x != null)
            {
                CampDetail z = db.CampDetails.FirstOrDefault(t => t.活動id == p.活動ID);
                x.營地id = p.營地ID;
                x.營區細項id = z.營區細項id;
                x.餐廳id = p.餐廳ID;
                x.套裝方案 = p.套裝方案;
                x.套裝細項 = p.套裝細項;
                x.套裝行程價格 = p.套裝行程價格;
                db.SaveChangesAsync();
            }
            return RedirectToAction("SetDetail");
        }
        //---------------訂單細節---------------

    }
}
