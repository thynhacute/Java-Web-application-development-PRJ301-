
CREATE DATABASE VegetableManagement
USE VegetableManagement
GO

SET DATEFORMAT dmy

CREATE TABLE tblRoles(
roleID INT NOT NULL,
roleName NVARCHAR(30) NOT NULL,
CONSTRAINT PK_TBLROLES PRIMARY KEY(roleID)
)

CREATE TABLE tblUsers(
userID NVARCHAR(30) NOT NULL,
fullName NVARCHAR(50) NOT NULL,
password NVARCHAR(30) NOT NULL,
roleID INT NOT NULL,
address NVARCHAR(50) NOT NULL,
birthday DATE NOT NULL,
phone NVARCHAR(30) NOT NULL,
email NVARCHAR(30) NOT NULL,
status BIT NULL,
CONSTRAINT PK_TBLUSERS PRIMARY KEY CLUSTERED (userID ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
ALTER TABLE tblUsers ADD CONSTRAINT FK01_TBLUSERS FOREIGN KEY(roleID) REFERENCES tblRoles(roleID)


CREATE TABLE tblOrder(
orderID INT NOT NULL,
orderDate DATE NULL,
total MONEY,
userID NVARCHAR(30),
status BIT NULL,
CONSTRAINT PK_TBLORDER PRIMARY KEY(orderID)
)
ALTER TABLE tblOrder ADD CONSTRAINT FK01_TBLORDER FOREIGN KEY(userID) REFERENCES tblUsers(userID)

CREATE TABLE tblCategory(
categoryID INT NOT NULL,
categoryName NVARCHAR(30),
CONSTRAINT PK_TBLCATEGORY PRIMARY KEY(categoryID)
)

CREATE TABLE tblProduct(
productID INT NOT NULL,
productName NVARCHAR(30) NULL,
image NVARCHAR(300) NULL,
price MONEY NULL,
quantity INT NULL,
categoryID INT NULL,
importDate DATE NULL,
usingDate DATE NULL,
CONSTRAINT PK_TBLPRODUCT PRIMARY KEY(productID)
)
ALTER TABLE tblProduct ADD CONSTRAINT FK01_TBLPRODUCT FOREIGN KEY(categoryID) REFERENCES tblCategory(categoryID)

CREATE TABLE tblOrderDetail(
detailID INT NOT NULL,
price MONEY,
quantity INT,
orderID INT,
productID INT,
CONSTRAINT PK_TBLORDERDETAIL PRIMARY KEY(detailID)
)
ALTER TABLE tblOrderDetail ADD CONSTRAINT FK01_TBLORDERDETAIL FOREIGN KEY(orderID) REFERENCES tblOrder(orderID)
ALTER TABLE tblOrderDetail ADD CONSTRAINT FK02_TBLORDERDETAIL FOREIGN KEY(productID) REFERENCES tblProduct(productID)

INSERT tblRoles(roleID, roleName) VALUES(N'1', N'Admin')
INSERT tblRoles(roleID, roleName) VALUES(N'2', N'User')

INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'admin', N'Toi la admin', N'1', N'1', N'VietNam', N'2022-03-10', N'123456', N'adminne@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SE151101', N'Hoang Nha Thy', N'1', N'1', N'Dong Nai', N'2001-10-07', N'0819439460', N'thyhnse151101@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SE151074', N'Ngo Xuan Thiep', N'1', N'1', N'Dong Nai', N'2001-12-24', N'0985325844', N'thiepnxse151074@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SE151056', N'Hoang Dinh Thai', N'1', N'2', N'Ho Chi Minh', N'2001-12-05', N'0938874361', N'thaihdse151056@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SE151086', N'Dao Duc Thinh', N'1', N'1', N'Dong Nai', N'2001-05-11', N'0987400704', N'thinhddse151086@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SE150209', N'Tran Hong Minh Nhat', N'1', N'2', N'Gia Lai', N'2001-11-26', N'0385159779', N'nhatthmse150209@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SS151122', N'Huynh Tai Sang', N'1', N'1', N'Ca Mau', N'2001-12-12', N'0834491515', N'sanghtss151122@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SE151046', N'Nguyen Hoang Tan', N'1', N'2', N'Ho Chi Minh', N'2000-12-24', N'0356969107', N'tannhse151046@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SE152537', N'Nguyen Ngoc Gia Han', N'1', N'2', N'Binh Duong', N'2001-07-30', N'0934326476', N'hannngse152537@fpt.edu.vn', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address],[birthday],[phone],[email],[status]) VALUES (N'SS151516', N'Le Thi My Cam', N'1', N'1', N'Ho Chi Minh', N'2000-07-17', N'0898874010', N'camltmss151516@fpt.edu.vn', 1)

INSERT tblCategory VALUES('1', N'Rau lá'),('2', N'Rau gia vị'),('3', N'Rau củ'),('4',N'Quả')

INSERT tblProduct(productID, productName, image, price, quantity, categoryID, importDate, usingDate) VALUES
('1', N'Giá đậu xanh 300g', N'https://baithuocquy.com/img/upload/Article/2016/5/6uuf82x2d4j8kqr62lgz-gia-do-xanh.jpg', 5000, 20, 2, '2022-03-05', '2022-03-12'),
('2', N'Bắp cải trắng 500g', N'https://product.hstatic.net/200000423303/product/bap-cai-huu-co_203a09f5391b4cb59bbad82f94c1cd7d_1024x1024.jpg', 11000,10,1, '2022-03-05', '2022-03-15'),
('3', N'Rau cải bẹ xanh 500g', N'https://cdn.tgdd.vn/Products/Images//8820/226912/bhx/files/cai-be-xanh-tui-500g-202009292341350261.jpg', 7500, 10, 1,'2022-03-05','2022-03-12'),
('4', N'Rau muống 500g', N'https://cityfarmer.vn/wp-content/uploads/2019/04/raumuong.jpg',7500, 15, 1, '2022-03-03', '2022-03-06'),
('5', N'Rau dền 500g', N'https://manafood.vn/wp-content/uploads/2021/05/rau-den1.jpg', 7500, 10, 1, '2022-03-03', '2022-03-04'),
('6', N'Xà lách xoong Đà Lạt 500g', N'https://thucphamsachgiatot.vn/image/cache/catalog/xa-lach-xoong-700x700.jpg',12500,15,1,'2022-03-03','2022-03-15'),
('7', N'Rau tần ô 500g', N'https://dalatxanh.vn/wp-content/uploads/2019/10/tan-o.jpg', 12500, 10, 1, '2022-03-03', '2022-03-21'),
('8', N'Cần tây 500g', N'https://www.minhcaumart.vn/media/com_eshop/products/2900531.jpg', 8750, 15, 1, '2022-03-03', '2022-03-14'),
('9', N'Rau ngót 500g', 'https://vinmec-prod.s3.amazonaws.com/images/20201125_143129_322415_ba-bau-khong-an-rau-g.max-800x800.jpg', 8000, 10, 1, '2022-03-03', '2022-03-19'),
('10', N'Rau mồng tơi 500g', N'https://vinmec-prod.s3.amazonaws.com/images/20210519_042214_593625_cho-tre-an-rau-mong.max-1800x1800.jpg', 7500, 15, 1, '2022-03-03', '2022-03-16'),
('11', N'Cải thìa 500g', N'https://static.mymarketcdn.com/uploads/2020/02/108316_2-1.jpg', 7500, 10, 1, '2022-03-03', '2022-03-20'),
('12', N'Lá giang 200g', N'https://giaviviet.vn/upload/hinhthem/lagiangtuoi-1956.jpg', 6000, 15, 2, '2022-03-03', '2022-04-06'),
('13', N'Rau thơm các loại 200gr', N'https://www.transoceanmart.com/wp-content/uploads/2020/11/rau-thom-cac-loai-100gr.jpg', 6000, 10, 2, '2022-03-03', '2022-03-29'),
('14', N'Cải bó xôi 300g', N'https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2021/10/8/image-500x500-16336805084271469691744.jpg', 4500, 15, 1, '2022-03-03', '2022-06-04'),
('15', N'Đậu bắp 250g', N'https://salt.tikicdn.com/cache/400x400/ts/product/55/75/9c/624fe58073713efe0cde9ef060fd37d4.jpg', 4500, 10, 3, '2022-03-03', '2022-05-03'),
('16', N'Rau má 200g', N'https://vinmec-prod.s3.amazonaws.com/images/20210602_144348_507977_rau-ma-tac-dung.max-1800x1800.jpg', 4250, 15, 1, '2022-03-03', '2022-05-06'),
('17', N'Măng tây 200g', N'https://product.hstatic.net/1000069791/product/3d32011f00000578-4222530-image-a-23_1487071847339_master.jpg', 25000, 10, 1, '2022-03-03', '2022-04-08'),
('18', N'Bông cải trắng 500g', N'https://thucphamdongxanh.com/wp-content/uploads/2019/09/cauliflower_x700.jpg', 25000, 15, 1, '2022-03-03', '2022-04-04'),
('19', N'Bông cải xanh 300g', N'https://product.hstatic.net/1000282430/product/broccoi-h-2_8e2d1e2c283c435186b03ff10d20519c.jpg', 15000, 10, 1, '2022-03-03', '2022-03-07'),
('20', N'Tỏi 300g', N'https://www.thuocdantoc.org/wp-content/uploads/2019/08/toi-cong-dung-doi-voi-suc-khoe-bai-thuoc-chua-benh-1.jpg', 18000, 15, 2, '2022-03-03', '0222-03-14'),
('21', N'Hành paro 500g', N'https://product.hstatic.net/1000282430/product/upload_7014ac9001e14cc7937f5fad35497d31_large.jpg', 17500, 10, 2, '2022-03-03', '2022-03-30'),
('22', N'Hành tím 300g', N'https://farm24h.vn/wp-content/uploads/2020/03/CUHANHTIM-4.jpg', 15000, 15, 2, '2022-03-03', '2022-04-04'),
('23', N'Gừng 100g', N'https://cdn.tgdd.vn/2021/12/CookDish/3-cach-lot-vo-gung-nhanh-chong-chi-voi-3-buoc-don-gian-avt-1200x676.jpg', 4500, 15, 2, '2022-03-03', '2022-06-03'),
('24', N'Me 68g', N'http://st.suckhoegiadinh.com.vn/staticFile/Subject/2018/09/14/2221110/kham-pha-nhung-cong-dung-tuyet-voi-cua-trai-me_14119620.jpg', 4000, 10, 2, '2022-03-03', '2022-11-03'),
('25', N'Chanh 200g', N'https://www.thuocdantoc.org/wp-content/uploads/2019/08/vi-thuoc-chanh-1.jpg', 4000, 15, 2, '2022-03-03', '2022-03-15'),
('26', N'Ớt 50g', N'https://minhcaumart.vn/media/com_eshop/products/2900040.jpg', 3500, 20, 2, '2022-03-05', '2022-03-12'),
('27', N'Hành lá 50g', N'https://www.transoceanmart.com/wp-content/uploads/2020/11/hanh-la.jpg', 2700, 10, 2, '2022-03-05', '2022-03-15'),
('28', N'Sả 100g', N'https://hatgiongphuongnam.com/asset/upload/image/hat-giong-sa-chanh-1.1_.jpg', 2000, 10, 2, '2022-03-05', '2022-03-12'),
('29', N'Bí xanh 500g', N'https://minhcaumart.vn/media/com_eshop/products/Bi-Xanh.jpg', 9000, 15, 3, '2022-03-03', '2022-03-06'),
('30', N'Khoai mỡ 1kg', N'https://cdn.nguyenkimmall.com/images/companies/_1/tin-tuc/kinh-nghiem-meo-hay/n%E1%BA%A5u%20%C4%83n/khoai-mo-tim-ngon.jpg', 45000, 10, 3, '2022-03-03', '2022-03-04'),
('31', N'Cà rốt 500g', N'https://suckhoedoisong.qltns.mediacdn.vn/Images/nguyenkhanh/2020/09/07/ca_rot_vi_thuoc_chua_2.jpg', 42500, 15, 3, '2022-03-03', '2022-03-15'),
('32', N'Khoai lang Nhật 1kg', N'https://cdn.tgdd.vn/Products/Images/8785/226905/bhx/khoai-lang-nhat-1kg-202101150934398643.jpg', 35000, 10, 3, '2022-03-03', '2022-03-21'),
('33', N'Cà chua 1kg', 'https://vtechfarms.com/UploadedFiles/Products/ca%20chua%20(9)_cecp.jpg', 28000, 15, 3, '2022-03-03', '2022-03-14'),
('34', N'Ớt chuông đỏ 300g', N'https://www.vtechfarms.com/UploadedFiles/Products/ot%20chuong%20do%201.jpg', 19500, 10, 3, '2022-03-03', '2022-03-19'),
('35', N'Khoai môn 500g', N'https://cdn.tgdd.vn/Products/Images/8785/230843/bhx/khoai-mon-tui-1kg-202011131737590276.jpg', 22500, 15, 3, '2022-03-03', '2022-03-16'),
('36', N'Dưa leo 500g', N'https://cdn.caythuocdangian.com/2019/11/qua-dua-leo.jpg', 18000, 10, 3, '2022-03-03', '2022-03-20'),
('37', N'Bí đỏ 700g', N'https://thucphamsachvita.com/wp-content/uploads/2020/06/bi-do-3.jpg', 17500, 15, 3, '2022-03-03', '2022-04-06'),
('38', N'Khổ qua 500g', N'https://farm24h.vn/wp-content/uploads/2020/04/KHOQUADALAT-1.jpg', 13000, 10, 3, '2022-03-03', '2022-03-29'),
('39', N'Khoai tây 500g', N'https://www.chuyenkhoadaday.com/wp-content/uploads/2016/10/cach-an-khoai-tay-tot-cho-he-tieu-hoa.jpg', 12500, 15, 3, '2022-03-03', '2022-06-04'),
('40', N'Cà tím 500g', N'https://rs.suckhoegiadinh.com.vn/staticFile/Subject/2018/06/21/ca4_21112299.jpg', 12000, 10, 3, '2022-03-03', '2022-05-03'),
('41', N'Su hào 500g', N'https://quatangbamien.com/assets/news/2020_09/6804920271e10e57b3a1adbadb8a1fdc.jpg', 11500, 15, 3, '2022-03-03', '2022-05-06'),
('42', N'Củ dền 500g', N'https://tracuuduoclieu.vn/wp-content/uploads/2021/05/cu-den.jpg', 11000, 10, 3, '2022-03-03', '2022-04-08'),
('43', N'Mướp hương 500g', N'https://tomitamart.vn/public/media//thumb/san-pham/muop_huong_tomita-570x421.jpg', 11500, 15, 3, '2022-03-03', '2022-04-04'),
('44', N'Su su 500g', N'https://tomitamart.vn/public/media//thumb/san-pham/qua_su_su_sapa-570x421.jpg', 10000, 10, 3, '2022-03-03', '2022-03-07'),
('45', N'Bầu 500g', N'https://product.hstatic.net/200000240163/product/a-bau_5d3c16469c034fc78ca7aa89da14a00f_master.jpg', 10000, 15, 3,'2022-03-03', '2022-03-14'),
('46', N'Nho xanh 500g', N'https://media.loveitopcdn.com/1254/nho-xanh-nho-xanh-hello-uc-11.jpg', 90000, 10, 4, '2022-03-03', '2022-03-30'),
('47', N'Nho đỏ 500g', N'https://product.hstatic.net/1000119621/product/upload_b8e8e2b1b274433d82627c0258a66188_large.jpg', 100000, 15, 4, '2022-03-03', '2022-04-04'),
('48', N'Táo Tessa 1kg', N'https://traicayxanh.vn/wp-content/uploads/2020/12/T%C3%A1o-Tessa-H%C3%A0-Lan.jpg', 89000, 15, 4, '2022-03-03', '2022-06-03'),
('49', N'Thanh long ruột đỏ 3kg', N'https://bachhoanongsan.com/wp-content/uploads/2020/06/thanh-long-ru%E1%BB%99t-%C4%91%E1%BB%8F.jpg', 26000, 10, 4, '2022-03-03', '2022-11-03'),
('50', N'Nho đen 500g', N'https://minhcaumart.vn/media/com_eshop/products/9900000480516.jpg', 89000, 15, 4, '2022-03-03', '2022-03-15'),
('51', N'Su hào 500g', N'https://thucphamdongxanh.com/wp-content/uploads/2019/09/su-hao.jpg', 80000, 15, 4, '2022-03-03', '2022-05-06'),
('52', N'Quýt 1kg', N'http://product.hstatic.net/1000282430/product/quyt_grande.jpg', 79000, 10, 4, '2022-03-03', '2022-04-08'),
('53', N'Cam Cara 1kg', N'https://img.websosanh.vn/v2/users/root_product/images/cam-ruot-do-uc/EWSHnC55QKUh.jpg', 79000, 15, 4, '2022-03-03', '2022-04-04'),
('54', N'Xoài cát Hoà Lộc 1kg', N'http://nongsanhungmanh.com/assets/san-pham/2017_12/quaxoai1-534.jpg', 75000, 10, 4, '2022-03-03', '2022-03-07'),
('55', N'Bơ 800g', N'https://toinayangi.vn/wp-content/uploads/2015/05/t%C3%A1c-d%E1%BB%A5ng-c%E1%BB%A7a-qu%E1%BA%A3-b%C6%A1.jpg', 68000, 15, 4, '2022-03-03', '2022-03-14'),
('56', N'Dưa hấu không hạt 3kg', N'https://product.hstatic.net/1000282430/product/seedless-watermelon-around-2.5kg-whole-fruit_23a860613aa94413aca16b9d766f6291.jpg', 65000, 10, 4, '2022-03-03', '2022-03-30'),
('57', N'Bưởi da xanh 1.7kg', N'https://minhcaumart.vn/media/com_eshop/products/2900115.jpg', 59000, 15, 4, '2022-03-03', '2022-04-04'),
('58', N'Dưa lưới 1.3kg', N'https://salt.tikicdn.com/ts/tmp/f9/c3/66/56e807901705fc629b102fb5eff44c99.jpg', 56000, 15, 4, '2022-03-03', '2022-06-03'),
('59', N'Lê 1kg', N'https://afamilycdn.com/Images/Uploaded/Share/2010/08/29/010829gt55.jpg', 52000, 10, 4, '2022-03-03', '2022-11-03'),
('60', N'Sapoche 1kg', N'http://hstatic.net/520/1000107520/1/2016/8-18/sapoche_grande.jpg', 36000, 15, 4, '2022-03-03', '2022-03-15')

ALTER TABLE tblProduct
  ADD DESCRIPTION NTEXT

UPDATE tblProduct
SET DESCRIPTION='Giá đậu xanh hay còn gọi là giá đỗ, là một trong những nguồn thực phẩm rau quen thuộc trong các món ăn của nhiều gia đình Việt Nam. 
Giá đậu xanh có tính hàn, vị ngọt rất nhẹ vì thế mang đến cho người dùng cảm giác dễ chịu, giúp thanh lọc và làm mát cơ thể.'
WHERE productID ='1'

UPDATE tblProduct
SET DESCRIPTION='Bắp cải trắng (bắp sú) luôn là nguyên liệu quen thuộc trong căn bếp của mọi gia đình Việt. 
Bắp cải có vị ngọt thanh đặc trưng và độ giòn nhất định. Không những thế chúng còn được xem như một nam châm hút bệnh ra khỏi cơ thể, 
nhất là giúp cơ thể giảm đau, trị ho, đờm, loét dạ dày… Theo các nghiên cứu y học thì bắp cải là loại củ giàu hàm lượng vitamin A, C, 
chất chống ung thư giúp gia tăng các tế bào hồng cầu, giải độc cơ thể,...'
WHERE productID ='2'

UPDATE tblProduct
SET DESCRIPTION='Cải bẹ xanh 4KFarm (còn gọi là cải cay, cải canh),... là loại rau chứa hàm lượng calories rất thấp nhưng lại 
có nhiều chất dinh dưỡng cần thiết cho cơ thể như Vitamin A, B, C, K, Axit nicotic, Abumin, Catoten,… 
Cải bẹ xanh có các tác dụng chữa bệnh tuyệt vời như ngăn ngừa các biểu hiện ung thư, ăn cải xanh nhiều còn giúp mắt sáng khỏe, 
giúp da ngăn ngừa lão hóa, chắc khỏe hỗ trợ chị em phụ nữ trong việc chăm sóc sắc đẹp.'
WHERE productID ='3'

UPDATE tblProduct
SET DESCRIPTION='Rau muống 4KFarm là loại rau phổ biến và ưa chuộng trong bữa ăn gia đình vì có vị ngọt, tính mát và chứa một lượng lớn vitamin A, C, 
các chất dinh dưỡng và đặc biệt là hàm lượng chất sắt dồi dào.'
WHERE productID ='4'

UPDATE tblProduct
SET DESCRIPTION='Rau dền 4KFarm là một loại rau xanh được các bà nội trợ bổ sung trong thực đơn mỗi ngày. 
Ngoài vị ngọt mát và thành phần dinh dưỡng cao, rau dền còn mang đến nhiều lợi ích như: Chống táo bón, điều trị tăng huyết áp, tốt cho bệnh nhân tiểu đường, ngừa ung thư...'
WHERE productID ='5'

UPDATE tblProduct
SET DESCRIPTION='Xà lách xoong (cải xoong) là loại rau cải được khá nhiều người biết đến vì nó ngon và có hương vị đặc biệt. 
Được trồng tại Đà Lạt nên xanh tươi và ngon hơn xà lách bình thường. Bên cạnh đó xà lách xoong còn chế biến nhiều món ăn ngon hấp dẫn cung cấp được nhiều chế độ dinh dưỡng an toàn.'
WHERE productID ='6'

UPDATE tblProduct
SET DESCRIPTION='Rau tần ô hay còn gọi là rau cải cúc, là một loại rau có tính hàn mát, vị ngọt nhẹ, rất phù hợp cho việc chế biến thành các món canh rau cho gia đình. 
Ngoài ra, rau tần ô cũng mang đến nhiều lợi ích cho sức khỏe con người như trị ho, trị đau đầu, lợi tiểu, chữa tiêu chảy,... 
Rau tần ô thích hợp với khẩu vị của cả gia đình, rau mềm, ngọt, tươi xanh, nấu cho bé cũng được mà nấu cho người lớn cũng rất tốt.'
WHERE productID ='7'

UPDATE tblProduct
SET DESCRIPTION='Cần tây là loại rau quen thuộc trong bữa ăn hàng ngày, không chỉ giúp món ăn thêm phần thơm ngon mà còn mang lại nhiều lợi ích cho sức khỏe. 
Cần tây có một mùi thơm vô cùng đặc trưng, giúp làm dậy mùi nhiều món ăn. Theo chuyên gia dinh dưỡng Megan Ware, trong cần tây chứa gần 95% nước cùng nhiều vitamin, protein và chất khoáng. 
Đặc biệt, hàm lượng vitamin K trong cần tây rất cao. Bên cạnh đó, cần tây chứa hàm lượng chất xơ phong phú, giúp ích cho quá trình đào thải độc tố ra ngoài cơ thể.'
WHERE productID ='8'

UPDATE tblProduct
SET DESCRIPTION='Rau ngót là một loại rau phổ biến, thông dụng trong bữa ăn của người Việt. Rau ngót dễ trồng, dễ sống ở mọi nơi. 
Thành phần dinh dưỡng của rau ngót chứa lượng đạm thực vật cao nên rau ngót được khuyên dùng thay thế đạm động vật. 
Rau ngót có ngọt, mát, ăn vừa thanh nhiệt cơ thể, vừa thơm  ngon và dinh dưỡng.'
WHERE productID ='9'

UPDATE tblProduct
SET DESCRIPTION='Rau mồng tơi là một trong những loại rau được ưa chuộng trong nhiều gia đình bởi tính hàn và dễ chế biến thành nhiều món ăn. 
Ngoài ra, những lợi ích tuyệt vời của mồng tơi đối với sức khỏe như giải nhiệt cơ thể, ngăn ngừa loãng xương, trị táo bón, khó tiêu,.... 
Rau mồng tơi mềm, ngọt, rất dễ ăn nên phù hợp với khẩu vị của cả gia đình, từ những món ăn dặm với rau mồng tơi cho bé, hay món canh rau mồng tơi mềm ngọt, thơm lừng cho người lớn tuổi.'
WHERE productID ='10'

UPDATE tblProduct
SET DESCRIPTION='Cải thìa hay cải bẹ trắng còn có tên là bạch giới tử thuộc họ cải cùng họ với cải thảo, cải bẹ xanh. 
Đây là loại rau chứa nhiều thành phần dinh dưỡng dễ chế biến, có thể đem nấu canh, xào với dầu mè thơm hoặc hấp chấm và ngay cả ăn sống, 
vị ngọt ngọt, giòn giòn của cải thìa sẽ làm cho bạn cảm thấy ngon miệng. Ngoài ra, rau cải thìa cũng mang đến nhiều lợi cho sức khỏe. 
Đặc biệt, rất tốt cho phụ nữ mang thai, phòng ngừa bệnh đục nhân mắt, ngăn ngừa ung thư,...'
WHERE productID ='11'

UPDATE tblProduct
SET DESCRIPTION='CLá giang (tên gọi khác: giang chua, chua méo, dây dang) là loại rau đặc sản của các tỉnh miền Trung và miền Nam, thường dùng để xào, nấu canh với thịt bò, 
thịt gà hay cá nước ngọt. Lá giang có vị chua, tính mát cùng hương thơm đặc trưng, giúp tạo cho món ăn hương vị vô cùng đặc biệt. Vì thế, đây không chỉ là rau ăn, 
lá giang còn là cây thuốc dân gian phòng trị nhiều bệnh. Theo Đông y, đây là loại thảo dược thường được dùng trong bài thuốc và các món ăn chữa viêm đường tiết niệu, sỏi thận, 
sỏi bàng quang, suy nhược cơ thể và sản hậu băng huyết.'
WHERE productID ='12'

UPDATE tblProduct
SET DESCRIPTION='Rau thơm các loại gói 200gr (hay gọi là rau gia vị) gồm rau kinh giới, rau húng trắng, rau diếp cá. 
Kết hợp ăn rau khác nhau tương ứng với từng món ăn khác nhau làm gia tăng hương vị cho món ăn, giúp cho món ăn ngon và không bị ngán. 
Hoặc được sử dụng như một phương pháp điều trị bệnh: mụn nhọt, sưng tuyến vú, điều trị cảm mạo, ho, dị ứng, rôm sẩy ở trẻ nhỏ, cầm máu, điều trị các bệnh phát ban, tốt cho tim mạch...'
WHERE productID ='13'

UPDATE tblProduct
SET DESCRIPTION='Cải bó xôi hay còn được gọi là rau Bina, là một loại rau được ưa chuộng ở rất nhiều nơi trên thế giới bởi những giá trị dinh dưỡng mà nó mang lại. 
Một số công dụng tuyệt vời của cải bó xôi có thể kể đến như chống ung thư, chống viêm, ngăn ngừa bệnh tuyến tiền liệt, hỗ trợ giảm cân, làm đẹp da, sáng mắt,...'
WHERE productID ='14'

UPDATE tblProduct
SET DESCRIPTION='Đậu bắp là một loại quả với tên gọi khác mướp tây hay bắp còi, là một trong loại thực phẩm quen thuộc được sử dụng trong các bữa ăn hằng ngày. 
Đậu bắp dễ ăn, chứa nhiều chất xơ, giàu dinh dưỡng, nhiều vitamin,…đều là những thành phần dưỡng chất hữu ích cho hệ tiêu hóa, tim mạch, chống ung thư, tốt cho da và mắt,... 
Ngoài việc trở thành món ăn trong các bữa ăn hằng ngày thì đậu bắp còn được chế biến thành nước để uống. Nước đậu bắp rất tốt cho các bà bầu, hạn chế khả năng dị tật của thai nhi tốt.'
WHERE productID ='15'

UPDATE tblProduct
SET DESCRIPTION='Rau má là loại rau mang đến nhiều công dụng cho sức khỏe của gia đình bạn như: giải độc gan, điều trị táo bón, bệnh tim mạch, 
làm đẹp da và tăng cường sức đề kháng cho sức khỏe,… rau má có thể dùng làm sinh tố uống giải nhiệt mùa hè, đồng thời cũng dùng để chế biến thành nhiều món ăn ngon hấp dẫn.'
WHERE productID ='16'

UPDATE tblProduct
SET DESCRIPTION='Măng tây là loại rau củ quý giá có chứa hàm lượng dinh dưỡng cao như: chất xơ, đạm, glucid, các vitamin K, C, A, pyridoxine (B6), riboflavin (B2), 
acid folic, canxi, sắt, kẽm… mang đến nhiều lợi ích cho sức khỏe và được chế biến thành nhiều món ăn khác nhau. Các dưỡng chất trong măng tây hỗ trợ, 
bổ sung rất nhiều chất dinh dưỡng như tốt cho tim mạch, hệ tiêu hoá, tăng cường hệ miễn dịch, ngăn ngừa loãng xương,... ngoài ra, măng tây còn giúp giảm cân một cách hiệu quả nữa đó.'
WHERE productID ='17'

UPDATE tblProduct
SET DESCRIPTION='Bông cải trắng hay còn gọi là súp lơ trắng là một loại rau họ cải, có giá trị dinh dưỡng rất cao. Đây là một loại rau cực kỳ tốt cho sức khỏe, 
là nguồn chứa nhiều chất dinh dưỡng quan trọng, có thể làm giảm nguy cơ mắc một số bệnh, bao gồm bệnh tim và ung thư. 
Ngoài ra, bông cải còn là thực phẩm không thể thiếu trong quá trình giảm cân và cực kỳ dễ dàng để phối hợp với các món ăn khác trong chế độ ăn uống của bạn. 
Bông cải trắng có phần bông màu trắng gắn khít vào nhau, xốp và hơi dai mềm, bên ngoài có lớp lá bao bọc xung quanh, phiến lá cứng và dày.'
WHERE productID ='18'

UPDATE tblProduct
SET DESCRIPTION='Bên cạnh những tác dụng giảm viêm và chống oxy hóa, một số hợp chất trong bông cải xanh có thể giúp giảm tổn thương mãn tính của một số mô trong cơ thể. 
Ngoài giàu dưỡng chất và vitamin, bông cải xanh hay còn được gọi là súp lơ, là loại rau xanh được nghiên cứu cho thấy tác dụng giảm nguy cơ ung thư ở một số cơ quan như ung thư vú, 
tuyến tiền liệt, dạ dày, thận, bàng quang.'
WHERE productID ='19'

UPDATE tblProduct
SET DESCRIPTION='Tỏi tím Trung Quốc thường có nhánh đều nhau, bao phủ bởi những dải màu tím. Tỏi là một loại gia vị không thể thiếu trong gian bếp của mỗi nhà. 
Không những giúp làm tăng hương vị cho món ăn mà còn có nhiều tác dụng trong việc phòng, điều trị một số bệnh hiệu quả. 
Tỏi có chứa rất nhiều chất dinh dưỡng có thể kể đến như: protein, carbohydrates, calo,... ngoài ra còn có các khoáng chất và các vitamin như: 
Vitamin nhóm B , sắt, canxi, kali, mangan, magie, photpho,... Tỏi không những giúp món ăn ngon hơn mà chúng còn giúp hỗ trợ, phòng chống một số loại bệnh như: 
cảm cúm, cải thiện chức năng khớp, phòng ngừa về các bệnh tim mạch.'
WHERE productID ='20'

UPDATE tblProduct
SET DESCRIPTION='Hành Paro là loại hành có cọng và lá thẳng trơn, căng, chúng có kích thước to gấp 3 – 4 lần hành lá thường và thường được trồng tại các vùng 
có khí hậu ôn hòa trên thế giới. Trong thành phần dinh dưỡng của hành boa rô có nhiều chất dinh dưỡng và khoáng chất tốt cho sức khỏe như fructosan tạo nên vị ngọt dịu, 
vitamin nhóm A, B, C, E và nhiều khoáng chất khác.'
WHERE productID ='21'

UPDATE tblProduct
SET DESCRIPTION='Hành tím không chỉ là một loại gia vị giúp tăng hương thơm làm món ăn thêm phần ngon miệng mà chúng còn có công dụng đặc biệt ít ai biết đến. 
Với một củ hành tím mỗi ngày bạn có thể làm đẹp, đồng thời ngăn ngừa bệnh. Hành tím Ấn Độ có củ to, tròn hơn so với hành tím Việt Nam. 
Củ có lớp vỏ ngoài mỏng, màu nâu cánh gián, mỗi củ riêng biệt, không dính liền nhau.'
WHERE productID ='22'

UPDATE tblProduct
SET DESCRIPTION='Gừng là một loài thực vật hay được dùng làm gia vị, thuốc. Trong củ gừng có các hoạt chất: Tinh dầu zingiberen, chất nhựa, chất cay, tinh bột. 
Chính tinh dầu này làm món ăn thơm ngon hơn, khử đi mùi tanh của thịt cá. Không những vậy, gừng có vị cay, tính ôn, kích thích vị giác, tạo cảm giác thèm ăn, 
khiến bữa ăn thêm ngon miệng. Bên cạnh đó những lợi ích từ gừng như: làm ấm cơ thể, trừ hàn, tiêu đàm, dịu ho, cầm máu, giúp giảm các cơn đau cơ, viêm khớp, thấp khớp, 
đau đầu hay đau nửa đầu.'
WHERE productID ='23'

UPDATE tblProduct
set description='Me chua vắt là thực phẩm được dùng rất phổ biến trong việc chế biến các món ăn, là rau gia vị dùng để chế biến nên nhiều món ăn ngon, 
hấp dẫn mà nó còn rất tốt cho sức khỏe. Nó có công dụng giảm mỡ, ngừa thiếu máu, cao huyết áp,... Sản phẩm được làm sạch, đóng hộp dễ chế biến, bảo quản được lâu, 
giúp người nội trợ tiết kiệm được nhiều thời gian.'
WHERE productID ='24'

UPDATE tblProduct
SET DESCRIPTION='Chanh là loại nguyên liệu mà nhà nhà đều phải có trong gian bếp của mình. Ngoài là nguyên liệu cho các món ăn, chanh còn rất nhiều tác dụng không ngờ khác như: 
Làm đẹp, cải thiện sức khỏe, vệ sinh nhà cửa,... Trong chanh có rất nhiều loại vitamin và khoáng chất rất tốt cho cơ thể nữa.'
WHERE productID ='25'

UPDATE tblProduct
SET DESCRIPTION='Ớt mang một vị cay đặc trưng, cùng với hành, tỏi, và các loại rau nêm khác trở thành nguyên liệu không thể thiếu trong mỗi món ăn, giúp các món ăn cay nồng, 
dậy mùi thêm phần hấp dẫn. Người ta có thể dùng ớt ở bất kể món ăn nào nếu muốn có thêm vị cay cay the the, có người còn ăn ớt sống, mỗi bữa cơm hai trái như thói quen 
để kích thích vị giác, giúp ăn ngon miệng hơn. Ớt có nhiều loại, nhưng phải nói là cay nhất thì chỉ có ớt hiểm, chính là loại quả ớt thường mọc quả có 3 màu trắng, đỏ, 
vàng trên cùng một cây.'
WHERE productID ='26'

UPDATE tblProduct
SET DESCRIPTION='Là một loại rau rất quen thuộc với chị em nội trợ. Hành lá thường được dùng để làm gia vị cho các món ăn, làm tăng hương vị lên gấp nhiều lần. 
Hầu như các món ăn đều có thể thêm hành lá vào nếu thích. Ngoài ra, hành lá còn có thể dùng để hỗ trợ trị một số bệnh nhẹ như: cảm sốt, nhức đầu,...'
WHERE productID ='27'

UPDATE tblProduct
SET DESCRIPTION='Sả được biết đến không chỉ là một loại rau nêm mang mùi hương đặc trưng trong gian bếp, trong mỗi món ăn mà còn là nguyên liệu làm đẹp da an toàn, 
tiết kiệm và hiệu quả. Trong sả có chứa nhiều loại vitamin như: A, C, B1, B2, B3, B5, B6 và axit folic rất tốt để nuôi dưỡng làn da. 
Ngoài ra, nó còn chứa nhiều loại khoáng chất quan trọng như: Kali, Canxi, Magie, Photpho, Mangan, Đồng, Kẽm và Sắt giúp làn da được căng khỏe và tràn đầy sức sống. 
Đặc biệt, tính kháng khuẩn và chất chống oxy hóa trong sả giúp ngăn ngừa lão hóa da, nếp nhăn đồng thời giải quyết các vấn đề về viêm nang lông, viêm mô tế bào đấy.'
WHERE productID ='28'

UPDATE tblProduct
SET DESCRIPTION='Trong thành phần của bí xanh phần lớn là nước, không chứa lipid, với hàm lượng natri rất thấp. Ngoài ra, bí xanh có chứa nhiều khoáng chất như protid, 
glucid, canxi, photpho, sắt và nhiều loại vitamin như: Caroten, B1, B2, B3, C… do đó bí xanh có rất nhiều công dụng tốt cho sức khoẻ như giải độc gan, thanh nhiệt cơ thể, 
tốt cho tim mạch, phát triển chiều cao, tăng cường hệ miễn dịch,..'
WHERE productID ='29'

UPDATE tblProduct
SET DESCRIPTION='Trong khoai mỡ chứa rất nhiều tinh bột, chất xơ cùng hàm lượng vitamin và các khoáng chất dồi dào. Cứ 100g khoai mỡ sẽ có khoảng 5.3g chất xơ, 10mg vitamin C, 
vitamin B6, 0.31mg Kali, Magnesium và Phosphorus. Điểm đặc biệt của khoai mỡ so với các loại củ, quả khác chính là khả năng chuyển hóa tối đa lượng carbonhydrate và điều tiết, 
tối ưu quá trình chuyển hóa năng lượng nhờ hàm lượng Magnesium dồi dào của mình, hiệu quả trong việc duy trì cân nặng, giảm cân.'
WHERE productID ='30'

UPDATE tblProduct
SET DESCRIPTION='Cà rốt baby là một loại củ rất quen thuộc trong các món ăn của người Việt, cà rốt baby có kích thước nhỏ hơn cà rốt thông thường. 
Loại củ này có hàm lượng chất dinh dưỡng và vitamin A cao, được xem là nguyên liệu cần thiết cho các món ăn dặm của trẻ nhỏ, giúp sáng mắt và nguồn chất xơ dồi dào.'
WHERE productID ='31'

UPDATE tblProduct
SET DESCRIPTION='Khoai lang Nhật là một loại củ có hình dáng thon, dài. Với lớp vỏ bên ngoài màu tím, trong ruột thì vàng, hương vị ngọt dịu nhẹ, 
bùi nên chiếm được rất nhiều cảm tình của mọi người. Trong Đông y củ khoai lang có vị ngọt, tính bình, có công dụng nhuận tràng, bồi bổ cơ thể, tiêu viêm, lợi mật, sáng mắt,.. 
đặc biệt ăn khoai vào buổi sáng sẽ giúp bạn cung cấp đầy đủ dinh dưỡng cho cơ thể, đặc biệt là chữa được nhiều bệnh nguy hiểm mà bạn không ngờ tới.'
WHERE productID ='32'

UPDATE tblProduct
SET DESCRIPTION='Cà chua được xem là một loại thực phẩm thiết yếu bởi chúng rất quen thuộc để tạo ra nhiều món ăn ngon hàng ngày với vị chua ngọt đặc trưng cho gia đình. 
Đây cũng được xem là một loại củ rất bổ dưỡng và lành mạnh, có tác dụng tăng cường sức đề kháng của cơ thể, ngăn ngừa và điều trị bệnh suy nhược, chống chống nhiễm trùng. 
Không những thế, cà chua còn chứa hàm lượng vitamin A cao, mang đến nhiều lợi ích cho sức khoẻ.'
WHERE productID ='33'

UPDATE tblProduct
set description='Ớt chuông có 92% là nước, còn lại là các chất dinh dưỡng như Carb, Protein, Chất béo cùng các khoáng chất và vitamin như: Vitamin A, C, K1, Folate và Kali 
cùng nhiều chất chống oxy hóa khác. - Với hàm lượng vitamin A dồi dào- Ngoài ra ớt chuông sinh nhiệt và làm tăng tỷ lệ trao đổi chất, giúp đốt cháy calo, hỗ trợ giảm cân. 
Các vitamin A, C, K cùng hàm lượng lưu huỳnh có trong ớt chuông hỗ trợ hệ thống miễn dịch, bảo vệ tế bào khỏi quá trình oxy hoá, tăng cường khả năng hấp thụ và bổ sung chất sắt, 
ngăn ngừa ung thư. cùng Lutein và Zeaxanthin, ớt chuông hỗ trợ giúp bảo vệ võng mạc khỏi các tác động oxy hóa, tránh khỏi các bệnh thoái hóa võng mạc, thoái hóa điểm vàng.'
WHERE productID ='34'

UPDATE tblProduct
SET DESCRIPTION='Loài củ này giúp cung cấp nguồn chất xơ tuyệt vời dinh dưỡng tuyệt vời có thể kể đến như: chất xơ, Mangan, Vitamin B6, Vitamin E, Vitamin C, Đồng, Magnesium...
Khoai môn có chứa nhiều Magnesium nên có khả năng chuyển hóa carbonhydrate và điều tiết quá trình sản xuất năng lượng, giúp cho cơ thể duy trì cân nặng. 
Bên cạnh đó, với lượng vitamin B6 dồi dào, đây là dưỡng chất có tác dụng ngăn ngừa các bệnh về tim mạch, đồng thời làm giảm huyết áp cho cơ thể. 
Điều đặc biệt ở loại khoai này là khả năng chống viêm nhiễm hiệu quả, phòng ngừa bệnh viêm đường tiểu.'
WHERE productID ='35'

UPDATE tblProduct
SET DESCRIPTION='Dưa leo baby là một giống dưa mới, được trồng khá nhiều ở nước ta, đây là một loại rau củ rất ngon, gần như là quen thuộc trong tất cả bữa ăn ở mọi gia đình. 
Dưa leo chứa rất nhiều chất dinh dưỡng và vitamin rất tốt cho cơ thể. Ngoài ra, dưa leo còn có thể dụng để làm đẹp cũng rất hiệu quả.'
WHERE productID ='36'

UPDATE tblProduct
SET DESCRIPTION='Bí đỏ là loại củ chứa lượng calo tương đối thấp, do 94% bí đỏ là nước. Bí đỏ cũng chứa nhiều beta-caroten, một loại carotenoid mà cơ thể tổng hợp thành vitamin A. 
Hơn thế nữa, hạt bí đỏ cũng có thể được sử dụng bởi chúng chứa nhiều chất dinh dưỡng và mang lại nhiều lợi ích cho sức khoẻ.'
WHERE productID ='37'

UPDATE tblProduct
SET DESCRIPTION='Hay còn gọi là mướp đắng, là món ăn cực quen thuộc trong thực đơn hàng tuần của các bà nội trợ. 
Trong khổ qua rừng chứa rất nhiều vitamin và khoáng chất tốt cho cơ thể, giúp nâng cao chức năng miễn dịch, thanh nhiệt giải độc. 
Khổ qua có thể chế biến thành canh hoặc các món xào đều rất ngon.'
WHERE productID ='38'

UPDATE tblProduct
SET DESCRIPTION='Khoai tây thuộc họ cà, là một loại củ đa năng có hàm lượng chất dinh dưỡng cao, vì vậy nhiều hộ gia đình tại Việt Nam đã lựa chọn khoai tây 
như một món ăn chính trong các bữa ăn hàng ngày. Sở hữu nguồn vitamin và khoáng chất phong phú, khoai tây mang lại nhiều lợi ích cho sức khỏe như kháng viêm, giảm đau, 
tăng cường hệ miễn dịch, kích thích tiêu hóa,... Khoai tây có vị bột bột, hầm lên ăn rất ngon, phù hợp cho các món ăn dặm của bé yêu.'
WHERE productID ='39'

UPDATE tblProduct
SET DESCRIPTION='Cà tím (hay quả cà tím), có họ hàng với cà chua, khoai tây, cà pháo. Loại củ, quả này sử dụng trong chế biến dưới dạng thức ăn hầm, xào, nướng. 
Nhờ chứa hàm lượng chất xơ vô cùng cao và giàu sắt, cà tím còn giúp giảm nguy cơ mắc các bệnh ung thư như ung thư ruột kết, trực tràng, tim mạch, chữa chứng hay quên,...'
WHERE productID ='40'

UPDATE tblProduct
SET DESCRIPTION='Su hào là loại củ được sử dụng nhiều trong chế biến món ăn vì nó có vị ngọt nhẹ, giòn và rất giàu Vitamin, chất xơ, thích hợp với khẩu vị của cả gia đình. 
Trong su hào rất giàu Vitamin C. Loại Vitamin này có tính chống oxy hóa mạnh, giúp cơ thể duy trì các mô liên kết, răng và nướu khỏe mạnh, 
giúp bảo vệ cơ thể con người hạn chế ung thư và đẩy các gốc tự do có hại ra khỏi cơ thể…Su hào còn chứa một lượng dồi dào nhóm Vitamin B phức hợp, 
là các yếu tố kết hợp với enzym trong quá trình trao đổi chất khác nhau trong cơ thể.'
WHERE productID ='41'

UPDATE tblProduct
SET DESCRIPTION='Củ dền hay còn gọi là củ dền đỏ, là một loại củ quen thuộc trong món ăn của nhiều gia đình. Củ dền có lớp vỏ bên ngoài xù xì, 
bên trong có màu đỏ thẫm hoặc tím than, lớp thịt cứng giòn. Đây là loại rau củ chứa nhiều vitamin (A, B2, C,...) cùng với hàm lượng chất xơ, 
chất sắt cao và các khoáng chất có lợi. Vì thế, củ dền có rất nhiều công dụng đối với sức khỏe con người khi chế biến thành nhiều món ăn như điều hòa huyết áp, 
cải thiện đường tiêu hóa, hỗ trợ thải độc,... '
WHERE productID ='42'

UPDATE tblProduct
SET DESCRIPTION='Là loại rau củ được nhiều chị em nội trợ chọn mua để chế biến thành các món ăn ngon cho gia đình. Mướp hương cũng chứa nhiều nước, Protid, Lipid, Glucid, Canxi, 
Photpho, Sắt, B1, B6, B2, C rất tốt cho cơ thể. Mướp có thể chế biến thành các món xào, món canh, hấp đều rất ngon.'
WHERE productID ='43'

UPDATE tblProduct
SET DESCRIPTION='Quả su su có tính mát, lành tính, chứa nhiều chất dinh dưỡng có lợi cho sức khỏe như nước, protid, glucid, vitamin C. 
Trong quả và hạt su su giàu axit amino như axit aspartic axit glutamic, alanine, arginine, cysteine, phenylalanine, glycine, histidine, isoleucine, leucine, methionine (chỉ có ở quả), 
proline, serine, tyrosine, threonine và valine.'
WHERE productID ='44'

UPDATE tblProduct
SET DESCRIPTION='Bầu sao có vị ngọt, tính mát, giúp giải nhiệt cơ thể được sử dụng làm một số vị thuốc Đông y có tác dụng lợi tiểu, mát gan, giải độc, làm đẹp da và giảm cân. 
Có tác dụng nhuận tràng, chống táo bón và thường được sử dụng nhiều trong mùa hè. Bên cạnh đó, hạt bầu cũng được tận dụng đun lấy nước súc miệng chữa bệnh sưng mộng răng, 
lợi răng lung lay, tụt lợi...'
WHERE productID ='45'

UPDATE tblProduct
SET DESCRIPTION='Nho xanh là loại trái cây tươi nhập khẩu cao cấp. Đạt tiêu chuẩn xuất khẩu toàn cầu. Bảo quản tươi ngon đến tận tay khách hàng. 
Quả nho màu xanh, dáng tròn, trái vừa ăn. Vỏ mỏng, không hạt, vị ngọt đậm, thịt chắc, giòn, tươi mát.'
WHERE productID ='46'

UPDATE tblProduct
SET DESCRIPTION='Từ vùng trồng nho nổi tiếng, nho đỏ không hạt tại Bách Hóa XANH quả to, chắc thịt, thơm ngon mọng nước chứa hàm lượng vitamin dồi dào. 
Cam kết đúng khối lượng, chất lượng và an toàn, bao bì kín đáo, bảo đảm hợp vệ sinh.'
WHERE productID ='47'

UPDATE tblProduct
SET DESCRIPTION='Táo Tessa nhập khẩu từ Holland với đặc điểm là quả to tròn, căng mọng nhìn rất thích mắt, vỏ màu đậm và bắt mắt vô cùng. 
Khi ăn, bạn dễ dàng cảm nhận được hương vị thơm, giòn, ngọt đậm đà, khiến bạn say đắm.'
WHERE productID ='48'

UPDATE tblProduct
SET DESCRIPTION='Thanh long đỏ giàu chất dinh dưỡng, giá trị chữa bệnh cao, có tác dụng hạ huyết áp, hạ lipid máu, giải độc , dưỡng phổi, dưỡng da, cải thiện thị lực, 
đồng thời cũng có tác dụng nhất định đối với bệnh táo bón, tiểu đường. Ngoài ra, thanh long đỏ còn tác dụng phòng chống nhiễm độc kim loại nặng và tăng cường sức đề kháng, 
chống oxy hóa, chống lão hóa và các tác dụng khác.'
WHERE productID ='49'

UPDATE tblProduct
SET DESCRIPTION='Táo xanh Mỹ là giống táo được phát hiện ở Úc và du nhập vào Mỹ vào năm 1860. Đây là một trong những loại trái cây nhập khẩu được nhiều người ưa chuộng 
bởi vị chua đậm khác biệt với các giống táo nhập khẩu khác. 
Táo có quả có kích thước không quá to, vỏ ngoài có màu xanh nhạt, láng mịn, hơi dai. Thịt táo bên trong có độ giòn, vị chua, nhiều nước.'
WHERE productID ='50'

UPDATE tblProduct
SET DESCRIPTION='Là loại trái cây tươi cao cấp, có quả thuôn dài, vỏ mỏng, màu đen sẫm, không hạt, rất ngọt và giòn. 
Nho đen được nhập khẩu trực tiếp, đạt tiêu chuẩn xuất khẩu toàn cầu, loại sản phẩm này có giá trị dinh dưỡng cao, được cả trẻ em và người lớn đều thích.'
WHERE productID ='51'

UPDATE tblProduct
SET DESCRIPTION='Là loại trái cây nhập khẩu chứa nhiều chất dinh dưỡng có lợi cho sức khỏe, đồng thời quýt cung cấp những chất dinh dưỡng thiết yếu như vitamin C 
để tăng cường sức đề kháng. Quýt vàng ươm, mọng nước và ngọt lịm sẽ là loại quả giải nhiệt mùa hè rất tốt.'
WHERE productID ='52'

UPDATE tblProduct
SET DESCRIPTION='Đặc điểm nổi bật là có vỏ màu vàng khá mỏng và dễ bóc. Ngoài ra, cam cara có vị ngọt dịu đặc biệt cùng với vị chua nhẹ, 
hương thơm của chúng khiến người ăn liên tưởng đến hương bưởi. Những múi cam có khi có màu ruby hoặc màu cam đậm, trông rất đẹp mắt.'
WHERE productID ='53'

UPDATE tblProduct
SET DESCRIPTION='Loại trái cây giàu chất xơ, vitamin, khoáng chất thiết yếu giúp cung cấp chất dinh dưỡng cho cơ thể con người và mang lại nhiều lợi ích tuyệt vời cho hệ tiêu hóa, 
tim mạch, giúp mắt sáng, làm đẹp da. Xoài cát Hòa Lộc có vị ngọt thanh dễ chịu, thịt dày, ít xơ và có độ dẻo lý tưởng.'
WHERE productID ='54'

UPDATE tblProduct
SET DESCRIPTION='Bơ là loại trái cây chứa nhiều thành phần dinh dưỡng tốt cho cơ thể bao gồm vitamin, khoáng chất và chất chống oxy hóa. 
Bơ có phần cơm dày, dẻo thơm hấp dẫn phù hợp chế biến rất nhiều món ăn, thức uống thơm ngon, bên cạnh đó còn mang lại hiệu quả làm đẹp rất tốt.'
WHERE productID ='55'

UPDATE tblProduct
SET DESCRIPTION='Dưa hấu không hạt là loại trái cây với vị ngọt thanh mát và rất giàu các chất dinh dưỡng cần thiết cho cơ thể. 
Dưa hấu chứa hàm lượng nước rất cao khoảng 91% trong thành phần và đặc biệt là gần như không có các chất như protein, chất béo. Dưa hấu có tác dụng chống oxy hoá, hỗ trợ điều trị các vấn đề về đường tiêu hoá, các vấn đề về da, ngăn ngừa tiểu đường, ung thư và tăng cường chức năng của hệ miễn dịch. Ngoài ra, với ưu điểm không hạt, loại dưa hấu này khiến nhiều người thích thú vì không cần bỏ hạt khi thưởng thức lại dễ dàng chế biến thành nhiều món ăn.'
WHERE productID ='56'

UPDATE tblProduct
SET DESCRIPTION='Bưởi da xanh là một trong những đặc sản nổi tiếng của Việt Nam. Loại bưởi này không chỉ ngon, ngọt mà còn mang lại cho con người nhiều công dụng tốt cho sức khoẻ 
như cung cấp nguồn vitamin dồi dào. Bưởi da xanh thích hợp cho những ngày nắng nóng với nhiều cách chế biến khác nhau.'
WHERE productID ='57'

UPDATE tblProduct
SET DESCRIPTION='Là loại trái cây được rất nhiều người ưa thích vì màu sắc đẹp mắt và vị ngon ngọt, mang giá trị dinh dưỡng cao và nhiều công dụng tuyệt vời cho sức khỏe 
như ngừa ung thư, bổ mắt, chống viêm khớp và làm đẹp da… Với vị ngọt vừa phải, giúp người dùng giải khát trong ngày hè.'
WHERE productID ='58'

UPDATE tblProduct
SET DESCRIPTION='Theo y dược học cổ truyền, lê có tính mát, vị chua và thanh nhiệt, nhuận phế, tiêu đờm, giảm ho hiệu quả. Lê còn giàu các chất dễ tan, 
chống tiểu đường và giúp cắt cơn đói nhanh chóng nên thường được dùng làm salad để giảm cân. Lê còn có tanin nên giúp bảo vệ tim mạch hiệu quả. Trong 100g lê sẽ có 86,5g nước; 
0.1g chất béo; 0.2g protein; 11g carbohydrat,... cùng các chất khác.'
WHERE productID ='59'

UPDATE tblProduct
SET DESCRIPTION='Hay còn còn là hồng xiêm, là loại trái cây nhiệt đới có nguồn gốc từ Trung và Nam Mỹ. Sapoche tươi ngon, chất lượng, 
khi chín có mùi hương thơm lừng khó cưỡng, có thể gọt vỏ ăn trực tiếp hoặc làm thành sinh tố đều rất ngon và giàu chất dinh dưỡng'
WHERE productID ='60'


