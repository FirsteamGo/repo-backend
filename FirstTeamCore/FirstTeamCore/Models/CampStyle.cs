using System;
using System.Collections.Generic;

namespace prjCoreFT.Models
{
    public partial class CampStyle
    {
        public CampStyle()
        {
            CampDetails = new HashSet<CampDetail>();
        }

        public int 露營形式id { get; set; }
        public string? 項目內容 { get; set; }
        public string? 建立人 { get; set; }
        public DateTime? 建立時間 { get; set; }
        public string? 修改人 { get; set; }
        public DateTime? 修改時間 { get; set; }

        public virtual ICollection<CampDetail> CampDetails { get; set; }
    }
}
