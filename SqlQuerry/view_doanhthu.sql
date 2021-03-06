create view v_doanhthu
as
	select Month(tblHoaDonNhap.NgayNhap) Tháng,Year(tblHoaDonNhap.NgayNhap) Năm,sum(tblChiTietHDN.SoLuong*tblChiTietHDN.DonGia) Tổng_nhập,sum(tblChiTietHDX.SoLuong*tblChiTietHDX.DonGia) Tổng_xuất
	from ((((tblChiTietHDN inner join tblHoaDonNhap on tblChiTietHDN.MaHD=tblHoaDonNhap.MaHD) 
	inner join tblMatHang on tblMatHang.MaMatH=tblChiTietHDN.MaMatH)
	inner join tblChiTietHDX on tblChiTietHDX.MaMatH=tblMatHang.MaMatH)
	inner join tblHoaDonXuat on tblChiTietHDX.MaHD=tblHoaDonXuat.MaHD)
	where (Month(tblHoaDonNhap.NgayNhap)=Month(tblHoaDonXuat.NgayXuat)) 
	and (Year(tblHoaDonNhap.NgayNhap)=Year(tblHoaDonXuat.NgayXuat))
	group by tblHoaDonNhap.NgayNhap