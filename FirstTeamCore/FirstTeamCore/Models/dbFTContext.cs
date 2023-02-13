using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace prjCoreFT.Models
{
    public partial class dbFTContext : DbContext
    {
        public dbFTContext()
        {
        }

        public dbFTContext(DbContextOptions<dbFTContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ActDetail> ActDetails { get; set; } = null!;
        public virtual DbSet<Camp> Camps { get; set; } = null!;
        public virtual DbSet<CampDetail> CampDetails { get; set; } = null!;
        public virtual DbSet<CampStyle> CampStyles { get; set; } = null!;
        public virtual DbSet<MemberInfo> MemberInfos { get; set; } = null!;
        public virtual DbSet<RentDetail> RentDetails { get; set; } = null!;
        public virtual DbSet<SelfFood> SelfFoods { get; set; } = null!;
        public virtual DbSet<SelfOrder> SelfOrders { get; set; } = null!;
        public virtual DbSet<SetFood> SetFoods { get; set; } = null!;
        public virtual DbSet<SetOrder> SetOrders { get; set; } = null!;
        public virtual DbSet<SetOrderDetail> SetOrderDetails { get; set; } = null!;
        public virtual DbSet<ShopDetail> ShopDetails { get; set; } = null!;
        public virtual DbSet<ShopOrder> ShopOrders { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=dbFT;Integrated Security=True");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ActDetail>(entity =>
            {
                entity.HasKey(e => e.活動id)
                    .HasName("PK_tLocalCampaign");

                entity.ToTable("ActDetail");

                entity.Property(e => e.活動id).HasColumnName("活動ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.活動介紹).HasMaxLength(500);

                entity.Property(e => e.活動名稱).HasMaxLength(200);

                entity.Property(e => e.活動圖片).HasMaxLength(50);

                entity.Property(e => e.活動方式).HasMaxLength(30);

                entity.Property(e => e.活動種類).HasMaxLength(30);

                entity.Property(e => e.營區id).HasColumnName("營區ID");

                entity.Property(e => e.結束日期).HasColumnType("datetime");

                entity.Property(e => e.開始日期).HasColumnType("datetime");

                entity.HasOne(d => d.營區)
                    .WithMany(p => p.ActDetails)
                    .HasForeignKey(d => d.營區id)
                    .HasConstraintName("FK_tLocalCampaign_tCampSite");
            });

            modelBuilder.Entity<Camp>(entity =>
            {
                entity.HasKey(e => e.營區id)
                    .HasName("PK_tCampSite");

                entity.ToTable("Camp");

                entity.Property(e => e.營區id).HasColumnName("營區ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.地區).HasMaxLength(10);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.營區介紹).HasMaxLength(300);

                entity.Property(e => e.營區名稱).HasMaxLength(20);

                entity.Property(e => e.營區地址).HasMaxLength(80);

                entity.Property(e => e.縣市).HasMaxLength(10);
            });

            modelBuilder.Entity<CampDetail>(entity =>
            {
                entity.HasKey(e => e.營區細項id)
                    .HasName("PK_tCarPark");

                entity.ToTable("CampDetail");

                entity.Property(e => e.營區細項id).HasColumnName("營區細項ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.圖片).HasMaxLength(200);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.活動id).HasColumnName("活動ID");

                entity.Property(e => e.營區id).HasColumnName("營區ID");

                entity.Property(e => e.詳細內容).HasMaxLength(200);

                entity.Property(e => e.露營形式id).HasColumnName("露營形式ID");

                entity.HasOne(d => d.活動)
                    .WithMany(p => p.CampDetails)
                    .HasForeignKey(d => d.活動id)
                    .HasConstraintName("FK_tCampDetale_tLocalCampaign");

                entity.HasOne(d => d.營區)
                    .WithMany(p => p.CampDetails)
                    .HasForeignKey(d => d.營區id)
                    .HasConstraintName("FK_tCampDetale_tCampSite");

                entity.HasOne(d => d.露營形式)
                    .WithMany(p => p.CampDetails)
                    .HasForeignKey(d => d.露營形式id)
                    .HasConstraintName("FK_tCampDetale_項目");
            });

            modelBuilder.Entity<CampStyle>(entity =>
            {
                entity.HasKey(e => e.露營形式id)
                    .HasName("PK_項目");

                entity.ToTable("CampStyle");

                entity.Property(e => e.露營形式id).HasColumnName("露營形式ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.項目內容).HasMaxLength(50);
            });

            modelBuilder.Entity<MemberInfo>(entity =>
            {
                entity.HasKey(e => e.會員id)
                    .HasName("PK_會員資料庫");

                entity.ToTable("MemberInfo");

                entity.Property(e => e.會員id).HasColumnName("會員ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.出生日期).HasColumnType("date");

                entity.Property(e => e.姓名).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.會員密碼).HasMaxLength(50);

                entity.Property(e => e.會員帳號).HasMaxLength(50);

                entity.Property(e => e.照片).HasMaxLength(500);

                entity.Property(e => e.連絡信箱).HasMaxLength(50);

                entity.Property(e => e.電話號碼).HasMaxLength(50);
            });

            modelBuilder.Entity<RentDetail>(entity =>
            {
                entity.HasKey(e => e.租賃商店id)
                    .HasName("PK_租賃商店");

                entity.ToTable("RentDetail");

                entity.Property(e => e.租賃商店id).HasColumnName("租賃商店ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.圖片).HasMaxLength(500);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.產品名稱).HasMaxLength(100);

                entity.Property(e => e.產品說明).HasMaxLength(300);
            });

            modelBuilder.Entity<SelfFood>(entity =>
            {
                entity.HasKey(e => e.自選飲食id)
                    .HasName("PK_自選飲食編號ID");

                entity.ToTable("SelfFood");

                entity.Property(e => e.自選飲食id).HasColumnName("自選飲食ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.商品內容).HasMaxLength(300);

                entity.Property(e => e.商品名稱).HasMaxLength(50);

                entity.Property(e => e.圖片).HasMaxLength(50);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");
            });

            modelBuilder.Entity<SelfOrder>(entity =>
            {
                entity.HasKey(e => e.自選訂單id)
                    .HasName("PK_自選訂單編號ID");

                entity.ToTable("SelfOrder");

                entity.Property(e => e.自選訂單id).HasColumnName("自選訂單ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.入住時間).HasColumnType("datetime");

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.會員id).HasColumnName("會員ID");

                entity.Property(e => e.營區細項id).HasColumnName("營區細項ID");

                entity.Property(e => e.租賃商店id).HasColumnName("租賃商店ID");

                entity.Property(e => e.自選訂單編號).HasMaxLength(50);

                entity.Property(e => e.自選飲食id).HasColumnName("自選飲食ID");

                entity.Property(e => e.評論).HasMaxLength(500);

                entity.Property(e => e.退住時間).HasColumnType("datetime");

                entity.HasOne(d => d.會員)
                    .WithMany(p => p.SelfOrders)
                    .HasForeignKey(d => d.會員id)
                    .HasConstraintName("FK_自選行程訂單_會員資料庫");

                entity.HasOne(d => d.營區細項)
                    .WithMany(p => p.SelfOrders)
                    .HasForeignKey(d => d.營區細項id)
                    .HasConstraintName("FK_自選行程訂單_tCampDetale");

                entity.HasOne(d => d.租賃商店)
                    .WithMany(p => p.SelfOrders)
                    .HasForeignKey(d => d.租賃商店id)
                    .HasConstraintName("FK_自選行程訂單_租賃商店");

                entity.HasOne(d => d.自選飲食)
                    .WithMany(p => p.SelfOrders)
                    .HasForeignKey(d => d.自選飲食id)
                    .HasConstraintName("FK_自選行程訂單_飲食");
            });

            modelBuilder.Entity<SetFood>(entity =>
            {
                entity.HasKey(e => e.餐廳id)
                    .HasName("PK_set餐廳");

                entity.ToTable("SetFood");

                entity.Property(e => e.餐廳id).HasColumnName("餐廳ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.地址).HasMaxLength(100);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.餐廳名).HasMaxLength(50);

                entity.Property(e => e.餐廳電話).HasMaxLength(50);

                entity.Property(e => e.餐點細項).HasMaxLength(300);
            });

            modelBuilder.Entity<SetOrder>(entity =>
            {
                entity.HasKey(e => e.套裝訂單id)
                    .HasName("PK_set訂單");

                entity.ToTable("SetOrder");

                entity.Property(e => e.套裝訂單id).HasColumnName("套裝訂單ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.入住時間).HasColumnType("datetime");

                entity.Property(e => e.套裝行程id).HasColumnName("套裝行程ID");

                entity.Property(e => e.套裝訂單編號).HasMaxLength(50);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.會員id).HasColumnName("會員ID");

                entity.Property(e => e.評論).HasMaxLength(500);

                entity.Property(e => e.退住時間).HasColumnType("datetime");

                entity.HasOne(d => d.套裝行程)
                    .WithMany(p => p.SetOrders)
                    .HasForeignKey(d => d.套裝行程id)
                    
                    .HasConstraintName("FK_set訂單_set行程");

                entity.HasOne(d => d.會員)
                    .WithMany(p => p.SetOrders)
                    .HasForeignKey(d => d.會員id)
                    .HasConstraintName("FK_set訂單_會員資料庫");
            });

            modelBuilder.Entity<SetOrderDetail>(entity =>
            {
                entity.HasKey(e => e.套裝行程id)
                    .HasName("PK_set行程");

                entity.ToTable("SetOrderDetail");

                entity.Property(e => e.套裝行程id).HasColumnName("套裝行程ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.套裝方案).HasMaxLength(300);

                entity.Property(e => e.套裝細項).HasMaxLength(300);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.營區細項id).HasColumnName("營區細項ID");

                entity.Property(e => e.營地id).HasColumnName("營地ID");

                entity.Property(e => e.餐廳id).HasColumnName("餐廳ID");

                entity.HasOne(d => d.營區細項)
                    .WithMany(p => p.SetOrderDetails)
                    .HasForeignKey(d => d.營區細項id)
                    .HasConstraintName("FK_set行程_tCampDetale");

                entity.HasOne(d => d.營地)
                    .WithMany(p => p.SetOrderDetails)
                    .HasForeignKey(d => d.營地id)
                    .HasConstraintName("FK_set行程_tCampSite");

                entity.HasOne(d => d.餐廳)
                    .WithMany(p => p.SetOrderDetails)
                    .HasForeignKey(d => d.餐廳id)
                    .HasConstraintName("FK_set行程_set餐廳");
            });

            modelBuilder.Entity<ShopDetail>(entity =>
            {
                entity.HasKey(e => e.商品細項id)
                    .HasName("PK_購物商店");

                entity.ToTable("ShopDetail");

                entity.Property(e => e.商品細項id).HasColumnName("商品細項ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.品牌名稱).HasMaxLength(100);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.產品名稱).HasMaxLength(100);

                entity.Property(e => e.產品圖片).HasMaxLength(500);

                entity.Property(e => e.產品說明).HasMaxLength(300);
            });

            modelBuilder.Entity<ShopOrder>(entity =>
            {
                entity.HasKey(e => e.商店id)
                    .HasName("PK_購物訂單");

                entity.ToTable("ShopOrder");

                entity.Property(e => e.商店id).HasColumnName("商店ID");

                entity.Property(e => e.修改人).HasMaxLength(50);

                entity.Property(e => e.修改時間).HasColumnType("datetime");

                entity.Property(e => e.商品細項id).HasColumnName("商品細項ID");

                entity.Property(e => e.商店訂單編號).HasMaxLength(50);

                entity.Property(e => e.建立人).HasMaxLength(50);

                entity.Property(e => e.建立時間).HasColumnType("datetime");

                entity.Property(e => e.成立時間).HasColumnType("datetime");

                entity.Property(e => e.會員id).HasColumnName("會員ID");

                entity.Property(e => e.細項).HasMaxLength(1000);

                entity.Property(e => e.購物評價).HasMaxLength(200);

                entity.HasOne(d => d.商品細項)
                    .WithMany(p => p.ShopOrders)
                    .HasForeignKey(d => d.商品細項id)
                    .HasConstraintName("FK_購物訂單_購物商店");

                entity.HasOne(d => d.會員)
                    .WithMany(p => p.ShopOrders)
                    .HasForeignKey(d => d.會員id)
                    .HasConstraintName("FK_購物訂單_會員資料庫");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
