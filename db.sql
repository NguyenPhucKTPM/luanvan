-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 08, 2024 lúc 10:56 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `thu_vien`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binhluan`
--

CREATE TABLE `binhluan` (
  `id_BinhLuan` int(11) NOT NULL,
  `noiDung` longtext NOT NULL,
  `ngayTaoBinhLuan` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaBinhLuan` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_NguoiDung` int(11) NOT NULL,
  `id_Sach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `binhluan`
--

INSERT INTO `binhluan` (`id_BinhLuan`, `noiDung`, `ngayTaoBinhLuan`, `ngaySuaBinhLuan`, `id_NguoiDung`, `id_Sach`) VALUES
(1, '<p>S&aacute;ch rất hay m&igrave;nh đọc rất c&oacute; cảm hứng v&agrave; đầy những th&ocirc;ng tin bổ &iacute;ch về m&atilde;ng lập tr&igrave;nh bằng ng&ocirc;n ngữ C++</p>', '2024-09-18 14:27:05', '2024-09-18 14:27:05', 3, 15),
(2, '<p>S&aacute;ch n&agrave;y đọc rất bổ &iacute;ch mọi người n&ecirc;n đọc thử một lần để cảm nhận nha. Cảm ơn</p>', '2024-09-18 14:58:48', '2024-09-18 14:58:48', 2, 15),
(3, '<p>S&aacute;ch n&agrave;y đọc hay cực k&igrave; lu&ocirc;n rất l&agrave; cuốn đấy</p>', '2024-09-18 15:11:34', '2024-09-18 15:11:34', 3, 8),
(4, '<p>S&aacute;ch n&agrave;y đọc l&agrave; n&acirc;ng cao tư duy lắm n&egrave; rất hay v&agrave; bổ &iacute;ch m&igrave;nh rất th&iacute;ch</p>', '2024-09-18 15:43:16', '2024-09-18 15:43:16', 3, 12),
(5, '<p>hay lắm mấy n&iacute; ơi mượn lẹ đi nha th&ocirc;i tui mượn đ&oacute; nha</p>', '2024-09-18 15:50:25', '2024-09-18 15:50:25', 3, 9),
(6, '<p>s&aacute;ch rất hay v&agrave; &yacute; nghĩa&nbsp;</p>', '2024-10-08 10:45:36', '2024-10-08 10:45:36', 7, 38);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietgiosach`
--

CREATE TABLE `chitietgiosach` (
  `id_ChiTietGioSach` int(11) NOT NULL,
  `id_GioSach` int(11) NOT NULL,
  `id_Sach` int(11) NOT NULL,
  `soLuong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietgiosach`
--

INSERT INTO `chitietgiosach` (`id_ChiTietGioSach`, `id_GioSach`, `id_Sach`, `soLuong`) VALUES
(9, 9, 14, 3),
(60, 9, 12, 1),
(161, 13, 36, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietnganhhoc`
--

CREATE TABLE `chitietnganhhoc` (
  `id_NganhHoc` int(11) NOT NULL,
  `id_Sach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietnganhhoc`
--

INSERT INTO `chitietnganhhoc` (`id_NganhHoc`, `id_Sach`) VALUES
(1, 11),
(2, 8),
(2, 9),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),
(2, 29),
(2, 34),
(2, 35),
(2, 36),
(2, 37),
(5, 7),
(5, 15),
(5, 16),
(5, 17),
(5, 38),
(5, 39),
(5, 40),
(5, 41),
(5, 42),
(8, 6),
(9, 10),
(9, 19),
(10, 12),
(10, 13),
(10, 14),
(10, 21),
(10, 28),
(10, 32),
(10, 33),
(15, 18),
(15, 19),
(15, 20),
(15, 22),
(16, 14),
(16, 24),
(16, 25),
(17, 30),
(17, 31),
(18, 33),
(18, 34),
(18, 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietphieumuon`
--

CREATE TABLE `chitietphieumuon` (
  `id_PhieuMuon` int(11) NOT NULL,
  `id_Sach` int(11) NOT NULL,
  `soLuongSachMuon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietphieumuon`
--

INSERT INTO `chitietphieumuon` (`id_PhieuMuon`, `id_Sach`, `soLuongSachMuon`) VALUES
(32, 7, 1),
(32, 9, 2),
(32, 15, 2),
(33, 12, 1),
(34, 12, 1),
(35, 9, 1),
(36, 10, 1),
(37, 12, 1),
(37, 15, 1),
(38, 6, 1),
(38, 17, 1),
(39, 9, 1),
(39, 17, 2),
(40, 6, 1),
(40, 13, 1),
(41, 6, 1),
(42, 10, 1),
(43, 16, 1),
(43, 17, 1),
(44, 7, 1),
(44, 17, 1),
(45, 33, 1),
(45, 34, 1),
(45, 35, 1),
(46, 34, 1),
(46, 35, 1),
(47, 7, 2),
(48, 7, 1),
(49, 7, 1),
(49, 15, 1),
(49, 16, 1),
(50, 35, 1),
(51, 25, 1),
(52, 26, 3),
(53, 21, 1),
(54, 12, 1),
(55, 9, 1),
(56, 13, 1),
(57, 29, 1),
(58, 18, 1),
(59, 22, 1),
(60, 37, 1),
(61, 38, 1),
(62, 7, 1),
(62, 15, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiettheloai`
--

CREATE TABLE `chitiettheloai` (
  `id_TheLoai` int(11) NOT NULL,
  `id_Sach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiettheloai`
--

INSERT INTO `chitiettheloai` (`id_TheLoai`, `id_Sach`) VALUES
(5, 7),
(5, 13),
(5, 17),
(5, 18),
(5, 32),
(5, 36),
(5, 40),
(6, 6),
(6, 7),
(6, 10),
(6, 15),
(6, 17),
(6, 20),
(6, 22),
(6, 33),
(6, 42),
(12, 6),
(13, 8),
(13, 26),
(13, 27),
(14, 9),
(14, 11),
(14, 13),
(14, 14),
(14, 23),
(14, 24),
(14, 25),
(14, 26),
(14, 29),
(15, 8),
(15, 9),
(15, 11),
(15, 13),
(15, 26),
(15, 27),
(15, 29),
(15, 34),
(15, 36),
(15, 37),
(16, 23),
(16, 24),
(16, 25),
(16, 34),
(17, 9),
(18, 10),
(18, 12),
(18, 19),
(18, 38),
(19, 12),
(19, 21),
(19, 28),
(19, 31),
(19, 35),
(20, 12),
(20, 14),
(20, 20),
(20, 21),
(20, 22),
(20, 28),
(20, 32),
(20, 34),
(20, 35),
(20, 37),
(26, 18),
(26, 19),
(26, 20),
(26, 22),
(27, 14),
(27, 24),
(27, 25),
(27, 33),
(28, 30),
(28, 31),
(29, 7),
(29, 15),
(29, 16),
(29, 17),
(29, 30),
(29, 38),
(29, 39),
(29, 40),
(29, 41),
(29, 42),
(30, 33),
(30, 34),
(30, 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitietvipham`
--

CREATE TABLE `chitietvipham` (
  `id_ViPham` int(11) NOT NULL,
  `id_NguoiDung` int(11) NOT NULL,
  `id_PhieuTra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `chitietvipham`
--

INSERT INTO `chitietvipham` (`id_ViPham`, `id_NguoiDung`, `id_PhieuTra`) VALUES
(2, 4, 4),
(3, 4, 3),
(4, 4, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhgia`
--

CREATE TABLE `danhgia` (
  `id_DanhGia` int(11) NOT NULL,
  `soSao` int(11) NOT NULL,
  `ngayDanhGia` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaDanhGia` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_NguoiDung` int(11) NOT NULL,
  `id_Sach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `danhgia`
--

INSERT INTO `danhgia` (`id_DanhGia`, `soSao`, `ngayDanhGia`, `ngaySuaDanhGia`, `id_NguoiDung`, `id_Sach`) VALUES
(1, 5, '2024-09-18 12:51:23', '2024-09-18 15:50:30', 3, 9),
(2, 5, '2024-09-18 12:51:48', '2024-09-18 15:43:27', 3, 12),
(3, 5, '2024-09-18 12:56:26', '2024-09-18 13:12:26', 3, 8),
(4, 4, '2024-09-18 12:57:36', '2024-09-18 12:57:36', 1, 8),
(5, 3, '2024-09-18 12:58:16', '2024-09-18 12:58:16', 2, 8),
(6, 5, '2024-09-18 13:04:03', '2024-09-18 13:04:03', 3, 6),
(7, 3, '2024-09-18 13:04:41', '2024-09-18 13:04:41', 2, 6),
(8, 5, '2024-09-18 13:12:47', '2024-09-18 13:14:45', 3, 13),
(9, 5, '2024-09-18 13:13:03', '2024-09-18 13:14:40', 2, 13),
(10, 5, '2024-09-18 13:19:00', '2024-09-18 13:19:00', 3, 14),
(11, 5, '2024-09-18 13:19:33', '2024-09-18 13:19:33', 3, 7),
(12, 5, '2024-09-18 13:24:38', '2024-09-18 13:24:38', 2, 9),
(13, 4, '2024-09-18 15:22:49', '2024-09-18 15:22:49', 3, 15),
(15, 5, '2024-09-18 15:40:03', '2024-09-18 15:40:03', 2, 15),
(16, 5, '2024-09-18 15:50:42', '2024-09-18 15:50:42', 3, 17),
(17, 4, '2024-09-18 18:30:19', '2024-09-18 18:30:19', 3, 10),
(18, 4, '2024-09-20 16:49:16', '2024-09-20 16:49:16', 3, 19),
(19, 5, '2024-09-20 16:53:37', '2024-09-20 16:53:37', 3, 20),
(20, 4, '2024-09-20 16:58:10', '2024-09-20 16:58:18', 3, 23),
(21, 5, '2024-09-21 10:14:31', '2024-09-21 10:14:31', 6, 24),
(22, 3, '2024-09-21 10:27:46', '2024-09-21 10:27:46', 6, 28),
(23, 5, '2024-09-21 10:54:38', '2024-09-21 10:54:38', 6, 33),
(24, 5, '2024-09-26 14:45:17', '2024-09-26 14:45:17', 1, 22),
(25, 5, '2024-09-26 14:45:25', '2024-09-26 14:45:25', 1, 26),
(26, 5, '2024-09-26 14:45:31', '2024-09-26 14:45:31', 1, 27),
(27, 5, '2024-09-30 10:30:14', '2024-09-30 10:30:14', 10, 37),
(28, 5, '2024-09-30 10:30:28', '2024-09-30 10:30:28', 10, 36),
(29, 5, '2024-10-02 14:04:22', '2024-10-02 14:04:22', 7, 39),
(30, 5, '2024-10-07 13:35:09', '2024-10-07 13:35:09', 6, 11),
(31, 5, '2024-10-08 10:45:43', '2024-10-08 10:45:43', 7, 38);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giangvien`
--

CREATE TABLE `giangvien` (
  `id_GiangVien` int(11) NOT NULL,
  `maGiangVien` varchar(1000) NOT NULL,
  `id_Khoa` int(11) NOT NULL DEFAULT 1,
  `id_NguoiDung` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `giangvien`
--

INSERT INTO `giangvien` (`id_GiangVien`, `maGiangVien`, `id_Khoa`, `id_NguoiDung`) VALUES
(2, 'GV9672352', 2, 3),
(4, 'GV3306475', 1, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `giosach`
--

CREATE TABLE `giosach` (
  `id_GioSach` int(11) NOT NULL,
  `id_NguoiDung` int(11) NOT NULL,
  `ngayTaoGioSach` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `giosach`
--

INSERT INTO `giosach` (`id_GioSach`, `id_NguoiDung`, `ngayTaoGioSach`) VALUES
(4, 2, '2024-09-09 14:01:51'),
(9, 1, '2024-09-09 19:33:42'),
(10, 3, '2024-09-11 11:17:25'),
(11, 4, '2024-09-18 19:59:19'),
(12, 5, '2024-09-20 10:46:06'),
(13, 6, '2024-09-22 12:35:41'),
(14, 7, '2024-09-22 15:21:05'),
(15, 8, '2024-09-22 16:26:15'),
(16, 10, '2024-09-23 20:36:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hinhanh`
--

CREATE TABLE `hinhanh` (
  `id_HinhAnh` int(11) NOT NULL,
  `tenHinhAnh` varchar(1000) NOT NULL,
  `duongDan` varchar(1000) NOT NULL,
  `id_Sach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `hinhanh`
--

INSERT INTO `hinhanh` (`id_HinhAnh`, `tenHinhAnh`, `duongDan`, `id_Sach`) VALUES
(3, 'luanvan/x8trjr1mp5hl3gm4jlq2', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1724750740/luanvan/x8trjr1mp5hl3gm4jlq2.jpg', 6),
(4, 'luanvan/jdsihdp5aegokuge2zgp', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1724918896/luanvan/jdsihdp5aegokuge2zgp.jpg', 7),
(5, 'luanvan/p1d06lw7qvjglrunonhi', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1724920379/luanvan/p1d06lw7qvjglrunonhi.jpg', 8),
(6, 'luanvan/e2kbybvfn9jtm01rxzju', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1724921322/luanvan/e2kbybvfn9jtm01rxzju.jpg', 9),
(7, 'luanvan/ahbzbuxhtmiwplyjuiiv', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1724921768/luanvan/ahbzbuxhtmiwplyjuiiv.jpg', 10),
(8, 'luanvan/vwnoyuuwtnr7to1cv029', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1724928854/luanvan/vwnoyuuwtnr7to1cv029.jpg', 11),
(9, 'luanvan/kiv9rdp6jlurhejig62j', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1724929576/luanvan/kiv9rdp6jlurhejig62j.jpg', 12),
(10, 'luanvan/nalayxoiazk9weobuxz0', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1724929856/luanvan/nalayxoiazk9weobuxz0.jpg', 13),
(11, 'luanvan/yptv1ggr0zxv4vuorfxh', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1725773959/luanvan/yptv1ggr0zxv4vuorfxh.jpg', 14),
(12, 'luanvan/ioqqbp3w77kuz8fntpis', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1725775147/luanvan/ioqqbp3w77kuz8fntpis.jpg', 15),
(13, 'luanvan/dx7p9d6pkeanfou60mij', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1725775633/luanvan/dx7p9d6pkeanfou60mij.jpg', 16),
(14, 'luanvan/vl4asvx9zqplhajxovjz', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1725775899/luanvan/vl4asvx9zqplhajxovjz.jpg', 17),
(15, 'luanvan/ulycp4nwzoayl1flnaah', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726806372/luanvan/ulycp4nwzoayl1flnaah.jpg', 18),
(16, 'luanvan/zcxhzkja8ptnh774mdbt', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726824521/luanvan/zcxhzkja8ptnh774mdbt.jpg', 19),
(17, 'luanvan/b8xarz3mmehitu5qannx', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726824916/luanvan/b8xarz3mmehitu5qannx.jpg', 20),
(18, 'luanvan/yksc7vonfg4k4wzu42tl', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726825787/luanvan/yksc7vonfg4k4wzu42tl.jpg', 21),
(19, 'luanvan/nuhxk8cfxl6pt35zw2nk', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726826006/luanvan/nuhxk8cfxl6pt35zw2nk.jpg', 22),
(20, 'luanvan/of99jc4tjzljtrxh2ud2', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726826252/luanvan/of99jc4tjzljtrxh2ud2.jpg', 23),
(21, 'luanvan/chsgjgzudebtyzsqayzk', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726888429/luanvan/chsgjgzudebtyzsqayzk.jpg', 24),
(22, 'luanvan/wkb9p8uuelbxd43qa5lf', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726888706/luanvan/wkb9p8uuelbxd43qa5lf.jpg', 25),
(23, 'luanvan/xmeif9ruifihskwjo52d', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726888947/luanvan/xmeif9ruifihskwjo52d.jpg', 26),
(24, 'luanvan/julhmisgynux8948i58a', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726889078/luanvan/julhmisgynux8948i58a.jpg', 27),
(25, 'luanvan/je71qmjfj7efsafiomod', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726889239/luanvan/je71qmjfj7efsafiomod.jpg', 28),
(26, 'luanvan/rt0yc1aip7lvpufiphds', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726889611/luanvan/rt0yc1aip7lvpufiphds.jpg', 29),
(27, 'luanvan/xhabz8uhjaatnbtkq1gq', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726889809/luanvan/xhabz8uhjaatnbtkq1gq.jpg', 30),
(28, 'luanvan/qcpydyvrcbxljakqvk6l', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726890127/luanvan/qcpydyvrcbxljakqvk6l.jpg', 31),
(29, 'luanvan/tmyh5mczdbzy5yoq4ud0', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726890325/luanvan/tmyh5mczdbzy5yoq4ud0.jpg', 32),
(30, 'luanvan/bl02twqvfxjsslrus8j1', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726890844/luanvan/bl02twqvfxjsslrus8j1.jpg', 33),
(31, 'luanvan/oyewrd6fjfe8hum2rslb', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726891018/luanvan/oyewrd6fjfe8hum2rslb.jpg', 34),
(32, 'luanvan/b3dnqjqf8rjbmylobiic', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1726891226/luanvan/b3dnqjqf8rjbmylobiic.jpg', 35),
(33, 'luanvan/j4hgbsizhabbzb2s57u5', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1727665185/luanvan/j4hgbsizhabbzb2s57u5.jpg', 36),
(34, 'luanvan/mrwxld6wbqtve8kwxmdb', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1727666675/luanvan/mrwxld6wbqtve8kwxmdb.jpg', 37),
(35, 'luanvan/bz8oauec9dzsfsaoxjjh', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1727850881/luanvan/bz8oauec9dzsfsaoxjjh.jpg', 38),
(36, 'luanvan/bs8ixc3vyfqslinwh8jq', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1727851295/luanvan/bs8ixc3vyfqslinwh8jq.jpg', 39),
(37, 'luanvan/gixcorzlq0szt0okcv4o', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1727851502/luanvan/gixcorzlq0szt0okcv4o.jpg', 40),
(38, 'luanvan/x2fxdyyjcg53ise3aime', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1727852882/luanvan/x2fxdyyjcg53ise3aime.jpg', 41),
(39, 'luanvan/zzjmflfbruraexms2til', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1727853158/luanvan/zzjmflfbruraexms2til.jpg', 42);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoa`
--

CREATE TABLE `khoa` (
  `id_Khoa` int(11) NOT NULL,
  `maKhoa` varchar(1000) NOT NULL,
  `tenKhoa` varchar(1000) NOT NULL,
  `ngayTaoKhoa` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaKhoa` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `khoa`
--

INSERT INTO `khoa` (`id_Khoa`, `maKhoa`, `tenKhoa`, `ngayTaoKhoa`, `ngaySuaKhoa`) VALUES
(1, 'KCC001', 'Chưa có', '2024-08-04 20:54:17', '2024-08-04 20:54:17'),
(2, 'MK8528CNTT', 'CNTT', '2024-08-04 21:11:16', '2024-08-04 21:11:33'),
(5, 'MK9668CNSH', 'CNSH', '2024-08-06 16:26:11', '2024-08-06 16:26:11'),
(6, 'MK6518QLCN', 'QLCN', '2024-08-06 16:26:25', '2024-08-16 12:07:21'),
(7, 'MK9525KTCK', 'KTCK', '2024-08-06 16:26:38', '2024-08-06 16:26:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khoahoc`
--

CREATE TABLE `khoahoc` (
  `id_KhoaHoc` int(11) NOT NULL,
  `maKhoaHoc` varchar(1000) NOT NULL,
  `tenKhoaHoc` varchar(1000) NOT NULL,
  `ngayTaoKhoaHoc` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaKhoaHoc` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `khoahoc`
--

INSERT INTO `khoahoc` (`id_KhoaHoc`, `maKhoaHoc`, `tenKhoaHoc`, `ngayTaoKhoaHoc`, `ngaySuaKhoaHoc`) VALUES
(1, 'KHCC001', 'Chưa có', '2024-08-04 20:54:39', '2024-08-04 20:54:39'),
(2, 'MKH79102016', '2016', '2024-08-04 21:10:58', '2024-08-04 21:11:53'),
(3, 'MKH56072017', '2017', '2024-08-06 16:28:14', '2024-08-06 16:28:14'),
(4, 'MKH59132018', '2018', '2024-08-06 16:28:18', '2024-08-06 16:28:18'),
(5, 'MKH16412019', '2019', '2024-08-06 16:28:23', '2024-08-06 16:28:23'),
(6, 'MKH61162020', '2020', '2024-08-06 16:28:28', '2024-08-06 16:28:28'),
(7, 'MKH76602021', '2021', '2024-08-06 16:28:32', '2024-08-06 16:28:32'),
(8, 'MKH54832022', '2022', '2024-08-06 16:28:36', '2024-08-06 16:28:36'),
(9, 'MKH30242023', '2023', '2024-08-06 16:28:40', '2024-08-06 16:28:40'),
(10, 'MKH14692024', '2024', '2024-08-06 16:28:46', '2024-08-06 16:28:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

CREATE TABLE `lop` (
  `id_Lop` int(11) NOT NULL,
  `maLop` varchar(1000) NOT NULL,
  `tenLop` varchar(1000) NOT NULL,
  `ngayTaoLop` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaLop` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `lop`
--

INSERT INTO `lop` (`id_Lop`, `maLop`, `tenLop`, `ngayTaoLop`, `ngaySuaLop`) VALUES
(1, 'LCC001', 'Chưa có', '2024-08-04 20:55:00', '2024-08-04 20:55:00'),
(5, 'MLH7983KTPM0120', 'KTPM0120', '2024-08-06 16:30:02', '2024-08-06 16:30:02'),
(6, 'MLH2715KTPM0220', 'KTPM0220', '2024-08-06 16:30:20', '2024-08-06 16:30:20'),
(7, 'MLH4155CNTT0120', 'CNTT0120', '2024-08-06 16:30:30', '2024-08-06 16:30:30'),
(8, 'MLH8429CNTT0220', 'CNTT0220', '2024-08-06 16:30:37', '2024-08-16 12:05:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ngan`
--

CREATE TABLE `ngan` (
  `id_Ngan` int(11) NOT NULL,
  `maNgan` varchar(1000) NOT NULL,
  `tenNgan` varchar(1000) NOT NULL,
  `soViTri` int(11) NOT NULL DEFAULT 0,
  `ngayTaoNgan` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaNgan` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `ngan`
--

INSERT INTO `ngan` (`id_Ngan`, `maNgan`, `tenNgan`, `soViTri`, `ngayTaoNgan`, `ngaySuaNgan`) VALUES
(1, 'MN87007521', 'Ngăn A', 6, '2024-08-18 11:04:58', '2024-08-20 11:14:34'),
(2, 'MN51763237', 'Ngăn B', 3, '2024-08-18 11:05:14', '2024-08-19 14:37:42'),
(3, 'MN26083479', 'Ngăn C', 5, '2024-08-18 11:05:31', '2024-08-20 11:14:34'),
(4, 'MN52762985', 'Ngăn D', 2, '2024-08-18 11:11:00', '2024-09-27 13:36:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nganhhoc`
--

CREATE TABLE `nganhhoc` (
  `id_NganhHoc` int(11) NOT NULL,
  `maNganhHoc` varchar(1000) NOT NULL,
  `tenNganhHoc` varchar(1000) NOT NULL,
  `ngayTaoNganhHoc` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaNganhHoc` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nganhhoc`
--

INSERT INTO `nganhhoc` (`id_NganhHoc`, `maNganhHoc`, `tenNganhHoc`, `ngayTaoNganhHoc`, `ngaySuaNganhHoc`) VALUES
(1, 'MNH65504924', 'Toán', '2024-08-17 09:57:46', '2024-08-17 10:46:23'),
(2, 'MNH54234284', 'Văn Học', '2024-08-17 09:58:30', '2024-08-29 15:43:47'),
(3, 'MNH34738968', 'Luật', '2024-08-17 09:58:35', '2024-08-17 09:58:35'),
(5, 'MNH74865156', 'Công Nghệ Thông Tin', '2024-08-25 12:23:46', '2024-08-25 12:23:46'),
(6, 'MNH55164909', 'Kinh Tế', '2024-08-27 14:56:54', '2024-08-27 14:56:54'),
(8, 'MNH70308144', 'Thể Thao - Võ Thuật', '2024-08-27 16:25:38', '2024-08-27 16:25:38'),
(9, 'MNH26877524', 'Địa Lý', '2024-08-29 15:56:07', '2024-08-29 15:56:07'),
(10, 'MNH45225287', 'Tâm Lý Học', '2024-08-29 18:06:15', '2024-08-29 18:06:15'),
(15, 'MNH86478784', 'Nông Nghiệp', '2024-09-20 11:22:40', '2024-09-20 11:22:40'),
(16, 'MNH76668780', 'Lịch Sử', '2024-09-21 10:18:22', '2024-09-21 10:18:22'),
(17, 'MNH27840436', 'Y Học', '2024-09-21 10:36:46', '2024-09-21 10:36:46'),
(18, 'MNH96426131', 'Triết Học', '2024-09-21 10:51:13', '2024-09-21 10:51:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ngonngu`
--

CREATE TABLE `ngonngu` (
  `id_NgonNgu` int(11) NOT NULL,
  `maNgonNgu` varchar(1000) NOT NULL,
  `tenNgonNgu` varchar(1000) NOT NULL,
  `ngayTaoNgonNgu` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaNgonNgu` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `ngonngu`
--

INSERT INTO `ngonngu` (`id_NgonNgu`, `maNgonNgu`, `tenNgonNgu`, `ngayTaoNgonNgu`, `ngaySuaNgonNgu`) VALUES
(1, 'MNN5228', 'Việt Nam', '2024-08-16 11:42:48', '2024-08-17 09:58:18'),
(2, 'MNN59791722', 'English', '2024-08-16 11:45:26', '2024-08-16 11:45:26'),
(3, 'MNN41478588', 'Russian', '2024-08-16 11:45:49', '2024-08-16 11:45:49'),
(4, 'MNN36830000', 'French', '2024-08-16 11:46:20', '2024-08-16 11:46:20'),
(5, 'MNN82636093', 'German', '2024-08-16 11:46:35', '2024-08-16 11:46:35'),
(6, 'MNN49581500', 'Italian', '2024-08-16 11:51:25', '2024-08-16 11:57:12'),
(16, 'MNN89568503', 'Test', '2024-09-01 14:22:04', '2024-09-01 14:22:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id_NguoiDung` int(11) NOT NULL,
  `tenNguoiDung` varchar(1000) NOT NULL,
  `ngaySinh` date NOT NULL,
  `gioiTinh` varchar(100) NOT NULL,
  `diaChi` varchar(1000) NOT NULL,
  `SDT` int(10) NOT NULL,
  `email` varchar(1000) NOT NULL,
  `password` varchar(1000) NOT NULL,
  `soViPham` int(11) NOT NULL DEFAULT 0,
  `soLanMuonSach` int(11) NOT NULL DEFAULT 0,
  `trangThaiMuonSach` int(11) NOT NULL DEFAULT 0,
  `ngayTaoNguoiDung` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaNguoiDung` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_TrangThai` int(11) NOT NULL DEFAULT 1,
  `id_VaiTro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nguoidung`
--

INSERT INTO `nguoidung` (`id_NguoiDung`, `tenNguoiDung`, `ngaySinh`, `gioiTinh`, `diaChi`, `SDT`, `email`, `password`, `soViPham`, `soLanMuonSach`, `trangThaiMuonSach`, `ngayTaoNguoiDung`, `ngaySuaNguoiDung`, `id_TrangThai`, `id_VaiTro`) VALUES
(1, 'phuc2', '2002-02-24', 'Nam', 'LT', 852348684, 'nguyennhamphuc2402@gmail.com', '$2y$12$.9yfk2zdY332wztYxKTc6uBMh/Q9Bac9dQ.bPbwrjG5DWemnPkKB2', 0, 0, 0, '2024-08-04 20:58:13', '2024-08-20 12:17:03', 2, 1),
(2, 'Phúc Nguyễn', '2002-02-24', 'Nam', 'Long Thạnh', 852348888, 'phucmap4444@gmail.com', '$2y$12$39wfmjG4wc/SuO4vigGJduDfqviCiOK56YJ9TOWV5wo8BiNO.DTSO', 0, 1, 0, '2024-08-06 13:58:45', '2024-09-20 10:40:41', 2, 4),
(3, 'Nguyễn Phúc', '1990-08-15', 'Nam', 'ABC', 852348822, 'nnphuc2000378@student.ctuet.edu.vn', '$2y$12$y3dZQh...y2b7trptugxBehe8WTPA9T.wuyCjrj0niPJGb/et23fi', 0, 2, 1, '2024-08-06 16:04:48', '2024-10-02 13:37:48', 2, 2),
(4, 'Tôi Lầm Lỗi', '2024-09-04', 'Nữ', 'Q.Ninh Kiều, TP.Cần Thơ', 212111111, 'accloinhieu@gmail.com', '$2y$12$VHidf9ELYIY4y.C4jrZjJ.QQkI/arMgzWjdGUEA4V6iyRTtOWvV5G', 3, 2, 0, '2024-09-18 19:57:53', '2024-09-20 10:40:33', 2, 4),
(5, 'Nguyễn Văn A', '2002-07-15', 'Nam', 'Thành Phố Cần Thơ', 939123123, 'accmuontuxa@gmail.com', '$2y$12$2oFaMLfmPtM7V7bI1qykpuwfb3VnBD8RwVdDa7nUk5fM//boqeExW', 0, 2, 0, '2024-09-20 10:42:46', '2024-09-23 20:44:16', 2, 4),
(6, 'Lê Triệu Vy', '1990-03-20', 'Nữ', 'Thành Phố Cần Thơ', 939629340, 'accthuthu@gmail.com', '$2y$12$ldqFVwGCas32UKHQTXxhfeehOgW0C4XXC0gjr2d4dSa9RfHKHmgyG', 0, 6, 1, '2024-09-21 09:55:59', '2024-09-30 10:37:35', 2, 2),
(7, 'Huỳnh Anh Tuấn', '2002-09-17', 'Nam', 'Vĩnh Long', 939463679, 'accthichtinhoc@gmail.com', '$2y$12$PERr9J6HQoVdu3xKnlZBIO3exPGBI4hF6MSf6c2gOhvq0X8klDSVG', 0, 2, 0, '2024-09-22 12:19:57', '2024-10-08 12:45:26', 2, 4),
(8, 'Phan Văn Nam', '2000-09-07', 'Nam', 'Ô Môn', 939644932, 'accthichtriethoc@gmail.com', '$2y$12$dHtGLtA7jcvVNFl8B46uEObCQmAo898S4ezfgI2Jp8KDSnCiHjfUS', 0, 1, 1, '2024-09-22 16:25:18', '2024-09-30 09:57:12', 2, 4),
(9, 'Nguyễn Hoàng Tuấn', '1997-04-09', 'Nam', 'Thành Phố Cần Thơ', 939888122, 'thichnongnghiep@gmail.com', '$2y$12$BDTltFuWDIrW4tGidlnkx.kd5RxWMUkQQiN7mp8kTpubCfJs/.5YC', 0, 0, 0, '2024-09-23 18:20:56', '2024-09-24 13:56:44', 2, 4),
(10, 'Đỗ Nguyễn Quốc', '2001-02-06', 'Nam', 'Kiên Giang', 939881188, 'thieunhi@gmail.com', '$2y$12$uxz1hQbFPfeEqq.X21Ibeuz9Qchv9udkWuZ.7klLtFmw0S7z5Wn.a', 0, 4, 0, '2024-09-23 20:26:25', '2024-09-30 10:14:37', 2, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhatkyhoatdong`
--

CREATE TABLE `nhatkyhoatdong` (
  `id_HoatDong` int(11) NOT NULL,
  `tenHoatDong` varchar(1000) NOT NULL,
  `chiTietHoatDong` varchar(1000) DEFAULT NULL,
  `ngayTaoHoatDong` datetime NOT NULL DEFAULT current_timestamp(),
  `id_ThuThu` int(11) NOT NULL,
  `id_Sach` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhatkyhoatdong`
--

INSERT INTO `nhatkyhoatdong` (`id_HoatDong`, `tenHoatDong`, `chiTietHoatDong`, `ngayTaoHoatDong`, `id_ThuThu`, `id_Sach`) VALUES
(3, 'Thêm sách', NULL, '2024-08-27 16:25:40', 1, 6),
(4, 'Thêm sách', NULL, '2024-08-29 15:08:17', 1, 7),
(5, 'Thêm sách', NULL, '2024-08-29 15:33:00', 1, 8),
(6, 'Thêm sách', NULL, '2024-08-29 15:48:43', 1, 9),
(7, 'Thêm sách', NULL, '2024-08-29 15:56:09', 1, 10),
(8, 'Thêm sách', NULL, '2024-08-29 17:54:14', 1, 11),
(9, 'Thêm sách', NULL, '2024-08-29 18:06:17', 1, 12),
(10, 'Thêm sách', NULL, '2024-08-29 18:10:56', 1, 13),
(27, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 13 vào sách', '2024-09-07 20:02:19', 1, 8),
(28, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 15 vào sách', '2024-09-07 20:02:19', 1, 8),
(29, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-09-07 20:02:19', 1, 8),
(30, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 13 vào sách', '2024-09-07 20:14:23', 1, 8),
(31, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 15 vào sách', '2024-09-07 20:14:23', 1, 8),
(32, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 1 khỏi sách', '2024-09-07 20:14:23', 1, 8),
(33, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-09-07 20:14:23', 1, 8),
(34, 'Thêm sách', NULL, '2024-09-08 12:39:19', 1, 14),
(35, 'Thêm sách', NULL, '2024-09-08 12:59:07', 1, 15),
(36, 'Thêm sách', NULL, '2024-09-08 13:07:13', 1, 16),
(37, 'Thêm sách', NULL, '2024-09-08 13:11:39', 1, 17),
(38, 'Thêm sách', NULL, '2024-09-20 11:26:13', 1, 18),
(39, 'Thêm sách', NULL, '2024-09-20 16:28:41', 1, 19),
(40, 'Thêm sách', NULL, '2024-09-20 16:35:16', 1, 20),
(41, 'Thêm sách', NULL, '2024-09-20 16:49:47', 1, 21),
(42, 'Thêm sách', NULL, '2024-09-20 16:53:25', 1, 22),
(43, 'Thêm sách', NULL, '2024-09-20 16:57:32', 1, 23),
(44, 'Thêm sách', NULL, '2024-09-21 10:13:48', 2, 24),
(45, 'Thêm sách', NULL, '2024-09-21 10:18:25', 2, 25),
(46, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 27 vào sách', '2024-09-21 10:18:47', 2, 14),
(47, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 14 vào sách', '2024-09-21 10:18:47', 2, 14),
(48, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 20 vào sách', '2024-09-21 10:18:47', 2, 14),
(49, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 27 vào sách', '2024-09-21 10:18:47', 2, 14),
(50, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-09-21 10:18:47', 2, 14),
(51, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 10 khỏi sách', '2024-09-21 10:18:47', 2, 14),
(52, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 27 vào sách', '2024-09-21 10:19:25', 2, 24),
(53, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 14 vào sách', '2024-09-21 10:19:25', 2, 24),
(54, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 16 vào sách', '2024-09-21 10:19:25', 2, 24),
(55, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 27 vào sách', '2024-09-21 10:19:25', 2, 24),
(56, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-09-21 10:19:25', 2, 24),
(57, 'Thêm sách', NULL, '2024-09-21 10:22:26', 2, 26),
(58, 'Thêm sách', NULL, '2024-09-21 10:24:37', 2, 27),
(59, 'Thêm sách', NULL, '2024-09-21 10:27:18', 2, 28),
(60, 'Thêm sách', NULL, '2024-09-21 10:33:29', 2, 29),
(61, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 14 vào sách', '2024-09-21 10:34:15', 2, 29),
(62, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 15 vào sách', '2024-09-21 10:34:15', 2, 29),
(63, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-09-21 10:34:15', 2, 29),
(64, 'Cập nhật sách', 'Cập nhật số trang, Thay đổi soTrang từ \'261\' sang \'112\'', '2024-09-21 10:34:15', 2, 29),
(65, 'Thêm sách', NULL, '2024-09-21 10:36:48', 2, 30),
(66, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 29 vào sách', '2024-09-21 10:38:46', 2, 30),
(67, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 28 vào sách', '2024-09-21 10:38:46', 2, 30),
(68, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 29 vào sách', '2024-09-21 10:38:46', 2, 30),
(69, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 17 khỏi sách', '2024-09-21 10:38:46', 2, 30),
(70, 'Thêm sách', NULL, '2024-09-21 10:42:06', 2, 31),
(71, 'Thêm sách', NULL, '2024-09-21 10:45:23', 2, 32),
(72, 'Thêm sách', NULL, '2024-09-21 10:54:02', 2, 33),
(73, 'Thêm sách', NULL, '2024-09-21 10:56:57', 2, 34),
(74, 'Thêm sách', NULL, '2024-09-21 11:00:24', 2, 35),
(75, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 29 vào sách', '2024-09-22 16:36:57', 2, 16),
(76, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 6 vào sách', '2024-09-22 16:36:57', 2, 16),
(77, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 29 vào sách', '2024-09-22 16:36:57', 2, 16),
(78, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 5 khỏi sách', '2024-09-22 16:36:57', 2, 16),
(79, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 29 vào sách', '2024-09-22 16:37:20', 2, 17),
(80, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 6 vào sách', '2024-09-22 16:37:20', 2, 17),
(81, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 29 vào sách', '2024-09-22 16:37:20', 2, 17),
(82, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 29 vào sách', '2024-09-22 16:37:54', 2, 7),
(83, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 6 vào sách', '2024-09-22 16:37:54', 2, 7),
(84, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 29 vào sách', '2024-09-22 16:37:54', 2, 7),
(85, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 29 vào sách', '2024-09-22 16:38:08', 2, 15),
(86, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 6 vào sách', '2024-09-22 16:38:08', 2, 15),
(87, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 29 vào sách', '2024-09-22 16:38:08', 2, 15),
(88, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 5 khỏi sách', '2024-09-22 16:38:08', 2, 15),
(89, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 18 vào sách', '2024-09-22 19:25:03', 2, 12),
(90, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 19 vào sách', '2024-09-22 19:25:03', 2, 12),
(91, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 20 vào sách', '2024-09-22 19:25:03', 2, 12),
(92, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-09-22 19:25:03', 2, 12),
(93, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 10 khỏi sách', '2024-09-22 19:25:03', 2, 12),
(94, 'Cập nhật sách', 'Cập nhật tên sách, Thay đổi tenSach từ \'ĐÁNH THỨC CON NGƯỜI PHI THƯỜNG TRONG BẠN\' sang \'CON NGƯỜI PHI THƯỜNG TRONG BẠN\'', '2024-09-22 19:25:03', 2, 12),
(95, 'Thêm sách', NULL, '2024-09-30 09:59:43', 2, 36),
(96, 'Thêm sách', NULL, '2024-09-30 10:24:33', 2, 37),
(97, 'Xóa thể loại của sách', 'Xóa thể loại có ID: 5 khỏi sách', '2024-09-30 10:33:44', 2, 37),
(98, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 15 vào sách', '2024-09-30 10:33:44', 2, 37),
(99, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 20 vào sách', '2024-09-30 10:33:44', 2, 37),
(100, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-09-30 10:33:44', 2, 37),
(101, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 14 vào sách', '2024-10-01 13:46:52', 2, 11),
(102, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 15 vào sách', '2024-10-01 13:46:52', 2, 11),
(103, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 14 vào sách', '2024-10-01 13:46:52', 2, 11),
(104, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 15 vào sách', '2024-10-01 13:46:52', 2, 11),
(105, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 1 khỏi sách', '2024-10-01 13:46:52', 2, 11),
(106, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-10-01 13:46:52', 2, 11),
(107, 'Thêm sách', NULL, '2024-10-02 13:34:40', 1, 38),
(108, 'Xóa thể loại của sách', 'Xóa thể loại có ID: 6 khỏi sách', '2024-10-02 13:35:45', 1, 16),
(109, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 29 vào sách', '2024-10-02 13:35:45', 1, 16),
(110, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 5 khỏi sách', '2024-10-02 13:35:45', 1, 16),
(111, 'Thêm sách', NULL, '2024-10-02 13:41:34', 1, 39),
(112, 'Thêm sách', NULL, '2024-10-02 13:45:01', 1, 40),
(113, 'Thêm sách', NULL, '2024-10-02 14:08:01', 1, 41),
(114, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 29 vào sách', '2024-10-02 14:08:38', 1, 41),
(115, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 5 khỏi sách', '2024-10-02 14:08:38', 1, 41),
(116, 'Cập nhật sách', 'Cập nhật số lượng có sẵn, Thay đổi soLuongHienCo từ \'1\' sang \'10\', Thay đổi soLuongCoSan từ \'1\' sang \'10\'', '2024-10-02 14:08:38', 1, 41),
(117, 'Thêm sách', NULL, '2024-10-02 14:12:37', 1, 42);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhaxuatban`
--

CREATE TABLE `nhaxuatban` (
  `id_NhaXuatBan` int(11) NOT NULL,
  `maNhaXuatBan` varchar(1000) NOT NULL,
  `tenNhaXuatBan` varchar(1000) NOT NULL,
  `diaChiNhaXuatBan` varchar(1000) NOT NULL,
  `ngayTaoNhaXuatBan` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaNhaXuatBan` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `nhaxuatban`
--

INSERT INTO `nhaxuatban` (`id_NhaXuatBan`, `maNhaXuatBan`, `tenNhaXuatBan`, `diaChiNhaXuatBan`, `ngayTaoNhaXuatBan`, `ngaySuaNhaXuatBan`) VALUES
(1, 'NXB63056384', 'Nhà xuất bản Kim Đồng', '55 Quang Trung, Hai Bà Trưng, Hà Nội', '2024-08-13 11:58:46', '2024-08-13 11:58:46'),
(2, 'NXB77234333', 'Nhà xuất bản giáo dục Việt Nam', 'Hà Nội', '2024-08-13 12:00:14', '2024-08-16 12:12:53'),
(5, 'NXB30797645', 'Đại Học Sư Phạm TP Hồ Chí Minh', 'Thành Phố Hồ Chí Minh', '2024-08-25 12:22:41', '2024-08-25 12:22:41'),
(12, 'NXB56730260', 'Tổng hợp', 'Chưa có', '2024-08-27 16:25:38', '2024-08-27 16:25:38'),
(13, 'NXB97018552', 'Trẻ', 'Chưa có', '2024-08-29 15:32:57', '2024-08-29 15:32:57'),
(16, 'NXB54823276', 'Nhà xuất bản Văn Học', 'Chưa có', '2024-09-08 12:39:17', '2024-09-08 12:39:17'),
(17, 'NXB47725326', 'Nhà xuất bản Bách Khoa Hà Nội', 'Chưa có', '2024-09-08 12:59:05', '2024-09-08 12:59:05'),
(18, 'NXB79471380', 'Nhà xuất bản Chính Trị Quốc Gia', 'Chưa có', '2024-09-20 16:32:27', '2024-09-20 16:32:27'),
(19, 'NXB59910031', 'Nhà Xuất Bản Phụ Nữ', 'Chưa có', '2024-09-21 11:00:22', '2024-09-21 11:00:22'),
(20, 'NXB97800492', 'Nhà xuất bản Lao Động', 'Chưa có', '2024-10-02 13:34:37', '2024-10-02 13:34:37'),
(21, 'NXB13119684', 'Nhà xuất bản Giao Thông Vận Tải', 'Chưa có', '2024-10-02 13:41:32', '2024-10-02 13:41:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieumuon`
--

CREATE TABLE `phieumuon` (
  `id_PhieuMuon` int(11) NOT NULL,
  `maPhieuMuon` varchar(1000) NOT NULL,
  `ngayMuon` datetime NOT NULL DEFAULT current_timestamp(),
  `ngayTraDuKien` datetime NOT NULL,
  `trangThaiPhieuMuon` int(100) NOT NULL DEFAULT 0,
  `hinhThucMuon` varchar(1000) NOT NULL,
  `ghiChuPhieuMuon` varchar(1000) DEFAULT NULL,
  `tienCoc` int(11) NOT NULL DEFAULT 0,
  `nguoiDuyet` varchar(1000) DEFAULT NULL,
  `id_NguoiDung` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `phieumuon`
--

INSERT INTO `phieumuon` (`id_PhieuMuon`, `maPhieuMuon`, `ngayMuon`, `ngayTraDuKien`, `trangThaiPhieuMuon`, `hinhThucMuon`, `ghiChuPhieuMuon`, `tienCoc`, `nguoiDuyet`, `id_NguoiDung`) VALUES
(32, 'MPM45650085', '2024-09-20 03:39:25', '2024-10-05 03:39:25', 4, 'Mượn tại trường', NULL, 498000, 'Nguyễn Phúc', 3),
(33, 'MPM72662505', '2024-09-16 15:06:37', '2024-10-01 08:06:37', 2, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 3),
(34, 'MPM78389917', '2024-09-16 15:33:21', '2024-10-06 08:33:21', 2, 'Mượn từ xa', NULL, 290000, 'Nguyễn Phúc', 3),
(35, 'MPM95232882', '2024-09-16 15:38:39', '2024-10-01 08:38:39', 2, 'Mượn tại trường', NULL, 0, 'Nguyễn Phúc', 3),
(36, 'MPM48007305', '2024-09-18 12:04:09', '2024-09-28 12:04:09', 4, 'Mượn tại trường', 'duyệt đi ní', 0, 'Nguyễn Phúc', 2),
(37, 'MPM57388424', '2024-09-18 13:12:15', '2024-09-28 13:12:15', 4, 'Mượn tại trường', 'duyệt cho tôi nha', 0, 'Nguyễn Phúc', 4),
(38, 'MPM84129367', '2024-09-18 20:31:54', '2024-09-28 13:31:54', 2, 'Mượn tại trường', NULL, 0, 'Nguyễn Phúc', 4),
(39, 'MPM88347250', '2024-09-19 07:51:54', '2024-09-29 07:51:54', 4, 'Mượn tại trường', NULL, 0, 'Nguyễn Phúc', 4),
(40, 'MPM66673903', '2024-09-20 10:46:16', '2024-09-30 03:46:16', 2, 'Mượn tại trường', NULL, 0, 'Nguyễn Phúc', 5),
(41, 'MPM99836226', '2024-09-20 03:48:36', '2024-09-30 03:48:36', 4, 'Mượn từ xa', NULL, 139000, 'Nguyễn Phúc', 5),
(42, 'MPM20289397', '2024-09-20 03:51:33', '2024-10-05 03:51:33', 4, 'Mượn từ xa', NULL, 139000, 'Nguyễn Phúc', 5),
(43, 'MPM21956170', '2024-09-22 05:36:23', '2024-10-07 05:36:23', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 6),
(44, 'MPM20876235', '2024-09-22 07:16:10', '2024-10-07 07:16:10', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 6),
(45, 'MPM34790258', '2024-09-22 07:52:06', '2024-10-07 07:52:06', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 6),
(46, 'MPM92614662', '2024-09-22 15:07:51', '2024-10-07 08:07:51', 0, 'Mượn tại trường', NULL, 0, NULL, 6),
(47, 'MPM49772743', '2024-09-22 08:20:22', '2024-10-07 08:20:22', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 6),
(48, 'MPM34521471', '2024-09-22 15:18:48', '2024-10-07 08:18:48', 0, 'Mượn tại trường', NULL, 0, NULL, 3),
(49, 'MPM27006588', '2024-09-22 15:21:34', '2024-10-18 05:35:44', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 7),
(50, 'MPM65809607', '2024-09-22 16:26:21', '2024-10-10 02:57:12', 3, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 8),
(51, 'MPM72873673', '2024-09-22 16:29:29', '2024-10-02 09:29:29', 0, 'Mượn tại trường', NULL, 0, NULL, 8),
(52, 'MPM56479610', '2024-09-23 20:36:39', '2024-10-10 02:56:52', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 10),
(53, 'MPM55008101', '2024-09-23 20:42:01', '2024-10-10 02:56:41', 3, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 10),
(54, 'MPM52782105', '2024-09-23 13:43:57', '2024-10-03 13:43:57', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 10),
(55, 'MPM62992619', '2024-09-24 11:06:58', '2024-10-04 04:06:58', 0, 'Mượn tại trường', NULL, 0, NULL, 10),
(56, 'MPM49695838', '2024-09-29 16:15:03', '2024-10-15 02:39:36', 4, 'Mượn từ xa', NULL, 119000, 'phuc2', 10),
(57, 'MPM40870504', '2024-09-30 09:41:40', '2024-10-15 02:41:41', 1, 'Mượn từ xa', NULL, 169000, 'Lê Triệu Vy', 10),
(58, 'MPM89708311', '2024-09-30 10:32:00', '2024-10-20 03:32:00', 1, 'Mượn từ xa', NULL, 122000, 'Lê Triệu Vy', 6),
(59, 'MPM53057931', '2024-09-30 10:35:11', '2024-10-15 03:37:35', 3, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 6),
(60, 'MPM63098184', '2024-09-30 10:35:33', '2024-10-15 03:36:34', 3, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 6),
(61, 'MPM25073889', '2024-10-02 13:36:12', '2024-10-22 06:37:48', 3, 'Mượn từ xa', NULL, 139000, 'Nguyễn Phúc', 3),
(62, 'MPM63662954', '2024-10-08 12:43:30', '2024-10-18 05:44:48', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieutra`
--

CREATE TABLE `phieutra` (
  `id_PhieuTra` int(11) NOT NULL,
  `maPhieuTra` varchar(1000) NOT NULL,
  `ngayTraThucTe` datetime NOT NULL DEFAULT current_timestamp(),
  `nguoiNhan` varchar(1000) DEFAULT NULL,
  `id_PhieuMuon` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `phieutra`
--

INSERT INTO `phieutra` (`id_PhieuTra`, `maPhieuTra`, `ngayTraThucTe`, `nguoiNhan`, `id_PhieuMuon`) VALUES
(2, 'MPT31202235', '2024-09-19 11:18:40', 'Nguyễn Phúc', 36),
(3, 'MPT77790938', '2024-09-19 11:23:22', 'Nguyễn Phúc', 37),
(4, 'MPT98296272', '2024-09-19 14:52:07', 'Nguyễn Phúc', 39),
(5, 'MPT46024407', '2024-09-20 10:52:04', 'Nguyễn Phúc', 32),
(6, 'MPT14550130', '2024-09-22 14:53:43', 'Lê Triệu Vy', 45),
(7, 'MPT93627508', '2024-09-22 14:53:53', 'Lê Triệu Vy', 44),
(8, 'MPT90123541', '2024-09-23 20:44:16', 'Lê Triệu Vy', 41),
(9, 'MPT92948333', '2024-09-30 09:38:10', 'phuc2', 54),
(10, 'MPT27233496', '2024-09-30 09:38:25', 'phuc2', 47),
(11, 'MPT47625707', '2024-09-30 09:38:50', 'phuc2', 43),
(12, 'MPT68801973', '2024-09-30 09:39:05', 'phuc2', 42),
(13, 'MPT39052636', '2024-09-30 10:14:37', 'Lê Triệu Vy', 52),
(14, 'MPT56389430', '2024-09-30 10:15:16', 'Lê Triệu Vy', 56),
(15, 'MPT58483953', '2024-10-08 12:35:51', 'Lê Triệu Vy', 49),
(16, 'MPT31442668', '2024-10-08 12:44:55', 'Lê Triệu Vy', 62);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sach`
--

CREATE TABLE `sach` (
  `id_Sach` int(11) NOT NULL,
  `maSach` varchar(1000) NOT NULL,
  `tenSach` varchar(1000) NOT NULL,
  `tenTacGia` varchar(1000) NOT NULL,
  `soTrang` int(11) NOT NULL,
  `namXuatBan` int(11) NOT NULL,
  `soLuongHienCo` int(11) NOT NULL,
  `soLuongCoSan` int(11) NOT NULL,
  `fileSach` varchar(1000) DEFAULT NULL,
  `giaTien` int(11) NOT NULL,
  `ghiChu` longtext NOT NULL,
  `luotXem` int(11) NOT NULL DEFAULT 0,
  `luotDoc` int(11) NOT NULL DEFAULT 0,
  `luotMuon` int(11) NOT NULL DEFAULT 0,
  `danhGiaTrungBinh` int(11) NOT NULL DEFAULT 0,
  `ngayTaoSach` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaSach` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_NhaXuatBan` int(11) NOT NULL,
  `id_NgonNgu` int(11) NOT NULL,
  `id_ViTri` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `sach`
--

INSERT INTO `sach` (`id_Sach`, `maSach`, `tenSach`, `tenTacGia`, `soTrang`, `namXuatBan`, `soLuongHienCo`, `soLuongCoSan`, `fileSach`, `giaTien`, `ghiChu`, `luotXem`, `luotDoc`, `luotMuon`, `danhGiaTrungBinh`, `ngayTaoSach`, `ngaySuaSach`, `id_NhaXuatBan`, `id_NgonNgu`, `id_ViTri`) VALUES
(6, 'MS48144709', 'LỊCH SỬ VÕ HỌC VIỆT NAM', 'Phạm Phong', 250, 1999, 10, 10, NULL, 99000, '<p>chưa c&oacute;</p>', 621, 50, 1, 4, '2024-08-27 16:25:38', '2024-09-26 14:44:12', 12, 1, 2),
(7, 'MS32422963', 'TỔNG HỢP KIẾN THỨC PHP CĂN BẢN', 'Codegym', 255, 2009, 10, 9, NULL, 200000, '<p>Giống với Java đ&atilde; kể tr&ecirc;n, c&aacute;c kiến thức PHP ở t&agrave;i liệu n&agrave;y được hệ thống h&oacute;a lại theo dạng sơ đồ c&acirc;y, gi&uacute;p bạn nắm được hết những kiến thức cốt l&otilde;i của ng&ocirc;n ngữ lập tr&igrave;nh PHP.</p>\r\n\r\n<p>Nội dung ch&iacute;nh được chia l&agrave;m 3 phần lớn: c&uacute; ph&aacute;p cơ bản, mảng v&agrave; cấu tr&uacute;c điều kiện.</p>\r\n\r\n<h2>Dưới đ&acirc;y l&agrave; những t&aacute;c phẩm đ&atilde; xuất bản của t&aacute;c giả &quot;Codegym&quot;:</h2>\r\n\r\n<ol>\r\n	<li><a href=\"https://thuviensach.vn/lap-trinh-can-ban-13868.html\">Lập Tr&igrave;nh Căn Bản</a></li>\r\n	<li><a href=\"https://thuviensach.vn/150-thuat-ngu-tieng-anh-chuyen-nganh-lap-trinh-14358.html\">150 Thuật Ngữ Tiếng Anh Chuy&ecirc;n Ng&agrave;nh Lập Tr&igrave;nh</a></li>\r\n	<li><a href=\"https://thuviensach.vn/tong-hop-kien-thuc-java-can-ban-14359.html\">Tổng Hợp Kiến Thức Java Căn Bản</a></li>\r\n	<li><a href=\"https://thuviensach.vn/tong-hop-kien-thuc-php-can-ban-14360.html\">Tổng Hợp Kiến Thức Php Căn Bản</a></li>\r\n	<li><a href=\"https://thuviensach.vn/so-tay-nghe-lap-trinh-14366.html\">Sổ Tay Nghề Lập Tr&igrave;nh</a></li>\r\n</ol>', 624, 0, 6, 5, '2024-08-29 15:08:15', '2024-10-08 12:44:55', 12, 2, 2),
(8, 'MS42146135', 'SỰ TÍCH CÂY XƯƠNG RỒNG', 'Nguyễn Ngọc Ký', 88, 2020, 5, 5, NULL, 45000, '<p>Sự T&iacute;ch C&acirc;y Xương Rồng</p>\r\n\r\n<p>&ldquo;Khi cả gia đ&igrave;nh rồng trở lại được chỗ b&atilde;i c&aacute;t vắng th&igrave; kỳ lạ thay: Kh&ocirc;ng thấy x&aacute;c Rồng &Uacute;t đ&acirc;u nữa. Chỉ thấy giữ cồn xuất hiện một bụi c&acirc;y uốn &eacute;o, kh&ocirc;ng hề c&oacute; l&aacute; m&agrave; chỉ tua tủa những gai. Tr&ecirc;n ngọn c&aacute;c nh&aacute;nh c&acirc;y nở tung những ch&ugrave;m hoa đỏ như những b&ocirc;ng lửa rực rỡ...&rdquo;</p>\r\n\r\n<p>Cuốn s&aacute;ch được viết bởi Nh&agrave; gi&aacute;o Ưu t&uacute;, Nh&agrave; văn đầu ti&ecirc;n của Việt Nam viết bằng ch&acirc;n.</p>\r\n\r\n<p>NGƯT. Nguyễn Ngọc K&yacute; sinh ng&agrave;y 28 th&aacute;ng 06 năm 1947, qu&ecirc; ở x&atilde; Hải Thanh, huyện Hải Hậu, tỉnh Nam Định. Từ năm l&ecirc;n 4 tuổi, &ocirc;ng bị bệnh v&agrave; bị bại liệt cả 2 tay, nhưng &ocirc;ng đ&atilde; vượt qua số phận của m&igrave;nh v&agrave; trở th&agrave;nh nh&agrave; gi&aacute;o ưu t&uacute;. &Ocirc;ng l&agrave; nh&agrave; văn đầu ti&ecirc;n, người thầy gi&aacute;o Việt Nam đầu ti&ecirc;n d&ugrave;ng ch&acirc;n để viết. Cho đến nay (2017), NGƯT - Nh&agrave; văn Nguyễn Ngọc K&yacute; đ&atilde; c&oacute; 36 cuốn s&aacute;ch được xuất bản.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Sự T&iacute;ch C&acirc;y Xương Rồng PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Ngọc K&yacute;</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 721, 0, 0, 4, '2024-08-29 15:32:57', '2024-09-30 10:25:30', 13, 1, 3),
(9, 'MS83562612', 'CUỘC PHIÊU LƯU KỲ DIỆU CỦA NILS', 'Selma Lagerlöf', 77, 2010, 15, 16, 'https://drive.google.com/drive/u/1/folders/1fuYkOSRiy5inW8zn5XXE4pTeLdhsRVsZ', 50000, '<p>Một b&agrave;i thơ d&agrave;i về thi&ecirc;n nhi&ecirc;n c&oacute; một kh&ocirc;ng hai: qua chuyến đi của Nilx - nước Thuỵ Điển dần dần hiện ra từ Bắc tới Nam, v&agrave; c&aacute;c yếu tố thi&ecirc;n nhi&ecirc;n dưới ng&ograve;i b&uacute;t của t&aacute;c giả Xelma kh&ocirc;ng kh&aacute;c g&igrave; những vật c&oacute; tri gi&aacute;c.</p>\r\n\r\n<p>Một thi&ecirc;n trường ca về con người v&agrave; lao động.</p>\r\n\r\n<p>L&agrave; truyện đời xưa v&agrave; truyện đời nay, đan xen giữa cổ t&iacute;ch v&agrave; hiện thực.</p>\r\n\r\n<p>L&agrave; truyện của thế giới lo&agrave;i vật v&agrave; x&atilde; hội lo&agrave;i người.</p>\r\n\r\n<p>Mượn truyện lo&agrave;i vật để dạy lo&agrave;i người - như một cuốn truyện ngụ ng&ocirc;n - s&aacute;nh ngang ngụ ng&ocirc;n La Fontaine. Truyện ngụ ng&ocirc;n m&agrave; x&acirc;y dựng t&acirc;m l&iacute; nh&acirc;n vật phức tạp chẳng k&eacute;m g&igrave; c&aacute;c tiểu thuyết x&atilde; hội.</p>', 125, 7, 2, 5, '2024-08-29 15:48:41', '2024-10-02 10:49:43', 13, 1, 3),
(10, 'MS80325327', 'SÔNG NÚI VÀ BIỂN HỒ', 'Hồ Cúc', 109, 1997, 10, 10, NULL, 99000, '<p>C&aacute;c bạn trẻ v&agrave;o đời cần trang bị cho m&igrave;nh một số vốn kiến thức bao qu&aacute;t v&agrave; ch&iacute;nh x&aacute;c về c&aacute;c lĩnh vực quan trọng nhất của thi&ecirc;n nhi&ecirc;n v&agrave; thế giới con người. Trong thời đại th&ocirc;ng tin v&agrave; to&agrave;n cầu h&oacute;a hiện nay, y&ecirc;u cầu đ&oacute; trở n&ecirc;n bức thiết hơn bao giờ hết. Những kiến thức đ&oacute; phải l&agrave; nền tảng vững v&agrave;ng v&agrave; hiện đại để người thanh ni&ecirc;n tiếp tục ph&aacute;t huy v&agrave; x&acirc;y dựng tri thức chuy&ecirc;n m&ocirc;n của m&igrave;nh, t&ugrave;y theo &yacute; th&iacute;ch v&agrave; ng&agrave;nh học sắp sửa được chọn lựa.</p>\r\n\r\n<p>Trong tinh thần đ&oacute;, Nh&agrave; xuất bản Trẻ cho ra mắt bạn đọc loạt ấn phẩm được tr&igrave;nh b&agrave;y nhất qu&aacute;n trong một tập hợp c&oacute; t&ecirc;n l&agrave; Ch&igrave;a Kh&oacute;a V&agrave;ng Tri Thức. Tập hợp n&agrave;y sẽ bao gồm 10 t&aacute;c phẩm, lần lượt đề cập đến c&aacute;c lĩnh vực thi&ecirc;n văn, n&uacute;i non, s&ocirc;ng ng&ograve;i, lịch sử, c&aacute;c nh&acirc;n vật nổi tiếng, c&aacute;c quốc gia tr&ecirc;n thế giới...</p>\r\n\r\n<p>Tr&acirc;n trọng giới thiệu c&ugrave;ng bạn đọc.</p>', 330, 0, 2, 4, '2024-08-29 15:56:07', '2024-09-30 09:39:05', 13, 1, 3),
(11, 'MS93137413', 'MỘT CHỮ CŨNG LÀ TRÒ1', 'Nguyễn Trường Sa', 222, 2001, 5, 5, NULL, 109000, '<p>Hẳn tựa s&aacute;ch khiến người đọc li&ecirc;n hệ ngay tới c&acirc;u &ldquo;Nhất tự vi sư, b&aacute;n tự vi sư.&rdquo; (Một chữ l&agrave; thầy, nửa chữ cũng l&agrave; thầy). V&igrave; sao ở đ&acirc;y lại Một chữ cũng l&agrave; tr&ograve;? C&oacute; g&igrave; nhầm lẫn chăng?</p>\r\n\r\n<p>Thưa, đ&oacute; l&agrave; c&aacute;ch m&agrave; một người thầy đ&atilde; tiếp nhận, đ&atilde; trải qua, đ&atilde; tin tưởng.</p>\r\n\r\n<p>Người thầy ấy l&agrave; t&aacute;c giả Nguyễn Trường Sa, một tiến sĩ gi&aacute;o dục c&oacute; g&oacute;c nh&igrave;n tho&aacute;ng, tư duy mới v&agrave; th&oacute;i quen đặt c&acirc;u hỏi ngược lại cho mọi vấn đề. Vậy n&ecirc;n mới c&oacute; Một chữ cũng l&agrave; Tr&ograve; - cuốn s&aacute;ch chia sẻ trải nghiệm d&agrave;nh cho c&aacute;c sinh vi&ecirc;n sư phạm v&agrave; những thầy c&ocirc; gi&aacute;o trẻ, những người đang ấp ủ nhiều l&yacute; tưởng bỗng một ng&agrave;y vỡ &ograve;a trước thực tế gai g&oacute;c, hoang mang kh&ocirc;ng biết n&ecirc;n đi tiếp hay rẽ sang hướng kh&aacute;c.</p>\r\n\r\n<p>Bạn sắp trở th&agrave;nh nh&agrave; gi&aacute;o hay đang l&agrave; một nh&agrave; gi&aacute;o? V&agrave; bạn coi việc đi dạy l&agrave; c&aacute;i nghề hay đam m&ecirc; hay nghĩa vụ? D&ugrave; thuộc trường hợp n&agrave;o, bạn đều c&oacute; thể t&igrave;m thấy c&acirc;u chuyện của (cho) ch&iacute;nh m&igrave;nh trong cuốn s&aacute;ch n&agrave;y.</p>', 247, 0, 0, 5, '2024-08-29 17:54:12', '2024-10-07 13:35:10', 12, 1, 7),
(12, 'MS77237466', 'CON NGƯỜI PHI THƯỜNG TRONG BẠN', 'Anthony Robbins', 256, 2016, 10, 10, 'https://drive.google.com/drive/u/1/folders/18oxmTU9P6G8lN_AYtSt64OVBJdy3MUWJ', 250000, '<p>LỜI N&Oacute;I ĐẦU</p>\r\n\r\n<p>Với tư c&aacute;ch l&agrave; nh&agrave; t&acirc;m l&yacute; ch&iacute;nh của bệnh viện Bellevue, th&agrave;nh phố New York, t&ocirc;i chứng kiến nhiều m&atilde;nh đời khổ đau, kh&ocirc;ng chỉ ri&ecirc;ng những bệnh nh&acirc;n t&acirc;m thần, m&agrave; cả ở những nh&acirc;n vi&ecirc;n &quot;b&igrave;nh thường&quot;,&quot;khoẻ mạnh&quot; đang chữa trị cho bệnh nh&acirc;n. T&ocirc;i c&ograve;n thấy sự bất hạnh cả ở những người tương đối th&agrave;nh c&ocirc;ng v&agrave; c&oacute; địa vị cao đến gặp t&ocirc;i ở ph&ograve;ng kh&aacute;m tư. Rất thường, sự đau đớn v&agrave; sự khốn khổ l&agrave; điều kh&ocirc;ng mong muốn v&agrave; cuối c&ugrave;ng cũng qua đi khi con người chịu để cho c&aacute;c niềm tin, t&igrave;nh cảm v&agrave; h&agrave;nh động của họ l&agrave;m thay đổi qui tr&igrave;nh của đời sống. Khổ nỗi nhiều khi họ kh&ocirc;ng l&agrave;m thế. Họ nấn n&aacute;, rồi cố thay đổi kết quả xấu hay thường rơi v&agrave;o sự lưỡng lự chỉ để than tr&aacute;ch cuộc đời khủng khiếp của họ hay bằng c&aacute;ch n&agrave;o đ&oacute; được một ai &quot;sắp xếp cho&quot;.</p>\r\n\r\n<p>Những người c&oacute; khả năng để nhận ra rằng họ định đoạt kết quả của cuộc sống ri&ecirc;ng kh&ocirc;ng phải l&uacute;c n&agrave;o cũng dễ. Thực tế l&agrave;, n&oacute; thường l&agrave; một c&ocirc;ng việc c&oacute; t&iacute;nh chất &aacute;p đảo. Do đ&oacute;, t&ocirc;i lu&ocirc;n t&igrave;m kiếm một phương ph&aacute;p v&agrave; những kỹ thuật mới khi l&agrave;m việc ở bệnh viện v&agrave; đối với những bệnh nh&acirc;n ri&ecirc;ng của t&ocirc;i. Năm năm về trước, lần đầu ti&ecirc;n t&ocirc;i nghe biết về t&aacute;c phẩm của Tony Robbins v&agrave; theo một trong những kh&oacute;a tập huấn của anh ở new York.</p>\r\n\r\n<p>Tối đ&oacute;, t&ocirc;i thấy l&agrave;, Tony g&oacute;p phần v&agrave;o niềm tin của t&ocirc;i khi cho rằng bất kỳ ai l&agrave;nh mạnh cơ bản đều c&oacute; thể l&agrave;m chủ v&agrave; sống cuộc đời tr&agrave;n đầy, ngay sau đ&oacute;, t&ocirc;i theo kh&oacute;a học hai tuần c&oacute; cấp giấy chứng nhận của Tony, cũng như c&ugrave;ng c&aacute;c đồng nghiệp v&agrave; c&aacute;c bệnh nh&acirc;n theo tiếp c&aacute;c kh&oacute;a kh&aacute;c. T&ocirc;i gọi đ&oacute; l&agrave; kh&oacute;a&quot;Huấn luyện cơ Bản cho cuộc sống&quot;. Rồi t&ocirc;i giới thiệu h&agrave;ng loạt băng ghi &acirc;m v&agrave; cuốn s&aacute;ch đầu tay của anh, Năng Lực v&ocirc; tận.</p>\r\n\r\n<p>Mặc dầu một số đồng nghiệp của t&ocirc;i kh&oacute; chịu v&agrave; ngạc nhi&ecirc;n khi t&ocirc;i giới thiệu những t&aacute;c phẩm của một thanh ni&ecirc;n chẳng c&oacute; bằng cấp, m&agrave; những ai đọc v&agrave; nghe Tony l&agrave; đi đến chổ t&aacute;n th&agrave;nh. Th&ecirc;m v&agrave;o t&agrave;i liệu đ&uacute;ng đắn v&agrave; dễ l&atilde;nh hội, Tony c&oacute; một t&agrave;i năng v&agrave; một phong th&aacute;i l&ocirc;i cuốn l&agrave;m cho điều viết ra của anh dễ nắm bắt.</p>', 846, 156, 5, 5, '2024-08-29 18:06:15', '2024-10-02 13:42:05', 12, 2, 7),
(13, 'MS36616003', 'KHÚC ĐỒNG DAO LẤM LÁP', 'Kao Sơn', 221, 2019, 5, 5, NULL, 79000, '<p>T&aacute;c phẩm đạt giải A cuộc vận động s&aacute;ng t&aacute;c cho thiếu nhi 1999 - 2000 của Nh&agrave; xuất bản Kim Đồng. Truyện kh&ocirc;ng được chia th&agrave;nh chương hay đoạn m&agrave; l&agrave; &ldquo;kh&uacute;c&rdquo;, n&oacute;i về những kỉ niệm tươi đẹp, giản dị, chất ph&aacute;c ở th&ocirc;n qu&ecirc; y&ecirc;n b&igrave;nh tr&agrave;n ngập n&eacute;t ng&acirc;y ng&ocirc; của tuổi thơ. Truyện đưa người đọc đến với những tr&ograve; chơi d&acirc;n gian c&ugrave;ng những b&agrave;i h&aacute;t đồng dao c&oacute; từ rất xưa, nhưng đ&atilde; bị l&atilde;ng qu&ecirc;n bởi cuộc sống v&ocirc; t&igrave;nh của con người thời hiện đại&hellip;</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Kh&uacute;c Đồng Dao Lấm L&aacute;p PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Kao Sơn</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 1108, 0, 1, 5, '2024-08-29 18:10:55', '2024-10-01 13:43:56', 1, 1, 7),
(14, 'MS84452290', 'HỒ CHÍ MINH VÀ NHẬT KÝ TRONG TÙ', 'Hồ Chí Minh', 200, 2000, 15, 15, NULL, 95000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Hồ Ch&iacute; Minh V&agrave; Nhật K&yacute; Trong T&ugrave; PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Hồ Ch&iacute; Minh</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 723, 0, 0, 5, '2024-09-08 12:39:17', '2024-09-30 10:30:07', 16, 1, 8),
(15, 'MS26741220', 'GIÁO TRÌNH C++', 'Khuyết Danh', 122, 2005, 18, 18, 'https://drive.google.com/drive/u/1/folders/1T1IhVMTR-FP6SKjFrvhDix5jE90n6Kaw', 79000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Gi&aacute;o Tr&igrave;nh C++ PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Khuyết Danh</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 949, 521, 4, 5, '2024-09-08 12:59:05', '2024-10-08 12:44:55', 17, 1, 12),
(16, 'MS82053029', 'WEB DEVELOPER - THIẾT KẾ VÀ PHÁT TRIỂN WEBSITE', 'Izwebz', 300, 2015, 15, 15, 'https://drive.google.com/drive/u/1/folders/12lyK9lG0WXnmlPEaXPLitQHYsx1WVAOf', 239000, '<p>Cuốn s&aacute;ch Web Developer - Thiết kế v&agrave; ph&aacute;t triển website bao gồm tất cả kiến thức từ tổng qu&aacute;t đến cụ thể về việc thiết kế v&agrave; ph&aacute;t triển một trang web.</p>\r\n\r\n<p>Mục lục:</p>\r\n\r\n<p>Chương 1: Bạn cần g&igrave; để thiết kế một trang web</p>\r\n\r\n<p>Chương 2: Thiết kế v&agrave; x&acirc;y dựng website</p>\r\n\r\n<p>Chương 3: Những điều n&ecirc;n v&agrave; kh&ocirc;ng n&ecirc;n trong thiết kế website</p>\r\n\r\n<p>Chương 4: SEO</p>\r\n\r\n<p>Chương 5: Những thủ thuật trong thiết kế v&agrave; lập tr&igrave;nh</p>\r\n\r\n<p>Chương 6: Ph&aacute;t triển web</p>\r\n\r\n<p>Chương 7: Kỹ năng viết b&agrave;i</p>\r\n\r\n<p>Chương 8: Dịch vụ Hostting</p>\r\n\r\n<p>Chương 9: Dịch vụ t&ecirc;n miền</p>\r\n\r\n<p>Chương 10: Chiến lượt ph&aacute;t triển một trang web</p>\r\n\r\n<p>Chương 11: Luật bản quyền</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Web Developer - Thiết Kế V&agrave; Ph&aacute;t Triển Website PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Izwebz</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 934, 323, 2, 0, '2024-09-08 13:07:11', '2024-10-08 12:35:51', 12, 2, 10),
(17, 'MS22424511', 'PYTHON CƠ BẢN - RẤT LÀ CƠ BẢN', 'Võ Duy Tuấn', 92, 2017, 8, 7, 'https://drive.google.com/drive/u/1/folders/1B1bvxqzobzR704T9PrFe81gfMypeTSZF', 152000, '<p>T&agrave;i liệu &ldquo;Python cơ bản - Cực kỳ cơ bản&rdquo; (T&aacute;c giả: V&otilde; Duy Tuấn) l&agrave; cuốn t&agrave;i liệu đầy đủ, dễ đọc, dễ hiểu d&agrave;nh cho bất kỳ ai quan t&acirc;m v&agrave; bắt đầu l&agrave;m quen với Python, một ng&ocirc;n ngữ &ldquo;hot&rdquo; đang rất được ưa chuộng.</p>\r\n\r\n<p>Nội dung của cuốn s&aacute;ch bao gồm 15 chương:</p>\r\n\r\n<p>Chương 1: Hello World</p>\r\n\r\n<p>Chương 2: C&uacute; ph&aacute;p</p>\r\n\r\n<p>Chương 3: Ph&acirc;n chia Module</p>\r\n\r\n<p>Chương 4: Class</p>\r\n\r\n<p>Chương 5: Thao t&aacute;c tr&ecirc;n tập tin</p>\r\n\r\n<p>Chương 6: Xử l&yacute; h&igrave;nh ảnh</p>\r\n\r\n<p>Chương 7: Xử l&yacute; file JSON</p>\r\n\r\n<p>Chương 8: Xử l&yacute; file XML</p>\r\n\r\n<p>Chương 9: Kết nối Redis</p>\r\n\r\n<p>Chương 10: Kết nối Memcached</p>\r\n\r\n<p>Chương 11: Kết nối RabbitMQ</p>\r\n\r\n<p>Chương 12: Restful Client</p>\r\n\r\n<p>Chương 13: Gởi email với SMTP</p>\r\n\r\n<p>Chương 14: Socket Programming</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Python Cơ Bản - Rất L&agrave; Cơ Bản PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>V&otilde; Duy Tuấn</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 1244, 542, 4, 5, '2024-09-08 13:11:37', '2024-10-02 14:13:11', 12, 2, 13),
(18, 'MS54330135', 'NGHỆ THUẬT TẠO ĐẤT MÙN', 'Sưu Tầm', 60, 2010, 12, 11, 'https://drive.google.com/drive/u/1/folders/1lrfDotpIwnk8IaWZOgemQLYQJS-Qqrd_', 82000, '<p>Cảm ơn Đất Mẹ,</p>\r\n\r\n<p>Cảm ơn C&ocirc;, Nh&agrave; B&aacute;o &ldquo;Phi&ecirc;n Chợ Xanh Tử Tế&rdquo; với b&agrave;i viết &ldquo;Dựng lại Người, Dựng lại Nh&agrave;&rdquo; lần đầu con đọc được từ C&ocirc;,</p>\r\n\r\n<p>Cảm ơn &Ocirc;ng Bụt Cấy Nền, cấy hiểu biết v&agrave; niềm tin, t&igrave;nh y&ecirc;u hồn nhi&ecirc;n,</p>\r\n\r\n<p>Cảm ơn Trưởng m&ocirc;n Truyền Nh&acirc;n Hơi Thở, truyền sự h&oacute;m hỉnh, gi&agrave;u c&oacute; v&agrave; sức mạnh,</p>\r\n\r\n<p>Cảm ơn c&aacute;c Guru Ph&aacute;p Clean, gi&uacute;p người viết kết nối được với những điều &yacute; nghĩa, như t&agrave;i liệu n&agrave;y c&ugrave;ng c&aacute;c b&agrave;i #đọc_chơi_mần_thiệt tr&ecirc;n facebook, tặng c&aacute;c nh&agrave; vườn.</p>\r\n\r\n<p><strong>T&igrave;m mua: Nghệ Thuật Tạo Đất M&ugrave;n</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>T&agrave;i liệu n&agrave;y ph&ugrave; hợp với bạn!</p>\r\n\r\n<p>- Nh&agrave; vườn quy m&ocirc; nhỏ v&agrave; vừa, với vườn từ v&agrave;i trăm m&eacute;t vu&ocirc;ng đến v&agrave;i h&eacute;c-ta.</p>\r\n\r\n<p>- Nh&agrave; vườn c&oacute; ph&aacute;t triển c&aacute;c loại n&ocirc;ng sản với [thời gian gieo trồng- thu hoạch] dưới 12 th&aacute;ng, như rau, củ, quả, ngũ cốc, hạt, hoa, l&aacute; v&agrave; rễ l&agrave;m thực phẩm.</p>\r\n\r\n<p>- Nh&agrave; vườn muốn đất vườn sống động, gi&agrave;u c&oacute;, đạt c&acirc;n bằng dưỡng chất sau 3-5 năm, v&agrave; kh&ocirc;ng bao giờ cần mua hay d&ugrave;ng ph&acirc;n b&oacute;n, thuốc trừ s&acirc;u nữa.</p>\r\n\r\n<p>- Nh&agrave; vườn muốn biết r&otilde; c&aacute;ch l&agrave;m n&ocirc;ng từ nguồn tin cậy- khoa học, quan t&acirc;m đến chất lượng cuộc sống của m&igrave;nh, hệ sinh th&aacute;i, chất lượng n&ocirc;ng sản, v&agrave; người d&ugrave;ng n&ocirc;ng sản.</p>\r\n\r\n<p>Cảm ơn bạn tiếp tục đọc, sử dụng v&agrave; chia sẻ t&agrave;i liệu n&agrave;y!</p>\r\n\r\n<p>T&agrave;i liệu c&aacute;ch ủ compost Bio Intensive gi&uacute;p c&acirc;n bằng đất vườn, ph&aacute;t triển n&ocirc;ng sản đậm đ&agrave;, gi&agrave;u dưỡng chất. Trang 4/60</p>\r\n\r\n<p>&ldquo;Đố bạn t&igrave;m được hai chiếc l&aacute; giống y hệt nhau!&rdquo;</p>\r\n\r\n<p>C&acirc;u đố n&agrave;y từ Gi&aacute;o sư, Tiến Sĩ Daniel Chamovitz, ĐH Tel Aviv, ĐH lớn nhất Israel, hỏi trong kh&oacute;a học mở &ldquo;Hiểu về c&acirc;y cối&rdquo; - https://www.coursera.org/learn/plantknows</p>\r\n\r\n<p>Dĩ nhi&ecirc;n bạn kh&ocirc;ng t&igrave;m được, giống như kh&ocirc;ng t&igrave;m được hai người c&ugrave;ng v&acirc;n tay. V&igrave; đ&oacute; l&agrave; gi&aacute; trị, vẻ đẹp của tự nhi&ecirc;n, chỉ thể hiện qua quy luật, kh&ocirc;ng sao y.</p>\r\n\r\n<p>Hiểu c&agrave;ng nhiều gi&aacute; trị của tự nhi&ecirc;n, bạn c&agrave;ng đẹp, bạn c&agrave;ng hạnh ph&uacute;c!</p>\r\n\r\n<p>Năm 1966, Alan Chadwick, bậc thầy l&agrave;m vườn người Anh đem v&agrave;o Mỹ phương ph&aacute;p n&ocirc;ng nghiệp hữu cơ kết hợp từ Bio-Dynamic (sinh học năng động) v&agrave; th&acirc;m canh kiểu Ph&aacute;p, biến khu đất dốc cằn cỗi ở trường ĐH California -Santa Cruz th&agrave;nh khu vườn tr&ugrave; ph&uacute;. C&aacute;c thế hệ thực tập, cộng t&aacute;c, tạo n&ecirc;n tổ chức Ecology Action (H&agrave;nh Động v&igrave; sinh th&aacute;i) v&agrave;o năm 1971, với phương ph&aacute;p n&ocirc;ng nghiệp hữu cơ khoa học BioIntensive - th&acirc;m canh sinh học. Gần 50 năm nghi&ecirc;n cứu, thực h&agrave;nh li&ecirc;n tục, BioIntensive hiện được &aacute;p dụng ở hơn 140 nước... ph&ugrave; hợp nh&agrave; vườn vừa v&agrave; nhỏ, quan trọng, ai cũng thực h&agrave;nh được.</p>\r\n\r\n<p>T&agrave;i liệu giới thiệu với bạn th&ecirc;m vẻ đẹp của compost, ph&acirc;n ủ hoai, c&aacute;c gi&aacute; trị kh&aacute;c của c&acirc;y, cỏ, thi&ecirc;n nhi&ecirc;n.</p>\r\n\r\n<p>Người chuyển ngữ.</p>\r\n\r\n<p>Th&aacute;ng 11 năm 2020.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Nghệ Thuật Tạo Đất M&ugrave;n PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Sưu Tầm</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 143, 1, 1, 0, '2024-09-20 11:26:09', '2024-10-07 15:19:45', 12, 1, 1),
(19, 'MS25900830', 'XÂY DỰNG LẠI TRÁI ĐẤT', 'Mark Everard', 125, 1999, 8, 8, NULL, 129000, '<p>Việc x&acirc;y dựng lại Tr&aacute;i đất l&agrave;m r&otilde; r&agrave;ng sự phụ thuộc lẫn nhau của lo&agrave;i người với hệ sinh th&aacute;i c&aacute;c h&agrave;nh tinh. C&aacute;c phương ph&aacute;p tiếp cận n&agrave;y dựa tr&ecirc;n việc phục hồi v&agrave; bảo vệ c&aacute;c hệ sinh th&aacute;i nước v&agrave; đất rừng t&agrave;i nguy&ecirc;n biển v&agrave; ven biển thực h&agrave;nh canh t&aacute;c cơ sở hạ tầng đ&ocirc; thị v&agrave; trong chuỗi cung ứng của doanh nghiệp.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>X&acirc;y Dựng Lại Tr&aacute;i Đất PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Mark Everard</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 10, 0, 0, 4, '2024-09-20 16:28:37', '2024-10-02 10:51:03', 12, 2, 1),
(20, 'MS79109954', 'HƯỚNG DẪN NGƯ DÂN ĐÁNH BẮT XA BỜ', 'Phạm Nguyên Phẩm', 244, 2001, 10, 10, 'https://drive.google.com/drive/u/1/folders/1fIrlMl4YzEGs2kcSJ0q62i6GQg5Og7ne', 79000, '<p>Nội dung cuốn s&aacute;ch giới thiệu kh&aacute;i qu&aacute;t về biển, đảo Việt Nam, về nguồn t&aacute;i nguy&ecirc;n v&ocirc; gi&aacute; m&agrave; thi&ecirc;n nhi&ecirc;n ban tặng; c&aacute;c quy định, ch&iacute;nh s&aacute;ch m&agrave; ngư d&acirc;n đ&aacute;nh bắt xa bờ cần biết; c&aacute;c bệnh thường gặp tr&ecirc;n biển v&agrave; c&aacute;ch sơ cứu, cứu chữa. Cuốn s&aacute;ch l&agrave; t&agrave;i liệu bổ &iacute;ch, gi&uacute;p ngư d&acirc;n thuận lợi hơn trong hoạt động khai th&aacute;c thủy, hải sản n&oacute;i chung v&agrave; đ&aacute;nh bắt xa bờ n&oacute;i ri&ecirc;ng.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Hướng Dẫn Ngư D&acirc;n Đ&aacute;nh Bắt Xa Bờ PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Phạm Nguy&ecirc;n Phẩm</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 18, 0, 0, 5, '2024-09-20 16:35:14', '2024-10-07 15:19:21', 18, 1, 1),
(21, 'MS55330927', 'YOU CAN - KHÔNG GÌ LÀ KHÔNG THỂ', 'George Matthew Adams', 79, 2009, 5, 4, 'https://drive.google.com/drive/u/1/folders/1auw90DgBEKBIzo5CQsG2ZIa--EJFJA-o', 49000, '<p>C&ugrave;ng với C&aacute;ch nghĩ để th&agrave;nh c&ocirc;ng của Napoleon Hill, Kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng thể của George Matthew Adams đ&atilde; trở th&agrave;nh người bạn đồng h&agrave;nh th&acirc;n thiết của rất nhiều người. Những triết l&yacute; đơn giản nhưng v&ocirc; c&ugrave;ng s&acirc;u sắc v&agrave; hữu dụng của Kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng thể đ&atilde; gi&uacute;p rất nhiều người đạt được th&agrave;nh c&ocirc;ng như họ mong đợi. Đến với những b&iacute; quyết n&agrave;y, bạn sẽ nhận ra rằng: Kh&ocirc;ng c&oacute; giới hạn n&agrave;o trong tư duy của con người ngo&agrave;i những giới hạn do ch&iacute;nh con người đặt ra.</p>\r\n\r\n<p>Mỗi nghịch cảnh, thất bại hay đau khổ đều mang trong n&oacute; hạt giống của những lợi &iacute;ch tương đương hoặc lớn hơn. H&atilde;y học c&aacute;ch đối mặt v&agrave; vượt qua thất bại. H&atilde;y để Kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng thể đồng h&agrave;nh với bạn tr&ecirc;n h&agrave;nh tr&igrave;nh kh&aacute;m ph&aacute; sức mạnh bản th&acirc;n v&agrave; đạt đến th&agrave;nh c&ocirc;ng hằng mong đợi.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>You Can - Kh&ocirc;ng G&igrave; L&agrave; Kh&ocirc;ng Thể PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>George Matthew Adams</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 5, 0, 1, 0, '2024-09-20 16:49:45', '2024-09-23 20:43:44', 12, 1, 8),
(22, 'MS46313904', 'HƯỚNG DẪN PHƯƠNG PHÁP KHUYẾN NÔNG', 'Ngô Xuân Hoàng', 110, 2020, 12, 11, 'https://drive.google.com/drive/u/1/folders/1XCjwT1c9A3fNPVRH4giiavyLPExz3Z87', 99000, '<p>Cuốn s&aacute;ch tập trung v&agrave;o c&aacute;c nội dung: Một số vấn đề chung về khuyến n&ocirc;ng v&agrave; hoạt động khuyến n&ocirc;ng; Tổ chức khuyến n&ocirc;ng ở Việt Nam cũng như vai tr&ograve;, chức năng của tổ chức khuyến n&ocirc;ng hiện tại v&agrave; trong tương lai; C&aacute;n bộ khuyến n&ocirc;ng v&agrave; vai tr&ograve;, nhiệm vụ của c&aacute;n bộ khuyến n&ocirc;ng trong sự nghiệp ph&aacute;t triển n&ocirc;ng nghiệp, n&ocirc;ng th&ocirc;n; Đối tượng của khuyến n&ocirc;ng v&agrave; c&aacute;c phương ph&aacute;p cần sử dụng để thực hiện tốt c&ocirc;ng t&aacute;c khuyến n&ocirc;ng ở c&aacute;c cấp; C&aacute;ch x&acirc;y dựng kế hoạch, tổ chức thực hiện hoạt động khuyến n&ocirc;ng ở c&aacute;c cấp cũng như phương ph&aacute;p đ&aacute;nh gi&aacute; kết quả hoạt động khuyến n&ocirc;ng v&agrave; kết quả hoạt động của c&aacute;n bộ khuyến n&ocirc;ng...</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Hướng Dẫn Phương Ph&aacute;p Khuyến N&ocirc;ng PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Ng&ocirc; Xu&acirc;n Ho&agrave;ng</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 12, 0, 1, 5, '2024-09-20 16:53:23', '2024-09-30 10:36:42', 18, 1, 9),
(23, 'MS73915021', 'TRUYỆN KIỀU', 'Nguyễn Du', 110, 2012, 15, 15, 'https://drive.google.com/drive/u/1/folders/1uX8aPLjF6mCNI13rx1-uQ6EatldoFZbA', 99000, '<p>Đoạn trường t&acirc;n thanh (chữ H&aacute;n: 斷腸新聲), thường được biết đến với c&aacute;i t&ecirc;n đơn giản l&agrave; Truyện Kiều (chữ N&ocirc;m: 傳翹), l&agrave; một truyện thơ của đại thi h&agrave;o Nguyễn Du. Đ&acirc;y được xem l&agrave; truyện thơ nổi tiếng nhất v&agrave; x&eacute;t v&agrave;o h&agrave;ng kinh điển trong văn học Việt Nam, t&aacute;c phẩm được viết bằng chữ N&ocirc;m theo thể lục b&aacute;t, gồm 3254 c&acirc;u.</p>\r\n\r\n<p>C&acirc;u chuyện dựa theo tiểu thuyết Kim V&acirc;n Kiều truyện của Thanh T&acirc;m T&agrave;i Nh&acirc;n, một thi sĩ thời nh&agrave; Minh, Trung Quốc.</p>\r\n\r\n<p>T&aacute;c phẩm kể lại cuộc đời, những thử th&aacute;ch v&agrave; đau khổ của Th&uacute;y Kiều, một phụ nữ trẻ xinh đẹp v&agrave; t&agrave;i năng, phải hy sinh th&acirc;n m&igrave;nh để cứu gia đ&igrave;nh. Để cứu cha v&agrave; em trai khỏi t&ugrave;, c&ocirc; b&aacute;n m&igrave;nh kết h&ocirc;n với một người đ&agrave;n &ocirc;ng trung ni&ecirc;n, kh&ocirc;ng biết rằng anh ta l&agrave; một kẻ bu&ocirc;n người, v&agrave; bị &eacute;p l&agrave;m kĩ nữ trong lầu xanh.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Truyện Kiều PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Du</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 20, 1, 0, 4, '2024-09-20 16:57:30', '2024-10-07 14:28:04', 16, 1, 11),
(24, 'MS72383693', 'BƯỚC ĐƯỜNG CÙNG', 'Nguyễn Công Hoan', 158, 1995, 20, 20, 'https://drive.google.com/drive/u/1/folders/1_0msBhyppuJSzcB5JMoN24uVJQdifs6P', 89000, '<p>Bước đường c&ugrave;ng - Nguyễn C&ocirc;ng Hoan l&agrave; tiểu thuyết gắn liền với số phận của anh Pha, một người n&ocirc;ng d&acirc;n với những kh&oacute; khăn chồng chất đ&atilde; đ&aacute;nh dấu đỉnh cao về tư tưởng của nh&agrave; văn Nguyễn C&ocirc;ng Hoan v&agrave; l&agrave; một trong những t&aacute;c phẩm ti&ecirc;u biểu của văn học hiện thực ph&ecirc; ph&aacute;n Việt Nam trước C&aacute;ch mạng***</p>\r\n\r\n<p>*G&Oacute;C REVIEW S&Aacute;CH*</p>\r\n\r\n<p>Bước đường c&ugrave;ng- Nguyễn C&ocirc;ng Hoan</p>\r\n\r\n<p>&ldquo;Bước đường c&ugrave;ng&rsquo;&rsquo;- một t&aacute;c phẩm ti&ecirc;u biểu của nh&agrave; văn Nguyễn C&ocirc;ng Hoan, được viết với chủ đề phản &aacute;nh số phận của những người n&ocirc;ng d&acirc;n thấp cổ b&eacute; họng bị giai cấp thống trị bốc lột, bị c&aacute;i x&atilde; hội của đồng tiền &eacute;p đến bước đường c&ugrave;ng kh&ocirc;ng lối tho&aacute;t. Đồng thời ph&ecirc; ph&aacute;n x&atilde; hội Việt Nam trước c&aacute;ch mạng. D&ugrave; lường trước s&aacute;ch sẽ bị cấm nhưng &ocirc;ng vẫn viết ra những trang tiểu thuyết với những hiện thực cuộc sống trước c&aacute;ch mạng của người n&ocirc;ng d&acirc;n.</p>\r\n\r\n<p>T&aacute;c phẩm gắn liền với số phận của anh Pha- người mang r&otilde; n&eacute;t của một người n&ocirc;ng d&acirc;n với những kh&oacute; khăn vất vả của cuộc sống trong giai đoạn 1930-1945. Anh bị Trương Thi chơi xấu bỏ rượu lậu v&agrave;o ruộng rồi b&aacute;o T&acirc;y Đoan đến bắt nhưng bất th&agrave;nh v&igrave; bỏ lầm ruộng Nghị Lại. Chi tiết ấy l&agrave;m người đọc cảm thấy hồi hộp khi kh&ocirc;ng biết một người lương thiện như Pha sẽ ra sau, nhưng quả thực may mắn &ldquo;Pha lại lương thiện như thường&rdquo;.Sau đ&oacute; l&agrave; sự x&uacute;i giục qua lại của Nghị Lại giữa Pha v&agrave; Trương Thi, thế nhưng khi đi kiện Pha lại bị đ&aacute;nh đấm, hạch s&aacute;ch v&igrave; kh&ocirc;ng mang tiền lễ v&agrave; c&ograve;n bị giam.</p>\r\n\r\n<p>Ta c&oacute; thể thấy được thế lực của đồng tiền đ&aacute;ng sợ biết nhường n&agrave;o trong</p>\r\n\r\n<p>c&aacute;i x&atilde; hội bất c&ocirc;ng n&agrave;y. Quan huyện cho l&iacute;nh v&agrave;o nh&agrave; vơ v&eacute;t của cải khiến vợ chồng Pha phải đến l&agrave;m thu&ecirc; cho Nghị Lại. Phần sau của t&aacute;c phẩm đ&atilde; thể hiện r&otilde; sự khốn khổ tột c&ugrave;ng của một người n&ocirc;ng d&acirc;n kh&ocirc;ng đủ tiền lo cơm &aacute;o thuốc men khi vợ ốm, chị v&agrave; con bị dịch bệnh qua đời, &ldquo;ở nh&agrave; bệnh của vợ kh&ocirc;ng bớt, chị nổi cơn ho, con đ&oacute;i sữa kh&oacute;c sa sả cả ng&agrave;y&rdquo;. Điều đ&oacute; cũng đủ để ta thấy nỗi lo toan của anh Pha vất vả như thế n&agrave;o, căn nh&agrave; h&ocirc;i h&aacute;m, hơi ẩm thấp, kh&ocirc;ng c&oacute; đường tho&aacute;t ra ngo&agrave;i. &ldquo;Anh thấy c&aacute;i đời người d&acirc;n c&agrave;y hết sức cực nhục, người d&acirc;n c&agrave;y sống để l&agrave;m việc vất vả, m&agrave; l&agrave;m việc vất vả kh&ocirc;ng để hưởng sự sung sướng&rdquo;.</p>\r\n\r\n<p>Đến cuối c&ugrave;ng, Pha chỉ c&ograve;n lại một m&igrave;nh trong c&aacute;i thế giới tăm tối. &ldquo;Ch&uacute;ng ta sống để l&agrave;m g&igrave;? Kh&ocirc;ng để ăn ngon, kh&ocirc;ng để mặc đẹp, kh&ocirc;ng để ở sướng nhưng l&agrave; để chịu những sự b&oacute;c lột của địa chủ t&agrave;n nhẫn những nỗi &aacute;p bức của quan lại tham nhũng, những c&aacute;i bất c&ocirc;ng của chế độ thối n&aacute;t chốn hương th&ocirc;n, để bước đường c&ugrave;ng l&agrave; đi đến chỗ ph&aacute; sản&rdquo;.</p>\r\n\r\n<p>Nguyễn C&ocirc;ng Hoan đ&atilde; đả k&iacute;ch vạch mặt chỉ t&ecirc;n thật sự của x&atilde; hội mục n&aacute;t trước C&aacute;ch Mạng, &ocirc;ng l&agrave; đ&agrave;n anh dẫn đầu trong việc đi s&acirc;u v&agrave;o n&ocirc;ng th&ocirc;n,cảm th&ocirc;ng với người n&ocirc;ng d&acirc;n để n&oacute;i l&ecirc;n nỗi l&ograve;ng của họ.</p>\r\n\r\n<p>Nguồn: Hạt C&aacute;t Nhỏ - th&agrave;nh vi&ecirc;n Ban Nh&acirc;n Sự</p>\r\n\r\n<p>#reviewsach #pnhtq #svhd</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Nguyễn C&ocirc;ng Hoan (1903 - 1977) l&agrave; nh&agrave; văn ti&ecirc;u biểu của văn học hiện thực ph&ecirc; ph&aacute;n Việt Nam. Thế giới truyện ngắn Nguyễn C&ocirc;ng Hoan đa dạng, phong ph&uacute;, như một &quot;b&aacute;ch khoa thư&quot;, một &quot;tấn tr&ograve; đời&quot;m&agrave; đặc trưng l&agrave; x&atilde; hội thuộc địa nửa phong kiến ở Việt Nam nửa đầu thế kỷ XX. Với một số lượng kh&aacute; lớn như vậy, truyện ngắn của Nguyễn C&ocirc;ng Hoan họp lại th&agrave;nh một bức tranh rộng lớn, kh&aacute; đầy đủ về x&atilde; hội cũ.</p>\r\n\r\n<p>Về nghệ thuật viết truyện ngắn, phải n&oacute;i rằng Nguyễn C&ocirc;ng Hoan l&agrave; người c&oacute; nhiều khả năng v&agrave; kinh nghiệm. Truyện của &ocirc;ng thường rất ngắn. Lời văn kh&uacute;c triết, giản dị. Cốt truyện được dẫn dắt một c&aacute;ch c&oacute; nghệ thuật v&agrave; kết cục thường rất đột ngột để hấp dẫn người đọc. Mỗi truyện như một m&agrave;n kịch ngắn c&oacute; giới thiệu, thắt n&uacute;t v&agrave; mở n&uacute;t. Ti&ecirc;u biểu l&agrave; c&aacute;c truyện ngắn: K&eacute;p Tư bền, Người ngựa, ngựa người..., tiểu thuyết c&oacute; Bước đường c&ugrave;ng...</p>\r\n\r\n<p>Ngay từ khi xuất hiện, Nguyễn C&ocirc;ng Hoan lu&ocirc;n g&acirc;y được sự ch&uacute; &yacute;, quan t&acirc;m của giới nghi&ecirc;n cứu, ph&ecirc; b&igrave;nh v&agrave; nhiều thế hệ độc giả. Mặc d&ugrave; c&oacute; nhiều người khen kẻ ch&ecirc;, nhưng truyện ngắn truyện d&agrave;i của Nguyễn C&ocirc;ng Hoan sừng sững tạo th&agrave;nh một thế Tam Đảo, Ba V&igrave; h&ugrave;ng vĩ.</p>\r\n\r\n<p>Trong thời tiền chiến, ai m&agrave; chẳng đọc qua c&aacute;c quyển: Tắt lửa l&ograve;ng, Bước đường c&ugrave;ng, Tấm l&ograve;ng v&agrave;ng, C&ocirc; gi&aacute;o Minh, Tr&ecirc;n đường sự nghiệp, Lệ Dung, Nợ nần, Bơ vơ, v. v...</p>\r\n\r\n<p>Hơn nữa, một số t&aacute;c phẩm của &ocirc;ng đ&atilde; được v&agrave; Đo&agrave;n Kịch nghệ nổi tiếng thời ấy ph&oacute;ng t&aacute;c th&agrave;nh tuồng cải lương, lưu diễn từ Nam ch&iacute; Bắc v&agrave; được đồng b&agrave;o c&aacute;c giới t&aacute;n thưởng nồng nhiệt!</p>\r\n\r\n<p>&Ocirc;ng s&aacute;ng t&aacute;c đủ mọi chiều hướng: Trữ t&igrave;nh, X&atilde; hội, Tranh đấu, Gi&aacute;o dục,... nhưng c&oacute; một điểm nổi bật hơn hết l&agrave; mỗi t&aacute;c phẩm của &ocirc;ng đều mang một sắc th&aacute;i đặc biệt... đ&aacute;nh dấu một bước tiến mới cho bộ m&ocirc;n tiểu thuyết thời ấy.</p>\r\n\r\n<p>Nhưng, từ 20 năm qua... những t&aacute;c phẩm của &ocirc;ng hầu hết bị thất lạc, bị mai một v&igrave; nạn Đất Nước qua ph&acirc;n!***</p>\r\n\r\n<p>Anh em rất ngạc nhi&ecirc;n về c&aacute;i th&aacute;i độ của Nghị Lại chịu nước l&eacute;p. Thấy sự đo&agrave;n kết rất c&oacute; c&ocirc;ng hiệu, Dự trỏ v&agrave;o đống l&uacute;a xếp đầy s&acirc;n:</p>\r\n\r\n<p>- Đ&aacute;ng lẽ mẫu bảy th&oacute;c của anh Thi với anh San đ&atilde; v&agrave;o t&uacute;i tham kh&ocirc;ng đ&aacute;y hết cả.</p>\r\n\r\n<p>Pha lo ngại:</p>\r\n\r\n<p>- Nhưng quyết hắn trả th&ugrave;, m&agrave; th&ugrave; n&agrave;y phải biết hắn t&iacute;nh to&aacute;n kỹ lưỡng lắm.</p>\r\n\r\n<p>Thi gật đầu:</p>\r\n\r\n<p>- Cho n&ecirc;n h&ocirc;m n&agrave;o l&uacute;a của anh ch&iacute;n, ta n&ecirc;n rủ người đi cho đ&ocirc;ng, v&agrave; phải cẩn thận lắm, kẻo thua mất.</p>\r\n\r\n<p>San xua tay:</p>\r\n\r\n<p>- Nếu t&aacute;m s&agrave;o của anh Pha bị hắn cướp hết th&igrave; th&oacute;c của ch&uacute;ng m&igrave;nh gặt về, đem chia ba.</p>\r\n\r\n<p>Mấy anh em rất cảm động. Một l&aacute;t Pha n&oacute;i:</p>\r\n\r\n<p>- B&aacute;c trưng bảo rằng thua, nhưng t&ocirc;i cho l&agrave; kh&ocirc;ng đ&uacute;ng. Ch&uacute;ng m&igrave;nh ba lần gặt, đ&atilde; được đến hai lần, d&ugrave; c&oacute; thua một lần ta cũng vẻ vang qu&aacute; rồi.</p>\r\n\r\n<p>Dự tiếp:</p>\r\n\r\n<p>- Như thế tức l&agrave; đằng n&agrave;o m&igrave;nh cũng giữ phần thắng lợi rồi.</p>\r\n\r\n<p>Bốn người cười vui vẻ, nghỉ tay để uống nước. B&aacute;t ch&egrave; tươi s&oacute;ng s&aacute;nh dưới &aacute;nh trăng. Tiếng th&igrave;nh thịch đập l&uacute;a ở s&acirc;n c&aacute;c nh&agrave; theo luồng gi&oacute; lạnh hiu hắt đưa đi l&agrave;m cho l&agrave;ng An Đạo c&oacute; vẻ hoạt động.</p>\r\n\r\n<p>Một l&aacute;t, San n&oacute;i:</p>\r\n\r\n<p>- Từ nay ch&uacute;ng ta phải giữ m&igrave;nh. Hắn c&oacute; đến hằng trăm thứ kh&iacute; giới, m&agrave; ta chỉ c&oacute; trơ mỗi đứa hai c&aacute;nh tay kh&ocirc;ng.</p>\r\n\r\n<p>Dự đ&aacute;p:</p>\r\n\r\n<p>- Nhưng hai c&aacute;nh tay mạnh mẽ, hai c&aacute;nh tay l&agrave;m cho đất c&aacute;t c&oacute; gi&aacute; trị.</p>', 19, 1, 0, 5, '2024-09-21 10:13:44', '2024-09-24 11:00:12', 16, 1, 1),
(25, 'MS91869119', 'BÀ CHÚA HÒN', 'Sơn Nam', 158, 1989, 5, 5, 'https://drive.google.com/drive/u/1/folders/198k6t-KA_8BQpKPXTCfHSOe6eD4JwXjw', 99000, '<p>Cuốn tiểu thuyết B&agrave; Ch&uacute;a H&ograve;n mang m&agrave;u sắc lịch sử v&agrave; kh&ocirc;ng kh&iacute; miệt vườn</p>\r\n\r\n<p>Lối dẫn dắt tự nhi&ecirc;n, ng&ocirc;n ngữ mộc mạc đậm chất Nam Bộ</p>\r\n\r\n<p>Kh&ocirc;ng chỉ mang gi&aacute; trị nghệ thuật, t&aacute;c phẩm c&ograve;n l&agrave; những b&agrave;i học s&acirc;u sắc về t&igrave;nh người***</p>\r\n\r\n<p>Buổi chiều đầu m&ugrave;a mưa, cảnh vật buồn b&atilde; l&agrave;m sao! Ếch nh&aacute;i k&ecirc;u vang b&ecirc;n ch&ograve;i, trong b&oacute;ng tối chập chờn, xa lắm qua rặng c&acirc;y tr&agrave;m mới thấy v&agrave;i &aacute;nh đ&egrave;n. Ở tr&ecirc;n h&ograve;n l&agrave; đ&oacute;i, kh&oacute; c&agrave;y cấy trồng tỉa. Bởi vậy Tư Th&iacute;nh đến tận v&ugrave;ng s&igrave;nh lầy m&agrave; chịu đựng muỗi m&ograve;ng.</p>\r\n\r\n<p>- Ng&agrave;y mai cho con ra ruộng nghe ba!</p>\r\n\r\n<p>Tư Th&iacute;nh day lại. Đứa con g&aacute;i vừa l&ecirc;n t&aacute;m tuổi bưng ch&eacute;n cơm đến gần. Ch&uacute; vuốt t&oacute;c con, b&ugrave;i ng&ugrave;i thương x&oacute;t. Mẹ n&oacute; mất hồi năm ngo&aacute;i. Ng&agrave;y n&agrave;o cũng vậy, trước khi ra ruộng, ch&uacute; bới sẵn ch&eacute;n cơm, gắp khứa c&aacute; để trong c&aacute;i đĩa nhỏ. Khi thức dậy, đứa con ăn cơm một m&igrave;nh rồi ra ngồi ở g&oacute;c s&acirc;n, tr&ocirc;ng ra ruộng.</p>\r\n\r\n<p>Cuốn tiểu thuyết &quot;B&agrave; ch&uacute;a h&ograve;n&quot; bắt đầu như thế với nh&acirc;n vật c&ocirc; b&eacute; t&ecirc;n Hu&ocirc;i. Số phận đ&atilde; sắp đặt cho c&ocirc;, khi lớn l&ecirc;n, sẽ trở th&agrave;nh b&agrave; ch&uacute;a H&ograve;n.</p>\r\n\r\n<p>H&ograve;n Ch&ocirc;ng l&agrave; d&atilde;y đồi thấy, s&aacute;t m&eacute; biển vịnh Xi&ecirc;m La. D&acirc;n ch&uacute;ng sống bằng nghề ch&aacute;i lưới ở m&eacute; biển nhưng nguồn lợi lớn nhất vẫn l&agrave; nghề trồng hồ ti&ecirc;u. &Ocirc;ng X&igrave;n Ph&oacute;c l&agrave; người Triều Ch&acirc;u lai Cao Mi&ecirc;n, trở th&agrave;nh &ocirc;ng Ch&uacute;a H&ograve;n đầu ti&ecirc;n, sau khi &ocirc;ng chết, người kế vị l&agrave; con trai &ocirc;ng, Hai Minh. B&aacute; Vạn l&agrave; người nắm giữ sổ s&aacute;ch thu chi cho Hai Minh. &Ocirc;ng n&agrave;y l&agrave; người Triều Ch&acirc;u lai Việt Nam, tuổi chừng 60, lắm mưu nhiều kế, c&oacute; &yacute; định giết &ocirc;ng Ch&uacute;a H&ograve;n, lật con b&agrave; cả để d&agrave;nh tất cả t&agrave;i sản về tay m&igrave;nh.</p>\r\n\r\n<p>Mười mấy năm tr&ocirc;i qua, nay Hu&ocirc;i đ&atilde; trở th&agrave;nh hoa kh&ocirc;i trong v&ugrave;ng, xinh đẹp tuyệt trần, v&oacute;c d&aacute;ng cao r&aacute;o, nước da trắng mịn, tr&aacute;n cao, m&ocirc;i đỏ như thoa son... B&aacute; Vạn muốn mượn sắc đẹp của Hu&ocirc;i để lung lạc &ocirc;ng Ch&uacute;a H&ograve;n...</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Sơn Nam (1926 - 2008) l&agrave; một nh&agrave; văn, nh&agrave; b&aacute;o, nh&agrave; nghi&ecirc;n cứu văn h&oacute;a Việt Nam nổi tiếng với nhiều t&aacute;c phẩm c&oacute; gi&aacute; trị.</p>\r\n\r\n<p>Với khối lượng t&aacute;c phẩm đồ sộ, &ocirc;ng l&agrave; người th&agrave;nh c&ocirc;ng ở nhiều lĩnh vực: lĩnh vực nghi&ecirc;n cứu, &ocirc;ng c&oacute; nhiều bi&ecirc;n khảo c&ocirc;ng phu, khoa học, khoảng 20 t&aacute;c phẩm. C&oacute; những t&aacute;c phẩm rất c&oacute; gi&aacute; trị cho việc t&igrave;m hiểu về v&ugrave;ng đất Nam Bộ, như: &ldquo;Ấn tượng 300 năm, Bến Ngh&eacute; xưa, C&aacute; t&iacute;nh miền Nam, Danh thắng miền Nam, Đất Gia Định xưa, Đồng bằng s&ocirc;ng Cửu Long - N&eacute;t sinh hoạt xưa, Giới thiệu S&agrave;i G&ograve;n xưa, Lịch sử An Giang, Lịch sự khẩn hoang miền Nam, Người S&agrave;i G&ograve;n...</p>\r\n\r\n<p>&ldquo;Sơn Nam l&agrave; một trong số những nh&agrave; văn từng sống ở đ&ocirc; thị miền Nam nhưng t&aacute;c phẩm vẫn được in liền mạch sau giải ph&oacute;ng, điều đ&oacute; kh&ocirc;ng phải dễ. Trước hết, t&aacute;c phẩm của Sơn Nam kh&ocirc;ng thuộc dạng a dua. Sống dưới chế độ ấy m&agrave; tr&aacute;nh được lối viết ấy quả l&agrave; rất cao tay. C&oacute; lần người viết b&agrave;i n&agrave;y hỏi vậy, Sơn Nam cười nhẹ, cũng chẳng giỏi giang g&igrave; đ&acirc;u m&agrave; t&ocirc;i chủ yếu viết về phong tục, về lịch sử khai khẩn đất đai Nam Bộ, v&agrave; nếu l&agrave; truyện th&igrave; đi v&agrave;o tầng lớp n&ocirc;ng d&acirc;n, d&acirc;n ngh&egrave;o th&agrave;nh thị.</p>\r\n\r\n<p>Hơn nửa thế kỷ gắn b&oacute; với nghiệp s&aacute;ng t&aacute;c, những trang viết của &ocirc;ng kh&ocirc;ng đơn thuần l&agrave; sự giải tr&iacute; cho độc giả m&agrave; c&ograve;n l&agrave; những khảo cứu, kh&aacute;m ph&aacute; về mảnh đất phương Nam. L&agrave; người Nam Bộ ch&iacute;nh gốc n&ecirc;n nh&agrave; văn Sơn Nam l&agrave; người am hiểu qu&aacute; tr&igrave;nh h&igrave;nh th&agrave;nh dải đất n&agrave;y. Những s&aacute;ng t&aacute;c của &ocirc;ng mang hơi thở của thi&ecirc;n nhi&ecirc;n, của văn h&oacute;a v&agrave; con người Nam Bộ được thể hiện qua giọng văn giản dị, mộc mạc...&rdquo;</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>B&agrave; Ch&uacute;a H&ograve;n PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Sơn Nam</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 9, 0, 0, 0, '2024-09-21 10:18:22', '2024-09-30 09:41:03', 16, 1, 9),
(26, 'MS67663881', 'HUYỀN THOẠI MỞ ĐẤT', 'Trần Hiền Ân', 90, 2002, 5, 5, NULL, 79000, '<p>Huyền thoại mở đất đưa bạn đọc đến những địa danh ở v&ugrave;ng thượng du miền Trung, những bu&ocirc;n l&agrave;ng tr&ecirc;n n&uacute;i cao quanh năm phải sống nhờ v&agrave;o s&ocirc;ng, n&uacute;i. Đằng sau cuộc sống thường ng&agrave;y của họ l&agrave; những huyền thoại ly kỳ, hấp dẫn kh&ocirc;ng nhiều người biết đến. Mỗi d&acirc;n tộc đều c&oacute; những n&eacute;t đẹp văn h&oacute;a đặc trưng, rất ri&ecirc;ng v&agrave; &yacute; nghĩa, đ&oacute; l&agrave; l&yacute; do t&aacute;c giả mang đến cho bạn đọc c&aacute;i nh&igrave;n cận cảnh về phong tục tập qu&aacute;n của những d&acirc;n tộc v&ugrave;ng cao. H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; qua tập truyện để biết đất nước ta v&ocirc; c&ugrave;ng tươi đẹp, hiểu hơn về cuộc sống của đồng b&agrave;o miền n&uacute;i v&agrave; hơn cả l&agrave; bồi đắp th&ecirc;m t&igrave;nh y&ecirc;u qu&ecirc; hương, đất nước.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Huyền Thoại Mở Đất PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Trần Hiền &Acirc;n</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 9, 0, 1, 5, '2024-09-21 10:22:24', '2024-09-30 10:14:37', 13, 1, 13),
(27, 'MS19415253', 'CHUYỆN HOA CHUYỆN QUẢ', 'Phạm Hổ', 150, 2020, 2, 2, NULL, 55000, '<p>T&ocirc;i nghĩ rằng anh Phạm Hổ trước hết đ&atilde; l&agrave;m được một điều rất hay rất qu&yacute;: anh đ&atilde; học được sự ngạc nhi&ecirc;n chưa từng bị b&agrave;o m&ograve;n v&agrave; đ&aacute;nh mất của c&aacute;c em&hellip; Đối với thế giới bộn bề xung quanh hằng ng&agrave;y, anh c&ograve;n giữ được c&acirc;u hỏi &ldquo;Tại sao? Tại sao?...&rdquo; kh&ocirc;ng c&ugrave;ng như một đứa b&eacute; ngơ ng&aacute;c&hellip;&rdquo;</p>\r\n\r\n<p>- Nh&agrave; văn Nguy&ecirc;n Ngọc -</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Chuyện Hoa Chuyện Quả PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Phạm Hổ</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 6, 0, 0, 5, '2024-09-21 10:24:35', '2024-09-30 10:25:50', 1, 1, 12);
INSERT INTO `sach` (`id_Sach`, `maSach`, `tenSach`, `tenTacGia`, `soTrang`, `namXuatBan`, `soLuongHienCo`, `soLuongCoSan`, `fileSach`, `giaTien`, `ghiChu`, `luotXem`, `luotDoc`, `luotMuon`, `danhGiaTrungBinh`, `ngayTaoSach`, `ngaySuaSach`, `id_NhaXuatBan`, `id_NgonNgu`, `id_ViTri`) VALUES
(28, 'MS76075631', 'GIVE AND TAKE - CHO VÀ NHẬN', 'Adam Grant', 453, 2009, 4, 4, 'https://drive.google.com/drive/u/1/folders/1dWfgR-MfDw_4U6u9L-U1pM5xRNFNspb9', 399000, '<p>GIVE AND TAKE CHO &amp; NHẬN</p>\r\n\r\n<p>Th&agrave;nh c&ocirc;ng l&agrave; điều m&agrave; tất cả ch&uacute;ng ta đều mong muốn. C&oacute; rất nhiều c&aacute;ch để th&agrave;nh c&ocirc;ng v&agrave; mỗi người c&oacute; một c&aacute;ch cho ri&ecirc;ng m&igrave;nh. S&aacute;ch về b&iacute; quyết th&agrave;nh c&ocirc;ng c&oacute; rất nhiều nhưng hầu hết c&aacute;c b&iacute; quyết ấy lại kh&ocirc;ng c&oacute; một b&iacute; quyết rất đặc biệt: Cho đi. &Iacute;t ai đồng &yacute; v&agrave; nhận ra rằng ta sẽ th&agrave;nh c&ocirc;ng khi biết cho đi, biết gi&uacute;p đỡ người kh&aacute;c c&ugrave;ng th&agrave;nh c&ocirc;ng, khi ấy ta th&agrave;nh c&ocirc;ng hơn cả th&agrave;nh c&ocirc;ng. Nhưng thường, ta chỉ thấy rằng những người gi&uacute;p đỡ người kh&aacute;c thường chịu thiệt th&ograve;i, chẳng những kh&ocirc;ng được đ&aacute;p lại m&agrave; c&ograve;n nhận nhiều sự phiền h&agrave; về bản th&acirc;n m&igrave;nh.</p>\r\n\r\n<p>Cho &amp; Nhận sẽ gi&uacute;p bạn c&oacute; c&aacute;i nh&igrave;n kh&aacute;c đi về cho v&agrave; nhận, nhất l&agrave; trong lĩnh vực kinh doanh, một lĩnh vực m&agrave; kh&aacute;i niệm &ldquo;Cho&rdquo; chưa được thừa nhận như l&agrave; một c&aacute;ch để th&agrave;nh c&ocirc;ng. Cho khế nhận v&agrave;ng l&agrave; quyển s&aacute;ch đặc biệt của Adam Grant. Từ thực tiễn giảng dạy của m&igrave;nh, Adam Grant - khi ấy đang l&agrave; gi&aacute;o sư trẻ nhất của ng&ocirc;i trường Wharton danh gi&aacute; - đ&atilde; kiểm chứng nguy&ecirc;n nh&acirc;n mang lại th&agrave;nh c&ocirc;ng cũng như dẫn đến thất bại của mỗi người. Anh đ&atilde; ph&acirc;n chia ra ba nh&oacute;m người ch&iacute;nh dựa theo phong c&aacute;ch h&agrave;nh xử: những người chỉ biết đến lợi &iacute;ch bản th&acirc;n, những người lu&ocirc;n hết l&ograve;ng v&igrave; người kh&aacute;c v&agrave; những người dung h&ograve;a.</p>\r\n\r\n<p>Trong khi những người chỉ biết lợi &iacute;ch bản th&acirc;n ra sức gi&agrave;nh lấy phần c&oacute; lợi nhất về m&igrave;nh, những người dung h&ograve;a hướng đến việc trao đổi lợi &iacute;ch, th&igrave; những người lu&ocirc;n hết l&ograve;ng v&igrave; người kh&aacute;c lại ho&agrave;n to&agrave;n kh&aacute;c biệt - họ lu&ocirc;n cố gắng gi&uacute;p đỡ mọi người m&agrave; kh&ocirc;ng cần bất cứ sự đền đ&aacute;p n&agrave;o. Đ&acirc;y cũng ch&iacute;nh l&agrave; ch&igrave;a kh&oacute;a mang lại th&agrave;nh c&ocirc;ng cho họ - những người lu&ocirc;n hết m&igrave;nh v&igrave; người kh&aacute;c.</p>\r\n\r\n<p>Được giới chuy&ecirc;n m&ocirc;n, bao gồm cả những t&ecirc;n tuổi như Dan Pink, Tony Hsieh, Dan Ariely, Susan Cain, Robert Cialdini,&hellip; cũng như đội ngũ l&atilde;nh đạo của những tập đo&agrave;n lừng danh như Google, McKinsey, Merck, Est&eacute;e Lauder, Nike, v&agrave; cả NASA đ&aacute;nh gi&aacute; cao. Cho khế nhận v&agrave;ng thực sự l&agrave; một cuốn cẩm nang dạy ta c&aacute;ch thức l&agrave;m việc, h&agrave;nh xử sao cho đạt hiệu quả cao nhất, với hiệu quả kh&ocirc;ng giới hạn cho một c&aacute; nh&acirc;n n&agrave;o, m&agrave; bao phủ l&ecirc;n th&agrave;nh c&ocirc;ng của tổ chức cũng như cộng đồng.</p>', 5, 0, 0, 3, '2024-09-21 10:27:16', '2024-10-01 14:06:15', 12, 2, 9),
(29, 'MS80157495', 'NHÀ CHỬ', 'Tô Hoài', 112, 2015, 9, 8, 'https://drive.google.com/drive/u/1/folders/1LUc5wY0Ze_HLnyP19bV4Uk1pyo_7Ch0W', 129000, '<p>&ldquo;Nh&agrave; Chử&rdquo; l&agrave; cuốn tiểu thuyết lịch sử viết cho thiếu nhi về thời hồng hoang dựng nước, dựa tr&ecirc;n truyền thuyết d&acirc;n gian quen thuộc về ch&agrave;ng trai ngh&egrave;o họ Chử v&agrave; n&agrave;ng c&ocirc;ng ch&uacute;a Ti&ecirc;n Dung. &ldquo;Nh&agrave; Chử&rdquo; đ&atilde; được nh&agrave; văn T&ocirc; Ho&agrave;i ph&aacute;t triển th&agrave;nh một t&aacute;c phẩm văn học c&oacute; gi&aacute; trị.</p>\r\n\r\n<p>Bằng những hiểu biết hết sức phong ph&uacute; v&agrave; s&acirc;u sắc về phong tục, tập qu&aacute;n, văn ho&aacute; cổ xưa cũng như tr&iacute; tưởng tượng dồi d&agrave;o của t&aacute;c giả, qua những trang văn đầy s&aacute;ng tạo v&agrave; sinh động, bạn đọc sẽ được gặp gỡ những người thực m&agrave; kh&ocirc;ng thực, những con người của thế giới huyền thoại diệu k&igrave;... Dưới b&uacute;t ph&aacute;p t&agrave;i nghệ, những nh&acirc;n vật uy nghi phi ph&agrave;m bỗng trở n&ecirc;n gần gũi, th&acirc;n thuộc, như hiện ra giữa tr&ograve; chơi của bầy trẻ thơ tr&ecirc;n b&atilde;i cỏ, bờ đ&ecirc;...</p>\r\n\r\n<p>Nh&agrave; l&iacute; luận ph&ecirc; b&igrave;nh Đỗ Ngọc Y&ecirc;n từng chia sẻ: &ldquo;&Ocirc;ng viết giản dị đến mức tự nhi&ecirc;n, như l&agrave; h&iacute;t thở kh&iacute; giời, cơm ăn, nước uống. C&oacute; lẽ trời đ&atilde; ph&uacute; cho &ocirc;ng một bộ &oacute;c quan s&aacute;t tinh tế, một &ldquo;con mắt tinh đời&rdquo;. Từng c&oacute; người nhận x&eacute;t nh&agrave; văn T&ocirc; Ho&agrave;i l&agrave; người &ldquo;h&oacute;m hỉnh&rdquo;. T&ocirc;i nghĩ, như vậy đ&uacute;ng nhưng chưa đủ, m&agrave; phải l&agrave; một nh&agrave; văn &ldquo;h&oacute;m lẹm&rdquo;. &Ocirc;ng chỉ cần viết ra những c&aacute;i &ocirc;ng quan s&aacute;t thấy, như kh&ocirc;ng cần văn chương ch&uacute;t n&agrave;o, kh&ocirc;ng cần hư cấu th&ecirc;m mắm th&ecirc;m muối g&igrave; cũng đ&atilde; l&agrave; văn rồi, một thứ văn vừa h&agrave;i hước, sắc sảo v&agrave; s&acirc;u cay, nhưng vẫn gần gũi với đời sống thực diễn ra hằng ng&agrave;y.&rdquo;</p>', 16, 1, 1, 0, '2024-09-21 10:33:27', '2024-10-01 13:49:49', 1, 1, 9),
(30, 'MS48734208', 'KIẾN THÚC VUI VỀ CƠ THỂ CON NGƯỜI', 'Nguyễn Minh Tiến', 110, 2016, 10, 10, NULL, 59000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Kiến Th&uacute;c Vui Về Cơ Thể Con Người PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Minh Tiến</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 1222, 0, 0, 0, '2024-09-21 10:36:46', '2024-10-06 11:34:14', 12, 1, 15),
(31, 'MS51162052', 'BÍ QUYẾT ĐỂ CÓ MỘT CUỘC SỐNG KHỎE MẠNH', 'David Niven', 220, 2012, 6, 6, NULL, 119000, '<p>Ai đ&atilde; từng n&oacute;i rằng kh&ocirc;ng c&oacute; một sự vĩ đại n&agrave;o trong một cơ thể đau yếu. Liệu bạn c&oacute; được sự minh mẫn, &oacute;c s&aacute;ng tạo, khi bạn đang phải g&aacute;nh chịu nỗi đau đớn thường xuy&ecirc;n v&igrave; bệnh tật? Với mong muốn mang đến cho bạn đọc một c&aacute;i nh&igrave;n s&acirc;u sắc, to&agrave;n diện hơn để cải thiện v&agrave; bảo vệ sức khỏe, tiến sĩ David Niven đ&atilde; tổng kết những kết quả nghi&ecirc;n cứu của c&aacute;c nh&agrave; khoa học v&agrave; cả kinh nghiệm sống của m&igrave;nh v&agrave;o cuốn s&aacute;ch n&agrave;y.</p>\r\n\r\n<p>C&aacute;c bạn c&oacute; thể bắt gặp trong cuốn s&aacute;ch n&agrave;y những kinh nghiệm được soi chiếu từ nhiều g&oacute;c cạnh kh&aacute;c nhau của cuộc sống. Từ việc lựa chọn thực phẩm, đến c&aacute;ch ăn uống, c&aacute;ch ngủ như thế n&agrave;o cho tốt, thậm ch&iacute; ngay cả c&aacute;ch tư duy, c&aacute;ch l&agrave;m việc v&agrave; những mối quan hệ kh&aacute;c nhau cũng được đề cập đến trong mối tương quan với sức khỏe con người. Tất cả những điều đ&oacute; đều ảnh hưởng quan trọng đến sức khỏe của ch&uacute;ng ta. Bạn cũng c&oacute; thể t&igrave;m thấy ở đ&acirc;y những b&iacute; quyết hết sức gản dị m&agrave; thường ng&agrave;y bạn kh&ocirc;ng ph&aacute;t hiện ra c&ugrave;ng với những kiến thức khoa học bất ngờ v&agrave; th&uacute; vị.</p>', 3, 0, 0, 0, '2024-09-21 10:42:04', '2024-10-03 11:25:27', 12, 2, 15),
(32, 'MS34303630', '101 CÁCH DẠY CON THÀNH TÀI', 'Trần Đại Vĩ', 226, 2018, 5, 5, 'https://drive.google.com/drive/u/1/folders/1N24cLgp5hRl15do4zO4GsS43p8zUZPwt', 189000, '<p>L&agrave;m cha mẹ, ai cũng mong muốn con m&igrave;nh trở th&agrave;nh người t&agrave;i giỏi. Cuốn &ldquo;101 c&aacute;ch dạy con th&agrave;nh t&agrave;i&rdquo; hướng dẫn tỉ mỉ từng bước cho bạn c&aacute;ch gi&uacute;p con m&igrave;nh th&agrave;nh đạt. Cuốn s&aacute;ch gồm 4 chương, mỗi chương được chia th&agrave;nh những phần nhỏ.</p>\r\n\r\n<p>Chương I: Hướng dẫn bạn c&aacute;ch gi&aacute;o dục con, n&ecirc;u l&ecirc;n vai tr&ograve; quan trọng của cha mẹ trong gi&aacute;o dục con c&aacute;i, chỉ ra tầm quan trọng của khen ngợi, sự ph&aacute;t triển tiềm năng v&agrave; thi&ecirc;n chất của con trẻ, r&egrave;n luyện t&iacute;nh tự trọng của con trẻ, n&ecirc;n trao đổi tr&ograve; chuyện với con c&aacute;i như thế n&agrave;o? N&ecirc;u một số phương ph&aacute;p gi&aacute;o dục con v&agrave; một số đặc trưng t&acirc;m l&yacute; của con trẻ trong c&aacute;c giai đoạn, những biện ph&aacute;p giao lưu c&oacute; hiệu quả giữa bố mẹ v&agrave; con c&aacute;i, biện ph&aacute;p khuyến kh&iacute;ch con trẻ, phương ph&aacute;p ph&ecirc; b&igrave;nh&hellip;</p>', 10, 0, 0, 0, '2024-09-21 10:45:21', '2024-10-01 13:37:54', 17, 1, 15),
(33, 'MS61986185', 'DANH NHÂN VĂN HÓA VIỆT NAM', 'Lê Minh Quốc', 253, 1999, 9, 9, 'https://drive.google.com/drive/u/1/folders/1UMLsMyODE3iwTyLzKw0InnqB0WbFMW81', 119000, '<p>Phong tục Bắc Nam cũng kh&aacute;c</p>\r\n\r\n<p>Điều n&agrave;y khẳng định, nước ta vốn c&oacute; truyền thống văn h&oacute;a l&acirc;u đời. D&ugrave; c&aacute;c thế lực ngoại x&acirc;m từ h&agrave;ng ng&agrave;n năm nay đ&atilde; thực hiện ch&iacute;nh s&aacute;ch đồng h&oacute;a về mọi mặt nhưng cuối c&ugrave;ng chỉ chuốc lại sự bại vong. Sức mạnh văn h&oacute;a của d&acirc;n tộc ta bền bỉ, trường tồn như sức sống của một d&acirc;n tộc. Những gi&aacute; trị vật chất v&agrave; tinh thần do tiền nh&acirc;n s&aacute;ng tạo ra trong qu&aacute; tr&igrave;nh lịch sử m&atilde;i m&atilde;i l&agrave; niềm tự h&agrave;o của c&aacute;c thế hệ sau.</p>\r\n\r\n<p>Trong tập s&aacute;ch n&agrave;y ch&uacute;ng t&ocirc;i cố gắng n&ecirc;u bật c&ocirc;ng đức của c&aacute;c danh nh&acirc;n như anh h&ugrave;ng d&acirc;n tộc Nguyễn Tr&atilde;i. Khi đ&aacute;nh giặc, &ocirc;ng đ&atilde; c&ugrave;ng L&ecirc; Lợi đ&atilde; vận dụng sức mạnh của văn h&oacute;a d&acirc;n tộc:</p>\r\n\r\n<p>Việc nh&acirc;n nghĩa cốt ở y&ecirc;n d&acirc;n</p>\r\n\r\n<p>Qu&acirc;n điếu phạt trước lo trừ bạo để đạt mục đ&iacute;ch cuối c&ugrave;ng l&agrave; &ldquo;X&atilde; tắc từ đ&acirc;y bền vững&rdquo;. Trong số c&aacute;c nh&acirc;n vật được UNESCO c&ocirc;ng nhận Danh nh&acirc;n văn h&oacute;a thế giới, ngo&agrave;i Nguyễn Tr&atilde;i ch&uacute;ng t&ocirc;i c&ograve;n đề cập đến thi h&agrave;o Nguyễn Du - người đ&atilde; để lại một t&aacute;c phẩm c&oacute; gi&aacute; trị l&agrave; vi&ecirc;n ngọc qu&yacute; Truyện Kiều, kh&ocirc;ng chỉ l&agrave;m rạng rỡ nền văn h&oacute;a nước nh&agrave; m&agrave; c&ograve;n c&oacute; tiếng vang tr&ecirc;n thế giới; Chủ tịch Hồ Ch&iacute; Minh - một vĩ nh&acirc;n lỗi lạc của thế kỷ XX m&agrave; cố Tổng B&iacute; thư L&ecirc; Duẩn đ&atilde; ph&aacute;t biểu: &ldquo;D&acirc;n tộc ta, nh&acirc;n d&acirc;n ta, non s&ocirc;ng đất nước ta đ&atilde; sinh ra Hồ Chủ tịch, người anh h&ugrave;ng d&acirc;n tộc vĩ đại, v&agrave; ch&iacute;nh Người đ&atilde; l&agrave;m rạng rỡ d&acirc;n tộc ta, nh&acirc;n d&acirc;n ta v&agrave; non s&ocirc;ng đất nước ta&rdquo;.</p>\r\n\r\n<p>Trong nhiều giai đoạn kh&aacute;c nhau của lịch sử, ch&uacute;ng t&ocirc;i đề cập đến danh nh&acirc;n Phạm Đ&igrave;nh Hổ - t&aacute;c giả của nhiều c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu c&oacute; gi&aacute; trị về lịch sử, ng&ocirc;n ngữ, đại l&yacute;, thơ ca&hellip; m&agrave; l&acirc;u nay ch&uacute;ng ta chỉ mới biết qua Vũ trung t&ugrave;y b&uacute;t. Tiếp theo, ch&uacute;ng t&ocirc;i đề cập đến Nguyễn Khuyến - thi sĩ số một của l&agrave;ng qu&ecirc;, của m&ugrave;a thu Việt Nam v&agrave; cũng l&agrave; c&acirc;y b&uacute;t tr&agrave;o ph&uacute;ng xuất sắc nhất thời đại m&agrave; &ocirc;ng đ&atilde; sống. B&ecirc;n cạnh đ&oacute;, ch&uacute;ng t&ocirc;i cũng giới thiệu những đ&oacute;ng g&oacute;p của c&aacute;c danh nh&acirc;n kh&aacute;c như nh&agrave; thơ Phan Văn Trị, nghi&ecirc;n cứu Nguyễn Đổng Chi, nh&agrave; văn Nam Cao, họa sĩ Nguyễn Phan Ch&aacute;nh&hellip; với những c&ocirc;ng tr&igrave;nh c&oacute; gi&aacute; trị l&acirc;u bền trong kho t&agrave;ng văn h&oacute;a của nước nh&agrave;.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i cũng kh&ocirc;ng qu&ecirc;n đến nh&agrave; thơ tr&agrave;o ph&uacute;ng T&uacute; Xương - người đ&atilde; để lại một sự nghiệp văn học để tạo n&ecirc;n cốt c&aacute;ch tr&agrave;o ph&uacute;ng v&agrave; trữ t&igrave;nh m&agrave; &iacute;t nh&agrave; thơ n&agrave;o s&aacute;nh kịp. Trong số c&aacute;c &ldquo;m&ocirc;n đệ&rdquo; của T&uacute; Xương, ch&uacute;ng t&ocirc;i giới thiệu nh&agrave; thơ T&uacute; Mỡ - một c&acirc;y b&uacute;t tr&agrave;o ph&uacute;ng rất nổi tiếng tr&ecirc;n văn đ&agrave;n những năm 1930 của thế kỷ XX. Tiếng cười độc đ&aacute;o của &ocirc;ng l&agrave; biết kế thừa c&aacute;i hay của c&aacute;c thi sĩ đ&agrave;n anh v&agrave; vận dụng ca dao, tục ngữ. Điều l&agrave;m n&ecirc;n t&ecirc;n tuổi T&uacute; Mỡ l&agrave; &ocirc;ng đ&atilde; cười rất &aacute;c v&agrave;o c&aacute;i &ocirc;ng nghị... gật m&agrave; trước v&agrave; sau &ocirc;ng chưa c&oacute; ai vượt qua nổi!</p>\r\n\r\n<p>Trong tập s&aacute;ch n&agrave;y, ch&uacute;ng t&ocirc;i c&ograve;n viết về b&aacute;c Ba Phi. Năm 2002, một hội thảo khoa học &ldquo;Chuyện kể b&aacute;c Ba Phi&rdquo; được tổ chức tại C&agrave; Mau với 36 tham luận của c&aacute;c học giả, nh&agrave; nghi&ecirc;n cứu trong cả nước. &ldquo;Tựu trung mọi người đều nhất tr&iacute; đ&aacute;nh gi&aacute; chuyện kể của b&aacute;c Ba Phi l&agrave; một di sản văn h&oacute;a phi vật thể của Nam Bộ cần được tr&acirc;n trọng g&igrave;n giữ cho mu&ocirc;n đời sau như ta đ&atilde; g&igrave;n giữ chuyện Trạng Quỳnh, Trạng Lợn... trước đ&acirc;y. C&aacute;c chuyện kể của b&aacute;c Ba Phi bắt nguồn từ sự phong ph&uacute;, gi&agrave;u c&oacute; của sản vật tự nhi&ecirc;n v&ugrave;ng U Minh những ng&agrave;y đầu được người d&acirc;n khai ph&aacute; v&agrave; b&aacute;c Ba Phi chỉ l&agrave; một người n&acirc;ng bức tranh sản vật v&ocirc; c&ugrave;ng phong ph&uacute; ấy l&ecirc;n tầm thẩm mỹ văn học&rdquo; (B&aacute;o Tuổi trẻ chủ nhật số ra ng&agrave;y 8.12.2002). Tương tự, l&agrave;m sao ta c&oacute; thể qu&ecirc;n được Vũ Trọng Phụng, nh&agrave; văn của nhiều t&aacute;c phẩm hiện thực ph&ecirc; ph&aacute;n như Số đỏ, Gi&ocirc;ng tố... v&agrave; nhiều tập ph&oacute;ng sự c&oacute; gi&aacute; trị hiện thực được phong tặng &ldquo;&Ocirc;ng vua ph&oacute;ng sự đất Bắc&rdquo;. Ngo&agrave;i ra, khi viết tiếp những nh&acirc;n vật lừng danh của thế kỷ XX, ch&uacute;ng t&ocirc;i c&ograve;n đề cập đến nh&agrave; triết học Trần Đức Thảo, người đ&atilde; từng tranh luận thắng thế với nh&agrave; văn, nh&agrave; tư tưởng J.P. Sartre tại Paris v&agrave; để lại nhiều t&aacute;c phẩm triết học c&oacute; gi&aacute; trị. L&agrave; nghệ sĩ đa t&agrave;i Văn Cao, người đ&atilde; viết ca kh&uacute;c bất hủ Tiến qu&acirc;n ca, được Quốc hội nước ta chọn l&agrave;m Quốc ca. L&agrave; nh&agrave; d&acirc;n tộc học Từ Chi, người đ&atilde; d&agrave;nh t&acirc;m huyết một đời để nghi&ecirc;n cứu về văn h&oacute;a Mường, về l&agrave;ng x&atilde; Việt Nam đ&atilde; c&oacute; nhiều đ&oacute;ng g&oacute;p to lớn m&agrave; học giả người Ph&aacute;p l&agrave; GS. Georges Condomimas đ&atilde; đ&aacute;nh gi&aacute; l&agrave; &ldquo;một nh&agrave; b&aacute;c học lớn&rdquo; của Việt Nam.</p>\r\n\r\n<p>C&oacute; thể khẳng định c&aacute;c nh&acirc;n vật tr&ecirc;n đều c&oacute; những nỗ lực đ&aacute;ng qu&yacute;, đ&aacute;ng tr&acirc;n trọng trong việc bảo vệ, ph&aacute;t huy di sản văn h&oacute;a của nước nh&agrave; bằng nhiều việc l&agrave;m thiết thực, nghi&ecirc;m t&uacute;c v&agrave; c&oacute; gi&aacute; trị l&acirc;u bền. Điều n&agrave;y c&oacute; &yacute; nghĩa kh&ocirc;ng nhỏ khi ch&uacute;ng ta đang phấn đấu x&acirc;y dựng một nền văn h&oacute;a ti&ecirc;n tiến v&agrave; đậm đ&agrave; bản sắc d&acirc;n tộc. Do khu&ocirc;n khổ tập s&aacute;ch c&oacute; hạn n&ecirc;n ch&uacute;ng t&ocirc;i sẽ tiếp tục đề cập đến nhiều danh nh&acirc;n văn h&oacute;a kh&aacute;c trong những tập sau.</p>\r\n\r\n<p>Nh&acirc;n đ&acirc;y ch&uacute;ng t&ocirc;i xin được nhắc lại, bộ s&aacute;ch KỂ CHUYỆN DANH NH&Acirc;N VIỆT NAM do nh&agrave; thơ L&ecirc; Minh Quốc thực hiện đ&atilde; ph&aacute;t h&agrave;nh c&aacute;c tập: Danh nh&acirc;n qu&acirc;n sự Việt Nam, Danh nh&acirc;n khoa học Việt Nam, C&aacute;c vị Tổ ng&agrave;nh nghề Việt Nam, Danh nh&acirc;n Sư phạm Việt Nam, Danh nh&acirc;n văn h&oacute;a Việt Nam, Nam, C&aacute;c vị nữ danh nh&acirc;n Việt Nam, Những nh&agrave; cải c&aacute;ch Việt Nam, Danh nh&acirc;n c&aacute;ch mạng Việt Nam, Những người Việt Nam đi ti&ecirc;n phong, Những nh&agrave; ch&iacute;nh trị Việt Nam v&agrave; sẽ c&ograve;n ph&aacute;t h&agrave;nh c&aacute;c tập tiếp theo, mời c&aacute;c bạn t&igrave;m đọc. Để bộ s&aacute;ch thật sự hữu &iacute;ch cho bạn đọc - nhất l&agrave; c&aacute;c bạn thanh thiếu ni&ecirc;n- ch&uacute;ng t&ocirc;i rất mong được sự chỉ gi&aacute;o, gi&uacute;p đỡ ch&acirc;n t&igrave;nh của c&aacute;c học giả uy&ecirc;n b&aacute;c, của c&aacute;c nh&agrave; sử học v&agrave; của c&aacute;c bạn đọc xa gần để tập s&aacute;ch ng&agrave;y một ho&agrave;n hảo hơn. Trước hết xin bạn đọc ghi nhận ở đ&acirc;y sự biết ơn s&acirc;u xa của ch&uacute;ng t&ocirc;i.</p>', 944, 157, 1, 5, '2024-09-21 10:54:00', '2024-10-01 14:13:24', 13, 1, 15),
(34, 'MS21708502', 'NHẬT KÝ SEN TRẮNG', 'Cao Huy Thuần', 199, 2010, 15, 15, NULL, 79000, '<p>C&oacute; thể coi đ&acirc;y l&agrave; cuốn gi&aacute;o khoa khuy&ecirc;n dạy đạo đức l&agrave;m người cho con trẻ. Những c&acirc;u chuyện kể sinh động, thiết thực đươc tr&iacute;ch từ văn chương c&aacute;c t&aacute;c gia nổi tiếng, v&agrave; từ những c&acirc;u chuyện tiền th&acirc;n của đức Phật m&agrave; t&aacute;c giả kể lại cho hợp với đạo đức của mọi gia đ&igrave;nh kh&ocirc;ng ph&acirc;n biệt t&iacute;n ngưỡng, văn h&oacute;a, trong sự li&ecirc;n quan đến c&aacute;c vấn đề: Thương y&ecirc;u sự sống; Tranh luận v&agrave; tranh c&atilde;i; N&oacute;i lời h&ograve;a &aacute;i; C&atilde;i v&agrave; im lặng; Cho; N&oacute;i xấu; Tiếng đồn; Trả th&ugrave;; C&ocirc;ng l&yacute;; T&acirc;m hồn cao thượng; Khi&ecirc;m tốn; Biết ơn; Bội bạc; Bền ch&iacute;&hellip;</p>\r\n\r\n<p>Ở c&aacute;i tuổi 15, theo lời của t&aacute;c giả gửi ba mẹ c&aacute;c em, &laquo;suy luận m&agrave; kh&ocirc;ng mở ra th&igrave; con em của qu&yacute; vị kh&ocirc;ng tiến xa được tr&ecirc;n đường học vấn cũng như tr&ecirc;n đường sự nghiệp. Triết học bắt đầu từ tuổi n&agrave;y chứ kh&ocirc;ng phải đợi đến khi l&ecirc;n đại học, bởi v&igrave; triết học bắt đầu l&agrave; đặt vấn đề. T&ograve; m&ograve; khoa học cũng nẩy mầm từ tuổi ấy, bởi v&igrave; từ tuổi ấy c&aacute;i đầu dậy l&ecirc;n c&acirc;u hỏi v&igrave; sao. Cũng vậy, ở c&aacute;i tuổi ấy, nếu c&aacute;c em kh&ocirc;ng biết suy nghĩ về những vấn đề đạo đức th&igrave; kh&ocirc;ng biết đến bao giờ c&aacute;c em mới hiểu được thế n&agrave;o l&agrave; học để l&agrave;m người.&raquo;</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Nhật K&yacute; Sen Trắng PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Cao Huy Thuần</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 560, 0, 1, 0, '2024-09-21 10:56:55', '2024-09-30 10:30:00', 13, 1, 14),
(35, 'MS66561528', 'PHẨM CÁCH QUỐC GIA', 'Fujiwara Masahiko', 120, 2010, 11, 10, 'Fujiwara Masahiko', 59000, '<p>Fujiwara Masahiko l&agrave; nh&agrave; to&aacute;n học, gi&aacute;o sư danh dự Đại học Ochanomizu, đồng thời cũng l&agrave; nh&agrave; ph&ecirc; b&igrave;nh, người viết tiểu luận c&oacute; tiếng tại Nhật Bản. &Ocirc;ng từng dạy ba năm ở đại học của Mĩ, &ldquo;nơi mọi sự được quyết định duy nhất bởi t&aacute;c dụng của sự logic&rdquo;, v&agrave; ngay lập tức say m&ecirc; lối tư duy kiểu Mỹ. Sau một năm sống tại Anh, nơi &ldquo;tập qu&aacute;n, truyền thống, sự th&agrave;nh thật v&agrave; h&agrave;i hước của c&aacute; nh&acirc;n được coi trọng hơn logic, người Anh &ldquo;rất coi trọng truyền thống đến độ họ c&oacute; thể t&igrave;m ra niềm hạnh ph&uacute;c khi họ ở trong căn ph&ograve;ng giống như thời của Newton&rdquo;, Fujiwara Masahiko dần quan t&acirc;m đến vị tr&iacute; của cảm x&uacute;c, h&igrave;nh thức v&agrave; hạ thấp địa vị của l&ocirc;i tư duy logic. Cảm x&uacute;c &ldquo;l&agrave; sự nhớ thương, cảm động - những thứ được tạo ra v&agrave; nu&ocirc;i dưỡng bởi gi&aacute;o dục&rdquo;. H&igrave;nh thức ở đ&acirc;y chủ yếu l&agrave; ti&ecirc;u chuẩn h&agrave;nh động đến từ tinh thần v&otilde; sĩ đạo&rdquo;. Fujiwara Masahiko cho rằng &ldquo;Sau chiến tranh thế giới thứ hai, những người Nhật bị gi&aacute;o dục l&agrave;m cho mất đi l&ograve;ng tự h&agrave;o, sự tự tin đối với Tổ quốc v&agrave; trở n&ecirc;n yếu đuối đ&atilde; qu&ecirc;n hết &ldquo;cảm x&uacute;c v&agrave; h&igrave;nh thức&rdquo; c&oacute; nguồn gốc xa xưa của nước m&igrave;nh, thứ rất đ&aacute;ng tự h&agrave;o trước thế giới v&agrave; b&aacute;n th&acirc;n cho sự &ldquo;logic v&agrave; l&yacute; t&iacute;nh&rdquo; của &Acirc;u Mĩ, thứ đại diện cho kinh tế thị trường.</p>\r\n\r\n<p>V&igrave; vậy, Nhật Bản đ&atilde; mất đi đặc trưng quốc gi&aacute; của m&igrave;nh. Nhật Bản đ&atilde; mất đi &ldquo;phẩm c&aacute;ch của quốc gia&rdquo;. Qu&aacute; tr&igrave;nh to&agrave;n cầu h&oacute;a đang diễn ra hiện nay l&agrave; thứ l&agrave;m cho thế giới trở n&ecirc;n thuần nhất. T&ocirc;i cho rằng người Nhật n&ecirc;n cương quyết chống lại xu hướng n&agrave;y của thế giới. Kh&ocirc;ng được để nước m&igrave;nh trở th&agrave;nh một nước th&ocirc;ng thường.</p>\r\n\r\n<p>Trong thế giới bị cai trị bởi &Acirc;u, Mĩ, n&oacute; phải l&agrave; một nước NHẬT BẢN DUY NG&Atilde; ĐỘC T&Ocirc;N&rdquo;. Với những quan điểm đi ngược lại với xu hướng của số đ&ocirc;ng, PHẨM C&Aacute;CH QUỐC GIA trở th&agrave;nh một cuốn s&aacute;ch mang lại nhiều tranh luận tr&aacute;i chiều, nhưng đồng thời cũng l&agrave; cuốn s&aacute;ch v&ocirc; c&ugrave;ng cuốn h&uacute;t, bằng chứng l&agrave; chỉ trong v&ograve;ng nửa năm sau khi ra s&aacute;ch cuốn s&aacute;ch đ&atilde; b&aacute;n được tr&ecirc;n 2,67 triệu. Đến năm 2006, từ &ldquo;phẩm c&aacute;ch&rdquo; đ&atilde; gi&agrave;nh được giải thưởng cho &ldquo;từ ngữ mới được lưu h&agrave;nh phổ biến&rdquo;.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Phẩm C&aacute;ch Quốc Gia PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Fujiwara Masahiko</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 815, 122, 2, 4, '2024-09-21 11:00:22', '2024-10-07 15:21:24', 19, 2, 4),
(36, 'MS71288926', '100 TRÒ CHƠI DÂN GIAN CHO THIẾU NHI', 'Nguyễn Thị Thanh Thủy', 218, 2012, 10, 10, 'https://drive.google.com/drive/u/1/folders/17Xdj27Q8m0GjvMBx5gX5aK0v-2i4zYKG', 99000, '<p>Cuốn s&aacute;ch &quot;100 Tr&ograve; Chơi D&acirc;n Gian Cho Thiếu Nhi&quot; của NXB Kim Đồng mang lại cho c&aacute;c em thiếu nhi nhiều tr&ograve; chơi d&acirc;n gian hay v&agrave; th&uacute; vị. Mỗi tr&ograve; đều c&oacute; quy luật ri&ecirc;ng, mang những sắc th&aacute;i kh&aacute;c nhau khiến trẻ em chơi suốt ng&agrave;y m&agrave; kh&ocirc;ng thấy ch&aacute;n.</p>\r\n\r\n<p>Tr&ograve; chơi d&acirc;n gian chủ yếu d&agrave;nh cho trẻ em ở c&aacute;c v&ugrave;ng n&ocirc;ng th&ocirc;n n&ecirc;n c&aacute;i t&ecirc;n cũng giản đơn, n&ocirc;m na như t&ecirc;n thằng T&iacute;, con Na, thằng Ốc, c&aacute;i Hến: N&agrave;o l&agrave; đ&aacute;nh đ&aacute;o, đ&aacute;nh quay, n&agrave;o l&agrave; đi c&agrave; kheo, nổ ph&aacute;o đất&hellip; Hơn nữa, c&aacute;c tr&ograve; chơi d&acirc;n gian Việt Nam thường giản tiện, kh&ocirc;ng cầu kỳ, tốn k&eacute;m n&ecirc;n c&oacute; thể dễ d&agrave;ng chơi mọi l&uacute;c, mọi nơi, dụng cụ dễ kiếm, dễ l&agrave;m, chủ yếu lấy từ trong tự nhi&ecirc;n, thậm ch&iacute; chỉ l&agrave; c&aacute;i gậy, h&ograve;n đ&aacute;, h&ograve;n bi nhặt trong vườn, dưới ruộng l&agrave; c&oacute; thể lập được một hội chơi.</p>\r\n\r\n<p>Người chơi thường l&agrave; những trẻ chăn tr&acirc;u l&ecirc; la t&uacute;m tụm ngo&agrave;i b&atilde;i cỏ, ngo&agrave;i việc vui đ&ugrave;a, r&egrave;n luyện th&acirc;n thể, c&ograve;n thể hiện nỗi kh&aacute;t khao chiến thắng tiềm ẩn trong mỗi đứa trẻ&hellip;</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>100 Tr&ograve; Chơi D&acirc;n Gian Cho Thiếu Nhi PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Thị Thanh Thủy</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 797, 212, 0, 5, '2024-09-30 09:59:39', '2024-10-02 12:10:00', 13, 1, 4),
(37, 'MS55386238', 'ĐẤT RỪNG PHƯƠNG NAM', 'Đoàn Giỏi', 233, 1996, 9, 8, 'https://drive.google.com/drive/u/1/folders/186d-eeTiJhPFIAARmBfxaoiuKGxh152y', 89000, '<p>Đất rừng phương nam l&agrave; tiểu thuyết của nh&agrave; văn Đo&agrave;n Giỏi viết về cuộc đời phi&ecirc;u bạt của một cậu b&eacute; t&ecirc;n An. Bối cảnh của tiểu thuyết l&agrave; c&aacute;c tỉnh miền T&acirc;y Nam Bộ, Việt Nam v&agrave;o những năm 1945, sau khi thực d&acirc;n Ph&aacute;p quay trở lại x&acirc;m chiếm Nam Bộ</p>\r\n\r\n<p>Tiểu thuyết Đất rừng phương nam được chuyển thể th&agrave;nh phim Đất phương nam do H&atilde;ng phim Truyền h&igrave;nh th&agrave;nh phố Hồ Ch&iacute; Minh sản xuất năm 1997. Một trong nhiều t&aacute;c phẩm được chuyển thể th&agrave;nh phim.</p>\r\n\r\n<p>C&acirc;u chuyện mượn h&igrave;nh ảnh một cậu b&eacute; bị lưu lạc trong thời kỳ kh&aacute;ng chiến chống Ph&aacute;p ở Nam bộ để giới thiệu &quot;Đất rừng Phương Nam&quot;. Nơi đ&oacute;, một v&ugrave;ng đất v&ocirc; c&ugrave;ng gi&agrave;u c&oacute;, h&agrave;o ph&oacute;ng v&agrave; h&ugrave;ng vĩ với những con người trung hậu, tr&iacute; dũng, một l&ograve;ng một dạ theo kh&aacute;ng chiến.</p>\r\n\r\n<p>&quot;Đất rừng phương Nam&quot; của Đo&agrave;n Giỏi như một x&atilde; hội của miền s&ocirc;ng nước T&acirc;y Nam bộ thu nhỏ. Bởi ở nơi đ&oacute;, người đọc đ&atilde; t&igrave;m thấy h&igrave;nh ảnh người d&acirc;n của v&ugrave;ng đất phương Nam từ s&ocirc;ng Tiền, s&ocirc;ng Hậu trải d&agrave;i đến Ki&ecirc;n Giang - Rạch Gi&aacute;, rồi xuống tận rừng U Minh, sau đ&oacute; dừng lại ở Năm Căn C&agrave; Mau.</p>\r\n\r\n<p>Bối cảnh trong &quot;Đất rừng phương Nam&quot; l&agrave; cả một đất trời thi&ecirc;n nhi&ecirc;n ưu đ&atilde;i, c&aacute;nh đồng b&aacute;t ng&aacute;t m&ecirc;nh m&ocirc;ng, s&oacute;ng nước r&igrave; rầm, rừng rậm bạt ng&agrave;n tr&ugrave; ph&uacute;, th&uacute; rừng hoang d&atilde; mu&ocirc;n lo&agrave;i... C&oacute; thể n&oacute;i truyện đ&atilde; mang đến cho người đọc nhiều th&uacute; vị.</p>', 534, 254, 1, 5, '2024-09-30 10:24:31', '2024-10-02 14:13:59', 1, 1, 4),
(38, 'MS37566680', 'BLOCKCHAIN VÀ TƯƠNG LAI CỦA TIỀN TỆ', 'Paul Vigna', 318, 2021, 12, 11, 'https://drive.google.com/drive/u/1/folders/1tqhAZ5rwgc33Agz9ffI4MrqvfDK4aaE3', 99000, '<p>Trong nền kinh tế hiện đại, những kẻ quản l&yacute; được sự truyền tải th&ocirc;ng tin sẽ kiểm so&aacute;t cả thế giới. Sự thực n&agrave;y đ&atilde; được chứng minh bởi vị thế vững v&agrave;ng v&agrave; tầm ảnh hưởng ng&agrave;y c&agrave;ng s&acirc;u rộng của Google v&agrave; Facebook. Hiện nay, quyền lực chỉ nằm trong tay một số &iacute;t những g&atilde; khổng lồ c&ocirc;ng nghệ - c&aacute;c tập đo&agrave;n nắm quyền thu thập, lưu trữ, v&agrave; chia sẻ dữ liệu.</p>\r\n\r\n<p>Vậy, điều g&igrave; sẽ xảy ra nếu quyền lực được ph&acirc;n t&aacute;n, mọi c&aacute; nh&acirc;n đều c&oacute; quyền ngang nhau trong việc quản l&yacute; th&ocirc;ng tin, v&agrave; kh&ocirc;ng một ch&iacute;nh phủ, một đại doanh nghiệp n&agrave;o c&oacute; quyền chi phối tuyệt đối? Điều đ&oacute; sẽ th&agrave;nh hiện thực với sự xuất hiện của Blockchain - &quot;cỗ m&aacute;y sự thật&quot;. Blockchain gi&uacute;p ta h&igrave;nh dung ra một thế giới kh&ocirc;ng bị thống trị bởi Google, Facebook, hay NSA - một nơi m&agrave; ch&iacute;nh mỗi ch&uacute;ng ta, những th&agrave;nh phần cốt l&otilde;i của x&atilde; hội to&agrave;n cầu, được quyền quyết định quản l&yacute; dữ liệu của bản th&acirc;n.</p>\r\n\r\n<p>Trong &quot; Blockchain v&agrave; tương lai của tiền tệ&quot;, Paul Vigna v&agrave; Michael J. Casey đ&atilde; l&agrave;m s&aacute;ng tỏ vấn đề blockchain v&agrave; giải th&iacute;ch l&yacute; do tại sao n&oacute; c&oacute; thể kh&ocirc;i phục quyền kiểm so&aacute;t c&aacute; nh&acirc;n đối với dữ liệu, t&agrave;i sản v&agrave; danh t&iacute;nh của ch&uacute;ng ta. Cuốn s&aacute;ch kh&aacute;m ph&aacute; c&aacute;ch thức m&agrave; c&ocirc;ng nghệ n&agrave;y, cũng như rất nhiều ứng dụng của n&oacute; (ti&ecirc;u biểu như Bitcoin) đang hoạt động nhằm t&aacute;i cơ cấu lại c&aacute;c tổ chức x&atilde; hội, v&agrave; tạo ra v&ocirc; số tiềm năng vĩ đại. Nối tiếp t&aacute;c phẩm &quot;Kỷ nguy&ecirc;n tiền điện tử&quot; đ&atilde; g&acirc;y tiếng vang lớn, bộ đ&ocirc;i t&aacute;c giả tiếp tục cung cấp cho người đọc một c&aacute;i nh&igrave;n tổng quan hơn về x&atilde; hội trong &quot; Blockchain v&agrave; tương lai của tiền tệ&quot;. Đọc hết t&aacute;c phẩm n&agrave;y, v&agrave; bạn sẽ hiểu được ch&uacute;ng ta đang đứng trước c&aacute;c cơ hội v&agrave; th&aacute;ch thức như thế n&agrave;o khi ứng dụng c&ocirc;ng nghệ blockchain v&agrave;o cuộc sống.</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Trong cuốn Kỷ nguy&ecirc;n Tiền điện tử, ch&uacute;ng ta đ&atilde; t&igrave;m hiểu về tiền ảo v&agrave; tiềm năng mang lại một hệ thống giao dịch c&ocirc;ng bằng hơn tr&ecirc;n to&agrave;n cầu, một hệ thống c&oacute; thể hoạt động kh&ocirc;ng cần ng&acirc;n h&agrave;ng v&agrave; c&aacute;c thể chế t&agrave;i ch&iacute;nh trung gian kh&aacute;c. Khi cuốn s&aacute;ch sắp được in, ứng dụng ng&agrave;y c&agrave;ng rộng r&atilde;i của Bitcoin1 - c&aacute;ch thức hệ thống cốt l&otilde;i của n&oacute; c&oacute; thể gi&uacute;p giải quyết những vấn đề về niềm tin giữa c&aacute;c c&aacute; nh&acirc;n v&agrave; doanh nghiệp khi họ giao thương t&agrave;i sản, khởi tạo hợp đồng, ph&acirc;n chia bất động sản, hoặc chia sẻ những th&ocirc;ng tin gi&aacute; trị hoặc nhạy cảm - đ&atilde; trở n&ecirc;n r&otilde; r&agrave;ng. Đối với c&aacute;c c&ocirc;ng ty, ch&iacute;nh phủ, v&agrave; giới truyền th&ocirc;ng, mối quan t&acirc;m chung của họ, v&agrave; đ&acirc;u đ&oacute; cả một ch&uacute;t k&iacute;ch th&iacute;ch t&ograve; m&ograve;, đ&atilde; hướng đến một kh&aacute;i niệm mang t&ecirc;n &ldquo;c&ocirc;ng nghệ Blockchain.&rdquo;</p>', 40, 0, 1, 5, '2024-10-02 13:34:37', '2024-10-08 12:43:38', 20, 1, 5),
(39, 'MS45455776', 'CÁC GIẢI PHÁP LẬP TRÌNH C#', 'Nguyễn Ngọc Bình Phương', 706, 1997, 8, 8, 'https://drive.google.com/drive/u/1/folders/10TVrtgFcCkEyPVuPLj_mop9njXpfXBur', 285000, '<p>C&aacute;c giải ph&aacute;p lập tr&igrave;nh C# khảo s&aacute;t chiều rộng của thư viện lớp.NET Framework v&agrave; cung cấp giải ph&aacute;p cụ thể cho c&aacute;c vấn đề thường gặp. Mỗi giải ph&aacute;p được tr&igrave;nh b&agrave;y theo dạng &ldquo;vấn đề/giải ph&aacute;p&rdquo; một c&aacute;ch ngắn gọn v&agrave; k&egrave;m theo l&agrave; c&aacute;c v&iacute; dụ mẫu.</p>\r\n\r\n<p>C&aacute;c giải ph&aacute;p lập tr&igrave;nh C# kh&ocirc;ng nhằm mục đ&iacute;ch hướng dẫn bạn c&aacute;ch lập tr&igrave;nh C#. Tuy vậy, ngay cả khi mới l&agrave;m quen với lập tr&igrave;nh ứng dụng được x&acirc;y dựng tr&ecirc;n.NET Framework với C#, bạn cũng sẽ nhận thấy quyển s&aacute;ch n&agrave;y l&agrave; một t&agrave;i nguy&ecirc;n v&ocirc; gi&aacute;.</p>\r\n\r\n<p>Ở mức l&yacute; tưởng, khi bạn đối mặt với một vấn đề, quyển s&aacute;ch n&agrave;y sẽ cung cấp một giải ph&aacute;p&mdash;hay &iacute;t nhất n&oacute; sẽ gợi cho bạn hướng đi đ&uacute;ng. Ngay cả nếu bạn chỉ muốn mở rộng kiến thức của m&igrave;nh về thư viện lớp.NET, C&aacute;c giải ph&aacute;p lập tr&igrave;nh C# cũng l&agrave; một t&agrave;i liệu rất hữu &iacute;ch.</p>\r\n\r\n<p>Bạn kh&ocirc;ng thể trở n&ecirc;n th&agrave;nh thạo C# v&agrave; c&aacute;c lớp trong thư viện lớp.NET nếu chỉ đơn thuần đọc về ch&uacute;ng, bạn phải sử dụng v&agrave; thử nghiệm ch&uacute;ng bằng c&aacute;ch viết thật nhiều chương tr&igrave;nh. Cấu tr&uacute;c v&agrave; nội dung của quyển s&aacute;ch n&agrave;y cũng như t&iacute;nh khả thi trong thế giới thực của c&aacute;c giải ph&aacute;p được đưa ra sẽ cung cấp điểm khởi đầu ho&agrave;n hảo, để từ đ&oacute; l&agrave;m b&agrave;n đạp cho việc thử nghiệm của ch&iacute;nh bạn.</p>\r\n\r\n<p>Phần m&atilde; lệnh trong quyển s&aacute;ch n&agrave;y đ&atilde; được viết v&agrave; chạy thử nghiệm tr&ecirc;n phi&ecirc;n bản 1.1 của.NET Framework. Trong nhiều trường hợp, bạn sẽ nhận thấy v&iacute; dụ mẫu n&agrave;y cũng sẽ chạy tr&ecirc;n phi&ecirc;n bản 1.0 hay 2.0 của.NET Framework, tuy nhi&ecirc;n điều n&agrave;y chưa được thử nghiệm.</p>', 10, 0, 0, 5, '2024-10-02 13:41:32', '2024-10-02 14:09:44', 21, 1, 5),
(40, 'MS70349152', 'LẬP TRÌNH CĂN BẢN', 'Codegym', 173, 2023, 10, 10, NULL, 89000, '<p>X&acirc;y dựng nền tảng lập tr&igrave;nh chỉ trong 1 th&aacute;ng</p>\r\n\r\n<p>Ebook &ldquo;Lập tr&igrave;nh căn bản&rdquo; cung cấp hệ thống kiến thức nền tảng lập tr&igrave;nh cốt yếu từ l&yacute; thuyết đến thực h&agrave;nh, gi&uacute;p bạn từ chưa biết g&igrave; c&oacute; thể x&acirc;y gốc, nhanh ch&oacute;ng bước ch&acirc;n v&agrave;o thế giới IT chỉ trong v&ograve;ng 1 th&aacute;ng.</p>\r\n\r\n<p>Cuốn s&aacute;ch đặc biệt ph&ugrave; hợp với những bạn bắt đầu từ con số 0, mong muốn ph&aacute;t triển năng lực lập tr&igrave;nh trong thời gian nhanh nhất.</p>', 10, 0, 0, 0, '2024-10-02 13:44:59', '2024-10-03 12:16:25', 12, 1, 5),
(41, 'MS47817755', 'TỔNG HỢP KIẾN THỨC JAVA CĂN BẢN', 'Codegym', 200, 2018, 10, 10, NULL, 119000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Tổng Hợp Kiến Thức Java Căn Bản PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Codegym</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 2, 0, 0, 0, '2024-10-02 14:07:58', '2024-10-03 11:24:36', 12, 1, 14),
(42, 'MS66347697', 'SỔ TAY NGHỀ LẬP TRÌNH', 'Codegym', 40, 2020, 10, 10, 'https://drive.google.com/drive/u/1/folders/1ceQk236vtKWLndSY8L_46SmAYl0CGp7s', 99000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Sổ Tay Nghề Lập Tr&igrave;nh PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Codegym</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 4, 0, 0, 0, '2024-10-02 14:12:35', '2024-10-08 10:49:00', 12, 1, 14);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `id_SinhVien` int(11) NOT NULL,
  `maSinhVien` varchar(1000) NOT NULL,
  `id_Khoa` int(11) NOT NULL DEFAULT 1,
  `id_KhoaHoc` int(11) NOT NULL DEFAULT 1,
  `id_Lop` int(11) NOT NULL DEFAULT 1,
  `id_NguoiDung` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`id_SinhVien`, `maSinhVien`, `id_Khoa`, `id_KhoaHoc`, `id_Lop`, `id_NguoiDung`) VALUES
(1, 'SV5805207', 2, 6, 6, 2),
(2, 'SV2933316', 1, 1, 1, 4),
(3, 'SV4840188', 1, 1, 1, 5),
(4, 'SV1467861', 1, 1, 1, 7),
(5, 'SV4521342', 1, 1, 1, 8),
(6, 'SV0207683', 1, 1, 1, 9),
(7, 'SV8023979', 2, 6, 5, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

CREATE TABLE `theloai` (
  `id_TheLoai` int(11) NOT NULL,
  `maTheLoai` varchar(1000) NOT NULL,
  `tenTheLoai` varchar(1000) NOT NULL,
  `ngayTaoTheLoai` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaTheLoai` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`id_TheLoai`, `maTheLoai`, `tenTheLoai`, `ngayTaoTheLoai`, `ngaySuaTheLoai`) VALUES
(5, 'MTL40532267', 'Giáo Dục - Đào Tạo', '2024-08-25 12:23:14', '2024-08-25 12:23:14'),
(6, 'MTL97947463', 'Tài Liệu Tham Khảo', '2024-08-25 12:23:23', '2024-08-25 12:23:23'),
(12, 'MTL79953346', 'Thể Thao', '2024-08-27 16:25:38', '2024-08-27 16:25:38'),
(13, 'MTL71285409', 'Cổ Tích - Thần Thoại', '2024-08-29 15:32:57', '2024-08-29 15:32:57'),
(14, 'MTL47180692', 'Văn Học - Nghệ Thuật', '2024-08-29 15:44:50', '2024-08-29 15:44:50'),
(15, 'MTL54776234', 'Trẻ Em - Thiếu Nhi', '2024-08-29 15:45:15', '2024-08-29 15:45:15'),
(16, 'MTL89818368', 'Tiểu Thuyết', '2024-08-29 15:45:32', '2024-08-29 15:45:32'),
(17, 'MTL92162666', 'Phiêu Lưu', '2024-08-29 15:48:41', '2024-08-29 15:48:41'),
(18, 'MTL15670153', 'Khám Phá Bí Ẩn', '2024-08-29 15:53:11', '2024-08-29 15:53:11'),
(19, 'MTL83077598', 'Tâm Lý - Kĩ Năng', '2024-08-29 17:54:12', '2024-08-29 17:54:12'),
(20, 'MTL10703539', 'Phát Triển Bản Thân', '2024-08-29 17:58:41', '2024-08-29 17:58:41'),
(26, 'MTL22982226', 'Nông - Lâm - Ngư', '2024-09-20 11:22:27', '2024-09-20 11:22:27'),
(27, 'MTL94325746', 'Lịch Sử - Quân Sự', '2024-09-21 10:18:22', '2024-09-21 10:18:22'),
(28, 'MTL71154822', 'Y Học - Sức Khỏe', '2024-09-21 10:36:46', '2024-09-21 10:36:46'),
(29, 'MTL24551137', 'Khoa Học - Công Nghệ', '2024-09-21 10:37:42', '2024-09-21 10:37:42'),
(30, 'MTL25507907', 'Triết Học - Lý Luận', '2024-09-21 10:51:13', '2024-09-21 10:51:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thuthu`
--

CREATE TABLE `thuthu` (
  `id_ThuThu` int(11) NOT NULL,
  `maThuThu` varchar(1000) NOT NULL,
  `id_Khoa` int(11) NOT NULL,
  `id_NguoiDung` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `thuthu`
--

INSERT INTO `thuthu` (`id_ThuThu`, `maThuThu`, `id_Khoa`, `id_NguoiDung`) VALUES
(1, 'TT9673605', 2, 3),
(2, 'TT8091765', 1, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trangthai`
--

CREATE TABLE `trangthai` (
  `id_TrangThai` int(11) NOT NULL,
  `maTrangThai` varchar(1000) NOT NULL,
  `tenTrangThai` varchar(1000) NOT NULL,
  `ngayTaoTrangThai` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaTrangThai` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `trangthai`
--

INSERT INTO `trangthai` (`id_TrangThai`, `maTrangThai`, `tenTrangThai`, `ngayTaoTrangThai`, `ngaySuaTrangThai`) VALUES
(1, 'CXNEMAIL', 'Chưa xác nhận ', '2024-08-04 20:49:44', '2024-08-04 20:49:44'),
(2, 'DXNEMAIL', 'Đã xác nhận', '2024-08-04 21:08:29', '2024-08-04 21:08:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vaitro`
--

CREATE TABLE `vaitro` (
  `id_VaiTro` int(11) NOT NULL,
  `tenVaiTro` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `vaitro`
--

INSERT INTO `vaitro` (`id_VaiTro`, `tenVaiTro`) VALUES
(1, 'Admin'),
(2, 'Thủ thư'),
(3, 'Giảng viên'),
(4, 'Sinh viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vipham`
--

CREATE TABLE `vipham` (
  `id_ViPham` int(11) NOT NULL,
  `maViPham` varchar(1000) NOT NULL,
  `tenViPham` varchar(1000) NOT NULL,
  `ngayTaoViPham` datetime NOT NULL DEFAULT current_timestamp(),
  `ngaySuaViPham` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `vipham`
--

INSERT INTO `vipham` (`id_ViPham`, `maViPham`, `tenViPham`, `ngayTaoViPham`, `ngaySuaViPham`) VALUES
(1, 'MVP0000001', 'Không vi phạm', '2024-09-18 19:14:03', '2024-09-18 19:14:03'),
(2, 'MVP0000002', 'Trả trễ hạn', '2024-09-18 19:14:03', '2024-09-18 19:14:03'),
(3, 'MVP0000003', 'Làm mất sách', '2024-09-18 19:14:39', '2024-09-18 19:14:39'),
(4, 'MVP0000004', 'Làm hỏng sách', '2024-09-18 19:14:39', '2024-09-18 19:14:39');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vitri`
--

CREATE TABLE `vitri` (
  `id_ViTri` int(11) NOT NULL,
  `maViTri` varchar(1000) NOT NULL,
  `tenViTri` varchar(1000) NOT NULL,
  `id_Ngan` int(11) NOT NULL,
  `sucChua` int(11) NOT NULL,
  `viTriDaSuDung` int(11) NOT NULL DEFAULT 0,
  `ngaySuaViTri` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ngayTaoViTri` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `vitri`
--

INSERT INTO `vitri` (`id_ViTri`, `maViTri`, `tenViTri`, `id_Ngan`, `sucChua`, `viTriDaSuDung`, `ngaySuaViTri`, `ngayTaoViTri`) VALUES
(1, 'MVT54313770', 'A.1.1', 1, 50, 50, '2024-10-07 11:26:34', '2024-08-19 11:22:03'),
(2, 'MVT72336940', 'A.1.2', 1, 20, 20, '2024-08-29 15:13:33', '2024-08-19 11:41:10'),
(3, 'MVT94078938', 'A.1.3', 1, 30, 30, '2024-08-29 15:56:07', '2024-08-19 11:41:26'),
(4, 'MVT20164508', 'B.1.1', 2, 30, 30, '2024-09-30 10:24:31', '2024-08-19 11:41:55'),
(5, 'MVT61478063', 'B.1.2', 2, 30, 30, '2024-10-02 13:44:59', '2024-08-19 11:42:26'),
(6, 'MVT95623285', 'B.1.3', 2, 40, 0, '2024-08-19 14:36:43', '2024-08-19 11:42:47'),
(7, 'MVT49740613', 'A.2.1', 1, 20, 20, '2024-08-29 18:10:55', '2024-08-19 11:43:01'),
(8, 'MVT29943289', 'A.2.2', 1, 20, 20, '2024-10-07 11:24:14', '2024-08-19 11:43:59'),
(9, 'MVT29759124', 'A.2.3', 1, 30, 30, '2024-10-07 11:24:21', '2024-08-19 11:44:08'),
(10, 'MVT21261371', 'C.1.1', 3, 15, 15, '2024-09-08 13:07:11', '2024-08-19 11:53:41'),
(11, 'MVT21080121', 'C.1.2', 3, 15, 15, '2024-09-20 16:57:30', '2024-08-19 11:54:46'),
(12, 'MVT75836393', 'C.1.3', 3, 20, 20, '2024-09-21 10:24:35', '2024-08-19 13:56:04'),
(13, 'MVT38171683', 'C.2.1', 3, 15, 13, '2024-09-21 10:22:24', '2024-08-19 14:03:57'),
(14, 'MVT97405866', 'C.2.2', 3, 35, 35, '2024-10-02 14:12:35', '2024-08-19 14:44:59'),
(15, 'MVT30754602', 'D.1.1', 4, 30, 30, '2024-09-21 10:54:00', '2024-09-08 13:15:40'),
(16, 'MVT88518666', 'D.1.2', 4, 30, 0, '2024-09-27 13:36:08', '2024-09-27 13:36:08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id_BinhLuan`),
  ADD KEY `id_NguoiDung` (`id_NguoiDung`),
  ADD KEY `id_Sach` (`id_Sach`);

--
-- Chỉ mục cho bảng `chitietgiosach`
--
ALTER TABLE `chitietgiosach`
  ADD PRIMARY KEY (`id_ChiTietGioSach`),
  ADD KEY `id_GioSach` (`id_GioSach`),
  ADD KEY `id_Sach` (`id_Sach`);

--
-- Chỉ mục cho bảng `chitietnganhhoc`
--
ALTER TABLE `chitietnganhhoc`
  ADD PRIMARY KEY (`id_NganhHoc`,`id_Sach`),
  ADD KEY `id_Sach` (`id_Sach`);

--
-- Chỉ mục cho bảng `chitietphieumuon`
--
ALTER TABLE `chitietphieumuon`
  ADD PRIMARY KEY (`id_PhieuMuon`,`id_Sach`),
  ADD KEY `id_Sach` (`id_Sach`);

--
-- Chỉ mục cho bảng `chitiettheloai`
--
ALTER TABLE `chitiettheloai`
  ADD PRIMARY KEY (`id_TheLoai`,`id_Sach`),
  ADD KEY `id_Sach` (`id_Sach`);

--
-- Chỉ mục cho bảng `chitietvipham`
--
ALTER TABLE `chitietvipham`
  ADD PRIMARY KEY (`id_ViPham`,`id_NguoiDung`,`id_PhieuTra`),
  ADD KEY `id_NguoiDung` (`id_NguoiDung`),
  ADD KEY `id_PhieuTra` (`id_PhieuTra`);

--
-- Chỉ mục cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD PRIMARY KEY (`id_DanhGia`),
  ADD KEY `id_NguoiDung` (`id_NguoiDung`),
  ADD KEY `id_Sach` (`id_Sach`);

--
-- Chỉ mục cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD PRIMARY KEY (`id_GiangVien`),
  ADD UNIQUE KEY `uniqueMaGiangVien` (`maGiangVien`) USING HASH,
  ADD KEY `id_Khoa` (`id_Khoa`),
  ADD KEY `id_NguoiDung` (`id_NguoiDung`);

--
-- Chỉ mục cho bảng `giosach`
--
ALTER TABLE `giosach`
  ADD PRIMARY KEY (`id_GioSach`),
  ADD KEY `id_NguoiDung` (`id_NguoiDung`);

--
-- Chỉ mục cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD PRIMARY KEY (`id_HinhAnh`),
  ADD KEY `id_Sach` (`id_Sach`);

--
-- Chỉ mục cho bảng `khoa`
--
ALTER TABLE `khoa`
  ADD PRIMARY KEY (`id_Khoa`),
  ADD UNIQUE KEY `uniqueMaKhoa` (`maKhoa`) USING HASH;

--
-- Chỉ mục cho bảng `khoahoc`
--
ALTER TABLE `khoahoc`
  ADD PRIMARY KEY (`id_KhoaHoc`),
  ADD UNIQUE KEY `uniqueMaKhoaHoc` (`maKhoaHoc`) USING HASH;

--
-- Chỉ mục cho bảng `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`id_Lop`),
  ADD UNIQUE KEY `uniqueMalop` (`maLop`) USING HASH;

--
-- Chỉ mục cho bảng `ngan`
--
ALTER TABLE `ngan`
  ADD PRIMARY KEY (`id_Ngan`),
  ADD UNIQUE KEY `uniqueMaNgan` (`maNgan`) USING HASH;

--
-- Chỉ mục cho bảng `nganhhoc`
--
ALTER TABLE `nganhhoc`
  ADD PRIMARY KEY (`id_NganhHoc`),
  ADD UNIQUE KEY `uniqueMaNganhHoc` (`maNganhHoc`) USING HASH;

--
-- Chỉ mục cho bảng `ngonngu`
--
ALTER TABLE `ngonngu`
  ADD PRIMARY KEY (`id_NgonNgu`),
  ADD UNIQUE KEY `uniqueMaNgonNgu` (`maNgonNgu`) USING HASH;

--
-- Chỉ mục cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id_NguoiDung`),
  ADD KEY `id_VaiTro` (`id_VaiTro`),
  ADD KEY `id_TrangThai` (`id_TrangThai`);

--
-- Chỉ mục cho bảng `nhatkyhoatdong`
--
ALTER TABLE `nhatkyhoatdong`
  ADD PRIMARY KEY (`id_HoatDong`),
  ADD KEY `id_Sach` (`id_Sach`),
  ADD KEY `id_ThuThu` (`id_ThuThu`);

--
-- Chỉ mục cho bảng `nhaxuatban`
--
ALTER TABLE `nhaxuatban`
  ADD PRIMARY KEY (`id_NhaXuatBan`),
  ADD UNIQUE KEY `uniqueMaNhaXuatBan` (`maNhaXuatBan`) USING HASH;
ALTER TABLE `nhaxuatban` ADD FULLTEXT KEY `tenNhaXuatBan` (`tenNhaXuatBan`);

--
-- Chỉ mục cho bảng `phieumuon`
--
ALTER TABLE `phieumuon`
  ADD PRIMARY KEY (`id_PhieuMuon`),
  ADD UNIQUE KEY `uniqueMaPhieuMuon` (`maPhieuMuon`) USING HASH,
  ADD KEY `id_NguoiDung` (`id_NguoiDung`);

--
-- Chỉ mục cho bảng `phieutra`
--
ALTER TABLE `phieutra`
  ADD PRIMARY KEY (`id_PhieuTra`),
  ADD UNIQUE KEY `uniqueMaPhieuTra` (`maPhieuTra`) USING HASH,
  ADD KEY `id_PhieuMuon` (`id_PhieuMuon`);

--
-- Chỉ mục cho bảng `sach`
--
ALTER TABLE `sach`
  ADD PRIMARY KEY (`id_Sach`),
  ADD KEY `id_NgonNgu` (`id_NgonNgu`),
  ADD KEY `id_NhaXuatBan` (`id_NhaXuatBan`),
  ADD KEY `id_ViTri` (`id_ViTri`);
ALTER TABLE `sach` ADD FULLTEXT KEY `tenSach` (`tenSach`,`tenTacGia`,`ghiChu`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`id_SinhVien`),
  ADD UNIQUE KEY `uniqueMaSinhVien` (`maSinhVien`) USING HASH,
  ADD KEY `id_Lop` (`id_Lop`),
  ADD KEY `id_Khoa` (`id_Khoa`),
  ADD KEY `id_KhoaHoc` (`id_KhoaHoc`),
  ADD KEY `id_NguoiDung` (`id_NguoiDung`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`id_TheLoai`),
  ADD UNIQUE KEY `uniqueMaTheLoai` (`maTheLoai`) USING HASH;

--
-- Chỉ mục cho bảng `thuthu`
--
ALTER TABLE `thuthu`
  ADD PRIMARY KEY (`id_ThuThu`),
  ADD UNIQUE KEY `uniqueMaThuThu` (`maThuThu`) USING HASH,
  ADD KEY `id_Khoa` (`id_Khoa`),
  ADD KEY `id_NguoiDung` (`id_NguoiDung`);

--
-- Chỉ mục cho bảng `trangthai`
--
ALTER TABLE `trangthai`
  ADD PRIMARY KEY (`id_TrangThai`),
  ADD UNIQUE KEY `uniqueMaTrangThai` (`maTrangThai`) USING HASH;

--
-- Chỉ mục cho bảng `vaitro`
--
ALTER TABLE `vaitro`
  ADD PRIMARY KEY (`id_VaiTro`);

--
-- Chỉ mục cho bảng `vipham`
--
ALTER TABLE `vipham`
  ADD PRIMARY KEY (`id_ViPham`),
  ADD UNIQUE KEY `uniqueMaViPham` (`maViPham`) USING HASH;

--
-- Chỉ mục cho bảng `vitri`
--
ALTER TABLE `vitri`
  ADD PRIMARY KEY (`id_ViTri`),
  ADD UNIQUE KEY `uniqueMaViTri` (`maViTri`) USING HASH,
  ADD KEY `id_Ngan` (`id_Ngan`);
ALTER TABLE `vitri` ADD FULLTEXT KEY `tenViTri` (`tenViTri`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id_BinhLuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `chitietgiosach`
--
ALTER TABLE `chitietgiosach`
  MODIFY `id_ChiTietGioSach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `id_DanhGia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  MODIFY `id_GiangVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `giosach`
--
ALTER TABLE `giosach`
  MODIFY `id_GioSach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  MODIFY `id_HinhAnh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT cho bảng `khoa`
--
ALTER TABLE `khoa`
  MODIFY `id_Khoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `khoahoc`
--
ALTER TABLE `khoahoc`
  MODIFY `id_KhoaHoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `lop`
--
ALTER TABLE `lop`
  MODIFY `id_Lop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `ngan`
--
ALTER TABLE `ngan`
  MODIFY `id_Ngan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `nganhhoc`
--
ALTER TABLE `nganhhoc`
  MODIFY `id_NganhHoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `ngonngu`
--
ALTER TABLE `ngonngu`
  MODIFY `id_NgonNgu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id_NguoiDung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `nhatkyhoatdong`
--
ALTER TABLE `nhatkyhoatdong`
  MODIFY `id_HoatDong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT cho bảng `nhaxuatban`
--
ALTER TABLE `nhaxuatban`
  MODIFY `id_NhaXuatBan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `phieumuon`
--
ALTER TABLE `phieumuon`
  MODIFY `id_PhieuMuon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `phieutra`
--
ALTER TABLE `phieutra`
  MODIFY `id_PhieuTra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `id_Sach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  MODIFY `id_SinhVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `theloai`
--
ALTER TABLE `theloai`
  MODIFY `id_TheLoai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `thuthu`
--
ALTER TABLE `thuthu`
  MODIFY `id_ThuThu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `trangthai`
--
ALTER TABLE `trangthai`
  MODIFY `id_TrangThai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `vaitro`
--
ALTER TABLE `vaitro`
  MODIFY `id_VaiTro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `vipham`
--
ALTER TABLE `vipham`
  MODIFY `id_ViPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `vitri`
--
ALTER TABLE `vitri`
  MODIFY `id_ViTri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `binhluan_ibfk_1` FOREIGN KEY (`id_NguoiDung`) REFERENCES `nguoidung` (`id_NguoiDung`),
  ADD CONSTRAINT `binhluan_ibfk_2` FOREIGN KEY (`id_Sach`) REFERENCES `sach` (`id_Sach`);

--
-- Các ràng buộc cho bảng `chitietgiosach`
--
ALTER TABLE `chitietgiosach`
  ADD CONSTRAINT `chitietgiosach_ibfk_1` FOREIGN KEY (`id_GioSach`) REFERENCES `giosach` (`id_GioSach`),
  ADD CONSTRAINT `chitietgiosach_ibfk_2` FOREIGN KEY (`id_Sach`) REFERENCES `sach` (`id_Sach`);

--
-- Các ràng buộc cho bảng `chitietnganhhoc`
--
ALTER TABLE `chitietnganhhoc`
  ADD CONSTRAINT `chitietnganhhoc_ibfk_1` FOREIGN KEY (`id_NganhHoc`) REFERENCES `nganhhoc` (`id_NganhHoc`),
  ADD CONSTRAINT `chitietnganhhoc_ibfk_2` FOREIGN KEY (`id_Sach`) REFERENCES `sach` (`id_Sach`);

--
-- Các ràng buộc cho bảng `chitietphieumuon`
--
ALTER TABLE `chitietphieumuon`
  ADD CONSTRAINT `chitietphieumuon_ibfk_1` FOREIGN KEY (`id_PhieuMuon`) REFERENCES `phieumuon` (`id_PhieuMuon`),
  ADD CONSTRAINT `chitietphieumuon_ibfk_2` FOREIGN KEY (`id_Sach`) REFERENCES `sach` (`id_Sach`);

--
-- Các ràng buộc cho bảng `chitiettheloai`
--
ALTER TABLE `chitiettheloai`
  ADD CONSTRAINT `chitiettheloai_ibfk_1` FOREIGN KEY (`id_Sach`) REFERENCES `sach` (`id_Sach`),
  ADD CONSTRAINT `chitiettheloai_ibfk_2` FOREIGN KEY (`id_TheLoai`) REFERENCES `theloai` (`id_TheLoai`);

--
-- Các ràng buộc cho bảng `chitietvipham`
--
ALTER TABLE `chitietvipham`
  ADD CONSTRAINT `chitietvipham_ibfk_1` FOREIGN KEY (`id_NguoiDung`) REFERENCES `nguoidung` (`id_NguoiDung`),
  ADD CONSTRAINT `chitietvipham_ibfk_2` FOREIGN KEY (`id_ViPham`) REFERENCES `vipham` (`id_ViPham`),
  ADD CONSTRAINT `chitietvipham_ibfk_3` FOREIGN KEY (`id_PhieuTra`) REFERENCES `phieutra` (`id_PhieuTra`);

--
-- Các ràng buộc cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  ADD CONSTRAINT `danhgia_ibfk_1` FOREIGN KEY (`id_NguoiDung`) REFERENCES `nguoidung` (`id_NguoiDung`),
  ADD CONSTRAINT `danhgia_ibfk_2` FOREIGN KEY (`id_Sach`) REFERENCES `sach` (`id_Sach`);

--
-- Các ràng buộc cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  ADD CONSTRAINT `giangvien_ibfk_1` FOREIGN KEY (`id_Khoa`) REFERENCES `khoa` (`id_Khoa`),
  ADD CONSTRAINT `giangvien_ibfk_2` FOREIGN KEY (`id_NguoiDung`) REFERENCES `nguoidung` (`id_NguoiDung`);

--
-- Các ràng buộc cho bảng `giosach`
--
ALTER TABLE `giosach`
  ADD CONSTRAINT `giosach_ibfk_1` FOREIGN KEY (`id_NguoiDung`) REFERENCES `nguoidung` (`id_NguoiDung`);

--
-- Các ràng buộc cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  ADD CONSTRAINT `hinhanh_ibfk_1` FOREIGN KEY (`id_Sach`) REFERENCES `sach` (`id_Sach`);

--
-- Các ràng buộc cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD CONSTRAINT `nguoidung_ibfk_1` FOREIGN KEY (`id_VaiTro`) REFERENCES `vaitro` (`id_VaiTro`),
  ADD CONSTRAINT `nguoidung_ibfk_2` FOREIGN KEY (`id_TrangThai`) REFERENCES `trangthai` (`id_TrangThai`);

--
-- Các ràng buộc cho bảng `nhatkyhoatdong`
--
ALTER TABLE `nhatkyhoatdong`
  ADD CONSTRAINT `nhatkyhoatdong_ibfk_1` FOREIGN KEY (`id_Sach`) REFERENCES `sach` (`id_Sach`),
  ADD CONSTRAINT `nhatkyhoatdong_ibfk_2` FOREIGN KEY (`id_ThuThu`) REFERENCES `thuthu` (`id_ThuThu`);

--
-- Các ràng buộc cho bảng `phieumuon`
--
ALTER TABLE `phieumuon`
  ADD CONSTRAINT `phieumuon_ibfk_1` FOREIGN KEY (`id_NguoiDung`) REFERENCES `nguoidung` (`id_NguoiDung`);

--
-- Các ràng buộc cho bảng `phieutra`
--
ALTER TABLE `phieutra`
  ADD CONSTRAINT `phieutra_ibfk_1` FOREIGN KEY (`id_PhieuMuon`) REFERENCES `phieumuon` (`id_PhieuMuon`);

--
-- Các ràng buộc cho bảng `sach`
--
ALTER TABLE `sach`
  ADD CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`id_NgonNgu`) REFERENCES `ngonngu` (`id_NgonNgu`),
  ADD CONSTRAINT `sach_ibfk_2` FOREIGN KEY (`id_NhaXuatBan`) REFERENCES `nhaxuatban` (`id_NhaXuatBan`),
  ADD CONSTRAINT `sach_ibfk_3` FOREIGN KEY (`id_ViTri`) REFERENCES `vitri` (`id_ViTri`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`id_Lop`) REFERENCES `lop` (`id_Lop`),
  ADD CONSTRAINT `sinhvien_ibfk_2` FOREIGN KEY (`id_Khoa`) REFERENCES `khoa` (`id_Khoa`),
  ADD CONSTRAINT `sinhvien_ibfk_3` FOREIGN KEY (`id_KhoaHoc`) REFERENCES `khoahoc` (`id_KhoaHoc`),
  ADD CONSTRAINT `sinhvien_ibfk_4` FOREIGN KEY (`id_NguoiDung`) REFERENCES `nguoidung` (`id_NguoiDung`);

--
-- Các ràng buộc cho bảng `thuthu`
--
ALTER TABLE `thuthu`
  ADD CONSTRAINT `thuthu_ibfk_1` FOREIGN KEY (`id_Khoa`) REFERENCES `khoa` (`id_Khoa`),
  ADD CONSTRAINT `thuthu_ibfk_2` FOREIGN KEY (`id_NguoiDung`) REFERENCES `nguoidung` (`id_NguoiDung`);

--
-- Các ràng buộc cho bảng `vitri`
--
ALTER TABLE `vitri`
  ADD CONSTRAINT `vitri_ibfk_1` FOREIGN KEY (`id_Ngan`) REFERENCES `ngan` (`id_Ngan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
