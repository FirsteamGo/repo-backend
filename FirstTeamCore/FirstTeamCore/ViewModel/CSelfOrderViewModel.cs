using prjCoreFT.Models;

namespace FirstTeamCore.ViewModel
{
    public class CSelfOrderViewModel
    {
        
            private SelfOrder _product; //_product 全域變數

            public SelfOrder Product
            {
                get { return _product; }
                set { _product = value; }
            }
            public CSelfOrderViewModel()
            {
                _product = new SelfOrder();
            }
        public int 自選訂單id
        {
            get { return _product.自選訂單id; }
            set { _product.自選訂單id = value; }
        }
        public int? 營區細項id
        {
            get { return _product.營區細項id; }
            set { _product.營區細項id = value; }
        }
        public string? 營區名稱
            {
                get { return _product.營區細項.營區.營區名稱; }
                set { _product.營區細項.營區.營區名稱 = value; }
            }
        public int? 會員id
        {
            get { return _product.會員id; }
            set { _product.會員id = value; }
        }
        public string? 姓名
        {
            get { return _product.會員.姓名; }
            set { _product.會員.姓名 = value; }
        }
        public string? 自選訂單編號
        {
            get { return _product.自選訂單編號; }
            set { _product.自選訂單編號 = value; }
        }
        public string? 項目內容
        {
            get { return _product.營區細項.露營形式.項目內容; }
            set { _product.營區細項.露營形式.項目內容 = value; }
        }
        public DateTime? 入住時間
        {
            get { return _product.入住時間; }
            set { _product.入住時間 = value; }
        }
        public DateTime? 退住時間
        {
            get { return _product.退住時間; }
            set { _product.退住時間 = value; }
        }
        public int? 露營天數
        {
            get { return _product.露營天數; }
            set { _product.露營天數 = value; }
        }
        public int? 預計人數
        {
            get { return _product.預計人數; }
            set { _product.預計人數 = value; }
        }
        public int? 自選飲食id
        {
            get { return _product.自選飲食id; }
            set { _product.自選飲食id = value; }
        }
        public string? 商品名稱
        {
            get { return _product.自選飲食.商品名稱; }
            set { _product.自選飲食.商品名稱 = value; }
        }
        public int? 租賃商店id
        {
            get { return _product.租賃商店id; }
            set { _product.租賃商店id = value; }
        }
        public string? 產品名稱
        {
            get { return _product.租賃商店.產品名稱; }
            set { _product.租賃商店.產品名稱 = value; }
        }
        public int? 單日租金
        {
            get { return _product.租賃商店.單日租金; }
            set { _product.租賃商店.單日租金 = value; }
        }
        public int? 租借總價
        {
            get { return _product.租借總價; }
            set { _product.租借總價 = value; }
        }
        public int? 自選訂單總價
        {
            get { return _product.自選訂單總價; }
            set { _product.自選訂單總價 = value; }
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
           
    }
}
