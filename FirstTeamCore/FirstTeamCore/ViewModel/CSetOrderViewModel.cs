using prjCoreFT.Models;

namespace prjCoreFT.ViewModel
{
    public class CSetOrderViewModel
    {
        private SetOrder _product;

        public SetOrder Product
        {
            get { return _product; }
            set { _product = value; }
        }
        public CSetOrderViewModel()
        {
            _product = new SetOrder();
        }
        public int 套裝訂單ID
        {
            get { return _product.套裝訂單id; }
            set { _product.套裝訂單id = value; }
        }
        public int? 套裝行程ID
        {
            get { return _product.套裝行程id; }
            set { _product.套裝行程id = value; }
        }
        public string? 套裝方案
        {
            get { return _product.套裝行程.套裝方案; }
            set { _product.套裝行程.套裝方案 = value; }
        }
        public string? 套裝細項
        {
            get { return _product.套裝行程.套裝細項; }
            set { _product.套裝行程.套裝細項 = value; }
        }
        public string? 餐點細項
        {
            get { return _product.套裝行程.餐廳.餐點細項; }
            set { _product.套裝行程.餐廳.餐點細項 = value; }
        }
        public int? 會員ID
        {
            get { return _product.會員id; }
            set { _product.會員id = value; }
        }
        public string? 會員姓名
        {
            get { return _product.會員.姓名; }
            set { _product.會員.姓名 = value; }
        }
        //public string? 套裝訂單編號
        //{
        //    get { return _product.套裝訂單編號; }
        //    set { _product.套裝訂單編號 = value; }
        //}

        public DateTime? 入住時間
        {
            get { return _product.入住時間;}
            set { _product.入住時間=value; }
        }
        public DateTime? 退住時間
        {
            get { return _product.退住時間; }
            set { _product.退住時間 = value; }
        }        
        
        public int? 預計人數
        {
            get { return _product.預計人數; }
            set { _product.預計人數 = value; }
        }
        public int? 合計總價
        {
            get { return _product.合計總價; }
            set { _product.合計總價 = value; }
        }
        public string? 評論
        {
            get { return _product.評論; }
            set { _product.評論 = value; }
        }
        public int? 評分
        {
            get { return _product.評分; }
            set { _product.評分 = value; }
        }

        public IEnumerable<SetOrderDetail>? 套裝行程表單 { get; set; }
        public IEnumerable<MemberInfo>? 會員表單 { get; set; }

    }
}
