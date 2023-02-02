using prjCoreFT.Models;

namespace prjCoreFT.ViewModel
{
    public class CCampViewModel
    {
            private Camp _product; //_product 全域變數

            public Camp Product
            {
                get { return _product; }
                set { _product = value; }
            }
            public CCampViewModel()
            {
                _product = new Camp();
            }

            public int 營區編號
            {
                get { return _product.營區id; }
                set { _product.營區id = value; }
            }

            public string? 營區名稱
            {
                get { return _product.營區名稱; }
                set { _product.營區名稱 = value; }
            }

            public string? 營區地址
            {
                get { return _product.營區地址; }
                set { _product.營區地址 = value; }
            }

            public string? 地區
            {
                get { return _product.地區; }
                set { _product.地區 = value; }
            }
            public string? 縣市
            {
                get { return _product.縣市; }
                set { _product.縣市 = value; }
            }
            public string? 營區介紹
            {
                get { return _product.營區介紹; }
                set { _product.營區介紹 = value; }
            }

            public int? 容納人數
            {
                get { return _product.容納人數; }
                set { _product.容納人數 = value; }
            }

            public string? 建立人
            {
                get { return _product.建立人; }
                set { _product.建立人 = value; }
            }

            public DateTime? 建立時間
            {
                get { return _product.建立時間; }
                set { _product.建立時間 = value; }
            }

            public string? 修改人
            {
                get { return _product.修改人; }
                set { _product.修改人 = value; }
            }

            public DateTime? 修改時間
            {
                get { return _product.修改時間; }
                set { _product.修改時間 = value; }
            }

            
        
    }
}
