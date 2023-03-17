using APIprjCroeFT.Models;

namespace APIprjCroeFT.DTO
{
    public class CampDTO
    {
        public int 營區細項id { get; set; }
        public int? 營區id { get; set; }
        public int? 活動id { get; set; }
        public int? 露營形式id { get; set; }
        public string 詳細內容 { get; set; }
        public string 圖片 { get; set; }
        public int? 單價 { get; set; }
        public string 營區名稱 { get; set; }
        public string 營區地址 { get; set; }
        public string 地區 { get; set; }
        public string 縣市 { get; set; }
        public string 營區介紹 { get; set; }
        public string 項目內容 { get; set; }
        public int? 容納人數 { get; set; }
        public virtual IEnumerable<ActDetail> 活動 { get; set; }
        public virtual IEnumerable<Camp> 營區 { get; set; }
        public virtual IEnumerable<CampStyle> 露營形式 { get; set; }
    }
}
