CREATE DATABASE w3school_SQL
use w3school_SQL

--1.Hiển thị danh sách Customers sinh sống ở quốc gia France có mã vùng 44000 hoặc 67000, 
--sắp xếp danh sách tăng dần theo mã vùng

Select *
From Customers
Where Country = 'France' and (PostalCode = 44000 or PostalCode = 67000)
Order by PostalCode 

--2.Hiển thị thông tin gồm tên, thành phố của những Customers có tên liên lạc chứa từ khóa ‘Paul’
Select CustomerName,City
From Customers
Where CustomerName like '%La%'
--3.Hiển thị danh sách mã vùng của quốc gia USA, lưu ý kết quả là duy nhất cho mỗi mã vùng xác định, 
--không bị trùng lặp. Sắp xếp theo alphabet của mã vùng
Select Distinct(PostalCode)
From Customers
Where Country = 'USA'
Order by PostalCode
--4.Hiển thị danh sách các Products có đơn vị tính là ‘kg’, sắp xếp tăng dần theo giá của sản phẩm.
Select *
From Products
Where Unit like '%kg%' 
Order by Price 
--5.Cho biết danh sách Products có mức giá dưới 10$ 
--hoặc trên 150$ được cung ứng bởi các đơn vị sản xuất có SupplierID trong danh sách sau: 15, 18, 4, 3.
Select *
From Products
Where (Price < 10 or Price > 150) and SupplierID in (15,18,4,3)
--6 Cho biết danh sách sản phẩm có tên có ít nhất 3 ký tự, bắt đầu bằng ký tự ‘C’ và và không chứa từ khóa ‘Chais’.
Select *
From Products
Where len(ProductName) > 3 and ProductName like 'C%' and ProductName not like '%Chais%' 
--7 Thực hiện xóa bỏ các nhân viên chưa từng xuất hóa đơn nào

Delete From Employees Where EmployeeID not in (Select EmployeeID From Employees)

--8 Thống kê tổng tiền hàng đã chi theo từng khách hàng, thông tin hiển thị ra gồm có: 
--Mã số Khách hàng, Tổng tiền hàng đã mua
Select o.CustomerID, SUM(Price) as SumMoney
From Orders o inner join OrderDetails d on o.OrderID = d.OrderID inner join Products p on p.ProductID = d.ProductID
Group by o.CustomerID
--9.Lấy ra thông tin của tất cả sản phẩm bao gồm Mã sản phẩm, tên sản phẩm, tên danh mục sản phẩm, tên nhà cung cấp

SELECT p.ProductID, p.ProductName, s.SupplierName,  c.CategoryName
FROM Products p inner join Suppliers s on p.SupplierID=s.SupplierID inner join Categories c on c.CategoryID=p.CategoryID

--10 Lấy ra thông tin của tất cả sản phẩm thuộc danh mục sản phẩm 
--“Confections”, “Dairy Products”, “Condiments”. Thông tin lấy ra bao gồm 
--Mã sản phẩm, tên sản phẩm, tên danh mục sản phẩm, giá tiền

SELECT p.ProductID, p.ProductName, c.CategoryName, p.Price
FROM Products p inner join Categories c on c.CategoryID=p.CategoryID
WHERE c.CategoryName in ('Confections', 'Dairy Products', 'Condiments')
 