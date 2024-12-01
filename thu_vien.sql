-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 01, 2024 lúc 03:58 AM
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
(6, '<p>s&aacute;ch rất hay v&agrave; &yacute; nghĩa&nbsp;</p>', '2024-10-08 10:45:36', '2024-10-08 10:45:36', 7, 38),
(7, '<p>hay lắm lu&ocirc;n mọi người n&ecirc;n đọc nha rất bổ &iacute;ch</p>', '2024-11-16 14:39:25', '2024-11-16 14:39:25', 1, 37);

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
(9, 9, 14, 2),
(172, 9, 33, 1);

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
(2, 43),
(2, 44),
(2, 45),
(2, 46),
(2, 47),
(2, 55),
(2, 56),
(2, 57),
(2, 61),
(2, 62),
(2, 63),
(2, 65),
(2, 80),
(2, 84),
(3, 79),
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
(10, 66),
(10, 67),
(10, 68),
(10, 69),
(10, 70),
(10, 76),
(10, 77),
(15, 18),
(15, 19),
(15, 20),
(15, 22),
(15, 71),
(15, 72),
(15, 73),
(15, 74),
(15, 75),
(16, 14),
(16, 24),
(16, 25),
(16, 80),
(16, 86),
(16, 87),
(16, 88),
(16, 89),
(17, 30),
(17, 31),
(17, 48),
(17, 49),
(17, 50),
(17, 51),
(17, 52),
(17, 53),
(17, 54),
(18, 33),
(18, 34),
(18, 35),
(18, 64),
(18, 77),
(18, 78),
(18, 79),
(18, 81),
(18, 82),
(18, 83),
(18, 84),
(18, 85),
(19, 49),
(19, 51),
(19, 52),
(19, 53),
(19, 54),
(19, 55),
(19, 58),
(19, 59),
(19, 60),
(19, 61),
(20, 90),
(20, 91),
(20, 92),
(20, 93),
(20, 94),
(20, 95);

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
(62, 15, 1),
(63, 21, 1),
(64, 39, 2),
(65, 27, 1),
(66, 16, 1),
(67, 41, 1),
(68, 39, 1),
(69, 8, 1),
(70, 42, 1);

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
(5, 69),
(5, 78),
(5, 79),
(5, 95),
(6, 6),
(6, 7),
(6, 10),
(6, 15),
(6, 17),
(6, 20),
(6, 22),
(6, 33),
(6, 42),
(6, 48),
(6, 59),
(6, 69),
(6, 71),
(6, 72),
(6, 73),
(6, 74),
(6, 75),
(6, 79),
(6, 81),
(6, 85),
(6, 87),
(6, 88),
(6, 89),
(6, 90),
(6, 93),
(12, 6),
(13, 8),
(13, 26),
(13, 27),
(13, 43),
(13, 44),
(13, 45),
(13, 46),
(13, 47),
(14, 9),
(14, 11),
(14, 13),
(14, 14),
(14, 23),
(14, 24),
(14, 25),
(14, 26),
(14, 29),
(14, 44),
(14, 55),
(14, 56),
(14, 57),
(14, 80),
(14, 84),
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
(15, 46),
(15, 62),
(16, 11),
(16, 23),
(16, 24),
(16, 25),
(16, 34),
(16, 43),
(16, 45),
(16, 56),
(16, 57),
(16, 61),
(16, 62),
(16, 63),
(16, 65),
(16, 66),
(17, 9),
(17, 62),
(17, 63),
(17, 64),
(17, 65),
(18, 10),
(18, 12),
(18, 19),
(18, 38),
(18, 47),
(18, 64),
(18, 65),
(18, 66),
(18, 91),
(18, 94),
(19, 12),
(19, 21),
(19, 28),
(19, 31),
(19, 35),
(19, 66),
(19, 67),
(19, 68),
(19, 69),
(19, 70),
(19, 76),
(20, 12),
(20, 14),
(20, 21),
(20, 28),
(20, 32),
(20, 34),
(20, 35),
(20, 37),
(20, 67),
(20, 68),
(20, 70),
(20, 76),
(20, 77),
(20, 82),
(20, 83),
(26, 18),
(26, 19),
(26, 20),
(26, 22),
(26, 71),
(26, 72),
(26, 73),
(26, 74),
(26, 75),
(27, 14),
(27, 24),
(27, 25),
(27, 33),
(27, 44),
(27, 80),
(27, 86),
(27, 87),
(27, 88),
(27, 89),
(28, 30),
(28, 31),
(28, 48),
(28, 49),
(28, 50),
(28, 51),
(28, 52),
(28, 53),
(28, 54),
(29, 7),
(29, 15),
(29, 16),
(29, 17),
(29, 38),
(29, 39),
(29, 40),
(29, 41),
(29, 42),
(30, 33),
(30, 34),
(30, 35),
(30, 77),
(30, 78),
(30, 79),
(30, 81),
(30, 82),
(30, 83),
(30, 84),
(30, 85),
(31, 49),
(31, 51),
(31, 52),
(31, 53),
(31, 54),
(31, 55),
(31, 58),
(31, 59),
(31, 60),
(31, 61),
(32, 90),
(32, 91),
(32, 92),
(32, 93),
(32, 94),
(32, 95);

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
(31, 5, '2024-10-08 10:45:43', '2024-10-08 10:45:43', 7, 38),
(32, 4, '2024-11-16 14:38:59', '2024-11-16 14:38:59', 1, 37),
(33, 5, '2024-11-17 10:40:23', '2024-11-17 10:40:23', 6, 43),
(34, 5, '2024-11-18 13:16:50', '2024-11-18 13:16:50', 6, 65);

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
(4, 'GV3306475', 1, 6),
(5, 'GV5893199', 1, 11),
(7, 'GV4358443', 1, 19);

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
(16, 10, '2024-09-23 20:36:22'),
(17, 11, '2024-10-09 09:56:44'),
(18, 14, '2024-11-10 19:09:30'),
(19, 13, '2024-11-11 14:09:32'),
(20, 15, '2024-11-12 11:30:12'),
(21, 19, '2024-11-18 13:57:52');

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
(39, 'luanvan/zzjmflfbruraexms2til', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1727853158/luanvan/zzjmflfbruraexms2til.jpg', 42),
(40, 'luanvan/grzk648wizz1nazwlqf7', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731814793/luanvan/grzk648wizz1nazwlqf7.jpg', 43),
(41, 'luanvan/ecqj0qjvdelvkaemgzrp', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731832170/luanvan/ecqj0qjvdelvkaemgzrp.jpg', 44),
(42, 'luanvan/iqxs795u67zevmmdy9a8', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731832320/luanvan/iqxs795u67zevmmdy9a8.jpg', 45),
(43, 'luanvan/uqdg0aywhjcm2hpzt6fu', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731832480/luanvan/uqdg0aywhjcm2hpzt6fu.jpg', 46),
(44, 'luanvan/tz6rikhuqe0nd0inynqz', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731832642/luanvan/tz6rikhuqe0nd0inynqz.jpg', 47),
(45, 'luanvan/dh4hfodqfywvtshfxtlg', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731832858/luanvan/dh4hfodqfywvtshfxtlg.jpg', 48),
(46, 'luanvan/poh3cibkpdryepeyi94n', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731833054/luanvan/poh3cibkpdryepeyi94n.jpg', 49),
(47, 'luanvan/ghsr8ra2feiwtow8optk', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731833144/luanvan/ghsr8ra2feiwtow8optk.jpg', 50),
(48, 'luanvan/zbed62ov2csuzhsbh5iq', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731833458/luanvan/zbed62ov2csuzhsbh5iq.jpg', 51),
(49, 'luanvan/hvkoislrafpqx7qyakc2', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731833686/luanvan/hvkoislrafpqx7qyakc2.jpg', 52),
(50, 'luanvan/cl77k7xxcsvr2qc1doxj', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731833832/luanvan/cl77k7xxcsvr2qc1doxj.jpg', 53),
(51, 'luanvan/zillkbtc3g78tsqmnpcz', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731833920/luanvan/zillkbtc3g78tsqmnpcz.jpg', 54),
(52, 'luanvan/jijmci0hfppmit1odh2i', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731834136/luanvan/jijmci0hfppmit1odh2i.jpg', 55),
(53, 'luanvan/x5ialz1idl5pxl167iag', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731834303/luanvan/x5ialz1idl5pxl167iag.jpg', 57),
(54, 'luanvan/bgbpskzal2lr8oiadtkf', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731834440/luanvan/bgbpskzal2lr8oiadtkf.jpg', 58),
(55, 'luanvan/ogojlvtgqseu0v18fgj2', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731834535/luanvan/ogojlvtgqseu0v18fgj2.jpg', 59),
(56, 'luanvan/s0clkcyi6nrokq9qtjot', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731834623/luanvan/s0clkcyi6nrokq9qtjot.jpg', 60),
(57, 'luanvan/cd1n1ka8vfszldsfmyri', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731834765/luanvan/cd1n1ka8vfszldsfmyri.jpg', 61),
(58, 'luanvan/x0cgat0xq5h7zoe8sep3', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731834935/luanvan/x0cgat0xq5h7zoe8sep3.jpg', 62),
(59, 'luanvan/ddnayrb9zbixf5maa2xf', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731835053/luanvan/ddnayrb9zbixf5maa2xf.jpg', 63),
(60, 'luanvan/vmf7q1czgyxxubtovqrd', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731835214/luanvan/vmf7q1czgyxxubtovqrd.jpg', 64),
(61, 'luanvan/prjkikjkqc350aguel5n', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731835355/luanvan/prjkikjkqc350aguel5n.jpg', 65),
(62, 'luanvan/v29iproddymi5jbfx0vj', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731835472/luanvan/v29iproddymi5jbfx0vj.jpg', 66),
(63, 'luanvan/cx1uhbk6exfdoiaxrkhf', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731835955/luanvan/cx1uhbk6exfdoiaxrkhf.jpg', 67),
(64, 'luanvan/t7dghb8l2zorni3pbwxq', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731836127/luanvan/t7dghb8l2zorni3pbwxq.jpg', 68),
(65, 'luanvan/xgd6968gekmymqfc2560', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731836250/luanvan/xgd6968gekmymqfc2560.jpg', 69),
(66, 'luanvan/kyejydlqi8cjwydx36sy', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731836385/luanvan/kyejydlqi8cjwydx36sy.jpg', 70),
(67, 'luanvan/v7vebo8oq9fk3irr0qvd', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731908460/luanvan/v7vebo8oq9fk3irr0qvd.jpg', 71),
(68, 'luanvan/zrvvcnhwrbv63n5lqebs', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731908592/luanvan/zrvvcnhwrbv63n5lqebs.jpg', 72),
(69, 'luanvan/iccyifynysv3exhy6m1k', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731909033/luanvan/iccyifynysv3exhy6m1k.jpg', 73),
(70, 'luanvan/hlyymwxy4trgurpecoda', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731909221/luanvan/hlyymwxy4trgurpecoda.jpg', 74),
(71, 'luanvan/kbzwqe3c1csbyh5xg7wp', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731909296/luanvan/kbzwqe3c1csbyh5xg7wp.jpg', 75),
(72, 'luanvan/f7ckhbiezq2l6wvb1i7x', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731909507/luanvan/f7ckhbiezq2l6wvb1i7x.jpg', 76),
(73, 'luanvan/ia2lilihk62yr4s5yqtb', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731909751/luanvan/ia2lilihk62yr4s5yqtb.jpg', 77),
(74, 'luanvan/ldgzvfc5lnxpgbf6nd5j', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731909832/luanvan/ldgzvfc5lnxpgbf6nd5j.jpg', 78),
(75, 'luanvan/xa64yip1vldolagq2hnc', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731909925/luanvan/xa64yip1vldolagq2hnc.jpg', 79),
(76, 'luanvan/e9qtkhsjj6m1txrtvkfr', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731910010/luanvan/e9qtkhsjj6m1txrtvkfr.jpg', 80),
(77, 'luanvan/wv54qqxdaqnl1q8599yv', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731910122/luanvan/wv54qqxdaqnl1q8599yv.jpg', 81),
(78, 'luanvan/pcgbywkjysaswqs6we4x', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731910224/luanvan/pcgbywkjysaswqs6we4x.jpg', 82),
(79, 'luanvan/mounhhvnmapfhvgeqp4e', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731910312/luanvan/mounhhvnmapfhvgeqp4e.jpg', 83),
(80, 'luanvan/kkielgfwtyljupulrtrq', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731910465/luanvan/kkielgfwtyljupulrtrq.jpg', 84),
(81, 'luanvan/v18kdmlusjesxrykojmx', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731910583/luanvan/v18kdmlusjesxrykojmx.jpg', 85),
(82, 'luanvan/kk9l2ow5cgfepj970k7k', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731910898/luanvan/kk9l2ow5cgfepj970k7k.jpg', 86),
(83, 'luanvan/ucphrq7p9ghaidj6zgbf', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911076/luanvan/ucphrq7p9ghaidj6zgbf.jpg', 87),
(84, 'luanvan/bgd3vdz7ovc6xqweektv', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911143/luanvan/bgd3vdz7ovc6xqweektv.jpg', 88),
(85, 'luanvan/fbpkwfkc07wwwxspty4e', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911205/luanvan/fbpkwfkc07wwwxspty4e.jpg', 89),
(86, 'luanvan/yrcdl7rjs0fqovkdrbnt', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911430/luanvan/yrcdl7rjs0fqovkdrbnt.jpg', 90),
(87, 'luanvan/dyozvplg9a7sop2z1hpr', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911507/luanvan/dyozvplg9a7sop2z1hpr.jpg', 91),
(88, 'luanvan/hhzf9fmxws0us31qrotg', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911582/luanvan/hhzf9fmxws0us31qrotg.jpg', 92),
(89, 'luanvan/lumqku6ckiew5hkonncu', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911668/luanvan/lumqku6ckiew5hkonncu.jpg', 93),
(90, 'luanvan/utc9arvogltuxlcngfn8', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911761/luanvan/utc9arvogltuxlcngfn8.jpg', 94),
(91, 'luanvan/tbbx2rhvwy7msqvxbp5g', 'https://res.cloudinary.com/dbmcdpt3h/image/upload/v1731911843/luanvan/tbbx2rhvwy7msqvxbp5g.jpg', 95);

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
(7, 'MK9525KTCK', 'KTCK', '2024-08-06 16:26:38', '2024-10-23 10:28:29'),
(9, 'MK1732KXD', 'KXD1', '2024-11-12 15:31:02', '2024-11-12 15:31:46');

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
(10, 'MKH14692024', '2024', '2024-08-06 16:28:46', '2024-10-23 10:28:52'),
(11, 'MKH50962025', '2026', '2024-11-12 15:24:32', '2024-11-16 14:29:59');

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
(8, 'MLH8429CNTT0220', 'CNTT0220', '2024-08-06 16:30:37', '2024-10-23 10:29:11'),
(11, 'MLH4411KTPM0000', 'KTPM11', '2024-11-12 15:35:17', '2024-11-16 19:16:47'),
(12, 'MLH4240Abc', 'Abc', '2024-11-16 19:16:55', '2024-11-16 19:16:55');

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
(1, 'MN87007521', 'Ngăn A', 12, '2024-08-18 11:04:58', '2024-11-18 12:39:19'),
(2, 'MN51763237', 'Ngăn B', 3, '2024-08-18 11:05:14', '2024-08-19 14:37:42'),
(3, 'MN26083479', 'Ngăn C', 5, '2024-08-18 11:05:31', '2024-08-20 11:14:34'),
(4, 'MN52762985', 'Ngăn D', 6, '2024-08-18 11:11:00', '2024-11-17 15:53:31'),
(5, 'MN88197424', 'Ngăn E', 1, '2024-11-17 11:14:30', '2024-11-17 11:18:47');

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
(18, 'MNH96426131', 'Triết Học', '2024-09-21 10:51:13', '2024-09-21 10:51:13'),
(19, 'MNH52292061', 'Thực Phẩm', '2024-11-17 11:09:32', '2024-11-17 11:10:07'),
(20, 'MNH33152079', 'Xây Dựng', '2024-11-18 13:29:01', '2024-11-18 13:29:01');

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
(16, 'MNN89568503', 'cập nhật ngôn ngữ mới', '2024-09-01 14:22:04', '2024-11-17 10:59:14'),
(17, 'MNN12553156', 'China', '2024-11-17 10:59:49', '2024-11-17 10:59:49');

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
(1, 'phuc2', '2002-02-24', 'Nam', 'LT', 852348684, 'nguyennhamphuc2402@gmail.com', '$2y$12$5FGmQ7YTKzcBJJ9dT3AGTepHNRHmyVf20/HrpLRe6NpKPY3HVvn3m', 0, 0, 0, '2024-08-04 20:58:13', '2024-11-16 14:42:08', 2, 1),
(2, 'Phúc Nguyễn', '2002-02-24', 'Nam', 'Long Thạnh', 852348888, 'phucmap4444@gmail.com', '$2y$12$39wfmjG4wc/SuO4vigGJduDfqviCiOK56YJ9TOWV5wo8BiNO.DTSO', 0, 1, 0, '2024-08-06 13:58:45', '2024-09-20 10:40:41', 2, 4),
(3, 'Nguyễn Phúc', '1990-08-15', 'Nam', 'ABC', 852348822, 'nnphuc2000378@student.ctuet.edu.vn', '$2y$12$y3dZQh...y2b7trptugxBehe8WTPA9T.wuyCjrj0niPJGb/et23fi', 0, 2, 1, '2024-08-06 16:04:48', '2024-10-02 13:37:48', 2, 2),
(4, 'Tôi Lầm Lỗi', '2024-09-04', 'Nữ', 'Q.Ninh Kiều, TP.Cần Thơ', 212111111, 'accloinhieu@gmail.com', '$2y$12$VHidf9ELYIY4y.C4jrZjJ.QQkI/arMgzWjdGUEA4V6iyRTtOWvV5G', 3, 2, 0, '2024-09-18 19:57:53', '2024-09-20 10:40:33', 2, 4),
(5, 'Nguyễn Văn A', '2002-07-15', 'Nam', 'Thành Phố Cần Thơ', 939123123, 'accmuontuxa@gmail.com', '$2y$12$2oFaMLfmPtM7V7bI1qykpuwfb3VnBD8RwVdDa7nUk5fM//boqeExW', 0, 2, 0, '2024-09-20 10:42:46', '2024-09-23 20:44:16', 2, 4),
(6, 'Lê Triệu Vy', '1990-03-20', 'Nữ', 'Thành Phố Cần Thơ', 939629340, 'accthuthu@gmail.com', '$2y$12$ldqFVwGCas32UKHQTXxhfeehOgW0C4XXC0gjr2d4dSa9RfHKHmgyG', 0, 7, 0, '2024-09-21 09:55:59', '2024-11-17 11:38:24', 2, 2),
(7, 'Huỳnh Anh Tuấn', '2002-09-17', 'Nam', 'Vĩnh Long', 939463679, 'accthichtinhoc@gmail.com', '$2y$12$PERr9J6HQoVdu3xKnlZBIO3exPGBI4hF6MSf6c2gOhvq0X8klDSVG', 0, 2, 0, '2024-09-22 12:19:57', '2024-10-08 12:45:26', 2, 4),
(8, 'Phan Văn Nam', '2000-09-07', 'Nam', 'Ô Môn', 939644932, 'accthichtriethoc@gmail.com', '$2y$12$dHtGLtA7jcvVNFl8B46uEObCQmAo898S4ezfgI2Jp8KDSnCiHjfUS', 0, 1, 1, '2024-09-22 16:25:18', '2024-09-30 09:57:12', 2, 4),
(9, 'Nguyễn Hoàng Tuấn', '1997-04-09', 'Nam', 'Thành Phố Cần Thơ', 939888122, 'thichnongnghiep@gmail.com', '$2y$12$BDTltFuWDIrW4tGidlnkx.kd5RxWMUkQQiN7mp8kTpubCfJs/.5YC', 0, 0, 0, '2024-09-23 18:20:56', '2024-09-24 13:56:44', 2, 4),
(10, 'Đỗ Nguyễn Quốc', '2001-02-06', 'Nam', 'Kiên Giang', 939881188, 'thieunhi@gmail.com', '$2y$12$uxz1hQbFPfeEqq.X21Ibeuz9Qchv9udkWuZ.7klLtFmw0S7z5Wn.a', 0, 6, 1, '2024-09-23 20:26:25', '2024-11-28 11:43:58', 2, 4),
(11, 'Huỳnh Thanh Nhã', '2002-01-01', 'Nam', 'Cần Thơ', 939881182, 'accvanhoc@gmail.com', '$2y$12$Xhjk0s8Y0s4pt5EDB/IPReaBDYDWhHbPrs2PJh07HcxiqLIi8UACq', 0, 0, 1, '2024-10-09 09:55:20', '2024-10-09 09:56:51', 1, 3),
(12, 'Nguyễn Nhâm Phúc', '2002-02-24', 'Nam', 'Cần Thơ', 939111111, 'demodangky@gmail.com', '$2y$12$/1g48wxL3tpvA6Fxt5219e2IplniYXvEqQFUzbFusfrlwihhuCxvu', 0, 0, 0, '2024-11-10 14:33:22', '2024-11-10 14:41:20', 1, 4),
(13, 'Nguyễn Nhâm Phúc', '2002-02-24', 'Nam', 'Hậu Giang', 939222222, 'testchucnang1111@gmail.com', '$2y$12$RjyWTE9CTVCnglT3zjeHU.qrmBBX8Xr4TUVYcMnx3kJ5X.AHXW0jm', 0, 0, 1, '2024-11-10 14:49:28', '2024-11-11 14:09:55', 2, 4),
(14, 'Phúc', '2024-10-28', 'Nam', 'Cần Thơ', 939881122, 'acctinhoc1@gmail.com', '$2y$12$VC7ydWIVSxIj6FT.zv/sSumMJsP6hTpnWL.6j428WrqbN2sDmgsqi', 0, 3, 1, '2024-11-10 19:08:13', '2024-11-17 11:39:32', 2, 4),
(15, 'Huỳnh Nhã', '2024-01-01', 'Nam', 'Cần Thơ', 939221133, 'testgoiy@gmail.com', '$2y$12$xKGgz1/rVeDua/eFGP8KUO3JGkBFzSwLSFlZwlbsQYZHZFgwcA4QO', 0, 1, 0, '2024-11-12 11:20:59', '2024-11-17 11:40:12', 1, 4),
(16, 'Phúc', '2024-11-21', 'Nam', 'Cần thơ', 939122122, 'acctest1111@gmail.com', '$2y$12$Z9wXnEBjBdnhp3VmlRn7hueYEa0KSOC5y/fWmOSHMUuauMcGzHO32', 0, 0, 0, '2024-11-13 20:54:23', '2024-11-16 15:07:10', 2, 4),
(17, 'Phúc', '2024-11-05', 'Nam', 'Cần Thơ', 939211213, 'testthuchucnang@gmail.com', '$2y$12$SXGAovBDdGA2BxjELt2DZ.XBvVxgExHlYm/CTru2H5OS8aHTGnLeC', 0, 0, 0, '2024-11-16 14:52:25', '2024-11-16 14:52:25', 1, 4),
(19, 'Phúc', '1997-01-01', 'Nam', 'Cần Thơ', 939411411, 'test1111@gmail.com', '$2y$12$onKZ7DtmT4AF2REkYHN.Y.eCGtTzssRmQtkcc1ynPpT6P8xoz9Eom', 0, 1, 0, '2024-11-18 13:54:03', '2024-11-18 14:02:36', 1, 3);

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
(117, 'Thêm sách', NULL, '2024-10-02 14:12:37', 1, 42),
(118, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 16 vào sách', '2024-11-16 10:16:57', 2, 11),
(119, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 14 vào sách', '2024-11-16 10:16:57', 2, 11),
(120, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 15 vào sách', '2024-11-16 10:16:57', 2, 11),
(121, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 16 vào sách', '2024-11-16 10:16:57', 2, 11),
(122, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 1 khỏi sách', '2024-11-16 10:16:57', 2, 11),
(123, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-11-16 10:16:57', 2, 11),
(124, 'Cập nhật sách', 'Cập nhật tên sách, Cập nhật giá tiền, Thay đổi tenSach từ \'MỘT CHỮ CŨNG LÀ TRÒ1\' sang \'MỘT CHỮ CŨNG LÀ TRÒ\', Thay đổi giaTien từ \'109000\' sang \'100000\'', '2024-11-16 10:16:57', 2, 11),
(125, 'Thêm sách', NULL, '2024-11-17 10:39:55', 2, 43),
(126, 'Thêm thể loại cho sách', 'Thêm thể loại có ID: 16 vào sách', '2024-11-17 10:51:02', 2, 43),
(127, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 13 vào sách', '2024-11-17 10:51:02', 2, 43),
(128, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 16 vào sách', '2024-11-17 10:51:02', 2, 43),
(129, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 2 khỏi sách', '2024-11-17 10:51:02', 2, 43),
(130, 'Thêm sách', NULL, '2024-11-17 15:29:31', 2, 44),
(131, 'Thêm sách', NULL, '2024-11-17 15:32:00', 2, 45),
(132, 'Thêm sách', NULL, '2024-11-17 15:34:40', 2, 46),
(133, 'Thêm sách', NULL, '2024-11-17 15:37:22', 2, 47),
(134, 'Thêm sách', NULL, '2024-11-17 15:40:59', 2, 48),
(135, 'Thêm sách', NULL, '2024-11-17 15:44:15', 2, 49),
(136, 'Thêm sách', NULL, '2024-11-17 15:45:44', 2, 50),
(137, 'Xóa thể loại của sách', 'Xóa thể loại có ID: 29 khỏi sách', '2024-11-17 15:47:42', 2, 30),
(138, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 28 vào sách', '2024-11-17 15:47:42', 2, 30),
(139, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 17 khỏi sách', '2024-11-17 15:47:42', 2, 30),
(140, 'Thêm sách', NULL, '2024-11-17 15:50:59', 2, 51),
(141, 'Thêm sách', NULL, '2024-11-17 15:54:47', 2, 52),
(142, 'Thêm sách', NULL, '2024-11-17 15:57:12', 2, 53),
(143, 'Thêm sách', NULL, '2024-11-17 15:58:40', 2, 54),
(144, 'Thêm sách', NULL, '2024-11-17 16:02:17', 2, 55),
(145, 'Thêm sách', NULL, '2024-11-17 16:05:04', 2, 57),
(146, 'Thêm sách', NULL, '2024-11-17 16:07:20', 2, 58),
(147, 'Thêm sách', NULL, '2024-11-17 16:08:56', 2, 59),
(148, 'Thêm sách', NULL, '2024-11-17 16:10:24', 2, 60),
(149, 'Thêm sách', NULL, '2024-11-17 16:12:46', 2, 61),
(150, 'Thêm sách', NULL, '2024-11-17 16:15:35', 2, 62),
(151, 'Thêm sách', NULL, '2024-11-17 16:17:34', 2, 63),
(152, 'Thêm sách', NULL, '2024-11-17 16:20:15', 2, 64),
(153, 'Thêm sách', NULL, '2024-11-17 16:22:36', 2, 65),
(154, 'Thêm sách', NULL, '2024-11-17 16:24:32', 2, 66),
(155, 'Thêm sách', NULL, '2024-11-17 16:32:36', 2, 67),
(156, 'Thêm sách', NULL, '2024-11-17 16:35:28', 2, 68),
(157, 'Thêm sách', NULL, '2024-11-17 16:37:30', 2, 69),
(158, 'Thêm sách', NULL, '2024-11-17 16:39:45', 2, 70),
(159, 'Thêm sách', NULL, '2024-11-18 12:41:01', 2, 71),
(160, 'Thêm sách', NULL, '2024-11-18 12:43:12', 2, 72),
(161, 'Thêm sách', NULL, '2024-11-18 12:50:34', 2, 73),
(162, 'Thêm sách', NULL, '2024-11-18 12:53:41', 2, 74),
(163, 'Thêm sách', NULL, '2024-11-18 12:54:56', 2, 75),
(164, 'Thêm sách', NULL, '2024-11-18 12:58:28', 2, 76),
(165, 'Xóa thể loại của sách', 'Xóa thể loại có ID: 20 khỏi sách', '2024-11-18 12:59:13', 2, 22),
(166, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 6 vào sách', '2024-11-18 12:59:13', 2, 22),
(167, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 26 vào sách', '2024-11-18 12:59:13', 2, 22),
(168, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 15 khỏi sách', '2024-11-18 12:59:13', 2, 22),
(169, 'Xóa thể loại của sách', 'Xóa thể loại có ID: 20 khỏi sách', '2024-11-18 12:59:32', 2, 20),
(170, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 6 vào sách', '2024-11-18 12:59:32', 2, 20),
(171, 'Thêm ngành học cho sách', 'Thêm ngành học có ID: 26 vào sách', '2024-11-18 12:59:32', 2, 20),
(172, 'Xóa ngành học của sách', 'Xóa ngành học có ID: 15 khỏi sách', '2024-11-18 12:59:32', 2, 20),
(173, 'Thêm sách', NULL, '2024-11-18 13:02:31', 2, 77),
(174, 'Thêm sách', NULL, '2024-11-18 13:03:53', 2, 78),
(175, 'Thêm sách', NULL, '2024-11-18 13:05:26', 2, 79),
(176, 'Thêm sách', NULL, '2024-11-18 13:06:50', 2, 80),
(177, 'Thêm sách', NULL, '2024-11-18 13:08:42', 2, 81),
(178, 'Thêm sách', NULL, '2024-11-18 13:10:25', 2, 82),
(179, 'Thêm sách', NULL, '2024-11-18 13:11:53', 2, 83),
(180, 'Thêm sách', NULL, '2024-11-18 13:14:26', 2, 84),
(181, 'Thêm sách', NULL, '2024-11-18 13:16:24', 2, 85),
(182, 'Thêm sách', NULL, '2024-11-18 13:21:39', 2, 86),
(183, 'Thêm sách', NULL, '2024-11-18 13:24:37', 2, 87),
(184, 'Thêm sách', NULL, '2024-11-18 13:25:44', 2, 88),
(185, 'Thêm sách', NULL, '2024-11-18 13:26:46', 2, 89),
(186, 'Thêm sách', NULL, '2024-11-18 13:30:30', 2, 90),
(187, 'Thêm sách', NULL, '2024-11-18 13:31:48', 2, 91),
(188, 'Thêm sách', NULL, '2024-11-18 13:33:03', 2, 92),
(189, 'Thêm sách', NULL, '2024-11-18 13:34:29', 2, 93),
(190, 'Thêm sách', NULL, '2024-11-18 13:36:02', 2, 94),
(191, 'Thêm sách', NULL, '2024-11-18 13:37:23', 2, 95);

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
(21, 'NXB13119684', 'Nhà xuất bản Giao Thông Vận Tải', 'Chưa có', '2024-10-02 13:41:32', '2024-10-02 13:41:32'),
(22, 'NXB77068072', 'nhà xuất bản mới cập nhật', 'chưa có', '2024-11-17 10:52:58', '2024-11-17 10:53:42'),
(23, 'NXB73725577', 'Nhà xuất bản Thanh Niên', 'Chưa có', '2024-11-17 15:34:39', '2024-11-17 15:34:39'),
(24, 'NXB70963553', 'Nhà xuất bản Hồng Bàn', 'Chưa có', '2024-11-18 13:20:03', '2024-11-18 13:20:03');

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
(57, 'MPM40870504', '2024-09-30 09:41:40', '2024-12-02 04:37:47', 3, 'Mượn từ xa', NULL, 169000, 'Lê Triệu Vy', 10),
(58, 'MPM89708311', '2024-09-30 10:32:00', '2024-10-20 03:32:00', 3, 'Mượn từ xa', NULL, 122000, 'Lê Triệu Vy', 6),
(59, 'MPM53057931', '2024-09-30 10:35:11', '2024-10-15 03:37:35', 3, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 6),
(60, 'MPM63098184', '2024-09-30 10:35:33', '2024-10-15 03:36:34', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 6),
(61, 'MPM25073889', '2024-10-02 13:36:12', '2024-10-22 06:37:48', 3, 'Mượn từ xa', NULL, 139000, 'Nguyễn Phúc', 3),
(62, 'MPM63662954', '2024-10-08 12:43:30', '2024-10-18 05:44:48', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 7),
(63, 'MPM59459605', '2024-10-09 09:56:51', '2024-10-24 02:56:51', 0, 'Mượn tại trường', NULL, 0, NULL, 11),
(64, 'MPM19034060', '2024-11-10 19:09:41', '2024-11-22 04:06:02', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 14),
(65, 'MPM81801229', '2024-11-11 14:09:55', '2024-11-21 07:09:55', 0, 'Mượn tại trường', NULL, 0, NULL, 13),
(66, 'MPM18433445', '2024-11-12 11:07:07', '2024-11-22 04:08:40', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 14),
(67, 'MPM78581809', '2024-11-12 11:10:09', '2024-11-27 04:39:32', 3, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 14),
(68, 'MPM22558059', '2024-11-12 11:30:16', '2024-11-22 04:30:16', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 15),
(69, 'MPM56185988', '2024-11-18 13:58:02', '2024-12-03 06:58:52', 4, 'Mượn tại trường', NULL, 0, 'Lê Triệu Vy', 19),
(70, 'MPM14803056', '2024-11-28 11:43:58', '2024-12-08 04:43:58', 0, 'Mượn tại trường', NULL, 0, NULL, 10);

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
(16, 'MPT31442668', '2024-10-08 12:44:55', 'Lê Triệu Vy', 62),
(17, 'MPT56890603', '2024-11-12 11:06:05', 'Lê Triệu Vy', 64),
(18, 'MPT81770450', '2024-11-12 11:08:43', 'Lê Triệu Vy', 66),
(19, 'MPT31221827', '2024-11-17 11:38:24', 'Lê Triệu Vy', 60),
(20, 'MPT34054721', '2024-11-17 11:40:12', 'Lê Triệu Vy', 68),
(21, 'MPT65086913', '2024-11-18 13:59:00', 'Lê Triệu Vy', 69);

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
(6, 'MS48144709', 'LỊCH SỬ VÕ HỌC VIỆT NAM', 'Phạm Phong', 250, 1999, 10, 10, NULL, 99000, '<p>chưa c&oacute;</p>', 631, 50, 1, 4, '2024-08-27 16:25:38', '2024-11-28 17:42:01', 12, 1, 2),
(7, 'MS32422963', 'TỔNG HỢP KIẾN THỨC PHP CĂN BẢN', 'Codegym', 255, 2009, 10, 9, NULL, 200000, '<p>Giống với Java đ&atilde; kể tr&ecirc;n, c&aacute;c kiến thức PHP ở t&agrave;i liệu n&agrave;y được hệ thống h&oacute;a lại theo dạng sơ đồ c&acirc;y, gi&uacute;p bạn nắm được hết những kiến thức cốt l&otilde;i của ng&ocirc;n ngữ lập tr&igrave;nh PHP.</p>\r\n\r\n<p>Nội dung ch&iacute;nh được chia l&agrave;m 3 phần lớn: c&uacute; ph&aacute;p cơ bản, mảng v&agrave; cấu tr&uacute;c điều kiện.</p>\r\n\r\n<h2>Dưới đ&acirc;y l&agrave; những t&aacute;c phẩm đ&atilde; xuất bản của t&aacute;c giả &quot;Codegym&quot;:</h2>\r\n\r\n<ol>\r\n	<li><a href=\"https://thuviensach.vn/lap-trinh-can-ban-13868.html\">Lập Tr&igrave;nh Căn Bản</a></li>\r\n	<li><a href=\"https://thuviensach.vn/150-thuat-ngu-tieng-anh-chuyen-nganh-lap-trinh-14358.html\">150 Thuật Ngữ Tiếng Anh Chuy&ecirc;n Ng&agrave;nh Lập Tr&igrave;nh</a></li>\r\n	<li><a href=\"https://thuviensach.vn/tong-hop-kien-thuc-java-can-ban-14359.html\">Tổng Hợp Kiến Thức Java Căn Bản</a></li>\r\n	<li><a href=\"https://thuviensach.vn/tong-hop-kien-thuc-php-can-ban-14360.html\">Tổng Hợp Kiến Thức Php Căn Bản</a></li>\r\n	<li><a href=\"https://thuviensach.vn/so-tay-nghe-lap-trinh-14366.html\">Sổ Tay Nghề Lập Tr&igrave;nh</a></li>\r\n</ol>', 666, 0, 6, 5, '2024-08-29 15:08:15', '2024-11-28 18:01:18', 12, 2, 2),
(8, 'MS42146135', 'SỰ TÍCH CÂY XƯƠNG RỒNG', 'Nguyễn Ngọc Ký', 88, 2020, 5, 5, NULL, 45000, '<p>Sự T&iacute;ch C&acirc;y Xương Rồng</p>\r\n\r\n<p>&ldquo;Khi cả gia đ&igrave;nh rồng trở lại được chỗ b&atilde;i c&aacute;t vắng th&igrave; kỳ lạ thay: Kh&ocirc;ng thấy x&aacute;c Rồng &Uacute;t đ&acirc;u nữa. Chỉ thấy giữ cồn xuất hiện một bụi c&acirc;y uốn &eacute;o, kh&ocirc;ng hề c&oacute; l&aacute; m&agrave; chỉ tua tủa những gai. Tr&ecirc;n ngọn c&aacute;c nh&aacute;nh c&acirc;y nở tung những ch&ugrave;m hoa đỏ như những b&ocirc;ng lửa rực rỡ...&rdquo;</p>\r\n\r\n<p>Cuốn s&aacute;ch được viết bởi Nh&agrave; gi&aacute;o Ưu t&uacute;, Nh&agrave; văn đầu ti&ecirc;n của Việt Nam viết bằng ch&acirc;n.</p>\r\n\r\n<p>NGƯT. Nguyễn Ngọc K&yacute; sinh ng&agrave;y 28 th&aacute;ng 06 năm 1947, qu&ecirc; ở x&atilde; Hải Thanh, huyện Hải Hậu, tỉnh Nam Định. Từ năm l&ecirc;n 4 tuổi, &ocirc;ng bị bệnh v&agrave; bị bại liệt cả 2 tay, nhưng &ocirc;ng đ&atilde; vượt qua số phận của m&igrave;nh v&agrave; trở th&agrave;nh nh&agrave; gi&aacute;o ưu t&uacute;. &Ocirc;ng l&agrave; nh&agrave; văn đầu ti&ecirc;n, người thầy gi&aacute;o Việt Nam đầu ti&ecirc;n d&ugrave;ng ch&acirc;n để viết. Cho đến nay (2017), NGƯT - Nh&agrave; văn Nguyễn Ngọc K&yacute; đ&atilde; c&oacute; 36 cuốn s&aacute;ch được xuất bản.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Sự T&iacute;ch C&acirc;y Xương Rồng PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Ngọc K&yacute;</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 749, 0, 1, 4, '2024-08-29 15:32:57', '2024-11-28 17:46:44', 13, 1, 3),
(9, 'MS83562612', 'CUỘC PHIÊU LƯU KỲ DIỆU CỦA NILS', 'Selma Lagerlöf', 77, 2010, 15, 16, 'https://drive.google.com/drive/u/1/folders/1fuYkOSRiy5inW8zn5XXE4pTeLdhsRVsZ', 50000, '<p>Một b&agrave;i thơ d&agrave;i về thi&ecirc;n nhi&ecirc;n c&oacute; một kh&ocirc;ng hai: qua chuyến đi của Nilx - nước Thuỵ Điển dần dần hiện ra từ Bắc tới Nam, v&agrave; c&aacute;c yếu tố thi&ecirc;n nhi&ecirc;n dưới ng&ograve;i b&uacute;t của t&aacute;c giả Xelma kh&ocirc;ng kh&aacute;c g&igrave; những vật c&oacute; tri gi&aacute;c.</p>\r\n\r\n<p>Một thi&ecirc;n trường ca về con người v&agrave; lao động.</p>\r\n\r\n<p>L&agrave; truyện đời xưa v&agrave; truyện đời nay, đan xen giữa cổ t&iacute;ch v&agrave; hiện thực.</p>\r\n\r\n<p>L&agrave; truyện của thế giới lo&agrave;i vật v&agrave; x&atilde; hội lo&agrave;i người.</p>\r\n\r\n<p>Mượn truyện lo&agrave;i vật để dạy lo&agrave;i người - như một cuốn truyện ngụ ng&ocirc;n - s&aacute;nh ngang ngụ ng&ocirc;n La Fontaine. Truyện ngụ ng&ocirc;n m&agrave; x&acirc;y dựng t&acirc;m l&iacute; nh&acirc;n vật phức tạp chẳng k&eacute;m g&igrave; c&aacute;c tiểu thuyết x&atilde; hội.</p>', 157, 7, 2, 5, '2024-08-29 15:48:41', '2024-11-30 10:24:45', 13, 1, 3),
(10, 'MS80325327', 'SÔNG NÚI VÀ BIỂN HỒ', 'Hồ Cúc', 109, 1997, 10, 10, NULL, 99000, '<p>C&aacute;c bạn trẻ v&agrave;o đời cần trang bị cho m&igrave;nh một số vốn kiến thức bao qu&aacute;t v&agrave; ch&iacute;nh x&aacute;c về c&aacute;c lĩnh vực quan trọng nhất của thi&ecirc;n nhi&ecirc;n v&agrave; thế giới con người. Trong thời đại th&ocirc;ng tin v&agrave; to&agrave;n cầu h&oacute;a hiện nay, y&ecirc;u cầu đ&oacute; trở n&ecirc;n bức thiết hơn bao giờ hết. Những kiến thức đ&oacute; phải l&agrave; nền tảng vững v&agrave;ng v&agrave; hiện đại để người thanh ni&ecirc;n tiếp tục ph&aacute;t huy v&agrave; x&acirc;y dựng tri thức chuy&ecirc;n m&ocirc;n của m&igrave;nh, t&ugrave;y theo &yacute; th&iacute;ch v&agrave; ng&agrave;nh học sắp sửa được chọn lựa.</p>\r\n\r\n<p>Trong tinh thần đ&oacute;, Nh&agrave; xuất bản Trẻ cho ra mắt bạn đọc loạt ấn phẩm được tr&igrave;nh b&agrave;y nhất qu&aacute;n trong một tập hợp c&oacute; t&ecirc;n l&agrave; Ch&igrave;a Kh&oacute;a V&agrave;ng Tri Thức. Tập hợp n&agrave;y sẽ bao gồm 10 t&aacute;c phẩm, lần lượt đề cập đến c&aacute;c lĩnh vực thi&ecirc;n văn, n&uacute;i non, s&ocirc;ng ng&ograve;i, lịch sử, c&aacute;c nh&acirc;n vật nổi tiếng, c&aacute;c quốc gia tr&ecirc;n thế giới...</p>\r\n\r\n<p>Tr&acirc;n trọng giới thiệu c&ugrave;ng bạn đọc.</p>', 333, 0, 2, 4, '2024-08-29 15:56:07', '2024-11-17 10:37:17', 13, 1, 3),
(11, 'MS93137413', 'MỘT CHỮ CŨNG LÀ TRÒ', 'Nguyễn Trường Sa', 222, 2001, 5, 5, NULL, 100000, '<p>Hẳn tựa s&aacute;ch khiến người đọc li&ecirc;n hệ ngay tới c&acirc;u &ldquo;Nhất tự vi sư, b&aacute;n tự vi sư.&rdquo; (Một chữ l&agrave; thầy, nửa chữ cũng l&agrave; thầy). V&igrave; sao ở đ&acirc;y lại Một chữ cũng l&agrave; tr&ograve;? C&oacute; g&igrave; nhầm lẫn chăng?</p>\r\n\r\n<p>Thưa, đ&oacute; l&agrave; c&aacute;ch m&agrave; một người thầy đ&atilde; tiếp nhận, đ&atilde; trải qua, đ&atilde; tin tưởng.</p>\r\n\r\n<p>Người thầy ấy l&agrave; t&aacute;c giả Nguyễn Trường Sa, một tiến sĩ gi&aacute;o dục c&oacute; g&oacute;c nh&igrave;n tho&aacute;ng, tư duy mới v&agrave; th&oacute;i quen đặt c&acirc;u hỏi ngược lại cho mọi vấn đề. Vậy n&ecirc;n mới c&oacute; Một chữ cũng l&agrave; Tr&ograve; - cuốn s&aacute;ch chia sẻ trải nghiệm d&agrave;nh cho c&aacute;c sinh vi&ecirc;n sư phạm v&agrave; những thầy c&ocirc; gi&aacute;o trẻ, những người đang ấp ủ nhiều l&yacute; tưởng bỗng một ng&agrave;y vỡ &ograve;a trước thực tế gai g&oacute;c, hoang mang kh&ocirc;ng biết n&ecirc;n đi tiếp hay rẽ sang hướng kh&aacute;c.</p>\r\n\r\n<p>Bạn sắp trở th&agrave;nh nh&agrave; gi&aacute;o hay đang l&agrave; một nh&agrave; gi&aacute;o? V&agrave; bạn coi việc đi dạy l&agrave; c&aacute;i nghề hay đam m&ecirc; hay nghĩa vụ? D&ugrave; thuộc trường hợp n&agrave;o, bạn đều c&oacute; thể t&igrave;m thấy c&acirc;u chuyện của (cho) ch&iacute;nh m&igrave;nh trong cuốn s&aacute;ch n&agrave;y.</p>', 272, 0, 0, 5, '2024-08-29 17:54:12', '2024-11-18 14:00:07', 12, 1, 7),
(12, 'MS77237466', 'CON NGƯỜI PHI THƯỜNG TRONG BẠN', 'Anthony Robbins', 256, 2016, 10, 10, 'https://drive.google.com/drive/u/1/folders/18oxmTU9P6G8lN_AYtSt64OVBJdy3MUWJ', 250000, '<p>LỜI N&Oacute;I ĐẦU</p>\r\n\r\n<p>Với tư c&aacute;ch l&agrave; nh&agrave; t&acirc;m l&yacute; ch&iacute;nh của bệnh viện Bellevue, th&agrave;nh phố New York, t&ocirc;i chứng kiến nhiều m&atilde;nh đời khổ đau, kh&ocirc;ng chỉ ri&ecirc;ng những bệnh nh&acirc;n t&acirc;m thần, m&agrave; cả ở những nh&acirc;n vi&ecirc;n &quot;b&igrave;nh thường&quot;,&quot;khoẻ mạnh&quot; đang chữa trị cho bệnh nh&acirc;n. T&ocirc;i c&ograve;n thấy sự bất hạnh cả ở những người tương đối th&agrave;nh c&ocirc;ng v&agrave; c&oacute; địa vị cao đến gặp t&ocirc;i ở ph&ograve;ng kh&aacute;m tư. Rất thường, sự đau đớn v&agrave; sự khốn khổ l&agrave; điều kh&ocirc;ng mong muốn v&agrave; cuối c&ugrave;ng cũng qua đi khi con người chịu để cho c&aacute;c niềm tin, t&igrave;nh cảm v&agrave; h&agrave;nh động của họ l&agrave;m thay đổi qui tr&igrave;nh của đời sống. Khổ nỗi nhiều khi họ kh&ocirc;ng l&agrave;m thế. Họ nấn n&aacute;, rồi cố thay đổi kết quả xấu hay thường rơi v&agrave;o sự lưỡng lự chỉ để than tr&aacute;ch cuộc đời khủng khiếp của họ hay bằng c&aacute;ch n&agrave;o đ&oacute; được một ai &quot;sắp xếp cho&quot;.</p>\r\n\r\n<p>Những người c&oacute; khả năng để nhận ra rằng họ định đoạt kết quả của cuộc sống ri&ecirc;ng kh&ocirc;ng phải l&uacute;c n&agrave;o cũng dễ. Thực tế l&agrave;, n&oacute; thường l&agrave; một c&ocirc;ng việc c&oacute; t&iacute;nh chất &aacute;p đảo. Do đ&oacute;, t&ocirc;i lu&ocirc;n t&igrave;m kiếm một phương ph&aacute;p v&agrave; những kỹ thuật mới khi l&agrave;m việc ở bệnh viện v&agrave; đối với những bệnh nh&acirc;n ri&ecirc;ng của t&ocirc;i. Năm năm về trước, lần đầu ti&ecirc;n t&ocirc;i nghe biết về t&aacute;c phẩm của Tony Robbins v&agrave; theo một trong những kh&oacute;a tập huấn của anh ở new York.</p>\r\n\r\n<p>Tối đ&oacute;, t&ocirc;i thấy l&agrave;, Tony g&oacute;p phần v&agrave;o niềm tin của t&ocirc;i khi cho rằng bất kỳ ai l&agrave;nh mạnh cơ bản đều c&oacute; thể l&agrave;m chủ v&agrave; sống cuộc đời tr&agrave;n đầy, ngay sau đ&oacute;, t&ocirc;i theo kh&oacute;a học hai tuần c&oacute; cấp giấy chứng nhận của Tony, cũng như c&ugrave;ng c&aacute;c đồng nghiệp v&agrave; c&aacute;c bệnh nh&acirc;n theo tiếp c&aacute;c kh&oacute;a kh&aacute;c. T&ocirc;i gọi đ&oacute; l&agrave; kh&oacute;a&quot;Huấn luyện cơ Bản cho cuộc sống&quot;. Rồi t&ocirc;i giới thiệu h&agrave;ng loạt băng ghi &acirc;m v&agrave; cuốn s&aacute;ch đầu tay của anh, Năng Lực v&ocirc; tận.</p>\r\n\r\n<p>Mặc dầu một số đồng nghiệp của t&ocirc;i kh&oacute; chịu v&agrave; ngạc nhi&ecirc;n khi t&ocirc;i giới thiệu những t&aacute;c phẩm của một thanh ni&ecirc;n chẳng c&oacute; bằng cấp, m&agrave; những ai đọc v&agrave; nghe Tony l&agrave; đi đến chổ t&aacute;n th&agrave;nh. Th&ecirc;m v&agrave;o t&agrave;i liệu đ&uacute;ng đắn v&agrave; dễ l&atilde;nh hội, Tony c&oacute; một t&agrave;i năng v&agrave; một phong th&aacute;i l&ocirc;i cuốn l&agrave;m cho điều viết ra của anh dễ nắm bắt.</p>', 862, 156, 5, 5, '2024-08-29 18:06:15', '2024-11-17 11:48:34', 12, 2, 7),
(13, 'MS36616003', 'KHÚC ĐỒNG DAO LẤM LÁP', 'Kao Sơn', 221, 2019, 5, 5, NULL, 79000, '<p>T&aacute;c phẩm đạt giải A cuộc vận động s&aacute;ng t&aacute;c cho thiếu nhi 1999 - 2000 của Nh&agrave; xuất bản Kim Đồng. Truyện kh&ocirc;ng được chia th&agrave;nh chương hay đoạn m&agrave; l&agrave; &ldquo;kh&uacute;c&rdquo;, n&oacute;i về những kỉ niệm tươi đẹp, giản dị, chất ph&aacute;c ở th&ocirc;n qu&ecirc; y&ecirc;n b&igrave;nh tr&agrave;n ngập n&eacute;t ng&acirc;y ng&ocirc; của tuổi thơ. Truyện đưa người đọc đến với những tr&ograve; chơi d&acirc;n gian c&ugrave;ng những b&agrave;i h&aacute;t đồng dao c&oacute; từ rất xưa, nhưng đ&atilde; bị l&atilde;ng qu&ecirc;n bởi cuộc sống v&ocirc; t&igrave;nh của con người thời hiện đại&hellip;</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Kh&uacute;c Đồng Dao Lấm L&aacute;p PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Kao Sơn</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 1161, 0, 1, 5, '2024-08-29 18:10:55', '2024-11-13 21:01:22', 1, 1, 7),
(14, 'MS84452290', 'HỒ CHÍ MINH VÀ NHẬT KÝ TRONG TÙ', 'Hồ Chí Minh', 200, 2000, 15, 15, NULL, 95000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Hồ Ch&iacute; Minh V&agrave; Nhật K&yacute; Trong T&ugrave; PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Hồ Ch&iacute; Minh</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 731, 0, 0, 5, '2024-09-08 12:39:17', '2024-11-18 13:43:13', 16, 1, 8),
(15, 'MS26741220', 'GIÁO TRÌNH C++', 'Khuyết Danh', 122, 2005, 18, 18, 'https://drive.google.com/drive/u/1/folders/1T1IhVMTR-FP6SKjFrvhDix5jE90n6Kaw', 79000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Gi&aacute;o Tr&igrave;nh C++ PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Khuyết Danh</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 962, 521, 4, 5, '2024-09-08 12:59:05', '2024-11-18 10:02:49', 17, 1, 12),
(16, 'MS82053029', 'WEB DEVELOPER - THIẾT KẾ VÀ PHÁT TRIỂN WEBSITE', 'Izwebz', 300, 2015, 15, 15, 'https://drive.google.com/drive/u/1/folders/12lyK9lG0WXnmlPEaXPLitQHYsx1WVAOf', 239000, '<p>Cuốn s&aacute;ch Web Developer - Thiết kế v&agrave; ph&aacute;t triển website bao gồm tất cả kiến thức từ tổng qu&aacute;t đến cụ thể về việc thiết kế v&agrave; ph&aacute;t triển một trang web.</p>\r\n\r\n<p>Mục lục:</p>\r\n\r\n<p>Chương 1: Bạn cần g&igrave; để thiết kế một trang web</p>\r\n\r\n<p>Chương 2: Thiết kế v&agrave; x&acirc;y dựng website</p>\r\n\r\n<p>Chương 3: Những điều n&ecirc;n v&agrave; kh&ocirc;ng n&ecirc;n trong thiết kế website</p>\r\n\r\n<p>Chương 4: SEO</p>\r\n\r\n<p>Chương 5: Những thủ thuật trong thiết kế v&agrave; lập tr&igrave;nh</p>\r\n\r\n<p>Chương 6: Ph&aacute;t triển web</p>\r\n\r\n<p>Chương 7: Kỹ năng viết b&agrave;i</p>\r\n\r\n<p>Chương 8: Dịch vụ Hostting</p>\r\n\r\n<p>Chương 9: Dịch vụ t&ecirc;n miền</p>\r\n\r\n<p>Chương 10: Chiến lượt ph&aacute;t triển một trang web</p>\r\n\r\n<p>Chương 11: Luật bản quyền</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Web Developer - Thiết Kế V&agrave; Ph&aacute;t Triển Website PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Izwebz</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 937, 323, 3, 0, '2024-09-08 13:07:11', '2024-11-17 16:25:59', 12, 2, 10),
(17, 'MS22424511', 'PYTHON CƠ BẢN - RẤT LÀ CƠ BẢN', 'Võ Duy Tuấn', 92, 2017, 8, 7, 'https://drive.google.com/drive/u/1/folders/1B1bvxqzobzR704T9PrFe81gfMypeTSZF', 152000, '<p>T&agrave;i liệu &ldquo;Python cơ bản - Cực kỳ cơ bản&rdquo; (T&aacute;c giả: V&otilde; Duy Tuấn) l&agrave; cuốn t&agrave;i liệu đầy đủ, dễ đọc, dễ hiểu d&agrave;nh cho bất kỳ ai quan t&acirc;m v&agrave; bắt đầu l&agrave;m quen với Python, một ng&ocirc;n ngữ &ldquo;hot&rdquo; đang rất được ưa chuộng.</p>\r\n\r\n<p>Nội dung của cuốn s&aacute;ch bao gồm 15 chương:</p>\r\n\r\n<p>Chương 1: Hello World</p>\r\n\r\n<p>Chương 2: C&uacute; ph&aacute;p</p>\r\n\r\n<p>Chương 3: Ph&acirc;n chia Module</p>\r\n\r\n<p>Chương 4: Class</p>\r\n\r\n<p>Chương 5: Thao t&aacute;c tr&ecirc;n tập tin</p>\r\n\r\n<p>Chương 6: Xử l&yacute; h&igrave;nh ảnh</p>\r\n\r\n<p>Chương 7: Xử l&yacute; file JSON</p>\r\n\r\n<p>Chương 8: Xử l&yacute; file XML</p>\r\n\r\n<p>Chương 9: Kết nối Redis</p>\r\n\r\n<p>Chương 10: Kết nối Memcached</p>\r\n\r\n<p>Chương 11: Kết nối RabbitMQ</p>\r\n\r\n<p>Chương 12: Restful Client</p>\r\n\r\n<p>Chương 13: Gởi email với SMTP</p>\r\n\r\n<p>Chương 14: Socket Programming</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Python Cơ Bản - Rất L&agrave; Cơ Bản PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>V&otilde; Duy Tuấn</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 1251, 542, 4, 5, '2024-09-08 13:11:37', '2024-11-17 11:27:48', 12, 2, 13),
(18, 'MS54330135', 'NGHỆ THUẬT TẠO ĐẤT MÙN', 'Sưu Tầm', 60, 2010, 12, 11, 'https://drive.google.com/drive/u/1/folders/1lrfDotpIwnk8IaWZOgemQLYQJS-Qqrd_', 82000, '<p>Cảm ơn Đất Mẹ,</p>\r\n\r\n<p>Cảm ơn C&ocirc;, Nh&agrave; B&aacute;o &ldquo;Phi&ecirc;n Chợ Xanh Tử Tế&rdquo; với b&agrave;i viết &ldquo;Dựng lại Người, Dựng lại Nh&agrave;&rdquo; lần đầu con đọc được từ C&ocirc;,</p>\r\n\r\n<p>Cảm ơn &Ocirc;ng Bụt Cấy Nền, cấy hiểu biết v&agrave; niềm tin, t&igrave;nh y&ecirc;u hồn nhi&ecirc;n,</p>\r\n\r\n<p>Cảm ơn Trưởng m&ocirc;n Truyền Nh&acirc;n Hơi Thở, truyền sự h&oacute;m hỉnh, gi&agrave;u c&oacute; v&agrave; sức mạnh,</p>\r\n\r\n<p>Cảm ơn c&aacute;c Guru Ph&aacute;p Clean, gi&uacute;p người viết kết nối được với những điều &yacute; nghĩa, như t&agrave;i liệu n&agrave;y c&ugrave;ng c&aacute;c b&agrave;i #đọc_chơi_mần_thiệt tr&ecirc;n facebook, tặng c&aacute;c nh&agrave; vườn.</p>\r\n\r\n<p><strong>T&igrave;m mua: Nghệ Thuật Tạo Đất M&ugrave;n</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>T&agrave;i liệu n&agrave;y ph&ugrave; hợp với bạn!</p>\r\n\r\n<p>- Nh&agrave; vườn quy m&ocirc; nhỏ v&agrave; vừa, với vườn từ v&agrave;i trăm m&eacute;t vu&ocirc;ng đến v&agrave;i h&eacute;c-ta.</p>\r\n\r\n<p>- Nh&agrave; vườn c&oacute; ph&aacute;t triển c&aacute;c loại n&ocirc;ng sản với [thời gian gieo trồng- thu hoạch] dưới 12 th&aacute;ng, như rau, củ, quả, ngũ cốc, hạt, hoa, l&aacute; v&agrave; rễ l&agrave;m thực phẩm.</p>\r\n\r\n<p>- Nh&agrave; vườn muốn đất vườn sống động, gi&agrave;u c&oacute;, đạt c&acirc;n bằng dưỡng chất sau 3-5 năm, v&agrave; kh&ocirc;ng bao giờ cần mua hay d&ugrave;ng ph&acirc;n b&oacute;n, thuốc trừ s&acirc;u nữa.</p>\r\n\r\n<p>- Nh&agrave; vườn muốn biết r&otilde; c&aacute;ch l&agrave;m n&ocirc;ng từ nguồn tin cậy- khoa học, quan t&acirc;m đến chất lượng cuộc sống của m&igrave;nh, hệ sinh th&aacute;i, chất lượng n&ocirc;ng sản, v&agrave; người d&ugrave;ng n&ocirc;ng sản.</p>\r\n\r\n<p>Cảm ơn bạn tiếp tục đọc, sử dụng v&agrave; chia sẻ t&agrave;i liệu n&agrave;y!</p>\r\n\r\n<p>T&agrave;i liệu c&aacute;ch ủ compost Bio Intensive gi&uacute;p c&acirc;n bằng đất vườn, ph&aacute;t triển n&ocirc;ng sản đậm đ&agrave;, gi&agrave;u dưỡng chất. Trang 4/60</p>\r\n\r\n<p>&ldquo;Đố bạn t&igrave;m được hai chiếc l&aacute; giống y hệt nhau!&rdquo;</p>\r\n\r\n<p>C&acirc;u đố n&agrave;y từ Gi&aacute;o sư, Tiến Sĩ Daniel Chamovitz, ĐH Tel Aviv, ĐH lớn nhất Israel, hỏi trong kh&oacute;a học mở &ldquo;Hiểu về c&acirc;y cối&rdquo; - https://www.coursera.org/learn/plantknows</p>\r\n\r\n<p>Dĩ nhi&ecirc;n bạn kh&ocirc;ng t&igrave;m được, giống như kh&ocirc;ng t&igrave;m được hai người c&ugrave;ng v&acirc;n tay. V&igrave; đ&oacute; l&agrave; gi&aacute; trị, vẻ đẹp của tự nhi&ecirc;n, chỉ thể hiện qua quy luật, kh&ocirc;ng sao y.</p>\r\n\r\n<p>Hiểu c&agrave;ng nhiều gi&aacute; trị của tự nhi&ecirc;n, bạn c&agrave;ng đẹp, bạn c&agrave;ng hạnh ph&uacute;c!</p>\r\n\r\n<p>Năm 1966, Alan Chadwick, bậc thầy l&agrave;m vườn người Anh đem v&agrave;o Mỹ phương ph&aacute;p n&ocirc;ng nghiệp hữu cơ kết hợp từ Bio-Dynamic (sinh học năng động) v&agrave; th&acirc;m canh kiểu Ph&aacute;p, biến khu đất dốc cằn cỗi ở trường ĐH California -Santa Cruz th&agrave;nh khu vườn tr&ugrave; ph&uacute;. C&aacute;c thế hệ thực tập, cộng t&aacute;c, tạo n&ecirc;n tổ chức Ecology Action (H&agrave;nh Động v&igrave; sinh th&aacute;i) v&agrave;o năm 1971, với phương ph&aacute;p n&ocirc;ng nghiệp hữu cơ khoa học BioIntensive - th&acirc;m canh sinh học. Gần 50 năm nghi&ecirc;n cứu, thực h&agrave;nh li&ecirc;n tục, BioIntensive hiện được &aacute;p dụng ở hơn 140 nước... ph&ugrave; hợp nh&agrave; vườn vừa v&agrave; nhỏ, quan trọng, ai cũng thực h&agrave;nh được.</p>\r\n\r\n<p>T&agrave;i liệu giới thiệu với bạn th&ecirc;m vẻ đẹp của compost, ph&acirc;n ủ hoai, c&aacute;c gi&aacute; trị kh&aacute;c của c&acirc;y, cỏ, thi&ecirc;n nhi&ecirc;n.</p>\r\n\r\n<p>Người chuyển ngữ.</p>\r\n\r\n<p>Th&aacute;ng 11 năm 2020.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Nghệ Thuật Tạo Đất M&ugrave;n PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Sưu Tầm</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 149, 1, 1, 0, '2024-09-20 11:26:09', '2024-11-12 11:17:31', 12, 1, 1),
(19, 'MS25900830', 'XÂY DỰNG LẠI TRÁI ĐẤT', 'Mark Everard', 125, 1999, 8, 8, NULL, 129000, '<p>Việc x&acirc;y dựng lại Tr&aacute;i đất l&agrave;m r&otilde; r&agrave;ng sự phụ thuộc lẫn nhau của lo&agrave;i người với hệ sinh th&aacute;i c&aacute;c h&agrave;nh tinh. C&aacute;c phương ph&aacute;p tiếp cận n&agrave;y dựa tr&ecirc;n việc phục hồi v&agrave; bảo vệ c&aacute;c hệ sinh th&aacute;i nước v&agrave; đất rừng t&agrave;i nguy&ecirc;n biển v&agrave; ven biển thực h&agrave;nh canh t&aacute;c cơ sở hạ tầng đ&ocirc; thị v&agrave; trong chuỗi cung ứng của doanh nghiệp.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>X&acirc;y Dựng Lại Tr&aacute;i Đất PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Mark Everard</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 260, 0, 0, 4, '2024-09-20 16:28:37', '2024-11-18 13:42:50', 12, 2, 1),
(20, 'MS79109954', 'HƯỚNG DẪN NGƯ DÂN ĐÁNH BẮT XA BỜ', 'Phạm Nguyên Phẩm', 244, 2001, 10, 10, 'https://drive.google.com/drive/u/1/folders/1fIrlMl4YzEGs2kcSJ0q62i6GQg5Og7ne', 79000, '<p>Nội dung cuốn s&aacute;ch giới thiệu kh&aacute;i qu&aacute;t về biển, đảo Việt Nam, về nguồn t&aacute;i nguy&ecirc;n v&ocirc; gi&aacute; m&agrave; thi&ecirc;n nhi&ecirc;n ban tặng; c&aacute;c quy định, ch&iacute;nh s&aacute;ch m&agrave; ngư d&acirc;n đ&aacute;nh bắt xa bờ cần biết; c&aacute;c bệnh thường gặp tr&ecirc;n biển v&agrave; c&aacute;ch sơ cứu, cứu chữa. Cuốn s&aacute;ch l&agrave; t&agrave;i liệu bổ &iacute;ch, gi&uacute;p ngư d&acirc;n thuận lợi hơn trong hoạt động khai th&aacute;c thủy, hải sản n&oacute;i chung v&agrave; đ&aacute;nh bắt xa bờ n&oacute;i ri&ecirc;ng.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Hướng Dẫn Ngư D&acirc;n Đ&aacute;nh Bắt Xa Bờ PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Phạm Nguy&ecirc;n Phẩm</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 216, 0, 0, 5, '2024-09-20 16:35:14', '2024-11-18 13:42:46', 18, 1, 1),
(21, 'MS55330927', 'YOU CAN - KHÔNG GÌ LÀ KHÔNG THỂ', 'George Matthew Adams', 79, 2009, 5, 4, 'https://drive.google.com/drive/u/1/folders/1auw90DgBEKBIzo5CQsG2ZIa--EJFJA-o', 49000, '<p>C&ugrave;ng với C&aacute;ch nghĩ để th&agrave;nh c&ocirc;ng của Napoleon Hill, Kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng thể của George Matthew Adams đ&atilde; trở th&agrave;nh người bạn đồng h&agrave;nh th&acirc;n thiết của rất nhiều người. Những triết l&yacute; đơn giản nhưng v&ocirc; c&ugrave;ng s&acirc;u sắc v&agrave; hữu dụng của Kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng thể đ&atilde; gi&uacute;p rất nhiều người đạt được th&agrave;nh c&ocirc;ng như họ mong đợi. Đến với những b&iacute; quyết n&agrave;y, bạn sẽ nhận ra rằng: Kh&ocirc;ng c&oacute; giới hạn n&agrave;o trong tư duy của con người ngo&agrave;i những giới hạn do ch&iacute;nh con người đặt ra.</p>\r\n\r\n<p>Mỗi nghịch cảnh, thất bại hay đau khổ đều mang trong n&oacute; hạt giống của những lợi &iacute;ch tương đương hoặc lớn hơn. H&atilde;y học c&aacute;ch đối mặt v&agrave; vượt qua thất bại. H&atilde;y để Kh&ocirc;ng g&igrave; l&agrave; kh&ocirc;ng thể đồng h&agrave;nh với bạn tr&ecirc;n h&agrave;nh tr&igrave;nh kh&aacute;m ph&aacute; sức mạnh bản th&acirc;n v&agrave; đạt đến th&agrave;nh c&ocirc;ng hằng mong đợi.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>You Can - Kh&ocirc;ng G&igrave; L&agrave; Kh&ocirc;ng Thể PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>George Matthew Adams</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 251, 0, 1, 0, '2024-09-20 16:49:45', '2024-11-18 13:42:44', 12, 1, 8),
(22, 'MS46313904', 'HƯỚNG DẪN PHƯƠNG PHÁP KHUYẾN NÔNG', 'Ngô Xuân Hoàng', 110, 2020, 12, 11, 'https://drive.google.com/drive/u/1/folders/1XCjwT1c9A3fNPVRH4giiavyLPExz3Z87', 99000, '<p>Cuốn s&aacute;ch tập trung v&agrave;o c&aacute;c nội dung: Một số vấn đề chung về khuyến n&ocirc;ng v&agrave; hoạt động khuyến n&ocirc;ng; Tổ chức khuyến n&ocirc;ng ở Việt Nam cũng như vai tr&ograve;, chức năng của tổ chức khuyến n&ocirc;ng hiện tại v&agrave; trong tương lai; C&aacute;n bộ khuyến n&ocirc;ng v&agrave; vai tr&ograve;, nhiệm vụ của c&aacute;n bộ khuyến n&ocirc;ng trong sự nghiệp ph&aacute;t triển n&ocirc;ng nghiệp, n&ocirc;ng th&ocirc;n; Đối tượng của khuyến n&ocirc;ng v&agrave; c&aacute;c phương ph&aacute;p cần sử dụng để thực hiện tốt c&ocirc;ng t&aacute;c khuyến n&ocirc;ng ở c&aacute;c cấp; C&aacute;ch x&acirc;y dựng kế hoạch, tổ chức thực hiện hoạt động khuyến n&ocirc;ng ở c&aacute;c cấp cũng như phương ph&aacute;p đ&aacute;nh gi&aacute; kết quả hoạt động khuyến n&ocirc;ng v&agrave; kết quả hoạt động của c&aacute;n bộ khuyến n&ocirc;ng...</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Hướng Dẫn Phương Ph&aacute;p Khuyến N&ocirc;ng PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Ng&ocirc; Xu&acirc;n Ho&agrave;ng</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 175, 0, 1, 5, '2024-09-20 16:53:23', '2024-11-18 13:42:41', 18, 1, 9),
(23, 'MS73915021', 'TRUYỆN KIỀU', 'Nguyễn Du', 110, 2012, 15, 15, 'https://drive.google.com/drive/u/1/folders/1uX8aPLjF6mCNI13rx1-uQ6EatldoFZbA', 99000, '<p>Đoạn trường t&acirc;n thanh (chữ H&aacute;n: 斷腸新聲), thường được biết đến với c&aacute;i t&ecirc;n đơn giản l&agrave; Truyện Kiều (chữ N&ocirc;m: 傳翹), l&agrave; một truyện thơ của đại thi h&agrave;o Nguyễn Du. Đ&acirc;y được xem l&agrave; truyện thơ nổi tiếng nhất v&agrave; x&eacute;t v&agrave;o h&agrave;ng kinh điển trong văn học Việt Nam, t&aacute;c phẩm được viết bằng chữ N&ocirc;m theo thể lục b&aacute;t, gồm 3254 c&acirc;u.</p>\r\n\r\n<p>C&acirc;u chuyện dựa theo tiểu thuyết Kim V&acirc;n Kiều truyện của Thanh T&acirc;m T&agrave;i Nh&acirc;n, một thi sĩ thời nh&agrave; Minh, Trung Quốc.</p>\r\n\r\n<p>T&aacute;c phẩm kể lại cuộc đời, những thử th&aacute;ch v&agrave; đau khổ của Th&uacute;y Kiều, một phụ nữ trẻ xinh đẹp v&agrave; t&agrave;i năng, phải hy sinh th&acirc;n m&igrave;nh để cứu gia đ&igrave;nh. Để cứu cha v&agrave; em trai khỏi t&ugrave;, c&ocirc; b&aacute;n m&igrave;nh kết h&ocirc;n với một người đ&agrave;n &ocirc;ng trung ni&ecirc;n, kh&ocirc;ng biết rằng anh ta l&agrave; một kẻ bu&ocirc;n người, v&agrave; bị &eacute;p l&agrave;m kĩ nữ trong lầu xanh.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Truyện Kiều PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Du</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 571, 1, 0, 4, '2024-09-20 16:57:30', '2024-11-18 13:42:39', 16, 1, 11),
(24, 'MS72383693', 'BƯỚC ĐƯỜNG CÙNG', 'Nguyễn Công Hoan', 158, 1995, 20, 20, 'https://drive.google.com/drive/u/1/folders/1_0msBhyppuJSzcB5JMoN24uVJQdifs6P', 89000, '<p>Bước đường c&ugrave;ng - Nguyễn C&ocirc;ng Hoan l&agrave; tiểu thuyết gắn liền với số phận của anh Pha, một người n&ocirc;ng d&acirc;n với những kh&oacute; khăn chồng chất đ&atilde; đ&aacute;nh dấu đỉnh cao về tư tưởng của nh&agrave; văn Nguyễn C&ocirc;ng Hoan v&agrave; l&agrave; một trong những t&aacute;c phẩm ti&ecirc;u biểu của văn học hiện thực ph&ecirc; ph&aacute;n Việt Nam trước C&aacute;ch mạng***</p>\r\n\r\n<p>*G&Oacute;C REVIEW S&Aacute;CH*</p>\r\n\r\n<p>Bước đường c&ugrave;ng- Nguyễn C&ocirc;ng Hoan</p>\r\n\r\n<p>&ldquo;Bước đường c&ugrave;ng&rsquo;&rsquo;- một t&aacute;c phẩm ti&ecirc;u biểu của nh&agrave; văn Nguyễn C&ocirc;ng Hoan, được viết với chủ đề phản &aacute;nh số phận của những người n&ocirc;ng d&acirc;n thấp cổ b&eacute; họng bị giai cấp thống trị bốc lột, bị c&aacute;i x&atilde; hội của đồng tiền &eacute;p đến bước đường c&ugrave;ng kh&ocirc;ng lối tho&aacute;t. Đồng thời ph&ecirc; ph&aacute;n x&atilde; hội Việt Nam trước c&aacute;ch mạng. D&ugrave; lường trước s&aacute;ch sẽ bị cấm nhưng &ocirc;ng vẫn viết ra những trang tiểu thuyết với những hiện thực cuộc sống trước c&aacute;ch mạng của người n&ocirc;ng d&acirc;n.</p>\r\n\r\n<p>T&aacute;c phẩm gắn liền với số phận của anh Pha- người mang r&otilde; n&eacute;t của một người n&ocirc;ng d&acirc;n với những kh&oacute; khăn vất vả của cuộc sống trong giai đoạn 1930-1945. Anh bị Trương Thi chơi xấu bỏ rượu lậu v&agrave;o ruộng rồi b&aacute;o T&acirc;y Đoan đến bắt nhưng bất th&agrave;nh v&igrave; bỏ lầm ruộng Nghị Lại. Chi tiết ấy l&agrave;m người đọc cảm thấy hồi hộp khi kh&ocirc;ng biết một người lương thiện như Pha sẽ ra sau, nhưng quả thực may mắn &ldquo;Pha lại lương thiện như thường&rdquo;.Sau đ&oacute; l&agrave; sự x&uacute;i giục qua lại của Nghị Lại giữa Pha v&agrave; Trương Thi, thế nhưng khi đi kiện Pha lại bị đ&aacute;nh đấm, hạch s&aacute;ch v&igrave; kh&ocirc;ng mang tiền lễ v&agrave; c&ograve;n bị giam.</p>\r\n\r\n<p>Ta c&oacute; thể thấy được thế lực của đồng tiền đ&aacute;ng sợ biết nhường n&agrave;o trong</p>\r\n\r\n<p>c&aacute;i x&atilde; hội bất c&ocirc;ng n&agrave;y. Quan huyện cho l&iacute;nh v&agrave;o nh&agrave; vơ v&eacute;t của cải khiến vợ chồng Pha phải đến l&agrave;m thu&ecirc; cho Nghị Lại. Phần sau của t&aacute;c phẩm đ&atilde; thể hiện r&otilde; sự khốn khổ tột c&ugrave;ng của một người n&ocirc;ng d&acirc;n kh&ocirc;ng đủ tiền lo cơm &aacute;o thuốc men khi vợ ốm, chị v&agrave; con bị dịch bệnh qua đời, &ldquo;ở nh&agrave; bệnh của vợ kh&ocirc;ng bớt, chị nổi cơn ho, con đ&oacute;i sữa kh&oacute;c sa sả cả ng&agrave;y&rdquo;. Điều đ&oacute; cũng đủ để ta thấy nỗi lo toan của anh Pha vất vả như thế n&agrave;o, căn nh&agrave; h&ocirc;i h&aacute;m, hơi ẩm thấp, kh&ocirc;ng c&oacute; đường tho&aacute;t ra ngo&agrave;i. &ldquo;Anh thấy c&aacute;i đời người d&acirc;n c&agrave;y hết sức cực nhục, người d&acirc;n c&agrave;y sống để l&agrave;m việc vất vả, m&agrave; l&agrave;m việc vất vả kh&ocirc;ng để hưởng sự sung sướng&rdquo;.</p>\r\n\r\n<p>Đến cuối c&ugrave;ng, Pha chỉ c&ograve;n lại một m&igrave;nh trong c&aacute;i thế giới tăm tối. &ldquo;Ch&uacute;ng ta sống để l&agrave;m g&igrave;? Kh&ocirc;ng để ăn ngon, kh&ocirc;ng để mặc đẹp, kh&ocirc;ng để ở sướng nhưng l&agrave; để chịu những sự b&oacute;c lột của địa chủ t&agrave;n nhẫn những nỗi &aacute;p bức của quan lại tham nhũng, những c&aacute;i bất c&ocirc;ng của chế độ thối n&aacute;t chốn hương th&ocirc;n, để bước đường c&ugrave;ng l&agrave; đi đến chỗ ph&aacute; sản&rdquo;.</p>\r\n\r\n<p>Nguyễn C&ocirc;ng Hoan đ&atilde; đả k&iacute;ch vạch mặt chỉ t&ecirc;n thật sự của x&atilde; hội mục n&aacute;t trước C&aacute;ch Mạng, &ocirc;ng l&agrave; đ&agrave;n anh dẫn đầu trong việc đi s&acirc;u v&agrave;o n&ocirc;ng th&ocirc;n,cảm th&ocirc;ng với người n&ocirc;ng d&acirc;n để n&oacute;i l&ecirc;n nỗi l&ograve;ng của họ.</p>\r\n\r\n<p>Nguồn: Hạt C&aacute;t Nhỏ - th&agrave;nh vi&ecirc;n Ban Nh&acirc;n Sự</p>\r\n\r\n<p>#reviewsach #pnhtq #svhd</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Nguyễn C&ocirc;ng Hoan (1903 - 1977) l&agrave; nh&agrave; văn ti&ecirc;u biểu của văn học hiện thực ph&ecirc; ph&aacute;n Việt Nam. Thế giới truyện ngắn Nguyễn C&ocirc;ng Hoan đa dạng, phong ph&uacute;, như một &quot;b&aacute;ch khoa thư&quot;, một &quot;tấn tr&ograve; đời&quot;m&agrave; đặc trưng l&agrave; x&atilde; hội thuộc địa nửa phong kiến ở Việt Nam nửa đầu thế kỷ XX. Với một số lượng kh&aacute; lớn như vậy, truyện ngắn của Nguyễn C&ocirc;ng Hoan họp lại th&agrave;nh một bức tranh rộng lớn, kh&aacute; đầy đủ về x&atilde; hội cũ.</p>\r\n\r\n<p>Về nghệ thuật viết truyện ngắn, phải n&oacute;i rằng Nguyễn C&ocirc;ng Hoan l&agrave; người c&oacute; nhiều khả năng v&agrave; kinh nghiệm. Truyện của &ocirc;ng thường rất ngắn. Lời văn kh&uacute;c triết, giản dị. Cốt truyện được dẫn dắt một c&aacute;ch c&oacute; nghệ thuật v&agrave; kết cục thường rất đột ngột để hấp dẫn người đọc. Mỗi truyện như một m&agrave;n kịch ngắn c&oacute; giới thiệu, thắt n&uacute;t v&agrave; mở n&uacute;t. Ti&ecirc;u biểu l&agrave; c&aacute;c truyện ngắn: K&eacute;p Tư bền, Người ngựa, ngựa người..., tiểu thuyết c&oacute; Bước đường c&ugrave;ng...</p>\r\n\r\n<p>Ngay từ khi xuất hiện, Nguyễn C&ocirc;ng Hoan lu&ocirc;n g&acirc;y được sự ch&uacute; &yacute;, quan t&acirc;m của giới nghi&ecirc;n cứu, ph&ecirc; b&igrave;nh v&agrave; nhiều thế hệ độc giả. Mặc d&ugrave; c&oacute; nhiều người khen kẻ ch&ecirc;, nhưng truyện ngắn truyện d&agrave;i của Nguyễn C&ocirc;ng Hoan sừng sững tạo th&agrave;nh một thế Tam Đảo, Ba V&igrave; h&ugrave;ng vĩ.</p>\r\n\r\n<p>Trong thời tiền chiến, ai m&agrave; chẳng đọc qua c&aacute;c quyển: Tắt lửa l&ograve;ng, Bước đường c&ugrave;ng, Tấm l&ograve;ng v&agrave;ng, C&ocirc; gi&aacute;o Minh, Tr&ecirc;n đường sự nghiệp, Lệ Dung, Nợ nần, Bơ vơ, v. v...</p>\r\n\r\n<p>Hơn nữa, một số t&aacute;c phẩm của &ocirc;ng đ&atilde; được v&agrave; Đo&agrave;n Kịch nghệ nổi tiếng thời ấy ph&oacute;ng t&aacute;c th&agrave;nh tuồng cải lương, lưu diễn từ Nam ch&iacute; Bắc v&agrave; được đồng b&agrave;o c&aacute;c giới t&aacute;n thưởng nồng nhiệt!</p>\r\n\r\n<p>&Ocirc;ng s&aacute;ng t&aacute;c đủ mọi chiều hướng: Trữ t&igrave;nh, X&atilde; hội, Tranh đấu, Gi&aacute;o dục,... nhưng c&oacute; một điểm nổi bật hơn hết l&agrave; mỗi t&aacute;c phẩm của &ocirc;ng đều mang một sắc th&aacute;i đặc biệt... đ&aacute;nh dấu một bước tiến mới cho bộ m&ocirc;n tiểu thuyết thời ấy.</p>\r\n\r\n<p>Nhưng, từ 20 năm qua... những t&aacute;c phẩm của &ocirc;ng hầu hết bị thất lạc, bị mai một v&igrave; nạn Đất Nước qua ph&acirc;n!***</p>\r\n\r\n<p>Anh em rất ngạc nhi&ecirc;n về c&aacute;i th&aacute;i độ của Nghị Lại chịu nước l&eacute;p. Thấy sự đo&agrave;n kết rất c&oacute; c&ocirc;ng hiệu, Dự trỏ v&agrave;o đống l&uacute;a xếp đầy s&acirc;n:</p>\r\n\r\n<p>- Đ&aacute;ng lẽ mẫu bảy th&oacute;c của anh Thi với anh San đ&atilde; v&agrave;o t&uacute;i tham kh&ocirc;ng đ&aacute;y hết cả.</p>\r\n\r\n<p>Pha lo ngại:</p>\r\n\r\n<p>- Nhưng quyết hắn trả th&ugrave;, m&agrave; th&ugrave; n&agrave;y phải biết hắn t&iacute;nh to&aacute;n kỹ lưỡng lắm.</p>\r\n\r\n<p>Thi gật đầu:</p>\r\n\r\n<p>- Cho n&ecirc;n h&ocirc;m n&agrave;o l&uacute;a của anh ch&iacute;n, ta n&ecirc;n rủ người đi cho đ&ocirc;ng, v&agrave; phải cẩn thận lắm, kẻo thua mất.</p>\r\n\r\n<p>San xua tay:</p>\r\n\r\n<p>- Nếu t&aacute;m s&agrave;o của anh Pha bị hắn cướp hết th&igrave; th&oacute;c của ch&uacute;ng m&igrave;nh gặt về, đem chia ba.</p>\r\n\r\n<p>Mấy anh em rất cảm động. Một l&aacute;t Pha n&oacute;i:</p>\r\n\r\n<p>- B&aacute;c trưng bảo rằng thua, nhưng t&ocirc;i cho l&agrave; kh&ocirc;ng đ&uacute;ng. Ch&uacute;ng m&igrave;nh ba lần gặt, đ&atilde; được đến hai lần, d&ugrave; c&oacute; thua một lần ta cũng vẻ vang qu&aacute; rồi.</p>\r\n\r\n<p>Dự tiếp:</p>\r\n\r\n<p>- Như thế tức l&agrave; đằng n&agrave;o m&igrave;nh cũng giữ phần thắng lợi rồi.</p>\r\n\r\n<p>Bốn người cười vui vẻ, nghỉ tay để uống nước. B&aacute;t ch&egrave; tươi s&oacute;ng s&aacute;nh dưới &aacute;nh trăng. Tiếng th&igrave;nh thịch đập l&uacute;a ở s&acirc;n c&aacute;c nh&agrave; theo luồng gi&oacute; lạnh hiu hắt đưa đi l&agrave;m cho l&agrave;ng An Đạo c&oacute; vẻ hoạt động.</p>\r\n\r\n<p>Một l&aacute;t, San n&oacute;i:</p>\r\n\r\n<p>- Từ nay ch&uacute;ng ta phải giữ m&igrave;nh. Hắn c&oacute; đến hằng trăm thứ kh&iacute; giới, m&agrave; ta chỉ c&oacute; trơ mỗi đứa hai c&aacute;nh tay kh&ocirc;ng.</p>\r\n\r\n<p>Dự đ&aacute;p:</p>\r\n\r\n<p>- Nhưng hai c&aacute;nh tay mạnh mẽ, hai c&aacute;nh tay l&agrave;m cho đất c&aacute;t c&oacute; gi&aacute; trị.</p>', 551, 1, 0, 5, '2024-09-21 10:13:44', '2024-11-18 13:42:33', 16, 1, 1),
(25, 'MS91869119', 'BÀ CHÚA HÒN', 'Sơn Nam', 158, 1989, 5, 5, 'https://drive.google.com/drive/u/1/folders/198k6t-KA_8BQpKPXTCfHSOe6eD4JwXjw', 99000, '<p>Cuốn tiểu thuyết B&agrave; Ch&uacute;a H&ograve;n mang m&agrave;u sắc lịch sử v&agrave; kh&ocirc;ng kh&iacute; miệt vườn</p>\r\n\r\n<p>Lối dẫn dắt tự nhi&ecirc;n, ng&ocirc;n ngữ mộc mạc đậm chất Nam Bộ</p>\r\n\r\n<p>Kh&ocirc;ng chỉ mang gi&aacute; trị nghệ thuật, t&aacute;c phẩm c&ograve;n l&agrave; những b&agrave;i học s&acirc;u sắc về t&igrave;nh người***</p>\r\n\r\n<p>Buổi chiều đầu m&ugrave;a mưa, cảnh vật buồn b&atilde; l&agrave;m sao! Ếch nh&aacute;i k&ecirc;u vang b&ecirc;n ch&ograve;i, trong b&oacute;ng tối chập chờn, xa lắm qua rặng c&acirc;y tr&agrave;m mới thấy v&agrave;i &aacute;nh đ&egrave;n. Ở tr&ecirc;n h&ograve;n l&agrave; đ&oacute;i, kh&oacute; c&agrave;y cấy trồng tỉa. Bởi vậy Tư Th&iacute;nh đến tận v&ugrave;ng s&igrave;nh lầy m&agrave; chịu đựng muỗi m&ograve;ng.</p>\r\n\r\n<p>- Ng&agrave;y mai cho con ra ruộng nghe ba!</p>\r\n\r\n<p>Tư Th&iacute;nh day lại. Đứa con g&aacute;i vừa l&ecirc;n t&aacute;m tuổi bưng ch&eacute;n cơm đến gần. Ch&uacute; vuốt t&oacute;c con, b&ugrave;i ng&ugrave;i thương x&oacute;t. Mẹ n&oacute; mất hồi năm ngo&aacute;i. Ng&agrave;y n&agrave;o cũng vậy, trước khi ra ruộng, ch&uacute; bới sẵn ch&eacute;n cơm, gắp khứa c&aacute; để trong c&aacute;i đĩa nhỏ. Khi thức dậy, đứa con ăn cơm một m&igrave;nh rồi ra ngồi ở g&oacute;c s&acirc;n, tr&ocirc;ng ra ruộng.</p>\r\n\r\n<p>Cuốn tiểu thuyết &quot;B&agrave; ch&uacute;a h&ograve;n&quot; bắt đầu như thế với nh&acirc;n vật c&ocirc; b&eacute; t&ecirc;n Hu&ocirc;i. Số phận đ&atilde; sắp đặt cho c&ocirc;, khi lớn l&ecirc;n, sẽ trở th&agrave;nh b&agrave; ch&uacute;a H&ograve;n.</p>\r\n\r\n<p>H&ograve;n Ch&ocirc;ng l&agrave; d&atilde;y đồi thấy, s&aacute;t m&eacute; biển vịnh Xi&ecirc;m La. D&acirc;n ch&uacute;ng sống bằng nghề ch&aacute;i lưới ở m&eacute; biển nhưng nguồn lợi lớn nhất vẫn l&agrave; nghề trồng hồ ti&ecirc;u. &Ocirc;ng X&igrave;n Ph&oacute;c l&agrave; người Triều Ch&acirc;u lai Cao Mi&ecirc;n, trở th&agrave;nh &ocirc;ng Ch&uacute;a H&ograve;n đầu ti&ecirc;n, sau khi &ocirc;ng chết, người kế vị l&agrave; con trai &ocirc;ng, Hai Minh. B&aacute; Vạn l&agrave; người nắm giữ sổ s&aacute;ch thu chi cho Hai Minh. &Ocirc;ng n&agrave;y l&agrave; người Triều Ch&acirc;u lai Việt Nam, tuổi chừng 60, lắm mưu nhiều kế, c&oacute; &yacute; định giết &ocirc;ng Ch&uacute;a H&ograve;n, lật con b&agrave; cả để d&agrave;nh tất cả t&agrave;i sản về tay m&igrave;nh.</p>\r\n\r\n<p>Mười mấy năm tr&ocirc;i qua, nay Hu&ocirc;i đ&atilde; trở th&agrave;nh hoa kh&ocirc;i trong v&ugrave;ng, xinh đẹp tuyệt trần, v&oacute;c d&aacute;ng cao r&aacute;o, nước da trắng mịn, tr&aacute;n cao, m&ocirc;i đỏ như thoa son... B&aacute; Vạn muốn mượn sắc đẹp của Hu&ocirc;i để lung lạc &ocirc;ng Ch&uacute;a H&ograve;n...</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Sơn Nam (1926 - 2008) l&agrave; một nh&agrave; văn, nh&agrave; b&aacute;o, nh&agrave; nghi&ecirc;n cứu văn h&oacute;a Việt Nam nổi tiếng với nhiều t&aacute;c phẩm c&oacute; gi&aacute; trị.</p>\r\n\r\n<p>Với khối lượng t&aacute;c phẩm đồ sộ, &ocirc;ng l&agrave; người th&agrave;nh c&ocirc;ng ở nhiều lĩnh vực: lĩnh vực nghi&ecirc;n cứu, &ocirc;ng c&oacute; nhiều bi&ecirc;n khảo c&ocirc;ng phu, khoa học, khoảng 20 t&aacute;c phẩm. C&oacute; những t&aacute;c phẩm rất c&oacute; gi&aacute; trị cho việc t&igrave;m hiểu về v&ugrave;ng đất Nam Bộ, như: &ldquo;Ấn tượng 300 năm, Bến Ngh&eacute; xưa, C&aacute; t&iacute;nh miền Nam, Danh thắng miền Nam, Đất Gia Định xưa, Đồng bằng s&ocirc;ng Cửu Long - N&eacute;t sinh hoạt xưa, Giới thiệu S&agrave;i G&ograve;n xưa, Lịch sử An Giang, Lịch sự khẩn hoang miền Nam, Người S&agrave;i G&ograve;n...</p>\r\n\r\n<p>&ldquo;Sơn Nam l&agrave; một trong số những nh&agrave; văn từng sống ở đ&ocirc; thị miền Nam nhưng t&aacute;c phẩm vẫn được in liền mạch sau giải ph&oacute;ng, điều đ&oacute; kh&ocirc;ng phải dễ. Trước hết, t&aacute;c phẩm của Sơn Nam kh&ocirc;ng thuộc dạng a dua. Sống dưới chế độ ấy m&agrave; tr&aacute;nh được lối viết ấy quả l&agrave; rất cao tay. C&oacute; lần người viết b&agrave;i n&agrave;y hỏi vậy, Sơn Nam cười nhẹ, cũng chẳng giỏi giang g&igrave; đ&acirc;u m&agrave; t&ocirc;i chủ yếu viết về phong tục, về lịch sử khai khẩn đất đai Nam Bộ, v&agrave; nếu l&agrave; truyện th&igrave; đi v&agrave;o tầng lớp n&ocirc;ng d&acirc;n, d&acirc;n ngh&egrave;o th&agrave;nh thị.</p>\r\n\r\n<p>Hơn nửa thế kỷ gắn b&oacute; với nghiệp s&aacute;ng t&aacute;c, những trang viết của &ocirc;ng kh&ocirc;ng đơn thuần l&agrave; sự giải tr&iacute; cho độc giả m&agrave; c&ograve;n l&agrave; những khảo cứu, kh&aacute;m ph&aacute; về mảnh đất phương Nam. L&agrave; người Nam Bộ ch&iacute;nh gốc n&ecirc;n nh&agrave; văn Sơn Nam l&agrave; người am hiểu qu&aacute; tr&igrave;nh h&igrave;nh th&agrave;nh dải đất n&agrave;y. Những s&aacute;ng t&aacute;c của &ocirc;ng mang hơi thở của thi&ecirc;n nhi&ecirc;n, của văn h&oacute;a v&agrave; con người Nam Bộ được thể hiện qua giọng văn giản dị, mộc mạc...&rdquo;</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>B&agrave; Ch&uacute;a H&ograve;n PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Sơn Nam</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 662, 0, 0, 0, '2024-09-21 10:18:22', '2024-11-18 13:42:31', 16, 1, 9),
(26, 'MS67663881', 'HUYỀN THOẠI MỞ ĐẤT', 'Trần Hiền Ân', 90, 2002, 5, 5, NULL, 79000, '<p>Huyền thoại mở đất đưa bạn đọc đến những địa danh ở v&ugrave;ng thượng du miền Trung, những bu&ocirc;n l&agrave;ng tr&ecirc;n n&uacute;i cao quanh năm phải sống nhờ v&agrave;o s&ocirc;ng, n&uacute;i. Đằng sau cuộc sống thường ng&agrave;y của họ l&agrave; những huyền thoại ly kỳ, hấp dẫn kh&ocirc;ng nhiều người biết đến. Mỗi d&acirc;n tộc đều c&oacute; những n&eacute;t đẹp văn h&oacute;a đặc trưng, rất ri&ecirc;ng v&agrave; &yacute; nghĩa, đ&oacute; l&agrave; l&yacute; do t&aacute;c giả mang đến cho bạn đọc c&aacute;i nh&igrave;n cận cảnh về phong tục tập qu&aacute;n của những d&acirc;n tộc v&ugrave;ng cao. H&atilde;y c&ugrave;ng kh&aacute;m ph&aacute; qua tập truyện để biết đất nước ta v&ocirc; c&ugrave;ng tươi đẹp, hiểu hơn về cuộc sống của đồng b&agrave;o miền n&uacute;i v&agrave; hơn cả l&agrave; bồi đắp th&ecirc;m t&igrave;nh y&ecirc;u qu&ecirc; hương, đất nước.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Huyền Thoại Mở Đất PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Trần Hiền &Acirc;n</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 461, 0, 1, 5, '2024-09-21 10:22:24', '2024-11-18 13:42:29', 13, 1, 13),
(27, 'MS19415253', 'CHUYỆN HOA CHUYỆN QUẢ', 'Phạm Hổ', 150, 2020, 2, 2, NULL, 55000, '<p>T&ocirc;i nghĩ rằng anh Phạm Hổ trước hết đ&atilde; l&agrave;m được một điều rất hay rất qu&yacute;: anh đ&atilde; học được sự ngạc nhi&ecirc;n chưa từng bị b&agrave;o m&ograve;n v&agrave; đ&aacute;nh mất của c&aacute;c em&hellip; Đối với thế giới bộn bề xung quanh hằng ng&agrave;y, anh c&ograve;n giữ được c&acirc;u hỏi &ldquo;Tại sao? Tại sao?...&rdquo; kh&ocirc;ng c&ugrave;ng như một đứa b&eacute; ngơ ng&aacute;c&hellip;&rdquo;</p>\r\n\r\n<p>- Nh&agrave; văn Nguy&ecirc;n Ngọc -</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Chuyện Hoa Chuyện Quả PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Phạm Hổ</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 283, 0, 0, 5, '2024-09-21 10:24:35', '2024-12-01 09:35:08', 1, 1, 12);
INSERT INTO `sach` (`id_Sach`, `maSach`, `tenSach`, `tenTacGia`, `soTrang`, `namXuatBan`, `soLuongHienCo`, `soLuongCoSan`, `fileSach`, `giaTien`, `ghiChu`, `luotXem`, `luotDoc`, `luotMuon`, `danhGiaTrungBinh`, `ngayTaoSach`, `ngaySuaSach`, `id_NhaXuatBan`, `id_NgonNgu`, `id_ViTri`) VALUES
(28, 'MS76075631', 'GIVE AND TAKE - CHO VÀ NHẬN', 'Adam Grant', 453, 2009, 4, 4, 'https://drive.google.com/drive/u/1/folders/1dWfgR-MfDw_4U6u9L-U1pM5xRNFNspb9', 399000, '<p>GIVE AND TAKE CHO &amp; NHẬN</p>\r\n\r\n<p>Th&agrave;nh c&ocirc;ng l&agrave; điều m&agrave; tất cả ch&uacute;ng ta đều mong muốn. C&oacute; rất nhiều c&aacute;ch để th&agrave;nh c&ocirc;ng v&agrave; mỗi người c&oacute; một c&aacute;ch cho ri&ecirc;ng m&igrave;nh. S&aacute;ch về b&iacute; quyết th&agrave;nh c&ocirc;ng c&oacute; rất nhiều nhưng hầu hết c&aacute;c b&iacute; quyết ấy lại kh&ocirc;ng c&oacute; một b&iacute; quyết rất đặc biệt: Cho đi. &Iacute;t ai đồng &yacute; v&agrave; nhận ra rằng ta sẽ th&agrave;nh c&ocirc;ng khi biết cho đi, biết gi&uacute;p đỡ người kh&aacute;c c&ugrave;ng th&agrave;nh c&ocirc;ng, khi ấy ta th&agrave;nh c&ocirc;ng hơn cả th&agrave;nh c&ocirc;ng. Nhưng thường, ta chỉ thấy rằng những người gi&uacute;p đỡ người kh&aacute;c thường chịu thiệt th&ograve;i, chẳng những kh&ocirc;ng được đ&aacute;p lại m&agrave; c&ograve;n nhận nhiều sự phiền h&agrave; về bản th&acirc;n m&igrave;nh.</p>\r\n\r\n<p>Cho &amp; Nhận sẽ gi&uacute;p bạn c&oacute; c&aacute;i nh&igrave;n kh&aacute;c đi về cho v&agrave; nhận, nhất l&agrave; trong lĩnh vực kinh doanh, một lĩnh vực m&agrave; kh&aacute;i niệm &ldquo;Cho&rdquo; chưa được thừa nhận như l&agrave; một c&aacute;ch để th&agrave;nh c&ocirc;ng. Cho khế nhận v&agrave;ng l&agrave; quyển s&aacute;ch đặc biệt của Adam Grant. Từ thực tiễn giảng dạy của m&igrave;nh, Adam Grant - khi ấy đang l&agrave; gi&aacute;o sư trẻ nhất của ng&ocirc;i trường Wharton danh gi&aacute; - đ&atilde; kiểm chứng nguy&ecirc;n nh&acirc;n mang lại th&agrave;nh c&ocirc;ng cũng như dẫn đến thất bại của mỗi người. Anh đ&atilde; ph&acirc;n chia ra ba nh&oacute;m người ch&iacute;nh dựa theo phong c&aacute;ch h&agrave;nh xử: những người chỉ biết đến lợi &iacute;ch bản th&acirc;n, những người lu&ocirc;n hết l&ograve;ng v&igrave; người kh&aacute;c v&agrave; những người dung h&ograve;a.</p>\r\n\r\n<p>Trong khi những người chỉ biết lợi &iacute;ch bản th&acirc;n ra sức gi&agrave;nh lấy phần c&oacute; lợi nhất về m&igrave;nh, những người dung h&ograve;a hướng đến việc trao đổi lợi &iacute;ch, th&igrave; những người lu&ocirc;n hết l&ograve;ng v&igrave; người kh&aacute;c lại ho&agrave;n to&agrave;n kh&aacute;c biệt - họ lu&ocirc;n cố gắng gi&uacute;p đỡ mọi người m&agrave; kh&ocirc;ng cần bất cứ sự đền đ&aacute;p n&agrave;o. Đ&acirc;y cũng ch&iacute;nh l&agrave; ch&igrave;a kh&oacute;a mang lại th&agrave;nh c&ocirc;ng cho họ - những người lu&ocirc;n hết m&igrave;nh v&igrave; người kh&aacute;c.</p>\r\n\r\n<p>Được giới chuy&ecirc;n m&ocirc;n, bao gồm cả những t&ecirc;n tuổi như Dan Pink, Tony Hsieh, Dan Ariely, Susan Cain, Robert Cialdini,&hellip; cũng như đội ngũ l&atilde;nh đạo của những tập đo&agrave;n lừng danh như Google, McKinsey, Merck, Est&eacute;e Lauder, Nike, v&agrave; cả NASA đ&aacute;nh gi&aacute; cao. Cho khế nhận v&agrave;ng thực sự l&agrave; một cuốn cẩm nang dạy ta c&aacute;ch thức l&agrave;m việc, h&agrave;nh xử sao cho đạt hiệu quả cao nhất, với hiệu quả kh&ocirc;ng giới hạn cho một c&aacute; nh&acirc;n n&agrave;o, m&agrave; bao phủ l&ecirc;n th&agrave;nh c&ocirc;ng của tổ chức cũng như cộng đồng.</p>', 95, 0, 0, 3, '2024-09-21 10:27:16', '2024-11-18 13:42:23', 12, 2, 9),
(29, 'MS80157495', 'NHÀ CHỬ', 'Tô Hoài', 112, 2015, 9, 8, 'https://drive.google.com/drive/u/1/folders/1LUc5wY0Ze_HLnyP19bV4Uk1pyo_7Ch0W', 129000, '<p>&ldquo;Nh&agrave; Chử&rdquo; l&agrave; cuốn tiểu thuyết lịch sử viết cho thiếu nhi về thời hồng hoang dựng nước, dựa tr&ecirc;n truyền thuyết d&acirc;n gian quen thuộc về ch&agrave;ng trai ngh&egrave;o họ Chử v&agrave; n&agrave;ng c&ocirc;ng ch&uacute;a Ti&ecirc;n Dung. &ldquo;Nh&agrave; Chử&rdquo; đ&atilde; được nh&agrave; văn T&ocirc; Ho&agrave;i ph&aacute;t triển th&agrave;nh một t&aacute;c phẩm văn học c&oacute; gi&aacute; trị.</p>\r\n\r\n<p>Bằng những hiểu biết hết sức phong ph&uacute; v&agrave; s&acirc;u sắc về phong tục, tập qu&aacute;n, văn ho&aacute; cổ xưa cũng như tr&iacute; tưởng tượng dồi d&agrave;o của t&aacute;c giả, qua những trang văn đầy s&aacute;ng tạo v&agrave; sinh động, bạn đọc sẽ được gặp gỡ những người thực m&agrave; kh&ocirc;ng thực, những con người của thế giới huyền thoại diệu k&igrave;... Dưới b&uacute;t ph&aacute;p t&agrave;i nghệ, những nh&acirc;n vật uy nghi phi ph&agrave;m bỗng trở n&ecirc;n gần gũi, th&acirc;n thuộc, như hiện ra giữa tr&ograve; chơi của bầy trẻ thơ tr&ecirc;n b&atilde;i cỏ, bờ đ&ecirc;...</p>\r\n\r\n<p>Nh&agrave; l&iacute; luận ph&ecirc; b&igrave;nh Đỗ Ngọc Y&ecirc;n từng chia sẻ: &ldquo;&Ocirc;ng viết giản dị đến mức tự nhi&ecirc;n, như l&agrave; h&iacute;t thở kh&iacute; giời, cơm ăn, nước uống. C&oacute; lẽ trời đ&atilde; ph&uacute; cho &ocirc;ng một bộ &oacute;c quan s&aacute;t tinh tế, một &ldquo;con mắt tinh đời&rdquo;. Từng c&oacute; người nhận x&eacute;t nh&agrave; văn T&ocirc; Ho&agrave;i l&agrave; người &ldquo;h&oacute;m hỉnh&rdquo;. T&ocirc;i nghĩ, như vậy đ&uacute;ng nhưng chưa đủ, m&agrave; phải l&agrave; một nh&agrave; văn &ldquo;h&oacute;m lẹm&rdquo;. &Ocirc;ng chỉ cần viết ra những c&aacute;i &ocirc;ng quan s&aacute;t thấy, như kh&ocirc;ng cần văn chương ch&uacute;t n&agrave;o, kh&ocirc;ng cần hư cấu th&ecirc;m mắm th&ecirc;m muối g&igrave; cũng đ&atilde; l&agrave; văn rồi, một thứ văn vừa h&agrave;i hước, sắc sảo v&agrave; s&acirc;u cay, nhưng vẫn gần gũi với đời sống thực diễn ra hằng ng&agrave;y.&rdquo;</p>', 72, 1, 1, 0, '2024-09-21 10:33:27', '2024-11-13 21:04:21', 1, 1, 9),
(30, 'MS48734208', 'KIẾN THÚC VUI VỀ CƠ THỂ CON NGƯỜI', 'Nguyễn Minh Tiến', 110, 2016, 10, 10, NULL, 59000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Kiến Th&uacute;c Vui Về Cơ Thể Con Người PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Minh Tiến</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 1226, 0, 0, 0, '2024-09-21 10:36:46', '2024-11-17 15:41:09', 12, 1, 15),
(31, 'MS51162052', 'BÍ QUYẾT ĐỂ CÓ MỘT CUỘC SỐNG KHỎE MẠNH', 'David Niven', 220, 2012, 6, 6, NULL, 119000, '<p>Ai đ&atilde; từng n&oacute;i rằng kh&ocirc;ng c&oacute; một sự vĩ đại n&agrave;o trong một cơ thể đau yếu. Liệu bạn c&oacute; được sự minh mẫn, &oacute;c s&aacute;ng tạo, khi bạn đang phải g&aacute;nh chịu nỗi đau đớn thường xuy&ecirc;n v&igrave; bệnh tật? Với mong muốn mang đến cho bạn đọc một c&aacute;i nh&igrave;n s&acirc;u sắc, to&agrave;n diện hơn để cải thiện v&agrave; bảo vệ sức khỏe, tiến sĩ David Niven đ&atilde; tổng kết những kết quả nghi&ecirc;n cứu của c&aacute;c nh&agrave; khoa học v&agrave; cả kinh nghiệm sống của m&igrave;nh v&agrave;o cuốn s&aacute;ch n&agrave;y.</p>\r\n\r\n<p>C&aacute;c bạn c&oacute; thể bắt gặp trong cuốn s&aacute;ch n&agrave;y những kinh nghiệm được soi chiếu từ nhiều g&oacute;c cạnh kh&aacute;c nhau của cuộc sống. Từ việc lựa chọn thực phẩm, đến c&aacute;ch ăn uống, c&aacute;ch ngủ như thế n&agrave;o cho tốt, thậm ch&iacute; ngay cả c&aacute;ch tư duy, c&aacute;ch l&agrave;m việc v&agrave; những mối quan hệ kh&aacute;c nhau cũng được đề cập đến trong mối tương quan với sức khỏe con người. Tất cả những điều đ&oacute; đều ảnh hưởng quan trọng đến sức khỏe của ch&uacute;ng ta. Bạn cũng c&oacute; thể t&igrave;m thấy ở đ&acirc;y những b&iacute; quyết hết sức gản dị m&agrave; thường ng&agrave;y bạn kh&ocirc;ng ph&aacute;t hiện ra c&ugrave;ng với những kiến thức khoa học bất ngờ v&agrave; th&uacute; vị.</p>', 421, 0, 0, 0, '2024-09-21 10:42:04', '2024-11-18 13:42:20', 12, 2, 15),
(32, 'MS34303630', '101 CÁCH DẠY CON THÀNH TÀI', 'Trần Đại Vĩ', 226, 2018, 5, 5, 'https://drive.google.com/drive/u/1/folders/1N24cLgp5hRl15do4zO4GsS43p8zUZPwt', 189000, '<p>L&agrave;m cha mẹ, ai cũng mong muốn con m&igrave;nh trở th&agrave;nh người t&agrave;i giỏi. Cuốn &ldquo;101 c&aacute;ch dạy con th&agrave;nh t&agrave;i&rdquo; hướng dẫn tỉ mỉ từng bước cho bạn c&aacute;ch gi&uacute;p con m&igrave;nh th&agrave;nh đạt. Cuốn s&aacute;ch gồm 4 chương, mỗi chương được chia th&agrave;nh những phần nhỏ.</p>\r\n\r\n<p>Chương I: Hướng dẫn bạn c&aacute;ch gi&aacute;o dục con, n&ecirc;u l&ecirc;n vai tr&ograve; quan trọng của cha mẹ trong gi&aacute;o dục con c&aacute;i, chỉ ra tầm quan trọng của khen ngợi, sự ph&aacute;t triển tiềm năng v&agrave; thi&ecirc;n chất của con trẻ, r&egrave;n luyện t&iacute;nh tự trọng của con trẻ, n&ecirc;n trao đổi tr&ograve; chuyện với con c&aacute;i như thế n&agrave;o? N&ecirc;u một số phương ph&aacute;p gi&aacute;o dục con v&agrave; một số đặc trưng t&acirc;m l&yacute; của con trẻ trong c&aacute;c giai đoạn, những biện ph&aacute;p giao lưu c&oacute; hiệu quả giữa bố mẹ v&agrave; con c&aacute;i, biện ph&aacute;p khuyến kh&iacute;ch con trẻ, phương ph&aacute;p ph&ecirc; b&igrave;nh&hellip;</p>', 513, 0, 0, 0, '2024-09-21 10:45:21', '2024-11-18 13:43:24', 17, 1, 15),
(33, 'MS61986185', 'DANH NHÂN VĂN HÓA VIỆT NAM', 'Lê Minh Quốc', 253, 1999, 9, 9, 'https://drive.google.com/drive/u/1/folders/1UMLsMyODE3iwTyLzKw0InnqB0WbFMW81', 119000, '<p>Phong tục Bắc Nam cũng kh&aacute;c</p>\r\n\r\n<p>Điều n&agrave;y khẳng định, nước ta vốn c&oacute; truyền thống văn h&oacute;a l&acirc;u đời. D&ugrave; c&aacute;c thế lực ngoại x&acirc;m từ h&agrave;ng ng&agrave;n năm nay đ&atilde; thực hiện ch&iacute;nh s&aacute;ch đồng h&oacute;a về mọi mặt nhưng cuối c&ugrave;ng chỉ chuốc lại sự bại vong. Sức mạnh văn h&oacute;a của d&acirc;n tộc ta bền bỉ, trường tồn như sức sống của một d&acirc;n tộc. Những gi&aacute; trị vật chất v&agrave; tinh thần do tiền nh&acirc;n s&aacute;ng tạo ra trong qu&aacute; tr&igrave;nh lịch sử m&atilde;i m&atilde;i l&agrave; niềm tự h&agrave;o của c&aacute;c thế hệ sau.</p>\r\n\r\n<p>Trong tập s&aacute;ch n&agrave;y ch&uacute;ng t&ocirc;i cố gắng n&ecirc;u bật c&ocirc;ng đức của c&aacute;c danh nh&acirc;n như anh h&ugrave;ng d&acirc;n tộc Nguyễn Tr&atilde;i. Khi đ&aacute;nh giặc, &ocirc;ng đ&atilde; c&ugrave;ng L&ecirc; Lợi đ&atilde; vận dụng sức mạnh của văn h&oacute;a d&acirc;n tộc:</p>\r\n\r\n<p>Việc nh&acirc;n nghĩa cốt ở y&ecirc;n d&acirc;n</p>\r\n\r\n<p>Qu&acirc;n điếu phạt trước lo trừ bạo để đạt mục đ&iacute;ch cuối c&ugrave;ng l&agrave; &ldquo;X&atilde; tắc từ đ&acirc;y bền vững&rdquo;. Trong số c&aacute;c nh&acirc;n vật được UNESCO c&ocirc;ng nhận Danh nh&acirc;n văn h&oacute;a thế giới, ngo&agrave;i Nguyễn Tr&atilde;i ch&uacute;ng t&ocirc;i c&ograve;n đề cập đến thi h&agrave;o Nguyễn Du - người đ&atilde; để lại một t&aacute;c phẩm c&oacute; gi&aacute; trị l&agrave; vi&ecirc;n ngọc qu&yacute; Truyện Kiều, kh&ocirc;ng chỉ l&agrave;m rạng rỡ nền văn h&oacute;a nước nh&agrave; m&agrave; c&ograve;n c&oacute; tiếng vang tr&ecirc;n thế giới; Chủ tịch Hồ Ch&iacute; Minh - một vĩ nh&acirc;n lỗi lạc của thế kỷ XX m&agrave; cố Tổng B&iacute; thư L&ecirc; Duẩn đ&atilde; ph&aacute;t biểu: &ldquo;D&acirc;n tộc ta, nh&acirc;n d&acirc;n ta, non s&ocirc;ng đất nước ta đ&atilde; sinh ra Hồ Chủ tịch, người anh h&ugrave;ng d&acirc;n tộc vĩ đại, v&agrave; ch&iacute;nh Người đ&atilde; l&agrave;m rạng rỡ d&acirc;n tộc ta, nh&acirc;n d&acirc;n ta v&agrave; non s&ocirc;ng đất nước ta&rdquo;.</p>\r\n\r\n<p>Trong nhiều giai đoạn kh&aacute;c nhau của lịch sử, ch&uacute;ng t&ocirc;i đề cập đến danh nh&acirc;n Phạm Đ&igrave;nh Hổ - t&aacute;c giả của nhiều c&ocirc;ng tr&igrave;nh nghi&ecirc;n cứu c&oacute; gi&aacute; trị về lịch sử, ng&ocirc;n ngữ, đại l&yacute;, thơ ca&hellip; m&agrave; l&acirc;u nay ch&uacute;ng ta chỉ mới biết qua Vũ trung t&ugrave;y b&uacute;t. Tiếp theo, ch&uacute;ng t&ocirc;i đề cập đến Nguyễn Khuyến - thi sĩ số một của l&agrave;ng qu&ecirc;, của m&ugrave;a thu Việt Nam v&agrave; cũng l&agrave; c&acirc;y b&uacute;t tr&agrave;o ph&uacute;ng xuất sắc nhất thời đại m&agrave; &ocirc;ng đ&atilde; sống. B&ecirc;n cạnh đ&oacute;, ch&uacute;ng t&ocirc;i cũng giới thiệu những đ&oacute;ng g&oacute;p của c&aacute;c danh nh&acirc;n kh&aacute;c như nh&agrave; thơ Phan Văn Trị, nghi&ecirc;n cứu Nguyễn Đổng Chi, nh&agrave; văn Nam Cao, họa sĩ Nguyễn Phan Ch&aacute;nh&hellip; với những c&ocirc;ng tr&igrave;nh c&oacute; gi&aacute; trị l&acirc;u bền trong kho t&agrave;ng văn h&oacute;a của nước nh&agrave;.</p>\r\n\r\n<p>Ch&uacute;ng t&ocirc;i cũng kh&ocirc;ng qu&ecirc;n đến nh&agrave; thơ tr&agrave;o ph&uacute;ng T&uacute; Xương - người đ&atilde; để lại một sự nghiệp văn học để tạo n&ecirc;n cốt c&aacute;ch tr&agrave;o ph&uacute;ng v&agrave; trữ t&igrave;nh m&agrave; &iacute;t nh&agrave; thơ n&agrave;o s&aacute;nh kịp. Trong số c&aacute;c &ldquo;m&ocirc;n đệ&rdquo; của T&uacute; Xương, ch&uacute;ng t&ocirc;i giới thiệu nh&agrave; thơ T&uacute; Mỡ - một c&acirc;y b&uacute;t tr&agrave;o ph&uacute;ng rất nổi tiếng tr&ecirc;n văn đ&agrave;n những năm 1930 của thế kỷ XX. Tiếng cười độc đ&aacute;o của &ocirc;ng l&agrave; biết kế thừa c&aacute;i hay của c&aacute;c thi sĩ đ&agrave;n anh v&agrave; vận dụng ca dao, tục ngữ. Điều l&agrave;m n&ecirc;n t&ecirc;n tuổi T&uacute; Mỡ l&agrave; &ocirc;ng đ&atilde; cười rất &aacute;c v&agrave;o c&aacute;i &ocirc;ng nghị... gật m&agrave; trước v&agrave; sau &ocirc;ng chưa c&oacute; ai vượt qua nổi!</p>\r\n\r\n<p>Trong tập s&aacute;ch n&agrave;y, ch&uacute;ng t&ocirc;i c&ograve;n viết về b&aacute;c Ba Phi. Năm 2002, một hội thảo khoa học &ldquo;Chuyện kể b&aacute;c Ba Phi&rdquo; được tổ chức tại C&agrave; Mau với 36 tham luận của c&aacute;c học giả, nh&agrave; nghi&ecirc;n cứu trong cả nước. &ldquo;Tựu trung mọi người đều nhất tr&iacute; đ&aacute;nh gi&aacute; chuyện kể của b&aacute;c Ba Phi l&agrave; một di sản văn h&oacute;a phi vật thể của Nam Bộ cần được tr&acirc;n trọng g&igrave;n giữ cho mu&ocirc;n đời sau như ta đ&atilde; g&igrave;n giữ chuyện Trạng Quỳnh, Trạng Lợn... trước đ&acirc;y. C&aacute;c chuyện kể của b&aacute;c Ba Phi bắt nguồn từ sự phong ph&uacute;, gi&agrave;u c&oacute; của sản vật tự nhi&ecirc;n v&ugrave;ng U Minh những ng&agrave;y đầu được người d&acirc;n khai ph&aacute; v&agrave; b&aacute;c Ba Phi chỉ l&agrave; một người n&acirc;ng bức tranh sản vật v&ocirc; c&ugrave;ng phong ph&uacute; ấy l&ecirc;n tầm thẩm mỹ văn học&rdquo; (B&aacute;o Tuổi trẻ chủ nhật số ra ng&agrave;y 8.12.2002). Tương tự, l&agrave;m sao ta c&oacute; thể qu&ecirc;n được Vũ Trọng Phụng, nh&agrave; văn của nhiều t&aacute;c phẩm hiện thực ph&ecirc; ph&aacute;n như Số đỏ, Gi&ocirc;ng tố... v&agrave; nhiều tập ph&oacute;ng sự c&oacute; gi&aacute; trị hiện thực được phong tặng &ldquo;&Ocirc;ng vua ph&oacute;ng sự đất Bắc&rdquo;. Ngo&agrave;i ra, khi viết tiếp những nh&acirc;n vật lừng danh của thế kỷ XX, ch&uacute;ng t&ocirc;i c&ograve;n đề cập đến nh&agrave; triết học Trần Đức Thảo, người đ&atilde; từng tranh luận thắng thế với nh&agrave; văn, nh&agrave; tư tưởng J.P. Sartre tại Paris v&agrave; để lại nhiều t&aacute;c phẩm triết học c&oacute; gi&aacute; trị. L&agrave; nghệ sĩ đa t&agrave;i Văn Cao, người đ&atilde; viết ca kh&uacute;c bất hủ Tiến qu&acirc;n ca, được Quốc hội nước ta chọn l&agrave;m Quốc ca. L&agrave; nh&agrave; d&acirc;n tộc học Từ Chi, người đ&atilde; d&agrave;nh t&acirc;m huyết một đời để nghi&ecirc;n cứu về văn h&oacute;a Mường, về l&agrave;ng x&atilde; Việt Nam đ&atilde; c&oacute; nhiều đ&oacute;ng g&oacute;p to lớn m&agrave; học giả người Ph&aacute;p l&agrave; GS. Georges Condomimas đ&atilde; đ&aacute;nh gi&aacute; l&agrave; &ldquo;một nh&agrave; b&aacute;c học lớn&rdquo; của Việt Nam.</p>\r\n\r\n<p>C&oacute; thể khẳng định c&aacute;c nh&acirc;n vật tr&ecirc;n đều c&oacute; những nỗ lực đ&aacute;ng qu&yacute;, đ&aacute;ng tr&acirc;n trọng trong việc bảo vệ, ph&aacute;t huy di sản văn h&oacute;a của nước nh&agrave; bằng nhiều việc l&agrave;m thiết thực, nghi&ecirc;m t&uacute;c v&agrave; c&oacute; gi&aacute; trị l&acirc;u bền. Điều n&agrave;y c&oacute; &yacute; nghĩa kh&ocirc;ng nhỏ khi ch&uacute;ng ta đang phấn đấu x&acirc;y dựng một nền văn h&oacute;a ti&ecirc;n tiến v&agrave; đậm đ&agrave; bản sắc d&acirc;n tộc. Do khu&ocirc;n khổ tập s&aacute;ch c&oacute; hạn n&ecirc;n ch&uacute;ng t&ocirc;i sẽ tiếp tục đề cập đến nhiều danh nh&acirc;n văn h&oacute;a kh&aacute;c trong những tập sau.</p>\r\n\r\n<p>Nh&acirc;n đ&acirc;y ch&uacute;ng t&ocirc;i xin được nhắc lại, bộ s&aacute;ch KỂ CHUYỆN DANH NH&Acirc;N VIỆT NAM do nh&agrave; thơ L&ecirc; Minh Quốc thực hiện đ&atilde; ph&aacute;t h&agrave;nh c&aacute;c tập: Danh nh&acirc;n qu&acirc;n sự Việt Nam, Danh nh&acirc;n khoa học Việt Nam, C&aacute;c vị Tổ ng&agrave;nh nghề Việt Nam, Danh nh&acirc;n Sư phạm Việt Nam, Danh nh&acirc;n văn h&oacute;a Việt Nam, Nam, C&aacute;c vị nữ danh nh&acirc;n Việt Nam, Những nh&agrave; cải c&aacute;ch Việt Nam, Danh nh&acirc;n c&aacute;ch mạng Việt Nam, Những người Việt Nam đi ti&ecirc;n phong, Những nh&agrave; ch&iacute;nh trị Việt Nam v&agrave; sẽ c&ograve;n ph&aacute;t h&agrave;nh c&aacute;c tập tiếp theo, mời c&aacute;c bạn t&igrave;m đọc. Để bộ s&aacute;ch thật sự hữu &iacute;ch cho bạn đọc - nhất l&agrave; c&aacute;c bạn thanh thiếu ni&ecirc;n- ch&uacute;ng t&ocirc;i rất mong được sự chỉ gi&aacute;o, gi&uacute;p đỡ ch&acirc;n t&igrave;nh của c&aacute;c học giả uy&ecirc;n b&aacute;c, của c&aacute;c nh&agrave; sử học v&agrave; của c&aacute;c bạn đọc xa gần để tập s&aacute;ch ng&agrave;y một ho&agrave;n hảo hơn. Trước hết xin bạn đọc ghi nhận ở đ&acirc;y sự biết ơn s&acirc;u xa của ch&uacute;ng t&ocirc;i.</p>', 955, 157, 1, 5, '2024-09-21 10:54:00', '2024-11-16 14:53:13', 13, 1, 15),
(34, 'MS21708502', 'NHẬT KÝ SEN TRẮNG', 'Cao Huy Thuần', 199, 2010, 15, 15, NULL, 79000, '<p>C&oacute; thể coi đ&acirc;y l&agrave; cuốn gi&aacute;o khoa khuy&ecirc;n dạy đạo đức l&agrave;m người cho con trẻ. Những c&acirc;u chuyện kể sinh động, thiết thực đươc tr&iacute;ch từ văn chương c&aacute;c t&aacute;c gia nổi tiếng, v&agrave; từ những c&acirc;u chuyện tiền th&acirc;n của đức Phật m&agrave; t&aacute;c giả kể lại cho hợp với đạo đức của mọi gia đ&igrave;nh kh&ocirc;ng ph&acirc;n biệt t&iacute;n ngưỡng, văn h&oacute;a, trong sự li&ecirc;n quan đến c&aacute;c vấn đề: Thương y&ecirc;u sự sống; Tranh luận v&agrave; tranh c&atilde;i; N&oacute;i lời h&ograve;a &aacute;i; C&atilde;i v&agrave; im lặng; Cho; N&oacute;i xấu; Tiếng đồn; Trả th&ugrave;; C&ocirc;ng l&yacute;; T&acirc;m hồn cao thượng; Khi&ecirc;m tốn; Biết ơn; Bội bạc; Bền ch&iacute;&hellip;</p>\r\n\r\n<p>Ở c&aacute;i tuổi 15, theo lời của t&aacute;c giả gửi ba mẹ c&aacute;c em, &laquo;suy luận m&agrave; kh&ocirc;ng mở ra th&igrave; con em của qu&yacute; vị kh&ocirc;ng tiến xa được tr&ecirc;n đường học vấn cũng như tr&ecirc;n đường sự nghiệp. Triết học bắt đầu từ tuổi n&agrave;y chứ kh&ocirc;ng phải đợi đến khi l&ecirc;n đại học, bởi v&igrave; triết học bắt đầu l&agrave; đặt vấn đề. T&ograve; m&ograve; khoa học cũng nẩy mầm từ tuổi ấy, bởi v&igrave; từ tuổi ấy c&aacute;i đầu dậy l&ecirc;n c&acirc;u hỏi v&igrave; sao. Cũng vậy, ở c&aacute;i tuổi ấy, nếu c&aacute;c em kh&ocirc;ng biết suy nghĩ về những vấn đề đạo đức th&igrave; kh&ocirc;ng biết đến bao giờ c&aacute;c em mới hiểu được thế n&agrave;o l&agrave; học để l&agrave;m người.&raquo;</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Nhật K&yacute; Sen Trắng PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Cao Huy Thuần</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 621, 0, 1, 0, '2024-09-21 10:56:55', '2024-11-12 10:52:30', 13, 1, 14),
(35, 'MS66561528', 'PHẨM CÁCH QUỐC GIA', 'Fujiwara Masahiko', 120, 2010, 11, 10, 'Fujiwara Masahiko', 59000, '<p>Fujiwara Masahiko l&agrave; nh&agrave; to&aacute;n học, gi&aacute;o sư danh dự Đại học Ochanomizu, đồng thời cũng l&agrave; nh&agrave; ph&ecirc; b&igrave;nh, người viết tiểu luận c&oacute; tiếng tại Nhật Bản. &Ocirc;ng từng dạy ba năm ở đại học của Mĩ, &ldquo;nơi mọi sự được quyết định duy nhất bởi t&aacute;c dụng của sự logic&rdquo;, v&agrave; ngay lập tức say m&ecirc; lối tư duy kiểu Mỹ. Sau một năm sống tại Anh, nơi &ldquo;tập qu&aacute;n, truyền thống, sự th&agrave;nh thật v&agrave; h&agrave;i hước của c&aacute; nh&acirc;n được coi trọng hơn logic, người Anh &ldquo;rất coi trọng truyền thống đến độ họ c&oacute; thể t&igrave;m ra niềm hạnh ph&uacute;c khi họ ở trong căn ph&ograve;ng giống như thời của Newton&rdquo;, Fujiwara Masahiko dần quan t&acirc;m đến vị tr&iacute; của cảm x&uacute;c, h&igrave;nh thức v&agrave; hạ thấp địa vị của l&ocirc;i tư duy logic. Cảm x&uacute;c &ldquo;l&agrave; sự nhớ thương, cảm động - những thứ được tạo ra v&agrave; nu&ocirc;i dưỡng bởi gi&aacute;o dục&rdquo;. H&igrave;nh thức ở đ&acirc;y chủ yếu l&agrave; ti&ecirc;u chuẩn h&agrave;nh động đến từ tinh thần v&otilde; sĩ đạo&rdquo;. Fujiwara Masahiko cho rằng &ldquo;Sau chiến tranh thế giới thứ hai, những người Nhật bị gi&aacute;o dục l&agrave;m cho mất đi l&ograve;ng tự h&agrave;o, sự tự tin đối với Tổ quốc v&agrave; trở n&ecirc;n yếu đuối đ&atilde; qu&ecirc;n hết &ldquo;cảm x&uacute;c v&agrave; h&igrave;nh thức&rdquo; c&oacute; nguồn gốc xa xưa của nước m&igrave;nh, thứ rất đ&aacute;ng tự h&agrave;o trước thế giới v&agrave; b&aacute;n th&acirc;n cho sự &ldquo;logic v&agrave; l&yacute; t&iacute;nh&rdquo; của &Acirc;u Mĩ, thứ đại diện cho kinh tế thị trường.</p>\r\n\r\n<p>V&igrave; vậy, Nhật Bản đ&atilde; mất đi đặc trưng quốc gi&aacute; của m&igrave;nh. Nhật Bản đ&atilde; mất đi &ldquo;phẩm c&aacute;ch của quốc gia&rdquo;. Qu&aacute; tr&igrave;nh to&agrave;n cầu h&oacute;a đang diễn ra hiện nay l&agrave; thứ l&agrave;m cho thế giới trở n&ecirc;n thuần nhất. T&ocirc;i cho rằng người Nhật n&ecirc;n cương quyết chống lại xu hướng n&agrave;y của thế giới. Kh&ocirc;ng được để nước m&igrave;nh trở th&agrave;nh một nước th&ocirc;ng thường.</p>\r\n\r\n<p>Trong thế giới bị cai trị bởi &Acirc;u, Mĩ, n&oacute; phải l&agrave; một nước NHẬT BẢN DUY NG&Atilde; ĐỘC T&Ocirc;N&rdquo;. Với những quan điểm đi ngược lại với xu hướng của số đ&ocirc;ng, PHẨM C&Aacute;CH QUỐC GIA trở th&agrave;nh một cuốn s&aacute;ch mang lại nhiều tranh luận tr&aacute;i chiều, nhưng đồng thời cũng l&agrave; cuốn s&aacute;ch v&ocirc; c&ugrave;ng cuốn h&uacute;t, bằng chứng l&agrave; chỉ trong v&ograve;ng nửa năm sau khi ra s&aacute;ch cuốn s&aacute;ch đ&atilde; b&aacute;n được tr&ecirc;n 2,67 triệu. Đến năm 2006, từ &ldquo;phẩm c&aacute;ch&rdquo; đ&atilde; gi&agrave;nh được giải thưởng cho &ldquo;từ ngữ mới được lưu h&agrave;nh phổ biến&rdquo;.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Phẩm C&aacute;ch Quốc Gia PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Fujiwara Masahiko</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 825, 122, 2, 4, '2024-09-21 11:00:22', '2024-11-16 14:53:00', 19, 2, 4),
(36, 'MS71288926', '100 TRÒ CHƠI DÂN GIAN CHO THIẾU NHI', 'Nguyễn Thị Thanh Thủy', 218, 2012, 10, 10, 'https://drive.google.com/drive/u/1/folders/17Xdj27Q8m0GjvMBx5gX5aK0v-2i4zYKG', 99000, '<p>Cuốn s&aacute;ch &quot;100 Tr&ograve; Chơi D&acirc;n Gian Cho Thiếu Nhi&quot; của NXB Kim Đồng mang lại cho c&aacute;c em thiếu nhi nhiều tr&ograve; chơi d&acirc;n gian hay v&agrave; th&uacute; vị. Mỗi tr&ograve; đều c&oacute; quy luật ri&ecirc;ng, mang những sắc th&aacute;i kh&aacute;c nhau khiến trẻ em chơi suốt ng&agrave;y m&agrave; kh&ocirc;ng thấy ch&aacute;n.</p>\r\n\r\n<p>Tr&ograve; chơi d&acirc;n gian chủ yếu d&agrave;nh cho trẻ em ở c&aacute;c v&ugrave;ng n&ocirc;ng th&ocirc;n n&ecirc;n c&aacute;i t&ecirc;n cũng giản đơn, n&ocirc;m na như t&ecirc;n thằng T&iacute;, con Na, thằng Ốc, c&aacute;i Hến: N&agrave;o l&agrave; đ&aacute;nh đ&aacute;o, đ&aacute;nh quay, n&agrave;o l&agrave; đi c&agrave; kheo, nổ ph&aacute;o đất&hellip; Hơn nữa, c&aacute;c tr&ograve; chơi d&acirc;n gian Việt Nam thường giản tiện, kh&ocirc;ng cầu kỳ, tốn k&eacute;m n&ecirc;n c&oacute; thể dễ d&agrave;ng chơi mọi l&uacute;c, mọi nơi, dụng cụ dễ kiếm, dễ l&agrave;m, chủ yếu lấy từ trong tự nhi&ecirc;n, thậm ch&iacute; chỉ l&agrave; c&aacute;i gậy, h&ograve;n đ&aacute;, h&ograve;n bi nhặt trong vườn, dưới ruộng l&agrave; c&oacute; thể lập được một hội chơi.</p>\r\n\r\n<p>Người chơi thường l&agrave; những trẻ chăn tr&acirc;u l&ecirc; la t&uacute;m tụm ngo&agrave;i b&atilde;i cỏ, ngo&agrave;i việc vui đ&ugrave;a, r&egrave;n luyện th&acirc;n thể, c&ograve;n thể hiện nỗi kh&aacute;t khao chiến thắng tiềm ẩn trong mỗi đứa trẻ&hellip;</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>100 Tr&ograve; Chơi D&acirc;n Gian Cho Thiếu Nhi PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Thị Thanh Thủy</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 831, 212, 0, 5, '2024-09-30 09:59:39', '2024-11-16 18:13:52', 13, 1, 4),
(37, 'MS55386238', 'ĐẤT RỪNG PHƯƠNG NAM', 'Đoàn Giỏi', 233, 1996, 9, 9, 'https://drive.google.com/drive/u/1/folders/186d-eeTiJhPFIAARmBfxaoiuKGxh152y', 89000, '<p>Đất rừng phương nam l&agrave; tiểu thuyết của nh&agrave; văn Đo&agrave;n Giỏi viết về cuộc đời phi&ecirc;u bạt của một cậu b&eacute; t&ecirc;n An. Bối cảnh của tiểu thuyết l&agrave; c&aacute;c tỉnh miền T&acirc;y Nam Bộ, Việt Nam v&agrave;o những năm 1945, sau khi thực d&acirc;n Ph&aacute;p quay trở lại x&acirc;m chiếm Nam Bộ</p>\r\n\r\n<p>Tiểu thuyết Đất rừng phương nam được chuyển thể th&agrave;nh phim Đất phương nam do H&atilde;ng phim Truyền h&igrave;nh th&agrave;nh phố Hồ Ch&iacute; Minh sản xuất năm 1997. Một trong nhiều t&aacute;c phẩm được chuyển thể th&agrave;nh phim.</p>\r\n\r\n<p>C&acirc;u chuyện mượn h&igrave;nh ảnh một cậu b&eacute; bị lưu lạc trong thời kỳ kh&aacute;ng chiến chống Ph&aacute;p ở Nam bộ để giới thiệu &quot;Đất rừng Phương Nam&quot;. Nơi đ&oacute;, một v&ugrave;ng đất v&ocirc; c&ugrave;ng gi&agrave;u c&oacute;, h&agrave;o ph&oacute;ng v&agrave; h&ugrave;ng vĩ với những con người trung hậu, tr&iacute; dũng, một l&ograve;ng một dạ theo kh&aacute;ng chiến.</p>\r\n\r\n<p>&quot;Đất rừng phương Nam&quot; của Đo&agrave;n Giỏi như một x&atilde; hội của miền s&ocirc;ng nước T&acirc;y Nam bộ thu nhỏ. Bởi ở nơi đ&oacute;, người đọc đ&atilde; t&igrave;m thấy h&igrave;nh ảnh người d&acirc;n của v&ugrave;ng đất phương Nam từ s&ocirc;ng Tiền, s&ocirc;ng Hậu trải d&agrave;i đến Ki&ecirc;n Giang - Rạch Gi&aacute;, rồi xuống tận rừng U Minh, sau đ&oacute; dừng lại ở Năm Căn C&agrave; Mau.</p>\r\n\r\n<p>Bối cảnh trong &quot;Đất rừng phương Nam&quot; l&agrave; cả một đất trời thi&ecirc;n nhi&ecirc;n ưu đ&atilde;i, c&aacute;nh đồng b&aacute;t ng&aacute;t m&ecirc;nh m&ocirc;ng, s&oacute;ng nước r&igrave; rầm, rừng rậm bạt ng&agrave;n tr&ugrave; ph&uacute;, th&uacute; rừng hoang d&atilde; mu&ocirc;n lo&agrave;i... C&oacute; thể n&oacute;i truyện đ&atilde; mang đến cho người đọc nhiều th&uacute; vị.</p>', 567, 254, 1, 5, '2024-09-30 10:24:31', '2024-11-17 11:38:24', 1, 1, 4),
(38, 'MS37566680', 'BLOCKCHAIN VÀ TƯƠNG LAI CỦA TIỀN TỆ', 'Paul Vigna', 318, 2021, 12, 11, 'https://drive.google.com/drive/u/1/folders/1tqhAZ5rwgc33Agz9ffI4MrqvfDK4aaE3', 99000, '<p>Trong nền kinh tế hiện đại, những kẻ quản l&yacute; được sự truyền tải th&ocirc;ng tin sẽ kiểm so&aacute;t cả thế giới. Sự thực n&agrave;y đ&atilde; được chứng minh bởi vị thế vững v&agrave;ng v&agrave; tầm ảnh hưởng ng&agrave;y c&agrave;ng s&acirc;u rộng của Google v&agrave; Facebook. Hiện nay, quyền lực chỉ nằm trong tay một số &iacute;t những g&atilde; khổng lồ c&ocirc;ng nghệ - c&aacute;c tập đo&agrave;n nắm quyền thu thập, lưu trữ, v&agrave; chia sẻ dữ liệu.</p>\r\n\r\n<p>Vậy, điều g&igrave; sẽ xảy ra nếu quyền lực được ph&acirc;n t&aacute;n, mọi c&aacute; nh&acirc;n đều c&oacute; quyền ngang nhau trong việc quản l&yacute; th&ocirc;ng tin, v&agrave; kh&ocirc;ng một ch&iacute;nh phủ, một đại doanh nghiệp n&agrave;o c&oacute; quyền chi phối tuyệt đối? Điều đ&oacute; sẽ th&agrave;nh hiện thực với sự xuất hiện của Blockchain - &quot;cỗ m&aacute;y sự thật&quot;. Blockchain gi&uacute;p ta h&igrave;nh dung ra một thế giới kh&ocirc;ng bị thống trị bởi Google, Facebook, hay NSA - một nơi m&agrave; ch&iacute;nh mỗi ch&uacute;ng ta, những th&agrave;nh phần cốt l&otilde;i của x&atilde; hội to&agrave;n cầu, được quyền quyết định quản l&yacute; dữ liệu của bản th&acirc;n.</p>\r\n\r\n<p>Trong &quot; Blockchain v&agrave; tương lai của tiền tệ&quot;, Paul Vigna v&agrave; Michael J. Casey đ&atilde; l&agrave;m s&aacute;ng tỏ vấn đề blockchain v&agrave; giải th&iacute;ch l&yacute; do tại sao n&oacute; c&oacute; thể kh&ocirc;i phục quyền kiểm so&aacute;t c&aacute; nh&acirc;n đối với dữ liệu, t&agrave;i sản v&agrave; danh t&iacute;nh của ch&uacute;ng ta. Cuốn s&aacute;ch kh&aacute;m ph&aacute; c&aacute;ch thức m&agrave; c&ocirc;ng nghệ n&agrave;y, cũng như rất nhiều ứng dụng của n&oacute; (ti&ecirc;u biểu như Bitcoin) đang hoạt động nhằm t&aacute;i cơ cấu lại c&aacute;c tổ chức x&atilde; hội, v&agrave; tạo ra v&ocirc; số tiềm năng vĩ đại. Nối tiếp t&aacute;c phẩm &quot;Kỷ nguy&ecirc;n tiền điện tử&quot; đ&atilde; g&acirc;y tiếng vang lớn, bộ đ&ocirc;i t&aacute;c giả tiếp tục cung cấp cho người đọc một c&aacute;i nh&igrave;n tổng quan hơn về x&atilde; hội trong &quot; Blockchain v&agrave; tương lai của tiền tệ&quot;. Đọc hết t&aacute;c phẩm n&agrave;y, v&agrave; bạn sẽ hiểu được ch&uacute;ng ta đang đứng trước c&aacute;c cơ hội v&agrave; th&aacute;ch thức như thế n&agrave;o khi ứng dụng c&ocirc;ng nghệ blockchain v&agrave;o cuộc sống.</p>\r\n\r\n<p>***</p>\r\n\r\n<p>Trong cuốn Kỷ nguy&ecirc;n Tiền điện tử, ch&uacute;ng ta đ&atilde; t&igrave;m hiểu về tiền ảo v&agrave; tiềm năng mang lại một hệ thống giao dịch c&ocirc;ng bằng hơn tr&ecirc;n to&agrave;n cầu, một hệ thống c&oacute; thể hoạt động kh&ocirc;ng cần ng&acirc;n h&agrave;ng v&agrave; c&aacute;c thể chế t&agrave;i ch&iacute;nh trung gian kh&aacute;c. Khi cuốn s&aacute;ch sắp được in, ứng dụng ng&agrave;y c&agrave;ng rộng r&atilde;i của Bitcoin1 - c&aacute;ch thức hệ thống cốt l&otilde;i của n&oacute; c&oacute; thể gi&uacute;p giải quyết những vấn đề về niềm tin giữa c&aacute;c c&aacute; nh&acirc;n v&agrave; doanh nghiệp khi họ giao thương t&agrave;i sản, khởi tạo hợp đồng, ph&acirc;n chia bất động sản, hoặc chia sẻ những th&ocirc;ng tin gi&aacute; trị hoặc nhạy cảm - đ&atilde; trở n&ecirc;n r&otilde; r&agrave;ng. Đối với c&aacute;c c&ocirc;ng ty, ch&iacute;nh phủ, v&agrave; giới truyền th&ocirc;ng, mối quan t&acirc;m chung của họ, v&agrave; đ&acirc;u đ&oacute; cả một ch&uacute;t k&iacute;ch th&iacute;ch t&ograve; m&ograve;, đ&atilde; hướng đến một kh&aacute;i niệm mang t&ecirc;n &ldquo;c&ocirc;ng nghệ Blockchain.&rdquo;</p>', 654, 0, 1, 5, '2024-10-02 13:34:37', '2024-11-18 13:42:15', 20, 1, 5),
(39, 'MS45455776', 'CÁC GIẢI PHÁP LẬP TRÌNH C#', 'Nguyễn Ngọc Bình Phương', 706, 1997, 8, 8, 'https://drive.google.com/drive/u/1/folders/10TVrtgFcCkEyPVuPLj_mop9njXpfXBur', 285000, '<p>C&aacute;c giải ph&aacute;p lập tr&igrave;nh C# khảo s&aacute;t chiều rộng của thư viện lớp.NET Framework v&agrave; cung cấp giải ph&aacute;p cụ thể cho c&aacute;c vấn đề thường gặp. Mỗi giải ph&aacute;p được tr&igrave;nh b&agrave;y theo dạng &ldquo;vấn đề/giải ph&aacute;p&rdquo; một c&aacute;ch ngắn gọn v&agrave; k&egrave;m theo l&agrave; c&aacute;c v&iacute; dụ mẫu.</p>\r\n\r\n<p>C&aacute;c giải ph&aacute;p lập tr&igrave;nh C# kh&ocirc;ng nhằm mục đ&iacute;ch hướng dẫn bạn c&aacute;ch lập tr&igrave;nh C#. Tuy vậy, ngay cả khi mới l&agrave;m quen với lập tr&igrave;nh ứng dụng được x&acirc;y dựng tr&ecirc;n.NET Framework với C#, bạn cũng sẽ nhận thấy quyển s&aacute;ch n&agrave;y l&agrave; một t&agrave;i nguy&ecirc;n v&ocirc; gi&aacute;.</p>\r\n\r\n<p>Ở mức l&yacute; tưởng, khi bạn đối mặt với một vấn đề, quyển s&aacute;ch n&agrave;y sẽ cung cấp một giải ph&aacute;p&mdash;hay &iacute;t nhất n&oacute; sẽ gợi cho bạn hướng đi đ&uacute;ng. Ngay cả nếu bạn chỉ muốn mở rộng kiến thức của m&igrave;nh về thư viện lớp.NET, C&aacute;c giải ph&aacute;p lập tr&igrave;nh C# cũng l&agrave; một t&agrave;i liệu rất hữu &iacute;ch.</p>\r\n\r\n<p>Bạn kh&ocirc;ng thể trở n&ecirc;n th&agrave;nh thạo C# v&agrave; c&aacute;c lớp trong thư viện lớp.NET nếu chỉ đơn thuần đọc về ch&uacute;ng, bạn phải sử dụng v&agrave; thử nghiệm ch&uacute;ng bằng c&aacute;ch viết thật nhiều chương tr&igrave;nh. Cấu tr&uacute;c v&agrave; nội dung của quyển s&aacute;ch n&agrave;y cũng như t&iacute;nh khả thi trong thế giới thực của c&aacute;c giải ph&aacute;p được đưa ra sẽ cung cấp điểm khởi đầu ho&agrave;n hảo, để từ đ&oacute; l&agrave;m b&agrave;n đạp cho việc thử nghiệm của ch&iacute;nh bạn.</p>\r\n\r\n<p>Phần m&atilde; lệnh trong quyển s&aacute;ch n&agrave;y đ&atilde; được viết v&agrave; chạy thử nghiệm tr&ecirc;n phi&ecirc;n bản 1.1 của.NET Framework. Trong nhiều trường hợp, bạn sẽ nhận thấy v&iacute; dụ mẫu n&agrave;y cũng sẽ chạy tr&ecirc;n phi&ecirc;n bản 1.0 hay 2.0 của.NET Framework, tuy nhi&ecirc;n điều n&agrave;y chưa được thử nghiệm.</p>', 383, 0, 2, 5, '2024-10-02 13:41:32', '2024-11-18 13:42:11', 21, 1, 5),
(40, 'MS70349152', 'LẬP TRÌNH CĂN BẢN', 'Codegym', 173, 2023, 10, 10, NULL, 89000, '<p>X&acirc;y dựng nền tảng lập tr&igrave;nh chỉ trong 1 th&aacute;ng</p>\r\n\r\n<p>Ebook &ldquo;Lập tr&igrave;nh căn bản&rdquo; cung cấp hệ thống kiến thức nền tảng lập tr&igrave;nh cốt yếu từ l&yacute; thuyết đến thực h&agrave;nh, gi&uacute;p bạn từ chưa biết g&igrave; c&oacute; thể x&acirc;y gốc, nhanh ch&oacute;ng bước ch&acirc;n v&agrave;o thế giới IT chỉ trong v&ograve;ng 1 th&aacute;ng.</p>\r\n\r\n<p>Cuốn s&aacute;ch đặc biệt ph&ugrave; hợp với những bạn bắt đầu từ con số 0, mong muốn ph&aacute;t triển năng lực lập tr&igrave;nh trong thời gian nhanh nhất.</p>', 250, 0, 0, 0, '2024-10-02 13:44:59', '2024-12-01 09:43:30', 12, 1, 5),
(41, 'MS47817755', 'TỔNG HỢP KIẾN THỨC JAVA CĂN BẢN', 'Codegym', 200, 2018, 10, 9, NULL, 119000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Tổng Hợp Kiến Thức Java Căn Bản PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Codegym</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 321, 0, 1, 0, '2024-10-02 14:07:58', '2024-11-18 13:42:04', 12, 1, 14),
(42, 'MS66347697', 'SỔ TAY NGHỀ LẬP TRÌNH', 'Codegym', 40, 2020, 10, 10, 'https://drive.google.com/drive/u/1/folders/1ceQk236vtKWLndSY8L_46SmAYl0CGp7s', 99000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Sổ Tay Nghề Lập Tr&igrave;nh PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Codegym</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 421, 1, 0, 0, '2024-10-02 14:12:35', '2024-11-18 13:42:02', 12, 1, 14),
(43, 'MS88026096', 'ĐÊM GIÁNG SINH KỲ DIỆU', 'Nhiều tác giả', 153, 2016, 10, 10, NULL, 100000, '<p>abc</p>', 662, 0, 0, 5, '2024-11-17 10:39:52', '2024-11-18 14:00:38', 12, 1, 6),
(44, 'MS42005625', 'CHUYỆN NỎ THẦN', 'Tô Hoài', 191, 1999, 10, 10, NULL, 79000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Chuyện Nỏ Thần PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>T&ocirc; Ho&agrave;i</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 673, 0, 0, 0, '2024-11-17 15:29:28', '2024-11-18 13:41:58', 1, 1, 17),
(45, 'MS80487737', 'TRUYỆN CỔ TÍCH VIỆT NAM CHỌN LỌC', 'Nhiều tác giả', 296, 2012, 15, 15, NULL, 149000, '<p>Truyện cổ t&iacute;ch Việt Nam l&agrave; những truyện truyền miệng d&acirc;n gian kể lại những c&acirc;u chuyện tưởng tượng xoay quanh một số nh&acirc;n vật quen thuộc như nh&acirc;n vật t&agrave;i giỏi, nh&acirc;n vật dũng sĩ, người mồ c&ocirc;i, người em &uacute;t, người con ri&ecirc;ng, người ngh&egrave;o khổ, người c&oacute; h&igrave;nh dạng xấu x&iacute;, người th&ocirc;ng minh, người ngốc nghếch v&agrave; cả những c&acirc;u chuyện kể về c&aacute;c con vật n&oacute;i năng v&agrave; hoạt động như con người.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Truyện Cổ T&iacute;ch Việt Nam Chọn Lọc PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nhiều T&aacute;c Giả</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 621, 0, 0, 0, '2024-11-17 15:31:58', '2024-11-18 13:41:57', 16, 1, 6),
(46, 'MS58313134', 'CHIẾC NHẪN THẦN', 'Ngô Quang Vinh', 191, 2012, 15, 15, NULL, 79000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Chiếc Nhẫn Thần PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Ng&ocirc; Quang Vinh</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 451, 0, 0, 0, '2024-11-17 15:34:39', '2024-11-18 13:41:54', 23, 1, 6),
(47, 'MS18060610', 'THẦN NGƯỜI VÀ ĐẤT VIỆT', 'Tạ Chí Đại Trường', 168, 2024, 10, 10, NULL, 79000, '<p>Giới thiệu</p>\r\n\r\n<p>Con khỉ T&ocirc;n H&agrave;nh Giả xuất th&acirc;n từ đ&aacute; nứt, vướng v&iacute;u c&aacute;i kim c&ocirc;, một lần trả lời Tam Tạng, thầy m&igrave;nh, đang d&ugrave;ng dằng tr&ecirc;n đường thỉnh kinh</p>\r\n\r\n<p>T&ocirc;i đi về ph&iacute;a trước</p>\r\n\r\n<p>Vị đấu chiến thắng Phật đ&oacute; l&agrave; của &ldquo; truyện T&agrave;u&ldquo; truyền k&igrave; nhưng lại n&oacute;i như một người d&acirc;n Ch&agrave;m b&igrave;nh thường</p>\r\n\r\n<p>Đi về ph&iacute;a trước kh&ocirc;ng nh&igrave;n lại sau th&igrave; anh sẽ được gi&agrave;u sang</p>\r\n\r\n<p>Ch&iacute;nh c&aacute;i chất người trong lốt khỉ, trong h&agrave;o quang của bậc thần linh khiến nh&acirc;n vật n&agrave;y vẫn được hiện diện giữa trần thế, nơi cửa miệng của những người kể chuyện thỉnh kinh qua một bản văn quốc ngữ đọc dưới &aacute;nh đ&egrave;n điện, trong buổi lễ tống &ocirc;n miền qu&ecirc; Nam bộ v&agrave; thấp tho&aacute;ng tr&ecirc;n những trang s&aacute;ch Ramayana hay trong buổi diễn Rim-k&ecirc;, b&ecirc;n cạnh Hanuman c&ograve;n lại d&aacute;ng h&igrave;nh của b&agrave; con xưa cũ.</p>\r\n\r\n<p>Ch&iacute;nh một v&ograve;ng th&aacute;c sinh văn h&oacute;a như thế, c&oacute; vinh quang ri&ecirc;ng của n&oacute; bởi v&igrave; n&oacute; cứ đi về ph&iacute;a trước m&agrave; ta c&oacute; thể mượn l&agrave;m h&igrave;nh tượng cho l&iacute; tr&iacute; d&otilde;i theo t&igrave;m dạng thần hồn người tr&ecirc;n đất Việt</p>\r\n\r\n<p>T&aacute;c giả: Tạ Ch&iacute; Đại Trường, người B&igrave;nh Định, sinh ở Nha Trang, t&ecirc;n được đặt theo hai địa danh ở tỉnh Kh&aacute;nh H&ograve;a, nơi c&oacute; Nha Trang l&agrave; tỉnh lị. Học ở B&igrave;nh Định, Nha Trang, S&agrave;i G&ograve;n. Cử nh&acirc;n văn khoa</p>\r\n\r\n<p>Đại học Văn khoa S&agrave;i G&ograve;n 1962, Cao học sử 1964, năm thứ nhất Tiển sĩ chuy&ecirc;n m&ocirc;n Sử học 1974 cũng của Đại học n&agrave;y. Giải thưởng Văn chương to&agrave;n quốc (1970)- Bộ m&ocirc;n Sử</p>\r\n\r\n<p>Qua Mỹ năm 1994 ở Oklakoma City, hiện sinh sống ở Westminster California</p>', 369, 0, 0, 0, '2024-11-17 15:37:21', '2024-11-29 10:49:45', 12, 1, 17),
(48, 'MS83375694', 'BẤM HUYỆT THẬP CHỈ ĐẠO', 'Hoàng Duy Tân', 202, 2006, 10, 10, NULL, 79000, '<p>Lương y Huỳnh Thị Lịch l&agrave; người s&aacute;ng lập ra phương ph&aacute;p Bấm huyệt Thập Chỉ đạo hay c&ograve;n gọi l&agrave; Thập Thủ đạo (Thập Chỉ Li&ecirc;n T&acirc;m). Suốt mấy chục năm l&agrave;m nghề lương y, chuy&ecirc;n trị bấm huyệt theo phương ph&aacute;p Thập chỉ đạo, b&agrave; đ&atilde; điều trị cho h&agrave;ng vạn bệnh nh&acirc;n v&agrave; đ&agrave;o tạo h&agrave;ng ngh&igrave;n học tr&ograve; theo phương ph&aacute;p n&agrave;y. B&agrave; đ&atilde; chữa dứt điểm hoặc tạo tiến triển tốt đối với nhiều loại bệnh, đặc biệt l&agrave; 5 loại bệnh: c&acirc;m, m&ugrave;, bướu, liệt, suyễn&hellip; Lương y Huỳnh Thị Lịch được ca ngợi l&agrave; &ldquo;thần y&rdquo; bấm huyệt chữa được rất nhiều bệnh cho mọi người.</p>\r\n\r\n<p>B&agrave; Huỳnh Thị Lịch t&ecirc;n thật l&agrave; Trần Thị Kim Thanh (1927-2007), qu&ecirc; b&agrave; ở v&ugrave;ng &Yacute; Y&ecirc;n,Nam Định. Theo b&agrave;, phương ph&aacute;p n&agrave;y do cha nu&ocirc;i, người Pakistan truyền dạy (phương ph&aacute;p n&agrave;y đ&atilde; được người Ai Cập cổ đại phổ biến trong c&aacute;c h&igrave;nh vẽ). Sau đ&oacute;, với nhiều năm thực nghiệm đ&atilde; gi&uacute;p b&agrave; s&aacute;ng tạo ra phương ph&aacute;p bấm huyệt ng&agrave;y c&agrave;ng độc đ&aacute;o.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Bấm Huyệt Thập Chỉ Đạo PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Ho&agrave;ng Duy T&acirc;n</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 954, 0, 0, 0, '2024-11-17 15:40:57', '2024-11-18 13:41:50', 12, 1, 17),
(49, 'MS77038020', 'TRÁI CÂY MÓN QUÀ KỲ DIỆU CỦA THIÊN NHIÊN', 'Kim Phụng', 210, 2016, 10, 10, NULL, 79000, '<p>Tr&aacute;i c&acirc;y l&agrave; m&oacute;n tr&aacute;ng mi&ecirc;ng rất quen thuộc tr&ecirc;n b&agrave;n ăn. Ở v&ugrave;ng kh&iacute; hậu nhiệt đới như nước ta, tr&aacute;i c&acirc;y lại c&agrave;ng dồi d&agrave;o v&agrave; phong ph&uacute; chủng loại, l&agrave; nguồn nguy&ecirc;n liệu để c&aacute;c b&agrave; nội trợ kh&eacute;o tay chế biến th&agrave;nh những m&oacute;n ngon hấp dẫn cho cả nh&agrave;.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, ăn tr&aacute;i c&acirc;y như thế n&agrave;o để ph&aacute;t huy hết h&agrave;m lượng dinh dưỡng, biến m&oacute;n ngon n&agrave;y th&agrave;nh trợ thủ đắc lực cho sức khỏe con người lại l&agrave; điều kh&ocirc;ng phải ai cũng biết.</p>\r\n\r\n<p>Tập s&aacute;ch nhỏ n&agrave;y sẽ mang lại cho bạn những th&ocirc;ng tin đ&oacute;. H&atilde;y lật s&aacute;ch để kh&aacute;m ph&aacute; những điều l&yacute; th&uacute; về tr&aacute;i c&acirc;y- m&oacute;n qu&agrave; kỳ diệu thi&ecirc;n nhi&ecirc;n đ&atilde; ban tặng cho ch&uacute;ng ta.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Tr&aacute;i C&acirc;y M&oacute;n Qu&agrave; Kỳ Diệu Của Thi&ecirc;n Nhi&ecirc;n PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Kim Phụng</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 788, 0, 0, 0, '2024-11-17 15:44:13', '2024-11-18 13:41:46', 13, 1, 16),
(50, 'MS20299014', 'DANH NHÂN Y HỌC VIỆT NAM', 'Lê Minh Quốc', 155, 2016, 15, 15, NULL, 89000, '<p>Trong lịch sử dựng nước v&agrave; giữ nước, b&ecirc;n cạnh những lĩnh vực kh&aacute;c, &ocirc;ng cha ta cũng đ&atilde; ch&uacute; &yacute; ph&aacute;t triển về y học để ph&ograve;ng chữa bệnh, bảo vệ sức khỏe. Trong qu&aacute; tr&igrave;nh đ&oacute;, nền y học Việt Nam đ&atilde; kh&ocirc;ng ngừng ph&aacute;t triển bởi những thầy thuốc t&agrave;i đức được nh&acirc;n d&acirc;n ghi nhớ c&ocirc;ng ơn v&agrave; so s&aacute;nh với mẹ hiền.</p>\r\n\r\n<p>Với truyền thống &ldquo;uống nước, nhớ nguồn&rdquo; nhằm t&ocirc;n vinh những danh d&acirc;n c&oacute; nhiều đ&oacute;ng g&oacute;p trong việc giữ g&igrave;n sức khỏe cho nh&acirc;n d&acirc;n, năm 1999 Nxb. Trẻ đ&atilde; xuất bản quyển s&aacute;ch Danh nh&acirc;n y học Việt Nam do t&aacute;c giả L&ecirc; Minh Quốc bi&ecirc;n soạn.</p>\r\n\r\n<p>S&aacute;ch gồm 160 trang, giới thiệu về 10 danh y nổi tiếng của Việt Nam. Đ&oacute; l&agrave; Th&aacute;nh Y Hải Thượng L&atilde;n &Ocirc;ng - người đ&atilde; ph&aacute;t huy chủ trương của Tuệ Tĩnh thiền sư &ldquo;Nam dược trị Nam nh&acirc;n&rdquo; v&agrave; để lại bộ s&aacute;ch gi&aacute; trị l&acirc;u bền &ldquo;Hải Thượng y t&ocirc;n t&acirc;m lĩnh&rdquo;, một bộ s&aacute;ch kh&ocirc;ng chỉ chỉ dẫn c&aacute;ch ph&ograve;ng chữa bệnh cho đ&ocirc;ng đảo nh&acirc;n d&acirc;n lao động, m&agrave; c&ograve;n vạch ra những vấn đề rất s&acirc;u sắc về tư tưởng, quan điểm, nội dung v&agrave; phương ph&aacute;p đ&aacute;ng nghi&ecirc;n cứu, đ&aacute;ng học tập cho c&aacute;c nh&agrave; y học v&agrave; khoa học của nước ta hiện nay.</p>\r\n\r\n<p>Tiếp đến l&agrave; c&aacute;c danh y như Ho&agrave;ng Đ&ocirc;n H&ograve;a - thầy thuốc đời nh&agrave; L&ecirc; được nh&acirc;n d&acirc;n t&ocirc;n thờ l&agrave; &ldquo;cứu người c&ocirc;ng đức khắp c&otilde;i bao la&rdquo;; l&agrave; Nguyễn Hữu Đạo - thầy thuốc cũng thời nh&agrave; L&ecirc; đ&atilde; viết s&aacute;ch, l&agrave;m thuốc g&oacute;p c&ocirc;ng lớn ph&aacute;t triển nền y học nước nh&agrave;; l&agrave; Quốc thủ danh y Trịnh Đ&igrave;nh Ngoạn - người c&oacute; c&ocirc;ng dựng Y miếu Thăng Long từ năm 1774; l&agrave; thầy thuốc Nguyễn Tử Si&ecirc;u đ&atilde; d&agrave;nh hết cả cuộc đời cho mực ti&ecirc;u &ldquo;cứu nh&acirc;n độ thế&rdquo;.</p>\r\n\r\n<p>B&ecirc;n cạnh đ&oacute; l&agrave; tấm gương của b&aacute;c sĩ Phạm Ngọc Thạch - người thầy thuốc đ&atilde; c&oacute; c&ocirc;ng chế tạo ra thuốc B.C.G chết để ti&ecirc;m ph&ograve;ng bệnh lao. L&agrave; b&aacute;c sĩ Nguyễn Khắc Viện - người đ&atilde; hướng dẫn cho nh&acirc;n d&acirc;n thở đ&uacute;ng c&aacute;ch để ph&ograve;ng, trị bệnh theo phương ph&aacute;p dưỡng sinh v&agrave; l&agrave; người s&aacute;ng lập trung t&acirc;m nghi&ecirc;n cứu t&acirc;m l&yacute; trẻ em. L&agrave; b&aacute;c sĩ Hồ Đắc Di, Đỗ Xu&acirc;n Hợp - ngo&agrave;i nhiều c&ocirc;ng tr&igrave;nh cống hiến qu&yacute; b&aacute;u cho nền y học nước nh&agrave;, c&ograve;n l&agrave; những gi&aacute;o sư mẫu mực c&oacute; c&ocirc;ng lớn đ&agrave;o tạo nhiều thế hệ thầy thuốc sau n&agrave;y. L&agrave; b&aacute;c sĩ Nguyễn Văn Hưởng đ&oacute;ng g&oacute;p nhiều c&ocirc;ng tr&igrave;nh y học v&agrave; cũng l&agrave; người đề ra phương ph&aacute;p dưỡng sinh trong nh&acirc;n d&acirc;n, ph&aacute;t huy chặt chẽ Đ&ocirc;ng y v&agrave; T&acirc;y trong c&ocirc;ng t&aacute;c y tế tr&ecirc;n mặt trận ph&ograve;ng chữa bệnh, sản xuất thuốc men, đ&agrave;o tạo c&aacute;n bộ v&agrave; nghi&ecirc;n cứu khoa học phục vụ nh&acirc;n d&acirc;n.</p>', 621, 0, 0, 0, '2024-11-17 15:45:42', '2024-11-18 13:41:43', 13, 1, 16),
(51, 'MS47741252', 'DINH DƯỠNG CHỮA BỆNH - DẦU, CÁ VÀ THỰC PHẨM LÊN MEN', 'Susan Curtis', 120, 2007, 10, 10, NULL, 55000, '<p>Cuộc sống hiện đại ng&agrave;y nay, do nhiều nguy&ecirc;n nh&acirc;n kh&aacute;c nhau, rất nhiều người, nhất l&agrave; người ở độ tuổi trung ni&ecirc;n v&agrave; người cao tuổi thường mắc bệnh cao huyết &aacute;p, bệnh tim, tiểu đường&hellip;V&igrave; vậy họ lu&ocirc;n quan t&acirc;m đến một chế độ ăn uống l&agrave;nh mạnh, đầy đủ dưỡng chất cho cơ thể m&agrave; kh&ocirc;ng ảnh hưởng tới sức khỏe. Bộ s&aacute;ch &ldquo;Thực phẩm chữa bệnh&rdquo; sẽ l&agrave; một m&oacute;n qu&agrave; v&ocirc; c&ugrave;ng &yacute; nghĩa d&agrave;nh tặng cho ch&iacute;nh bản th&acirc;n của mỗi người, để tiếp th&ecirc;m nguồn kiến thức, sinh lực nu&ocirc;i dưỡng một &quot;sức khỏe v&agrave;ng&quot; tốt nhất.</p>\r\n\r\n<p>Bộ s&aacute;ch Thực phẩm chữa bệnh bao gồm 5 cuốn:</p>\r\n\r\n<p>Rau củ dinh dưỡng chữa bệnh</p>\r\n\r\n<p>Tr&aacute;i c&acirc;y dinh dưỡng chữa bệnh</p>\r\n\r\n<p>Đậu hạt ngũ cốc dinh dưỡng chữa bệnh</p>', 661, 0, 0, 0, '2024-11-17 15:50:57', '2024-11-18 13:41:38', 12, 1, 16);
INSERT INTO `sach` (`id_Sach`, `maSach`, `tenSach`, `tenTacGia`, `soTrang`, `namXuatBan`, `soLuongHienCo`, `soLuongCoSan`, `fileSach`, `giaTien`, `ghiChu`, `luotXem`, `luotDoc`, `luotMuon`, `danhGiaTrungBinh`, `ngayTaoSach`, `ngaySuaSach`, `id_NhaXuatBan`, `id_NgonNgu`, `id_ViTri`) VALUES
(52, 'MS49080819', 'DINH DƯỠNG CHỮA BỆNH - GIA VỊ VÀ THẢO DƯỢC', 'Susan Curtis', 236, 2007, 5, 5, NULL, 99000, '<p>Cuộc sống hiện đại ng&agrave;y nay, do nhiều nguy&ecirc;n nh&acirc;n kh&aacute;c nhau, rất nhiều người, nhất l&agrave; người ở độ tuổi trung ni&ecirc;n v&agrave; người cao tuổi thường mắc bệnh cao huyết &aacute;p, bệnh tim, tiểu đường&hellip;V&igrave; vậy họ lu&ocirc;n quan t&acirc;m đến một chế độ ăn uống l&agrave;nh mạnh, đầy đủ dưỡng chất cho cơ thể m&agrave; kh&ocirc;ng ảnh hưởng tới sức khỏe. Bộ s&aacute;ch &quot;Thực phẩm chữa bệnh&quot; sẽ l&agrave; một m&oacute;n qu&agrave; v&ocirc; c&ugrave;ng &yacute; nghĩa d&agrave;nh tặng cho ch&iacute;nh bản th&acirc;n của mỗi người, để tiếp th&ecirc;m nguồn kiến thức, sinh lực nu&ocirc;i dưỡng một &quot;sức khỏe v&agrave;ng&quot; tốt nhất c&oacute; thể.</p>\r\n\r\n<p>Việc c&acirc;n bằng dinh dưỡng cho cơ thể mỗi người l&agrave; điều thiết yếu, đặc biệt đối với rau - củ - quả tươi l&agrave; điều kh&ocirc;ng thể bỏ qua. V&igrave; những thực phẩm ch&uacute;ng ta ăn h&agrave;ng ng&agrave;y kh&ocirc;ng chỉ ảnh hưởng đến sức khỏe thể chất, m&agrave; c&ograve;n t&aacute;c động đến trạng th&aacute;i l&agrave;nh mạnh về cảm x&uacute;c, tinh thần. Nhận thức r&otilde; về chế độ dinh dưỡng đang &aacute;p dụng v&agrave; đặc t&iacute;nh chữa bệnh của c&aacute;c loại thực phẩm sẽ gi&uacute;p bạn c&oacute; những điều chỉnh cần thiết để đ&aacute;p ứng nhu cấu cơ thể, tạo n&ecirc;n sự thay đổi kỳ diệu nhằm duy tr&igrave; v&agrave; cải thiện t&igrave;nh trạng sức khỏe.</p>\r\n\r\n<p>Những loại thực phẩm chữa bệnh n&agrave;y lu&ocirc;n l&agrave; nguồn dinh dưỡng tự nhi&ecirc;n dồi d&agrave;o nhất v&agrave; chứa những b&agrave;i thuốc qu&yacute; đối với cơ thể con người, đặc biệt đối với c&aacute;c chị em phụ nữ th&igrave; đ&acirc;y c&ograve;n l&agrave; nguồn thực phẩm l&agrave;m đẹp quan trọng. V&igrave; vậy, một chế độ ăn uống khoa học v&agrave; an to&agrave;n th&igrave; rau xanh v&agrave; c&aacute;c loại hoa quả l&agrave; nguồn thực phẩm kh&ocirc;ng thể thiếu.</p>\r\n\r\n<p>Rau củ - tr&aacute;i c&acirc;y - đậu hạt chứa nhiều c&aacute;c vitamin, kho&aacute;ng chất, chất chống oxy h&oacute;a, chất xơ v&agrave; c&aacute;c hợp chất dinh dưỡng thực vật chống lại bệnh tật. Đồng thời, ch&uacute;ng l&agrave; lựa chọn đầu ti&ecirc;n của chế độ ăn h&agrave;ng ng&agrave;y để ph&ograve;ng ngừa bệnh b&eacute;o ph&igrave; v&agrave; c&aacute;c bệnh m&atilde;n t&iacute;nh như bệnh tim, ung thư v&agrave; tiểu đường, cũng như c&aacute;c vấn đề về ti&ecirc;u h&oacute;a, thị gi&aacute;c&hellip;</p>\r\n\r\n<p>Bộ s&aacute;ch &quot;Thực phẩm chữa bệnh&quot; được bi&ecirc;n soạn nhằm g&oacute;p phần giải quyết những mối băn khoăn, lo lắng của mọi người trong việc bảo vệ sức khỏe, gồm c&aacute;c tập:</p>', 831, 0, 0, 0, '2024-11-17 15:54:45', '2024-11-18 13:41:36', 12, 1, 18),
(53, 'MS79772064', 'DINH DƯỠNG CHỮA BỆNH - ĐẬU, HẠT, NGŨ CỐC', 'Susan Curtis', 272, 2007, 5, 5, NULL, 79000, '<p>Cuộc sống hiện đại ng&agrave;y nay, do nhiều nguy&ecirc;n nh&acirc;n kh&aacute;c nhau, rất nhiều người, nhất l&agrave; người ở độ tuổi trung ni&ecirc;n v&agrave; người cao tuổi thường mắc bệnh cao huyết &aacute;p, bệnh tim, tiểu đường&hellip;V&igrave; vậy họ lu&ocirc;n quan t&acirc;m đến một chế độ ăn uống l&agrave;nh mạnh, đầy đủ dưỡng chất cho cơ thể m&agrave; kh&ocirc;ng ảnh hưởng tới sức khỏe. Bộ s&aacute;ch &quot;Thực phẩm chữa bệnh&quot; sẽ l&agrave; một m&oacute;n qu&agrave; v&ocirc; c&ugrave;ng &yacute; nghĩa d&agrave;nh tặng cho ch&iacute;nh bản th&acirc;n của mỗi người, để tiếp th&ecirc;m nguồn kiến thức, sinh lực nu&ocirc;i dưỡng một &quot;sức khỏe v&agrave;ng&quot; tốt nhất c&oacute; thể.</p>\r\n\r\n<p>Việc c&acirc;n bằng dinh dưỡng cho cơ thể mỗi người l&agrave; điều thiết yếu, đặc biệt đối với rau - củ - quả tươi l&agrave; điều kh&ocirc;ng thể bỏ qua. V&igrave; những thực phẩm ch&uacute;ng ta ăn h&agrave;ng ng&agrave;y kh&ocirc;ng chỉ ảnh hưởng đến sức khỏe thể chất, m&agrave; c&ograve;n t&aacute;c động đến trạng th&aacute;i l&agrave;nh mạnh về cảm x&uacute;c, tinh thần. Nhận thức r&otilde; về chế độ dinh dưỡng đang &aacute;p dụng v&agrave; đặc t&iacute;nh chữa bệnh của c&aacute;c loại thực phẩm sẽ gi&uacute;p bạn c&oacute; những điều chỉnh cần thiết để đ&aacute;p ứng nhu cấu cơ thể, tạo n&ecirc;n sự thay đổi kỳ diệu nhằm duy tr&igrave; v&agrave; cải thiện t&igrave;nh trạng sức khỏe.</p>\r\n\r\n<p>Những loại thực phẩm chữa bệnh n&agrave;y lu&ocirc;n l&agrave; nguồn dinh dưỡng tự nhi&ecirc;n dồi d&agrave;o nhất v&agrave; chứa những b&agrave;i thuốc qu&yacute; đối với cơ thể con người, đặc biệt đối với c&aacute;c chị em phụ nữ th&igrave; đ&acirc;y c&ograve;n l&agrave; nguồn thực phẩm l&agrave;m đẹp quan trọng. V&igrave; vậy, một chế độ ăn uống khoa học v&agrave; an to&agrave;n th&igrave; rau xanh v&agrave; c&aacute;c loại hoa quả l&agrave; nguồn thực phẩm kh&ocirc;ng thể thiếu.</p>\r\n\r\n<p>Rau củ - tr&aacute;i c&acirc;y - đậu hạt chứa nhiều c&aacute;c vitamin, kho&aacute;ng chất, chất chống oxy h&oacute;a, chất xơ v&agrave; c&aacute;c hợp chất dinh dưỡng thực vật chống lại bệnh tật. Đồng thời, ch&uacute;ng l&agrave; lựa chọn đầu ti&ecirc;n của chế độ ăn h&agrave;ng ng&agrave;y để ph&ograve;ng ngừa bệnh b&eacute;o ph&igrave; v&agrave; c&aacute;c bệnh m&atilde;n t&iacute;nh như bệnh tim, ung thư v&agrave; tiểu đường, cũng như c&aacute;c vấn đề về ti&ecirc;u h&oacute;a, thị gi&aacute;c&hellip;</p>\r\n\r\n<p>Bộ s&aacute;ch &quot;Thực phẩm chữa bệnh&quot; được bi&ecirc;n soạn nhằm g&oacute;p phần giải quyết những mối băn khoăn, lo lắng của mọi người trong việc bảo vệ sức khỏe, gồm c&aacute;c tập:</p>', 122, 0, 0, 0, '2024-11-17 15:57:11', '2024-11-18 13:41:31', 12, 1, 18),
(54, 'MS27867681', 'DINH DƯỠNG CHỮA BỆNH - RAU CỦ', 'Susan Curtis', 210, 2007, 10, 10, NULL, 99000, '<p>Cuộc sống hiện đại ng&agrave;y nay, do nhiều nguy&ecirc;n nh&acirc;n kh&aacute;c nhau, rất nhiều người, nhất l&agrave; người ở độ tuổi trung ni&ecirc;n v&agrave; người cao tuổi thường mắc bệnh cao huyết &aacute;p, bệnh tim, tiểu đường&hellip;V&igrave; vậy họ lu&ocirc;n quan t&acirc;m đến một chế độ ăn uống l&agrave;nh mạnh, đầy đủ dưỡng chất cho cơ thể m&agrave; kh&ocirc;ng ảnh hưởng tới sức khỏe. Bộ s&aacute;ch &ldquo;Thực phẩm chữa bệnh&rdquo; sẽ l&agrave; một m&oacute;n qu&agrave; v&ocirc; c&ugrave;ng &yacute; nghĩa d&agrave;nh tặng cho ch&iacute;nh bản th&acirc;n của mỗi người, để tiếp th&ecirc;m nguồn kiến thức, sinh lực nu&ocirc;i dưỡng một &ldquo;sức khỏe v&agrave;ng&rdquo; tốt nhất.</p>', 255, 0, 0, 0, '2024-11-17 15:58:38', '2024-11-18 13:41:29', 12, 1, 18),
(55, 'MS51535017', 'MIẾNG NGON HÀ NỘI', 'Vũ Bằng', 149, 2004, 10, 10, NULL, 99000, '<p>Văn học Việt Nam thời xưa c&oacute; nhiều t&aacute;c phẩm c&oacute; gi&aacute; trị to lớn về mặt nh&acirc;n văn v&agrave; nghệ thuật, đ&atilde; được c&ocirc;ng nhận v&agrave; chứng thực qua thời gian. Bộ s&aacute;ch Việt Nam danh t&aacute;c bao gồm loạt t&aacute;c phẩm đi c&ugrave;ng năm th&aacute;ng như: Số đỏ (Vũ Trọng Phụng), Việc l&agrave;ng (Ng&ocirc; Tất Tố), Gi&oacute; đầu m&ugrave;a, H&agrave; Nội băm s&aacute;u phố phường (Thạch Lam), Miếng ngon H&agrave; Nội (Vũ Bằng), Vang b&oacute;ng một thời (Nguyễn Tu&acirc;n)... Hy vọng bộ s&aacute;ch sau khi t&aacute;i bản sẽ gi&uacute;p đ&ocirc;ng đảo tầng lớp độc giả th&ecirc;m hiểu, tự h&agrave;o v&agrave; n&acirc;ng niu kho t&agrave;ng văn học nước nh&agrave;.***</p>', 578, 0, 0, 0, '2024-11-17 16:02:15', '2024-11-18 13:41:27', 16, 1, 18),
(56, 'MS36469659', 'NÓI CÓ SÁCH', 'Vũ Bằng', 273, 1990, 5, 5, NULL, 99000, '<p>Tuổi 24 (1937) Vũ Bằng đ&atilde; in tiểu thuyết đầu tay &ldquo;Một m&igrave;nh trong b&oacute;ng tối&rdquo; tại nh&agrave; Trung Bắc t&acirc;n văn. Rồi sau đ&oacute; l&agrave; c&aacute;c t&aacute;c phẩm &ldquo;Hai người&rdquo; (1940), &ldquo;Ba truyện mổ bụng&rdquo; (1941), &ldquo;Cai&rdquo; (1942), &ldquo;B&egrave;o nước (1944)&hellip; Đ&oacute; l&agrave; những t&aacute;c phẩm Vũ Bằng s&aacute;ng t&aacute;c tại miền Bắc v&agrave;o giai đoạn đầu đời của m&igrave;nh. Chỉ t&iacute;nh ngần ấy cũng đ&atilde; l&agrave;m n&ecirc;n t&ecirc;n tuổi một nh&agrave; văn s&aacute;ng danh. Nhiều nh&agrave; văn, nh&agrave; ph&ecirc; b&igrave;nh đ&aacute;nh gi&aacute; cao t&aacute;c phẩm thời kỳ n&agrave;y của Vũ Bằng, cho rằng Vũ Bằng l&agrave; một trong những người c&oacute; c&ocirc;ng lớn c&aacute;ch t&acirc;n tiểu thuyết Việt Nam, hiện đại h&oacute;a nền văn xu&ocirc;i Việt Nam từ những năm ba mươi.</p>\r\n\r\n<p>Nhưng số phận thật trớ tr&ecirc;u. Khi tiếng tăm của Vũ Bằng vừa được c&ocirc;ng ch&uacute;ng mến mộ th&igrave; cũng l&agrave; l&uacute;c &ocirc;ng d&iacute;nh v&agrave;o thuốc phiện. N&oacute;i về hiện tượng đ&aacute;ng buồn n&agrave;y, nghệ sĩ Tạ Tỵ, bạn th&acirc;n của Vũ Bằng, trong một b&uacute;t k&yacute; ch&acirc;n dung đ&atilde; viết:</p>', 521, 0, 0, 0, '2024-11-17 16:05:01', '2024-11-18 13:41:25', 16, 1, 18),
(57, 'MS77953975', 'NÓI CÓ SÁCH', 'Vũ Bằng', 273, 1990, 5, 5, NULL, 99000, '<p>Tuổi 24 (1937) Vũ Bằng đ&atilde; in tiểu thuyết đầu tay &ldquo;Một m&igrave;nh trong b&oacute;ng tối&rdquo; tại nh&agrave; Trung Bắc t&acirc;n văn. Rồi sau đ&oacute; l&agrave; c&aacute;c t&aacute;c phẩm &ldquo;Hai người&rdquo; (1940), &ldquo;Ba truyện mổ bụng&rdquo; (1941), &ldquo;Cai&rdquo; (1942), &ldquo;B&egrave;o nước (1944)&hellip; Đ&oacute; l&agrave; những t&aacute;c phẩm Vũ Bằng s&aacute;ng t&aacute;c tại miền Bắc v&agrave;o giai đoạn đầu đời của m&igrave;nh. Chỉ t&iacute;nh ngần ấy cũng đ&atilde; l&agrave;m n&ecirc;n t&ecirc;n tuổi một nh&agrave; văn s&aacute;ng danh. Nhiều nh&agrave; văn, nh&agrave; ph&ecirc; b&igrave;nh đ&aacute;nh gi&aacute; cao t&aacute;c phẩm thời kỳ n&agrave;y của Vũ Bằng, cho rằng Vũ Bằng l&agrave; một trong những người c&oacute; c&ocirc;ng lớn c&aacute;ch t&acirc;n tiểu thuyết Việt Nam, hiện đại h&oacute;a nền văn xu&ocirc;i Việt Nam từ những năm ba mươi.</p>\r\n\r\n<p>Nhưng số phận thật trớ tr&ecirc;u. Khi tiếng tăm của Vũ Bằng vừa được c&ocirc;ng ch&uacute;ng mến mộ th&igrave; cũng l&agrave; l&uacute;c &ocirc;ng d&iacute;nh v&agrave;o thuốc phiện. N&oacute;i về hiện tượng đ&aacute;ng buồn n&agrave;y, nghệ sĩ Tạ Tỵ, bạn th&acirc;n của Vũ Bằng, trong một b&uacute;t k&yacute; ch&acirc;n dung đ&atilde; viết:</p>', 854, 0, 0, 0, '2024-11-17 16:05:01', '2024-11-18 13:41:23', 16, 1, 18),
(58, 'MS75420609', '100 MÓN NGON - CÙNG NẤU NGON NHƯ VUA ĐẦU BẾP CHISTINE HÀ', 'Christine Hà', 101, 2015, 6, 6, NULL, 99000, '<p>Cuốn s&aacute;ch 100 m&oacute;n ngon của vua đầu bếp Christine H&agrave; l&agrave; tập hợp 100 c&ocirc;ng thức nấu c&aacute;c m&oacute;n ăn ngon của mọi miền, bao gồm m&oacute;n kho, canh, x&agrave;o, chi&ecirc;n, nướng&hellip; để chế biến bữa ăn h&agrave;ng ng&agrave;y v&agrave; cả những m&oacute;n cuối tuần, m&oacute;n ngon ng&agrave;y Tết, gi&uacute;p chị em dễ d&agrave;ng trổ t&agrave;i nội trợ.</p>\r\n\r\n<p>Christine H&agrave; chia sẻ: &lsquo;T&ocirc;i lu&ocirc;n nấu những m&oacute;n ăn m&igrave;nh y&ecirc;u th&iacute;ch v&agrave; lu&ocirc;n đặt hết t&acirc;m huyết, t&igrave;nh cảm v&agrave; cả tr&aacute;i tim m&igrave;nh v&agrave;o đ&oacute;&rsquo;. Ch&iacute;nh niềm đam m&ecirc; ch&aacute;y bỏng đ&oacute; đ&atilde; t&ocirc;i gi&agrave;nh được chiến thắng vang dội trong cuộc thi ẩm thực danh gi&aacute; h&agrave;ng đầu nước Mỹ.</p>\r\n\r\n<p>Trong c&aacute;i nh&igrave;n của Christine H&agrave;, phụ nữ Việt Nam l&agrave; những người rất y&ecirc;u th&iacute;ch c&ocirc;ng việc nấu nướng. Nhưng cũng như H&agrave; v&agrave; nhiều chị em hiện đại kh&aacute;c tr&ecirc;n đất Mỹ, họ c&ograve;n bận rộn với nhiều c&ocirc;ng việc n&ecirc;n kh&ocirc;ng thể d&agrave;nh nhiều thời gian nấu ăn. &ldquo;Với 100 c&ocirc;ng thức nấu ăn n&agrave;y, t&ocirc;i hy vọng c&aacute;c chị em c&oacute; thể nấu những m&oacute;n ăn ngon mỗi ng&agrave;y một c&aacute;ch dễ d&agrave;ng, ngon miệng hơn v&agrave; c&oacute; những gi&acirc;y ph&uacute;t sum vầy đầy &yacute; nghĩa quanh m&acirc;m cơm gia đ&igrave;nh&rdquo;</p>', 521, 0, 0, 0, '2024-11-17 16:07:19', '2024-11-18 13:41:20', 12, 1, 19),
(59, 'MS71850852', '1001 MẸO VẶT HAY TRONG CUỘC SỐNG', 'Thuỳ Linh', 269, 2014, 14, 14, NULL, 55000, '<p>Cuốn s&aacute;ch &quot;1001 mẹo vặt hay trong cuộc sống&quot; l&agrave; một cuốn s&aacute;ch tuyệt vời d&agrave;nh cho c&aacute;c gia đ&igrave;nh Việt, s&aacute;ch cung cấp rất nhiều kinh nghiệm bổ &iacute;ch, với b&iacute; k&iacute;p đơn giản v&agrave; thiết thực cho cuộc sống h&agrave;ng ng&agrave;y m&agrave; bạn gặp phải. S&aacute;ch tổng hợp một khối lượng kiến thức, kĩ năng v&ocirc; c&ugrave;ng đa dạng, phong ph&uacute;, gi&uacute;p bạn nhận ra những điều c&oacute; lợi, c&oacute; hại cho sức khỏe, nắm được kĩ năng xử l&yacute; nhiều t&igrave;nh huống kh&aacute;c nhau trong qu&aacute; tr&igrave;nh nấu nướng, giặt giũ, vệ sinh, bảo quản đồ vật, dụng cụ gia đ&igrave;nh, học c&aacute;c phương ph&aacute;p chăm s&oacute;c sức khỏe v&agrave; sắc đẹp đơn giản m&agrave; hiệu quả&hellip;</p>', 125, 0, 0, 0, '2024-11-17 16:08:54', '2024-11-18 13:41:17', 12, 1, 19),
(60, 'MS31694625', 'MÓN NGON DỄ LÀM', 'Minh Thư', 141, 2016, 10, 10, NULL, 79000, '<p>Cuốn s&aacute;ch &ldquo;M&oacute;n Ngon Dễ L&agrave;m&rdquo; của t&aacute;c giả Minh Thư gi&uacute;p c&aacute;c ch&uacute;ng ta chế biến c&aacute;c m&oacute;n ăn cho gia đ&igrave;nh một c&aacute;ch dễ d&agrave;ng, với c&aacute;ch hướng dẫn tỉ mỉ, tất cả mọi người sau khi đọc xong đều c&oacute; thể lựa chọn cho m&igrave;nh những m&oacute;n ph&ugrave; hợp để thực h&agrave;nh. Cuốn s&aacute;ch c&oacute; tr&ecirc;n 70 m&oacute;n kh&aacute;c nhau để c&aacute;c bạn lựa chọn.</p>', 421, 0, 0, 0, '2024-11-17 16:10:22', '2024-11-18 13:41:15', 12, 1, 19),
(61, 'MS86850225', 'MÓN LẠ MIỀN NAM', 'Vũ Bằng', 149, 2012, 12, 12, NULL, 99000, '<p>Suốt những năm th&aacute;ng r&ograve;ng r&atilde; vật lộn mưu sinh tại miền Nam, của ngon vật hiếm nơi đất kh&aacute;ch đ&atilde; gi&uacute;p Vũ Bằng vơi đi nỗi buồn hoang hoải hướng về cố hương.</p>\r\n\r\n<p>M&oacute;n lạ miền Nam đ&atilde; ra đời như vậy, cuốn t&ugrave;y b&uacute;t độc đ&aacute;o của Vũ Bằng về những trải nghiệm hương vị ẩm thực m&agrave; mới nghe t&ecirc;n th&ocirc;i người ta đ&atilde; cảm thấy th&iacute;ch th&uacute;.</p>\r\n\r\n<p>C&ocirc;ng bằng m&agrave; n&oacute;i, m&oacute;n ngon hay kh&ocirc;ng l&agrave; do khẩu vị mỗi người. Mỗi miếng ngon c&oacute; thể sẽ thay đổi, biến chuyển theo từng giai đoạn để vừa l&ograve;ng &ocirc;ng thần khẩu. Nhưng đồ ăn miền Nam th&igrave; kh&ocirc;ng đổi thay. Thứ hương vị l&agrave;m người xa qu&ecirc; cảm thấy ngon l&agrave;nh, khang kh&aacute;c, nhận thức được l&ograve;ng thương y&ecirc;u của c&otilde;i nh&acirc;n sinh ở chung quanh v&igrave; thế m&agrave; tự nhi&ecirc;n r&otilde; rệt đậm đ&agrave;.</p>', 632, 0, 0, 0, '2024-11-17 16:12:44', '2024-11-18 13:41:13', 16, 1, 20),
(62, 'MS93547484', 'DẾ MÈN PHIÊU LƯU KÝ', 'Tô Hoài', 70, 2001, 8, 8, NULL, 55000, '<p>&quot;Dế m&egrave;n phi&ecirc;u lưu k&iacute;&quot; l&agrave; t&aacute;c phẩm văn xu&ocirc;i đặc sắc v&agrave; nổi tiếng nhất của T&ocirc; Ho&agrave;i viết về lo&agrave;i vật, d&agrave;nh cho lứa tuổi thiếu nhi. Ban đầu truyện c&oacute; t&ecirc;n l&agrave; &quot;Con dế m&egrave;n&quot; (ch&iacute;nh l&agrave; ba chương đầu của truyện) do Nh&agrave; xuất bản T&acirc;n D&acirc;n, H&agrave; Nội ph&aacute;t h&agrave;nh năm 1941.</p>\r\n\r\n<p>Sau đ&oacute;, được sự ủng hộ nhiệt t&igrave;nh của nh&acirc;n d&acirc;n, T&ocirc; Ho&agrave;i viết th&ecirc;m truyện &quot;Dế M&egrave;n phi&ecirc;u lưu k&iacute;&quot; (l&agrave; bảy chương cuối của chuyện&quot;. Năm 1955, &ocirc;ng mới gộp hai chuyện v&agrave;o với nhau để th&agrave;nh truyện &quot;Dế m&egrave;n phi&ecirc;u lưu k&iacute;&quot; như ng&agrave;y nay.</p>', 735, 0, 0, 0, '2024-11-17 16:15:33', '2024-11-18 13:57:19', 1, 1, 20),
(63, 'MS88862626', 'NGƯỜI HOA TIÊU TRÊN SÔNG DANUBE', 'Jules Verne', 235, 1992, 7, 7, NULL, 89000, '<p>Jules Verne sinh ng&agrave;y 8 th&aacute;ng hai năm 1828 tại Nantes, mất ng&agrave;y 24 th&aacute;ng Ba năm 1905 tại Amiens (Ph&aacute;p). &Ocirc;ng l&agrave; nh&agrave; văn Ph&aacute;p nổi tiếng, người đi ti&ecirc;n phong trong lịch sử thể loại Khoa học viễn tưởng.</p>\r\n\r\n<p>Năm 1863, cuốn tiểu thuyết đầu tay Năm tuần tr&ecirc;n khinh kh&iacute; cầu của Jules Verne được xuất bản tại nh&agrave; xuất bản Pierre- Jules hetzel, một trong những nh&acirc;n vật quan trọng nhất trong ng&agrave;nh xuất bản Ph&aacute;p thời bấy giờ v&agrave; đ&atilde; gặt h&aacute;i th&agrave;nh c&ocirc;ng vang dội vượt ra ngo&agrave;i bi&ecirc;n giới nước Ph&aacute;p. Sau thắng lợi đầu ti&ecirc;n đ&oacute;, Jules Verne đ&atilde; k&yacute; với hetzel hợp đồng 20 năm s&aacute;ng t&aacute;c c&aacute;c tiểu thuyết cho tờ Tạp ch&iacute; gi&aacute;o dục v&agrave; giải tr&iacute; chuy&ecirc;n d&agrave;nh cho giới trẻ. Trong v&ograve;ng 40 năm, Jules Verne đ&atilde; s&aacute;ng t&aacute;c loạt tiểu thuyết Những chuyến du h&agrave;nh kỳ th&uacute; (Voyages extraordinaires) bao gồm 62 tiểu thuyết v&agrave; 18 truyện ngắn.</p>', 267, 0, 0, 0, '2024-11-17 16:17:32', '2024-11-18 13:41:07', 12, 2, 20),
(64, 'MS13063313', 'BÍ ẨN MÃI MÃI LÀ BÍ ẨN', 'Nhiều tác giả', 415, 1999, 2, 2, NULL, 189000, '<p>Bộ s&aacute;ch &ldquo;B&iacute; ẩn m&atilde;i m&atilde;i l&agrave; b&iacute; ẩn&rdquo; gồm 6 tập sẽ đưa bạn tới những c&acirc;u chuyện kỳ b&iacute; của thế giới. Đ&acirc;y ch&iacute;nh l&agrave; bộ s&aacute;ch d&agrave;nh cho bạn, những người ưa phi&ecirc;u lưu v&agrave; kh&aacute;m ph&aacute;, những người y&ecirc;u th&iacute;ch v&agrave; say m&ecirc; khoa học. H&atilde;y t&igrave;m đọc bộ s&aacute;ch n&agrave;y v&igrave; biết đ&acirc;u ch&iacute;nh bạn sẽ l&agrave; người t&igrave;m ra đ&aacute;p &aacute;n cho những &ldquo;b&iacute; ẩn m&atilde;i m&atilde;i l&agrave; b&iacute; ẩn&rdquo; đấy th&igrave; sao.</p>\r\n\r\n<p>&ldquo;B&iacute; Ẩn M&atilde;i M&atilde;i L&agrave; B&iacute; Ẩn&rdquo; với những c&acirc;u chuyện ớn xương về c&aacute;c sinh vật kỳ b&iacute;, đĩa bay UFO, t&iacute;n hiệu của người ngo&agrave;i h&agrave;nh tinh, khả năng kỳ diệu của cơ thể người v&agrave; c&aacute;c vật thể xuất hiện &ldquo;kh&aacute;c thường&rdquo; về mặt thời gian&hellip; c&ugrave;ng những tấm ảnh &ldquo;bằng chứng&rdquo; rất thực (thật ra người ta c&ograve;n đang g&acirc;y tranh c&atilde;i về độ thật giả của mấy tấm h&igrave;nh n&agrave;y). Vậy c&ograve;n bạn, c&oacute; tin v&agrave;o những &ldquo;b&iacute; ẩn&rdquo; n&agrave;y kh&ocirc;ng?</p>', 967, 0, 0, 0, '2024-11-17 16:20:13', '2024-11-18 13:41:02', 13, 1, 13),
(65, 'MS12631375', 'ĐÁ QUÝ KHÔNG NÓI DỐI', 'Tâm Doanh Cốc', 505, 2012, 3, 3, NULL, 279000, '<p>Khi một nh&agrave; gi&aacute;m định đ&aacute; qu&yacute; gặp một kẻ n&oacute;i dối trời sinh, một mối t&igrave;nh thảm họa bắt đầu. Khi một ch&agrave;ng trai đem l&ograve;ng y&ecirc;u một c&ocirc; g&aacute;i, mối t&igrave;nh s&acirc;u nặng tưởng chừng như chẳng g&igrave; lay chuyển nổi. Kẻ n&oacute;i dối sau khi ngỏ lời y&ecirc;u, bỗng ra đi kh&ocirc;ng một lời nhắn nhủ, ba năm sau đột ngột trở lại.</p>\r\n\r\n<p>Người si t&igrave;nh vẫn chờ đợi, sẵn s&agrave;ng l&agrave;m chỗ dựa cho người m&igrave;nh y&ecirc;u. Ba năm sau, hai người y&ecirc;u nhau trở th&agrave;nh đối thủ tr&ecirc;n thương trường.</p>\r\n\r\n<p>Ba năm sau, một người phải chứng kiến đ&aacute;m cưới của người con g&aacute;i m&igrave;nh y&ecirc;u.</p>\r\n\r\n<p>Ba năm sau, t&igrave;nh y&ecirc;u m&agrave; một người chờ đợi tưởng chừng như đ&atilde; kết tr&aacute;i ngọt, nhưng bỗng tan biến, tất cả thời gian &ecirc;m đềm bỗng trở th&agrave;nh gi&oacute; thổi m&acirc;y tr&ocirc;i.</p>\r\n\r\n<p>Ba năm sau, t&igrave;nh y&ecirc;u tưởng chừng đ&atilde; ch&ocirc;n chặt lại trỗi dậy, một người phải giằng x&eacute; giữa t&igrave;nh cảm v&agrave; l&yacute; tr&iacute;, y&ecirc;u thương v&agrave; tr&aacute;ch nhiệm.</p>', 685, 0, 0, 5, '2024-11-17 16:22:34', '2024-11-18 13:40:59', 12, 1, 20),
(66, 'MS96818487', 'BÍ MẬT CỦA HẠNH PHÚC', 'David Niven', 231, 2012, 10, 10, NULL, 99000, '<p>&ldquo;Ước mơ lớn nhất của con người l&agrave; cảm nhận v&agrave; t&igrave;m được &yacute; nghĩa, hạnh ph&uacute;c của cuộc sống&rdquo;</p>\r\n\r\n<p>Hạnh ph&uacute;c l&agrave; biết lu&ocirc;n kh&aacute;m ph&aacute; cuộc sống mới mẻ từng ng&agrave;y.</p>\r\n\r\n<p>Hạnh ph&uacute;c l&agrave; cảm nhận hồn nhi&ecirc;n c&aacute;i đẹp cuộc sống từ những điều đang diễn ra quanh ta như bản th&acirc;n n&oacute; vốn từng c&oacute;.</p>\r\n\r\n<p>Hạnh ph&uacute;c l&agrave; được sống, chia sẻ với những người bạn ch&acirc;n th&agrave;nh.</p>\r\n\r\n<p>Hạnh ph&uacute;c l&agrave; c&oacute; một t&acirc;m hồn trong s&aacute;ng, một tr&aacute;i tim thuần khiết, kh&ocirc;ng vị kỷ, gh&eacute;t ghen.</p>', 1321, 0, 0, 0, '2024-11-17 16:24:30', '2024-11-18 13:40:56', 13, 2, 20),
(67, 'MS39851807', 'BÍ MẬT HÀNH TRÌNH TÌNH YÊU', 'David Niven', 121, 2012, 10, 10, NULL, 99000, '<p>abcv</p>', 524, 0, 0, 0, '2024-11-17 16:32:34', '2024-11-18 13:43:06', 13, 1, 21),
(68, 'MS44481692', 'TRUMP - ĐỪNG BAO GIỜ BỎ CUỘC', 'Donald J. Trump', 220, 2009, 10, 10, NULL, 99000, '<p>Trump - Đừng bao giờ bỏ cuộc, doanh nh&acirc;n nổi tiếng nhất thế giới n&agrave;y thẳng thắn gi&atilde;i b&agrave;y những th&aacute;ch thức to lớn nhất, những gi&acirc;y ph&uacute;t tệ hại nhất, v&agrave; những cuộc chiến khốc liệt nhất - v&agrave; c&aacute;ch &ocirc;ng biến những nghịch cảnh đ&oacute; th&agrave;nh c&aacute;c th&agrave;nh c&ocirc;ng mới.</p>\r\n\r\n<p>Cuốn s&aacute;ch c&ograve;n đưa ra những lời khuy&ecirc;n đắt gi&aacute; trong kinh về: c&aacute;ch phản ph&aacute;o khi gặp thất bại v&agrave; trở ngại; biến những vấn đề lớn th&agrave;nh những cơ hội thậm ch&iacute; c&ograve;n lớn hơn; c&aacute;ch biến kẻ th&ugrave; v&agrave; địch thủ th&agrave;nh bạn b&egrave; v&agrave; đồng minh; c&aacute;ch tận dụng những thất bại trước mắt l&agrave;m động lực cho bản th&acirc;n bạn - v&agrave; khiến bạn ki&ecirc;n cường hơn.</p>\r\n\r\n<p>Qua những c&acirc;u chuyện v&agrave; trải nghiệm s&acirc;u sắc từ một nh&agrave; kinh doanh bậc thầy sẽ gi&uacute;p bạn tự tin v&agrave;o bản th&acirc;n khi phải đối mặt với những kh&oacute; khăn, vượt qua trở ngại để hiện thực h&oacute;a những giấc mơ.</p>', 324, 0, 0, 0, '2024-11-17 16:35:26', '2024-11-18 13:43:21', 13, 1, 21),
(69, 'MS86124409', 'TÂM LÝ HỌC PHÁP LÝ', 'Nguyễn Hồi Loan', 10, 2004, 15, 15, NULL, 55000, '<p>Gi&aacute;o tr&igrave;nh T&acirc;m l&yacute; học ph&aacute;p l&yacute; được bi&ecirc;n soạn nhằm cung cấp cho c&aacute;c bạn những kiến thức về những vấn đề chung của t&acirc;m l&yacute; học ph&aacute;p l&yacute;; những vấn đề cụ thể của t&acirc;m l&yacute; học ph&aacute;p l&yacute;. Đ&acirc;y l&agrave; t&agrave;i liệu hữu &iacute;ch cho c&aacute;c bạn chuy&ecirc;n ng&agrave;nh T&acirc;m l&yacute; v&agrave; những ng&agrave;nh c&oacute; li&ecirc;n quan. Mời c&aacute;c bạn tham khảo gi&aacute;o tr&igrave;nh để bổ sung th&ecirc;m kiến thức về lĩnh vực n&agrave;y.</p>', 842, 0, 0, 0, '2024-11-17 16:37:29', '2024-11-18 13:40:44', 17, 1, 21),
(70, 'MS40940021', 'BÍ QUYẾT CỦA THÀNH CÔNG', 'David Niven', 202, 2010, 5, 5, NULL, 79000, '<p>Trong cuộc sống, ai cũng mong muốn c&oacute; được th&agrave;nh c&ocirc;ng. Ch&uacute;ng ta học tập, r&egrave;n luyện v&agrave; l&agrave;m việc để thực hiện ước mong đ&oacute;. V&agrave; hẳn ch&uacute;ng ta đ&atilde; từng bao lần suy nghĩ, trăn trở để lựa chọn hướng đi v&agrave; nghĩ về gi&aacute; trị đ&iacute;ch thực của th&agrave;nh c&ocirc;ng. Cũng như hạnh ph&uacute;c, lu&ocirc;n c&oacute; những mục ti&ecirc;u ri&ecirc;ng của th&agrave;nh c&ocirc;ng trong từng giai đoạn cuộc sống. D&ugrave; muốn d&ugrave; kh&ocirc;ng, mỗi người ch&uacute;ng ta đều đi t&igrave;m v&agrave; mong muốn đạt được th&agrave;nh c&ocirc;ng ph&ugrave; hợp với m&igrave;nh nhất. V&agrave; một số người th&igrave; th&agrave;nh c&ocirc;ng, một số kh&aacute;c th&igrave; kh&ocirc;ng. Th&agrave;nh c&ocirc;ng kh&ocirc;ng phải l&agrave; một may mắn hay l&agrave; một số phận như một số người lầm tưởng - m&agrave; th&agrave;nh c&ocirc;ng l&agrave; sự cố gắng của cả một qu&aacute; tr&igrave;nh. V&agrave; con đường đến th&agrave;nh c&ocirc;ng kh&ocirc;ng hề dễ d&agrave;ng, ch&uacute;ng ta phải vượt qua rất nhiều kh&oacute; khăn thử th&aacute;ch để c&oacute; thể đến đ&iacute;ch.</p>', 621, 0, 0, 0, '2024-11-17 16:39:43', '2024-11-18 13:40:41', 12, 2, 21),
(71, 'MS10780610', 'CHĂN NUÔI DÊ', 'Hồ Quảng Ðồ', 38, 2016, 6, 6, NULL, 39000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Chăn Nu&ocirc;i D&ecirc; PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Th. S Hồ Quảng &ETH;ồ</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 673, 0, 0, 0, '2024-11-18 12:40:58', '2024-11-18 13:40:38', 12, 1, 23),
(72, 'MS38443123', 'QUẢN LÝ SẢN XUẤT RAU AN TOÀN TRÁI VỤ', 'Lê Thị Thủy', 207, 2012, 8, 8, NULL, 55000, '<p>Nội dung cuốn s&aacute;ch gồm 2 phần: Phần I giới thiệu những nguy&ecirc;n tắc chung trong sản xuất rau an to&agrave;n như c&aacute;c quy định chung về GAP trong sản xuất rau an to&agrave;n, cơ chế, ch&iacute;nh s&aacute;ch khuyến kh&iacute;ch ph&aacute;t triển sản xuất rau an to&agrave;n của Nh&agrave; nước...; Phần II giới thiệu kỹ thuật sản xuất rau an to&agrave;n tr&aacute;i vụ (quy tr&igrave;nh canh t&aacute;c, bảo vệ, quản l&yacute; trong v&agrave; sau thu hoạch...) cho một số loại rau như c&agrave; chua, bắp cải, cải xanh, dưa chuột, đậu c&ocirc;ve, đậu đũa, mướp đắng, x&agrave; l&aacute;ch,...</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Quản L&yacute; Sản Xuất Rau An To&agrave;n Tr&aacute;i Vụ PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>L&ecirc; Thị Thủy</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>', 135, 0, 0, 0, '2024-11-18 12:43:10', '2024-11-18 13:40:35', 12, 1, 23),
(73, 'MS23033413', 'KỸ THUẬT NUÔI THỦY ĐẶC SẢN NƯỚC NGỌT - TẬP 1', 'Ngô Trọng Lư', 164, 2012, 6, 6, NULL, 55000, '<p>Bộ s&aacute;ch gồm 2 tập, giới thiệu đặc điểm sinh học, kỹ thuật sản xuất giống, nu&ocirc;i một số loại thủy đặc sản phổ biến, c&oacute; h&igrave;nh vẽ minh hoạ r&otilde; r&agrave;ng với từng đối tượng v&agrave; vấn đề cụ thể. Tập 1 tập trung giới thiệu về c&aacute;c lo&agrave;i: c&aacute; m&egrave;, c&aacute; tr&ocirc;i, c&aacute; trắm, c&aacute; ch&eacute;p, c&aacute; r&ocirc; phi, c&aacute; tr&ecirc;, c&aacute; quả, c&aacute; vền, c&aacute; bỗng, c&aacute; chi&ecirc;n, c&aacute; lăng, c&aacute; ngạnh, c&aacute; tra, c&aacute; sặc rằn, c&aacute; bống tượng, c&aacute; th&aacute;t l&aacute;t, c&aacute; c&ograve;m, c&aacute; r&ocirc; đồng, c&aacute; chim trắng, ốc nhồi, c&agrave; cuống, t&ocirc;m c&agrave;ng xanh, t&ocirc;m c&agrave;ng nước ngọt.</p>', 874, 0, 0, 0, '2024-11-18 12:50:32', '2024-11-18 13:40:30', 12, 1, 23),
(74, 'MS56063342', 'KỸ THUẬT NUÔI THỦY ĐẶC SẢN NƯỚC NGỌT - TẬP 2', 'Ngô Trọng Lư', 163, 2012, 8, 8, NULL, 99000, '<p>Bộ s&aacute;ch gồm 2 tập, giới thiệu đặc điểm sinh học, kỹ thuật sản xuất giống, nu&ocirc;i một số loại thủy đặc sản phổ biến, c&oacute; h&igrave;nh vẽ minh hoạ r&otilde; r&agrave;ng với từng đối tượng v&agrave; vấn đề cụ thể. Tập 2 tập trung giới thiệu c&aacute;c lo&agrave;i như: c&aacute; r&ocirc; phi lai, c&aacute; ch&igrave;nh nước ngọt, c&aacute; lăng, c&aacute; tai tượng, c&aacute; anh vũ, c&aacute; rầm xanh, c&aacute; diếc, c&aacute; he đỏ, c&aacute; m&ugrave;i, c&aacute; ngần, c&aacute; vược đen, c&aacute; đồng, c&aacute; ba gai, c&aacute; sấu, c&aacute; c&oacute;c tam đảo.</p>', 489, 0, 0, 0, '2024-11-18 12:53:39', '2024-11-18 13:40:27', 12, 1, 23),
(75, 'MS12455224', 'HỎI - ĐÁP VỀ BỆNH CỦA GIA SÚC, GIA CẦM', 'Bùi Quý Huy', 158, 2012, 12, 12, NULL, 79000, '<p>Cuốn s&aacute;ch đưa ra 126 c&acirc;u hỏi về những bệnh thường gặp ở đ&agrave;n gia s&uacute;c, gia cầm, đ&agrave;n thủy cầm; đồng thời hướng dẫn c&aacute;ch chẩn đo&aacute;n bệnh, ph&ograve;ng bệnh v&agrave; điều trị bệnh c&oacute; hiệu quả nhằm hạn chế dịch bệnh xảy ra, g&oacute;p phần ph&aacute;t triển chăn nu&ocirc;i bền vững.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Hỏi - Đ&aacute;p Về Bệnh Của Gia S&uacute;c, Gia Cầm PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>B&ugrave;i Qu&yacute; Huy</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>', 325, 0, 0, 0, '2024-11-18 12:54:54', '2024-11-18 13:40:22', 12, 1, 23),
(76, 'MS53095302', 'SỨC MẠNH CỦA SỰ TỬ TẾ', 'Linda Kaplan Thaler', 89, 2022, 10, 10, NULL, 76000, '<p>Với tôi, cu&ocirc;́n sách vĩ đại nh&acirc;́t từng được vi&ecirc;́t là cu&ocirc;́n Bản Thánh ca Giáng sinh của Charles Dickens. Vì sao ư? Vì tri&ecirc;́t lí đơn giản của nó: làm đi&ecirc;̀u đúng sẽ cảm th&acirc;́y vui hơn. Đó chả phải là một tín đi&ecirc;̀u tôn giáo gì cả. Chỉ là n&ecirc;́u bạn làm việc t&ocirc;́t thì cuộc đời bạn sẽ khá lên. Nó là th&ecirc;́, bạn không th&ecirc;̉ một mình ăn h&ecirc;́t cái bánh to, cứ c&ocirc;́ ăn chỉ t&ocirc;̉ chướng bụng mà thôi. Ăn một ít, còn đâu đ&ecirc;̉ dành cho người khác.</p>\r\n\r\n<p>Khi được yêu c&acirc;̀u trả lời phỏng v&acirc;́n v&ecirc;̀ Sức mạnh của sự tử t&ecirc;́, tôi đã đ&ocirc;̀ng ý không chỉ vì mu&ocirc;́n tỏ ra d&ecirc;̃ thương đâu. Tôi làm đi&ecirc;̀u đó vì tôi nghĩ đó là cách mình nên làm. Nhưng thời nay tỏ ra tử t&ecirc;́ lại là chuyện lạ khó tin. Mới đây tôi có k&ecirc;̉ một câu chuyện cười trong một show di&ecirc;̃n và nhận được thư của một phụ nữ nói rằng bà &acirc;́y khó chịu với nó. Tôi gọi điện lại nói xin l&ocirc;̃i bà n&ecirc;́u có gì xúc phạm đ&ecirc;́n tình cảm của bà. Không hi&ecirc;̉u sao bà lại ti&ecirc;́p xúc với báo chí và th&ecirc;́ là lời xin l&ocirc;̃i của tôi được lên báo! Chúng ta đang s&ocirc;́ng trong một xã hội mà ngay cả một nhã ý thông thường cũng bị coi là b&acirc;́t thường, như th&ecirc;̉ mình vừa thực hiện thủ thuật móc họng cứu mạng ai không bằng.</p>\r\n\r\n<p>Thậm chí n&ecirc;́u bạn đụng xe vào ai thì các công ty bảo hi&ecirc;̉m sẽ bảo bạn đừng xin l&ocirc;̃i người ta. Xin l&ocirc;̃i tức là thừa nhận mình sai. Vậy chứ họ mu&ocirc;́n bạn làm gì? Chu&ocirc;̀n nhanh và gọi cho luật sư của mình ư? Tuy nhiên, theo tôi, dù có sai thật mà mình xin l&ocirc;̃i trước thì có đ&ecirc;́n chín trên mười người sẽ động tâm và chắc chắn sẽ tử t&ecirc;́ lại với mình trong chuyện khắc phục thiệt hại. Th&ecirc;́ là nhi&ecirc;̀u thứ phi&ecirc;̀n toái ngày nay có th&ecirc;̉ được xử lí chỉ bằng vài hành động nhân ái đơn giản thôi.</p>\r\n\r\n<p>Trở nên một người nhân hậu càng đặc biệt quan trọng hơn khi ta có một di&ecirc;̃n đàn như The Tonight Show. Đó không th&ecirc;̉ là sàn di&ecirc;̃u võ của một tên đ&acirc;̀u g&acirc;́u hay một kẻ khoe mẽ. Có một lý do vì sao show này được gọi là The Tonight Show với Jay Leno chứ không phải là The Tonight Show do Jay Leno thủ di&ecirc;̃n. Đó là vì mẹ tôi. Bà cho rằng nói &ldquo;Jay Leno thủ di&ecirc;̃n&rdquo; thì vô hình trung mình nói với cử tọa rằng &ldquo;Này, nhìn tôi đây, tôi là ngôi sao lớn đ&acirc;́y.&rdquo; Vậy là tôi bảo bà, &ldquo;Được r&ocirc;̀i, mẹ à. Th&ecirc;́ với Jay Leno thì sao?&rdquo;</p>\r\n\r\n<p>Cuộc s&ocirc;́ng không &ldquo;cứng&rdquo; như th&ecirc;́. Hãy nhường nhịn một chút. R&ocirc;̀i bạn sẽ ngạc nhiên khi th&acirc;́y mình thu lại được nhi&ecirc;̀u chừng nào.</p>', 555, 0, 0, 0, '2024-11-18 12:58:26', '2024-11-18 13:40:20', 5, 1, 23),
(77, 'MS47956755', 'THỨC TỈNH', 'Khôi Hoàng', 475, 2009, 4, 4, NULL, 222000, '<p>C&ograve;n ở nơi Thi&ecirc;n đường, người tr&ograve; sẽ cảm ơn thầy v&igrave; những kiến thức v&agrave; b&agrave;i giảng, c&ograve;n người thầy sẽ cảm ơn người tr&ograve; v&igrave; nhờ tr&ograve; m&agrave; người được trải nghiệm vai tr&ograve; v&agrave; h&igrave;nh ảnh của một người thầy. V&agrave; đ&oacute; lu&ocirc;n l&agrave; bản chất của vạn vật, lu&ocirc;n l&agrave; mối quan hệ đa chiều tương hỗ, c&acirc;n bằng v&agrave; cộng hợp để tạo ra sự tồn tại của vật chất v&agrave; trải nghiệm. Rằng kh&ocirc;ng c&oacute; ch&acirc;n kh&ocirc;ng th&igrave; sẽ kh&ocirc;ng c&oacute; vật chất, kh&ocirc;ng c&oacute; b&oacute;ng tối th&igrave; sẽ kh&ocirc;ng c&oacute; &aacute;nh s&aacute;ng.</p>\r\n\r\n<p>Như thế, quyển s&aacute;ch n&agrave;y kh&ocirc;ng được tạo ra bởi mỗi người viết, m&agrave; n&oacute; được tạo ra đồng thời bởi người viết lẫn người đọc v&agrave; những người sẽ đọc. Vậy m&agrave; bạn kh&ocirc;ng cần sự cho ph&eacute;p của m&igrave;nh để chia sẻ những quyển s&aacute;ch n&agrave;y, v&agrave; cũng như nếu bạn cảm thấy biết ơn m&igrave;nh v&igrave; đ&atilde; viết n&ecirc;n những điều n&agrave;y, th&igrave; h&atilde;y biết rằng l&agrave; m&igrave;nh cũng biết ơn v&agrave; y&ecirc;u qu&iacute; bạn v&igrave; đ&atilde; cho m&igrave;nh được trải nghiệm viết vẽ v&agrave; tạo dựng n&ecirc;n những quyển s&aacute;ch n&agrave;y. Đ&oacute; l&agrave; những th&iacute;ch th&uacute;, những đam m&ecirc;, những hăng h&aacute;i lẫn với rất nhiều những giọt nước mắt hạnh ph&uacute;c khi viết n&ecirc;n những d&ograve;ng chữ v&agrave; những b&agrave;i đọc n&agrave;y. Mặc d&ugrave; đi k&egrave;m trong đ&oacute; l&agrave; những ng&agrave;y thiếu ngủ v&agrave; mệt mỏi v&igrave; mỗi khi c&oacute; thứ để viết th&igrave; ở trong c&aacute;i đầu n&agrave;y, chữ với tự cứ chạy tới chạy lui riết kh&ocirc;ng th&ocirc;i, v&agrave; đ&acirc;y cũng l&agrave; một phần của trải nghiệm s&aacute;ng tạo n&agrave;y. Như đ&oacute;, dưới con mắt đ&atilde; thức tỉnh, hay cũng ch&iacute;nh l&agrave; con mắt của Đấng s&aacute;ng tạo, th&igrave; sự ph&acirc;n biệt giữa người cho hay người nhận th&igrave; sẽ kh&ocirc;ng c&ograve;n hiện hữu v&agrave; tồn tại. Bởi v&igrave; người cho cũng đồng thời l&agrave; người nhận, v&agrave; người nhận cũng đồng thời l&agrave; người cho&hellip;</p>', 423, 0, 0, 0, '2024-11-18 13:02:29', '2024-11-18 13:51:43', 16, 1, 22),
(78, 'MS54000768', 'GIÁO TRÌNH TRIẾT HỌC MÁC - LÊNIN', 'Bộ Giáo Dục Và Đào Tạo', 214, 2007, 14, 14, NULL, 119000, '<p>Triết học M&aacute;c - L&ecirc;nin hay học thuyết M&aacute;c-L&ecirc;nin l&agrave; một trong ba bộ phận cấu th&agrave;nh của chủ nghĩa M&aacute;c - L&ecirc;nin, được C&aacute;c M&aacute;c, Engels s&aacute;ng lập v&agrave;o thế kỷ thứ XIX, sau đ&oacute; được L&ecirc;nin v&agrave; c&aacute;c nh&agrave; macxit kh&aacute;c ph&aacute;t triển th&ecirc;m. Triết học M&aacute;c- L&ecirc; nin ra đời v&agrave;o những năm 40 thế kỉ XIX v&agrave; được ph&aacute;t triển gắn chặt với những th&agrave;nh tựu khoa học v&agrave; thực tiễn trong phong tr&agrave;o c&aacute;ch mạng c&ocirc;ng nh&acirc;n. Sự ra đời của triết học M&aacute;c-L&ecirc;nin l&agrave; một cuộc c&aacute;ch mạng thực sự trong lịch sử tư tưởng lo&agrave;i người, trong lịch sử triết học.</p>', 842, 0, 0, 0, '2024-11-18 13:03:51', '2024-11-18 13:40:12', 2, 1, 22),
(79, 'MS73844374', 'LÝ LUẬN VỀ NHÀ NƯỚC', 'Đỗ Minh Khôi', 249, 2012, 12, 12, NULL, 55000, '<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>L&yacute; Luận Về Nh&agrave; Nước PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Đỗ Minh Kh&ocirc;i</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 521, 0, 0, 0, '2024-11-18 13:05:24', '2024-11-18 13:40:08', 12, 1, 22),
(80, 'MS72576392', 'THÉP ĐÃ TÔI THẾ ĐẤY', 'Nicolai Ostrovsky', 334, 1990, 5, 5, NULL, 79000, '<p>Pavel Korchagin (thường được gọi l&agrave; Pavlusha, Pavka) l&agrave; một thanh ni&ecirc;n lớn l&ecirc;n trong khi điều kiện đất nước đang gặp nhiều kh&oacute; khăn. Cũng như bao thanh ni&ecirc;n Li&ecirc;n X&ocirc; kh&aacute;c, anh cũng c&oacute; người bạn g&aacute;i chơi th&acirc;n, c&ocirc; t&ecirc;n l&agrave; Tonya v&agrave; sau n&agrave;y trở th&agrave;nh người y&ecirc;u. Tonya l&agrave; một c&ocirc; g&aacute;i xinh xắn, y&ecirc;u Pavel với tất cả t&igrave;nh cảm ban đầu trong trắng ng&acirc;y thơ của một thiếu nữ mới lớn. T&igrave;nh cảm của hai người c&oacute; lẽ sẽ rất đẹp v&agrave; trọn vẹn nếu như kh&ocirc;ng c&oacute; chuyện Pavel đi theo tiếng gọi của l&yacute; tưởng giai cấp l&uacute;c đ&oacute;, l&yacute; tưởng muốn cống hiến sức trẻ của m&igrave;nh phục vụ cho Tổ quốc, cho c&aacute;ch mạng, theo tiếng gọi của Đảng Cộng sản. Anh trai Pavel cũng theo con đường n&agrave;y. Tonya rất y&ecirc;u Pavel nhưng kh&ocirc;ng thể đợi anh v&agrave; theo anh, kh&ocirc;ng d&aacute;m y&ecirc;u một l&yacute; tưởng. Nh&agrave; Tonya lại thuộc giai cấp tư sản. Pavel n&oacute;i: &quot;Anh trước hết l&agrave; người của Đảng - sau đ&oacute; mới l&agrave; người của em v&agrave; những người th&acirc;n kh&aacute;c. Em c&oacute; gan y&ecirc;u một c&ocirc;ng nh&acirc;n, nhưng lại kh&ocirc;ng c&oacute; gan y&ecirc;u một l&yacute; tưởng&quot;.</p>\r\n\r\n<p>Pavel đ&atilde; chia tay Tonya m&agrave; theo l&yacute; tưởng m&igrave;nh đ&atilde; x&aacute;c định. Anh hăng h&aacute;i, hồ hởi cống hiến sức trẻ thanh ni&ecirc;n của m&igrave;nh cho những c&ocirc;ng việc phục vụ cho nh&acirc;n d&acirc;n, cho Tổ quốc. Trong thời gian x&acirc;y dựng con đường sắt nhỏ nối khu rừng với th&agrave;nh phố, t&igrave;nh cờ Pavel đ&atilde; gặp lại Tonya. C&ocirc;ng việc ở đ&acirc;y rất cực nhọc, ng&agrave;y đ&ecirc;m chịu đ&oacute;i r&eacute;t, gian khổ để gấp r&uacute;t ho&agrave;n th&agrave;nh cho kỳ được con đường sắt cho kịp trước khi m&ugrave;a đ&ocirc;ng tới. Nếu kh&ocirc;ng kịp th&igrave; tất cả mọi người trong th&agrave;nh phố n&agrave;y sẽ chết c&oacute;ng v&igrave; kh&ocirc;ng đủ gỗ để sưởi ấm. Do vậy, Tonya đ&atilde; su&yacute;t kh&ocirc;ng nhận ra anh v&igrave; tr&ocirc;ng anh đ&atilde; ho&agrave;n to&agrave;n kh&aacute;c, r&aacute;ch rưới, t&iacute;m t&aacute;i v&igrave; gi&aacute; lạnh, gầy g&ograve; như một người ăn xin v&agrave; đang x&uacute;c tuyết, tuy c&oacute; đ&ocirc;i mắt th&igrave; vẫn l&agrave; Pavlusha ng&agrave;y n&agrave;o. Tuy nhi&ecirc;n, c&ocirc; đ&atilde; kh&ocirc;ng d&aacute;m bắt tay anh khi anh đưa tay ra v&agrave; anh hiểu rằng, t&igrave;nh cảm cũ giữa hai người vĩnh viễn kh&ocirc;ng c&ograve;n nữa. C&ocirc; giờ đ&acirc;y đ&atilde; c&oacute; chồng v&agrave; &quot;sặc m&ugrave;i băng phiến&quot;.</p>\r\n\r\n<p>Sau n&agrave;y, trong qu&aacute; tr&igrave;nh lao động v&agrave; sinh hoạt trong tổ chức Đảng, Pavel đ&atilde; gặp Rita v&agrave; được c&ocirc; qu&yacute; mến. Nhưng t&igrave;nh cảm giữa hai người chỉ giữ ở t&igrave;nh đồng ch&iacute;... Về sau, c&oacute; l&uacute;c Pavel bị bệnh sốt thương h&agrave;n v&agrave; bị bại liệt, v&ocirc;i h&oacute;a cột sống, phải ngồi xe lăn, c&oacute; một y t&aacute; chăm s&oacute;c v&agrave; động vi&ecirc;n, dồn hết t&igrave;nh thương cho anh. Anh cảm thấy m&igrave;nh kh&ocirc;ng được quyền l&ugrave;i bước trước kh&oacute; khăn, tin tưởng v&agrave;o t&igrave;nh y&ecirc;u mới v&agrave; chuyển sang viết s&aacute;ch vẫn với ngọn lửa v&agrave; chất th&eacute;p đ&atilde; được t&ocirc;i luyện ng&agrave;y n&agrave;o.</p>', 565, 0, 0, 0, '2024-11-18 13:06:48', '2024-11-18 13:40:02', 16, 1, 22),
(81, 'MS47748505', 'CƠ SỞ LÝ LUẬN BÁO CHÍ', 'Nguyễn Văn Hà', 129, 2012, 8, 8, NULL, 79000, '<p>Cơ sở l&yacute; luận b&aacute;o ch&iacute; v&agrave; truyền th&ocirc;ng l&agrave; một học phần quan yếu trong chương tr&igrave;nh đạo tạo cử nh&acirc;n b&aacute;o ch&iacute; của Trường Đại học Khoa học X&atilde; hội v&agrave; Nh&acirc;n văn, Đại học Quốc gia TP. HCM v&agrave; c&aacute;c trường đại học, cao đẳng c&oacute; đ&agrave;o tạo ng&agrave;nh b&aacute;o ch&iacute; v&agrave; truyền th&ocirc;ng ở Việt Nam. Một số ng&agrave;nh học kh&aacute;c cũng giảng dạy m&ocirc;n học n&agrave;y với tư c&aacute;ch l&agrave; m&ocirc;n học tự chọn.</p>\r\n\r\n<p>Hơn nữa, cơ sở l&yacute; luận b&aacute;o ch&iacute; v&agrave; truyền th&ocirc;ng, ở kh&iacute;a cạnh n&agrave;o đ&oacute;, ch&iacute;nh l&agrave; &ldquo;&yacute; thức triết học&rdquo; của hoạt động b&aacute;o ch&iacute; v&agrave; truyền th&ocirc;ng trong x&atilde; hội. Nếu được tiếp cận những kiến thức căn cơ, người l&agrave;m b&aacute;o v&agrave; người l&agrave;m truyền th&ocirc;ng sẽ chủ động, tự tin, dễ gặt h&aacute;i th&agrave;nh c&ocirc;ng hơn tr&ecirc;n con đường nghề nghiệp của m&igrave;nh. C&oacute; thể n&oacute;i, nhu cầu về một cuốn s&aacute;ch c&oacute; t&iacute;nh chất l&yacute; thuyết căn bản về b&aacute;o ch&iacute; v&agrave; truyền th&ocirc;ng l&agrave; kh&aacute; cấp b&aacute;ch, kh&ocirc;ng chỉ ở giảng đường đại học m&agrave; c&ograve;n cả ở ngo&agrave;i x&atilde; hội, nhất l&agrave; trong bối cảnh ph&aacute;t triển v&agrave; truyền th&ocirc;ng hiện nay.</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Cơ Sở L&yacute; Luận B&aacute;o Ch&iacute; PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Nguyễn Văn H&agrave;</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;y mua s&aacute;ch giấy.</p>', 864, 0, 0, 0, '2024-11-18 13:08:40', '2024-11-18 13:39:57', 5, 1, 22),
(82, 'MS45245672', 'TOÀN CHÂN TRIẾT LUẬN', 'Nguyễn Duy Cần', 92, 2007, 7, 7, NULL, 55000, '<p>Về những chữ d&ugrave;ng, t&aacute;c giả c&oacute; mượn năm ba chữ của c&aacute;c t&ocirc;n gi&aacute;o học thuyết. Ấy l&agrave; sự bất đắc dĩ. V&igrave; lẽ, một thứ tiếng m&agrave; d&ugrave;ng chung cho ba học ph&aacute;i như Phật, L&atilde;o, Nho, thời tr&aacute;nh sao, khi n&oacute;i, khỏi phải hiểu lầm. Tỉ như chữ T&acirc;m n&oacute;i ra, thời người học Phật sẽ hiểu c&aacute;i nghĩa chữ T&acirc;m theo học ph&aacute;i của họ, người học Nho sẽ hiểu theo chữ T&acirc;m theo học ph&aacute;i của họ. Th&agrave;nh ra sự hiểu lầm nhau giữa độc giả v&agrave; người viết s&aacute;ch, kh&ocirc;ng sao tr&aacute;nh cho khỏi đặng. Sở dĩ t&aacute;c giả d&ugrave;ng những tiếng mượn ấy l&agrave; v&igrave; những chữ ấy c&oacute; phần ph&ugrave; hợp theo &yacute; tưởng của t&aacute;c giả định n&oacute;i. Song le, v&igrave; muốn ngừa sự hiểu lầm đ&oacute;, t&aacute;c giả, hoặc tạo chữ mới, 3/92 hoặc mượn chữ cũ, mỗi mỗi đều c&oacute; ch&uacute; th&iacute;ch v&agrave; định nghĩa r&otilde; r&agrave;ng cả. Độc giả h&atilde;y ch&uacute; &yacute; kẻo hiểu lầm c&aacute;i nguy&ecirc;n &yacute; t&aacute;c giả.</p>\r\n\r\n<p>Đ&acirc;y chẳng phải quyển s&aacute;ch khảo cứu về L&atilde;o gi&aacute;o hay để phể b&igrave;nh t&ocirc;n gi&aacute;o học thuyết n&agrave;o. T&aacute;c giả cũng kh&ocirc;ng phải đem l&yacute; thuyết mới n&agrave;o n&oacute;i ra. Ấy l&agrave; những &yacute; ri&ecirc;ng của t&aacute;c giả đối với lẽ Đạo, m&agrave; t&aacute;c giả tưởng cho l&agrave; đ&uacute;ng với lẽ tự nhi&ecirc;n. Trong c&aacute;ch lập ng&ocirc;n, mới xem qua c&oacute; kẻ đ&atilde; bảo rằng t&aacute;c giả c&oacute; c&aacute;i &yacute; c&ocirc;ng phẫn rất mạnh bạo, kh&ocirc;ng đặng c&aacute;i vẻ &ocirc;n tồn&hellip;</p>\r\n\r\n<p>Nếu quả c&oacute; thật vậy, th&igrave; kh&ocirc;ng phải lỗi của t&aacute;c giả. Thiết tưởng rằng, S&aacute;ng, Tối c&oacute; xung đột nhau, chẳng phải tư t&acirc;m. Phải, Quấy c&oacute; xung đột nhau, chẳng phải v&igrave; tư &yacute;. Vả lại, m&ugrave;i hương c&aacute;c thứ hoa, c&oacute; thứ dịu d&agrave;ng, c&oacute; thứ gắt gỏng, đ&oacute; cũng l&agrave; một lẽ tự nhi&ecirc;n. T&aacute;c giả h&ocirc;m nay, nếu trong lời lẽ c&oacute; kh&ocirc;ng đặng dịu d&agrave;ng m&agrave; lại lắm khi gắt gỏng, độc giả cũng kh&ocirc;ng lẽ tr&aacute;ch t&aacute;c giả m&agrave; kh&ocirc;ng tr&aacute;ch c&acirc;y b&ocirc;ng! T&aacute;c giả chỉ như con chim ca, như gi&ograve;ng nước chảy, Ca v&igrave; ca, chảy v&igrave; chảy. Dầu hay dầu dở thế n&agrave;o, cũng l&agrave; chỗ sở dĩ đ&oacute; th&ocirc;i.</p>', 337, 0, 0, 0, '2024-11-18 13:10:23', '2024-11-18 13:39:54', 12, 1, 22),
(83, 'MS24280047', 'LÃO TỬ TINH HOA', 'Nguyễn Duy Cần', 214, 2012, 9, 9, NULL, 89000, '<p>L&atilde;o Tử l&agrave; người huyện Khổ, nước Sở, sống trong thời Xu&acirc;n Thu Chiến Quốc. Tương truyền &ocirc;ng l&agrave; người viết bộ s&aacute;ch Đạo Đức Kinh, chủ yếu b&agrave;n về Đạo học v&agrave; c&aacute;ch sống để h&ograve;a hợp với Đạo. Ở Việt Nam, c&oacute; rất nhiều nh&agrave; nghi&ecirc;n cứu đ&atilde; dịch v&agrave; b&igrave;nh ch&uacute; về cuốn Đạo Đức Kinh của L&atilde;o Tử. Nhờ những c&aacute;ch hiểu v&agrave; kh&aacute;m ph&aacute; mới mẻ của mỗi nh&agrave; nghi&ecirc;n cứu m&agrave; nội dung quyển Đạo Đức Kinh ng&agrave;y c&agrave;ng trở n&ecirc;n phong ph&uacute; v&agrave; nhiều m&agrave;u sắc.</p>\r\n\r\n<p>L&atilde;o Tử Đạo Đức kinh được học giả Nguyễn Duy Cần dịch trực tiếp từ bản gốc tiếng Trung Quốc, c&oacute; k&egrave;m theo phần ch&uacute; giải để độc giả tiện theo d&otilde;i. L&atilde;o Tử tinh hoa l&agrave; cuốn s&aacute;ch b&agrave;n rộng ra về những nội dung cốt l&otilde;i của Đạo Đức Kinh. Tr&acirc;n trọng giới thiệu đến qu&yacute; độc giả cả nước.***</p>\r\n\r\n<p>L&atilde;o Tử Tinh Hoa gồm ba phần m&agrave; phần chủ yếu, tức phần thứ hai, t&ocirc;i đ&atilde; c&oacute; dịp ch&eacute;p lại từ blogspot Chu Văn An http://chuvanan1972.blogspot.com (xem post #20, trang http://www.e-thuvien.com/forums/showthread.php?t=26460&amp;page=2). V&igrave; l&uacute;c ch&eacute;p lại t&ocirc;i kh&ocirc;ng c&oacute; &ldquo;s&aacute;ch giấy&rdquo; n&ecirc;n đ&atilde; ch&eacute;p kh&ocirc;ng theo đ&uacute;ng thứ tự c&aacute;c tiết. Trong một dịp về qu&ecirc; t&ocirc;i t&igrave;m lại t&aacute;c phẩm n&agrave;y (t&ocirc;i mua từ năm 1994) n&ecirc;n nay t&ocirc;i cũng bắt đầu ch&eacute;p lại từ phần thứ hai. Ngo&agrave;i việc sắp xếp lại theo đ&uacute;ng thứ tự trong s&aacute;ch, t&ocirc;i c&ograve;n sửa một v&agrave;i lỗi ch&iacute;nh tả, lược bỏ những đoạn m&agrave; trong s&aacute;ch kh&ocirc;ng c&oacute;; ch&eacute;p th&ecirc;m c&aacute;c những chỗ thiếu (bản đ&oacute; kh&ocirc;ng ch&eacute;p chữ H&aacute;n, chữ Ph&aacute;p, một số c&aacute;c ch&uacute; th&iacute;ch).</p>\r\n\r\n<p>Nhờ trước đ&acirc;y t&ocirc;i đ&atilde; ch&eacute;p cuốn L&atilde;o tử - Đạo Đức kinh của cụ Nguyễn Hiến L&ecirc; (Nxb Văn ho&aacute;, năm 2006) n&ecirc;n việc ch&eacute;p chữ H&aacute;n trong cuốn L&atilde;o tử tinh hoa n&agrave;y kh&ocirc;ng tốn c&ocirc;ng nhiều, gần như chỉ cần ch&eacute;p lại c&aacute;c đoạn tương ứng trong bản của cụ Nguyễn Hiến L&ecirc; rồi sửa lại cho ph&ugrave; hợp với bản của cụ Nguyễn Duy Cần v&igrave; hai bản c&oacute; nhiều chỗ kh&aacute;c nhau như hai v&iacute; dụ sau:</p>\r\n\r\n<p>Trong tiết D: Ch&iacute;nh trị, phần II: Tổng quan, cụ Nguyễn Duy Cần c&oacute; tr&iacute;ch dẫn c&acirc;u: &ldquo;D&acirc;n chi khinh tử, dĩ kỳ cầu sinh chi hậu&hellip;&rdquo; (民之輕死, 以其求生之厚&hellip;), v&agrave; dịch l&agrave;: &ldquo;d&acirc;n m&agrave; coi thường c&aacute;i chết, l&agrave; v&igrave; qu&aacute; trọng cầu c&aacute;i sống&rdquo;). C&ograve;n bản của cụ Nguyễn Hiến L&ecirc; th&igrave; ch&eacute;p l&agrave;: &ldquo;D&acirc;n chi khinh tử, dĩ k&igrave; thượng cầu sinh chi hậu&hellip;&rdquo; (民之輕死, 以其上求生之厚&hellip;), v&agrave; dịch l&agrave;: &ldquo;D&acirc;n sở dĩ coi thường c&aacute;i chết l&agrave; v&igrave; nh&agrave; cần quyền tự phụng dưỡng qu&aacute; hậu&hellip;&rdquo;. V&igrave; bản của cụ Nguyễn Hiến L&ecirc; c&oacute; chữ &ldquo;thượng&rdquo;上, c&ograve;n bản của cụ Nguyễn Duy Cần th&igrave; kh&ocirc;ng, n&ecirc;n &yacute; nghĩa c&acirc;u đ&oacute; kh&aacute;c nhau như vậy. Điều n&agrave;y cụ Nguyễn Hiến L&ecirc; c&oacute; n&ecirc;u ra trong cuốn L&atilde;o tử - Đạo Đức kinh (xem phần dịch Đạo Đức kinh, chương75).</p>', 421, 0, 0, 0, '2024-11-18 13:11:51', '2024-11-18 13:39:51', 12, 1, 24);
INSERT INTO `sach` (`id_Sach`, `maSach`, `tenSach`, `tenTacGia`, `soTrang`, `namXuatBan`, `soLuongHienCo`, `soLuongCoSan`, `fileSach`, `giaTien`, `ghiChu`, `luotXem`, `luotDoc`, `luotMuon`, `danhGiaTrungBinh`, `ngayTaoSach`, `ngaySuaSach`, `id_NhaXuatBan`, `id_NgonNgu`, `id_ViTri`) VALUES
(84, 'MS27921745', 'TRIẾT HỌC NHÂN SINH CỦA TÔI', 'Vương Mông', 340, 2002, 4, 4, NULL, 119000, '<p>Thế n&agrave;o l&agrave; triết học nh&acirc;n sinh? Triết học nh&acirc;n sinh c&oacute; thể đem ra b&agrave;n luận kh&ocirc;ng?</p>\r\n\r\n<p>C&oacute; c&acirc;u &ldquo;Thi&ecirc;n cơ bất khả lộ&rdquo;, lại c&oacute; c&acirc;u &ldquo;chỉ khả &yacute; hội, bất khả ng&ocirc;n truyền&rdquo;, theo c&aacute;ch n&oacute;i nh&agrave; Phật l&agrave; &ldquo;bất khả thuyết&rdquo;.</p>\r\n\r\n<p>V&igrave; sao vậy?</p>\r\n\r\n<p>Bởi ng&ocirc;n ngữ l&agrave; c&ocirc;ng cụ đắc lực, song cũng l&agrave; c&aacute;i bẫy. Một khi đ&atilde; n&oacute;i ra, viết ra, sẽ trở n&ecirc;n xơ cứng, thiếu s&oacute;t, bị hiểu lệch lạc đi, bước v&agrave;o qu&aacute; tr&igrave;nh &ldquo;cứt ch&oacute; h&oacute;a&rdquo;.</p>\r\n\r\n<p>D&aacute;m viết về triết học nh&acirc;n sinh, triết học của đời người, thật dũng cảm thay! Cuốn s&aacute;ch trong tay bạn l&agrave; tổng kết, đ&uacute;c r&uacute;t mấy chục năm trải nghiệm, cảm ngộ của một nh&agrave; văn lớn, c&acirc;y đại thụ của văn đ&agrave;n Trung Quốc - Vương M&ocirc;ng. Nội dung h&agrave;m s&uacute;c triết l&yacute; cao song thể hiện dưới lối viết h&oacute;m hỉnh m&agrave; gần gũi, Triết học nh&acirc;n sinh của Vương M&ocirc;ng đ&atilde; trở th&agrave;nh một hiện tượng s&aacute;ch b&aacute;n chạy trong năm đầu ti&ecirc;n xuất bản 2003, v&agrave; đến nay vẫn được rất đ&ocirc;ng độc giả trẻ tuổi t&igrave;m đọc v&agrave; t&aacute;n thưởng.</p>', 412, 0, 0, 0, '2024-11-18 13:14:23', '2024-11-18 13:39:46', 12, 1, 24),
(85, 'MS55832540', 'NHỮNG TƯ TƯỞNG LỚN TỪ NHỮNG TÁC PHẨM VĨ ĐẠI', 'Phạm Viêm Phương', 245, 1999, 7, 7, NULL, 119000, '<p>Cuốn s&aacute;ch c&aacute;c bạn đang cầm tr&ecirc;n tay l&agrave; một tập hợp những c&acirc;u hỏi v&agrave; trả lời. Những c&acirc;u hỏi n&agrave;y được đặt ra cho t&aacute;c giả, một chuy&ecirc;n gia về lịch sử tư tưởng phương T&acirc;y, từ những độc giả thuộc đủ mọi tầng lớp x&atilde; hội Mỹ muốn t&igrave;m hiểu về đủ loại vấn đề. Nh&igrave;n chung, đ&ocirc;ng đảo độc giả đều muốn biết c&aacute;c nh&agrave; tư tưởng trong qu&aacute; khứ suy nghĩ v&agrave; l&yacute; giải thế n&agrave;o về những vấn đề m&agrave; con người h&ocirc;m nay đang phải đối mặt. Họ kh&ocirc;ng mưu t&igrave;m một c&acirc;u trả lời dứt kho&aacute;t, một giải ph&aacute;p rốt r&aacute;o, m&agrave; thường họ muốn hiểu r&otilde; vấn đề v&agrave; muốn r&uacute;t được b&agrave;i học từ c&aacute;c nh&agrave; tư tưởng lớn trong truyền thống triết học phương T&acirc;y. Những c&acirc;u hỏi n&agrave;y được t&aacute;c giả trả lời trong một chuy&ecirc;n mục của &ocirc;ng, ban đầu chỉ được đăng tải tr&ecirc;n tờ Chicago Sun-Times v&agrave; Chicago Daily News. Trong v&ograve;ng một năm sau khi ra đời, đ&atilde; c&oacute; tới 28 tờ b&aacute;o mua bản quyền để đăng tải chuy&ecirc;n mục n&agrave;y (trong đ&oacute; c&oacute; tờ Kenkyu Sha ở Tokyo). Sự th&agrave;nh c&ocirc;ng của chuy&ecirc;n mục đ&atilde; đưa tới việc tập hợp những c&acirc;u hỏi v&agrave; trả lời th&agrave;nh một cuốn s&aacute;ch. Đ&oacute; l&agrave; ho&agrave;n cảnh h&igrave;nh th&agrave;nh t&aacute;c phẩm n&agrave;y trong l&ograve;ng x&atilde; hội Mỹ.</p>\r\n\r\n<p>Dĩ nhi&ecirc;n đối với người Việt, văn minh phương T&acirc;y n&oacute;i chung, v&agrave; triết học của n&oacute; n&oacute;i ri&ecirc;ng, kh&ocirc;ng phải l&agrave; đề t&agrave;i học tập bắt buộc, v&agrave; cũng kh&ocirc;ng phải l&agrave; nguồn cội tư tưởng gi&uacute;p ch&uacute;ng ta định hướng cuộc sống v&agrave; giải quyết những vấn đề của m&igrave;nh. Tuy nhi&ecirc;n ch&uacute;ng ta kh&ocirc;ng thể phủ nhận sự kiện rằng truyền thống triết học phương T&acirc;y đ&atilde; c&oacute; ảnh hưởng quyết định đối với nền văn minh phương T&acirc;y vốn đ&atilde; đạt nhiều gi&aacute; trị m&agrave; hiện đ&atilde; trở th&agrave;nh phổ qu&aacute;t đối với phần c&ograve;n lại của thế giới, n&ecirc;n triết học phương T&acirc;y thực sự xứng đ&aacute;ng được ch&uacute;ng ta quan t&acirc;m đ&uacute;ng mức. Như đ&atilde; n&oacute;i tr&ecirc;n, khi trả lời c&aacute;c c&acirc;u hỏi, t&aacute;c giả kh&ocirc;ng đưa ra, hay &aacute;p đặt, một c&acirc;u trả lời dứt kho&aacute;t hay một giải ph&aacute;p tối hậu. &Ocirc;ng chỉ tr&igrave;nh b&agrave;y c&aacute;c nh&agrave; tư tưởng lớn đ&atilde; n&oacute;i g&igrave; trong c&aacute;c t&aacute;c phẩm của họ về c&aacute;c vấn đề được độc giả n&ecirc;u ra. C&aacute;c nh&agrave; tư tưởng n&agrave;y thường c&oacute; những &yacute; kiến kh&aacute;c nhau, thậm ch&iacute; xung khắc nhau, tuy họ đều dựa tr&ecirc;n cơ sở l&yacute; luận n&agrave;o đ&oacute;, v&agrave; &yacute; kiến của họ lu&ocirc;n l&agrave; th&agrave;nh quả của nhiều năm th&aacute;ng suy nghĩ v&agrave; chi&ecirc;m nghiệm. C&aacute;ch tr&igrave;nh b&agrave;y n&agrave;y gi&uacute;p độc giả c&oacute; cơ hội nh&igrave;n v&agrave; mổ xẻ vấn đề ở nhiều kh&iacute;a cạnh kh&aacute;c nhau, tự r&uacute;t ra b&agrave;i học cho m&igrave;nh v&agrave; đưa ra quyết định cuối c&ugrave;ng. Đ&acirc;y cũng ch&iacute;nh l&agrave; cốt tủy của c&aacute;i m&agrave; t&aacute;c giả tr&igrave;nh b&agrave;y như một &ldquo;nền gi&aacute;o dục khai ph&oacute;ng&rdquo;, một nền gi&aacute;o dục - h&igrave;nh th&agrave;nh từ thời cổ đại ở Hy Lạp v&agrave; La M&atilde; - nhằm v&agrave;o việc đ&agrave;o tạo những con người tự do, hiểu theo nghĩa l&agrave; một con người biết tư duy rốt r&aacute;o về từng vấn đề, biết tự đưa ra quyết định v&agrave; chịu tr&aacute;ch nhiệm cho quyết định của m&igrave;nh. Mẫu người tự do n&agrave;y kh&aacute;c hẳn mẫu người n&ocirc; lệ, chỉ tr&ocirc;ng cậy v&agrave;o tư duy v&agrave; quyết định của người kh&aacute;c, v&agrave; dĩ nhi&ecirc;n, họ kh&ocirc;ng hề muốn chịu tr&aacute;ch nhiệm về những quyết định đ&oacute; tuy rằng họ đ&atilde; h&agrave;nh động theo những quyết định đ&oacute;. Một quan điểm đ&aacute;ng lưu &yacute; nữa của t&aacute;c giả l&agrave; ở chỗ &ocirc;ng lu&ocirc;n tr&iacute;ch dẫn &yacute; kiến của những t&aacute;c gia kinh điển của từng l&atilde;nh vực, ngay cả khi l&yacute; thuyết của những t&aacute;c gia n&agrave;y đ&atilde; bị vượt qua, hay thậm ch&iacute; bị phi b&aacute;c, bởi những nh&agrave; tư tưởng v&agrave; th&agrave;nh quả khoa học của thời hiện đại. &Ocirc;ng biện minh rằng ch&uacute;ng ta kh&ocirc;ng học tập hay tiếp nhận những tri thức của c&aacute;c nh&agrave; tư tưởng đ&oacute;, v&igrave; c&oacute; thể n&oacute; đ&atilde; bị vượt qua hoặc kh&ocirc;ng c&ograve;n đ&uacute;ng nữa dưới &aacute;nh s&aacute;ng của khoa học ng&agrave;y nay, m&agrave; ch&uacute;ng ta học tập phương ph&aacute;p tư duy của họ, hiểu ra con đường v&agrave; c&aacute;ch đi của họ để tiếp cận với ch&acirc;n l&yacute;, tuy họ sống trong những thời kỳ m&agrave; khoa học v&agrave; kinh tế c&ograve;n ph&ocirc;i thai, chưa ph&aacute;t triển. Đ&oacute; mới thực sự l&agrave; điều m&agrave; triết học mang lại cho con người v&agrave; cũng l&agrave; điều bổ &iacute;ch của t&aacute;c phẩm n&agrave;y.</p>', 666, 0, 0, 0, '2024-11-18 13:16:22', '2024-11-18 13:39:42', 12, 1, 24),
(86, 'MS23540564', 'VIỆT NAM BA LẦN ĐÁNH NGUYÊN TOÀN THẮNG', 'Nguyễn Lương Bích', 241, 2001, 6, 6, NULL, 99000, '<p>Việt Nam ba lần đ&aacute;nh Nguy&ecirc;n to&agrave;n thắng l&agrave; một kỳ t&iacute;ch tuyệt vời của d&acirc;n tộc ta về chiến tranh chống x&acirc;m lược, một v&otilde; c&ocirc;ng hiển h&aacute;ch bậc nhất của d&acirc;n tộc ta ở thế kỷ XIII, đ&aacute;nh thắng những đạo qu&acirc;n cuồng chiến t&agrave;n bạo nhất thế giới đương thời.</p>\r\n\r\n<p>Ch&uacute;ng đ&atilde; ch&eacute;m giết, đ&aacute;nh ph&aacute;, x&acirc;m chiếm gần khắp ch&acirc;u &Aacute;, ch&acirc;u &Acirc;u. Về ph&iacute;a t&acirc;y, ch&uacute;ng thống trị tất cả c&aacute;c nước từ T&acirc;y &Aacute; sang Đ&ocirc;ng &Acirc;u. Tại ph&iacute;a đ&ocirc;ng, ch&uacute;ng l&agrave;m chủ gần khắp lục địa ch&acirc;u &Aacute; bao gồm to&agrave;n bộ nước Trung Hoa, c&aacute;c nước M&ocirc;ng Cổ, Triều Ti&ecirc;n, Đại L&yacute;,... lập triều đại nh&agrave; Nguy&ecirc;n tr&ecirc;n đất Trung Quốc, đ&oacute;ng đ&ocirc; tại Bắc Kinh.</p>\r\n\r\n<p>Nhưng khi đụng tới Việt Nam, ch&uacute;ng bị ho&agrave;n to&agrave;n bất ngờ. Trong 30 năm, giặc Nguy&ecirc;n ba lần x&acirc;m lược Việt Nam, v&agrave; cả ba lần, ch&uacute;ng đều thất bại thảm hại.</p>\r\n\r\n<p>Việt Nam ba lần đ&aacute;nh Nguy&ecirc;n to&agrave;n thắng l&agrave; một chiến c&ocirc;ng vĩ đại. T&aacute;c dụng chiến thắng vượt ra ngo&agrave;i phạm vi nước ta. Tiếng vang của chiến thắng dội ra to&agrave;n ch&acirc;u &Aacute;, sang tận Ba Tư. Một nh&agrave; sử học Ba Tư đương thời l&agrave; Rasit-ut-Din, trong s&aacute;ch Tập sử bi&ecirc;n ni&ecirc;n của &ocirc;ng, đ&atilde; n&oacute;i đến những thất bại thảm hại của qu&acirc;n Nguy&ecirc;n (Tho&aacute;t Hoan) tr&ecirc;n đất nước ta.</p>\r\n\r\n<p>Việt Nam ba lần đ&aacute;nh Nguy&ecirc;n to&agrave;n thắng l&agrave; một niềm tự h&agrave;o rất lớn của d&acirc;n tộc ta từ 700 năm nay. Như đồng ch&iacute; L&ecirc; Duẩn, Tổng B&iacute; thư Đảng ta đ&atilde; li&ecirc;n hệ xưa với nay v&agrave; nhận định:</p>', 1123, 0, 0, 0, '2024-11-18 13:21:37', '2024-11-18 13:39:38', 24, 1, 24),
(87, 'MS98323111', 'THỜI TÂY SƠN', 'Ngô Văn Phú', 219, 2007, 6, 6, NULL, 79000, '<p>avc</p>', 754, 0, 0, 0, '2024-11-18 13:24:35', '2024-11-18 13:39:33', 13, 1, 24),
(88, 'MS12827041', 'THỜI ĐẦU NHÀ NGUYỄN', 'Ngô Văn Phú', 10, 2009, 8, 8, NULL, 99000, '<p>Kể Chuyện Lịch Sử Nước Nh&agrave; - Thời Đầu Nh&agrave; Nguyễn Kể Chuyện Lịch Sử Nước Nh&agrave; gồm 10 tập của t&aacute;c giả - Nh&agrave; thơ Ng&ocirc; Văn Ph&uacute;, l&agrave; bộ s&aacute;ch kể về những nh&acirc;n vật lịch sử Việt Nam qua c&aacute;c triều đại, từ thời H&ugrave;ng Vương dựng nước cho đến thời kỳ chống thực d&acirc;n Ph&aacute;p x&acirc;m lược. Hầu hết đ&oacute; l&agrave; những nh&acirc;n vật c&oacute; cuộc đời, sự nghiệp gằn liền với những sự kiện lớn trong lịch sử dựng nước v&agrave; giữ nước của d&acirc;n tộc m&agrave; học sinh đ&atilde; tiếp x&uacute;c qua s&aacute;ch gi&aacute;o khoa Lịch sử, truyện tranh lịch sử hoặc qua thực tế đời sống văn h&oacute;a, lịch sử ở từng địa phương.</p>\r\n\r\n<p>Ở mỗi nh&acirc;n vật, cuốn s&aacute;ch đảm bảo y&ecirc;u cầu cung cấp kiến thức lịch sử, sử liệu mang t&iacute;nh kh&aacute;ch quan, được thu thập từ c&aacute;c nguồn sử liệu ch&iacute;nh thống như Đại Việt Sử K&yacute; To&agrave;n Thư, Đại Nam Thực Lục... Mặt kh&aacute;c, dựa tr&ecirc;n cốt l&otilde;i lịch sử, bằng hư cấu nghệ thuật, t&aacute;c giả vận dụng s&aacute;ng tạo những truyền thuyết, giai thoại li k&igrave;, hấp dẫn về c&aacute;c nh&acirc;n vật, tạo n&ecirc;n những c&acirc;u chuyện gi&agrave;u m&agrave;u sắc huyền thoại, l&atilde;ng mạn. Cấu tr&uacute;c từng truyện kể gồm hai phần ch&iacute;nh: - Giới thiệu t&oacute;m tắt tiểu sử v&agrave; sự kiện lịch sử gắn với nh&acirc;n vật. - Kể chuyện về nh&acirc;n vật. Đan xen trong mỗi c&acirc;u chuyện kể l&agrave; h&igrave;nh ảnh minh họa, những ch&uacute; th&iacute;ch về những nh&acirc;n vật c&oacute; li&ecirc;n quan đến nh&acirc;n vật ch&iacute;nh; đến bối cảnh, triều đại, sự kiện lịch sử m&agrave; nh&acirc;n vật xuất hiện.</p>\r\n\r\n<p>Kể Chuyện Lịch Sử Nước Nh&agrave; - Thời Đầu Nh&agrave; Nguyễn được bi&ecirc;n soạn nhằm gi&uacute;p học sinh nắm chắc kiến thức lịch sử đ&atilde; v&agrave; đang học trong chương tr&igrave;nh, s&aacute;ch gi&aacute;o khoa Lịch sử ở c&aacute;c cấp học phổ th&ocirc;ng. Đồng thời, gi&uacute;p học sinh h&igrave;nh dung được những ch&acirc;n dung, t&iacute;nh c&aacute;ch, phẩm chất vừa cao cả, phi thường m&agrave; cũng vừa rất gần gũi, đời thường ở những vị vua anh minh, những trung thần gi&agrave;u t&agrave;i năng v&agrave; đức độ... c&oacute; những đ&oacute;ng g&oacute;p to lớn trong việc g&igrave;n giữ giang sơn, bờ c&otilde;i, x&acirc;y dựng c&aacute;c triều đại hưng thịnh qua bao thăng trầm của lịch sử d&acirc;n tộc</p>', 421, 0, 0, 0, '2024-11-18 13:25:42', '2024-11-18 13:39:30', 13, 1, 24),
(89, 'MS54108799', 'THỜI KÌ CHỐNG THỰC DÂN PHÁP', 'Ngô Văn Phú', 310, 2009, 10, 10, NULL, 79000, '<p>KỂ CHUYỆN LỊCH SỬ NƯỚC NH&Agrave; D&Agrave;NH CHO HỌC SINH gồm 10 tập của nh&agrave; thơ Ng&ocirc; Văn Ph&uacute; được NXB Trẻ v&agrave; NXB Gi&aacute;o dục phối hợp bi&ecirc;n soạn, l&agrave; bộ s&aacute;ch kể về những nh&acirc;n vật lịch sử Việt Nam qua c&aacute;c triều đại, từ thời H&ugrave;ng Vương dựng nước cho đến thời k&igrave; chống thực d&acirc;n Ph&aacute;p x&acirc;m lược. Qua bộ s&aacute;ch, kh&ocirc;ng chỉ gi&uacute;p c&aacute;c em học sinh nắm chắc kiến thực lịch sử đ&atilde; v&agrave; đang học trong chương tr&igrave;nh s&aacute;ch gi&aacute;o khoa ở c&aacute;c cấp học phổ th&ocirc;ng m&agrave; c&ograve;n gi&uacute;p c&aacute;c em h&igrave;nh dung được những ch&acirc;n dung, t&iacute;nh c&aacute;ch, phẩm chất vừa cao cả, phi thường m&agrave; cũng rất gần gũi đời thường của họ. B&ecirc;n cạnh đ&oacute;, bộ s&aacute;ch cũng mang &yacute; nghĩa gi&aacute;o dục s&acirc;u sắc về l&ograve;ng y&ecirc;u nước, &yacute; thức cống hiến, tinh thần miệt m&agrave;i học tập, lao động s&aacute;ng tạo, hết l&ograve;ng v&igrave; d&acirc;n v&igrave; nước của c&aacute;c bậc danh t&agrave;i để c&aacute;c em noi gương học tập.</p>\r\n\r\n<p>Tập 10 gồm c&aacute;c chuyện kể về c&aacute;c nh&acirc;n vật lịch sử thời k&igrave; chống thực d&acirc;n Ph&aacute;p: Trương Định; Phan Đ&igrave;nh Ph&ugrave;ng; Ho&agrave;ng Hoa Th&aacute;m; Trịnh Văn Cấn; Duy T&acirc;n; Phan Bội Ch&acirc;u; Lương Văn Can; Phan Chu Trinh; Huỳnh Th&uacute;c Kh&aacute;ng; Ng&ocirc; Đức Kế.</p>', 552, 0, 0, 0, '2024-11-18 13:26:44', '2024-11-18 13:39:28', 13, 1, 24),
(90, 'MS87450312', 'CÁC KIỂU KIẾN TRÚC TRÊN THẾ GIỚI', 'Nguyễn Tứ', 262, 2012, 11, 11, NULL, 119000, '<p>Nếu đ&atilde; từng đi qua nh&agrave; Thờ Đức B&agrave; ở TPHCM, chắc hẳn bạn sẽ trầm trồ trước vẻ đẹp oai nghi&ecirc;m nhưng tinh tế của n&oacute;. Vậy bạn c&oacute; nhận ra được c&aacute;c kiểu kiến tr&uacute;c G&ocirc;tic ở c&aacute;c n&eacute;t đặc trưng v&ograve;m nhọn, của sổ k&iacute;nh m&agrave;u, hoa văn đ&aacute;... của ng&ocirc;i nh&agrave; gi&aacute;o đường n&agrave;y kh&ocirc;ng?</p>\r\n\r\n<p>Cuốn s&aacute;ch C&aacute;c Kiểu Kiến Tr&uacute;c Tr&ecirc;n Thế Giới sẽ c&ugrave;ng c&aacute;c bạn t&igrave;m hiểu điều đ&oacute;. S&aacute;ch giới thiệu những nội dung sau:</p>', 244, 0, 0, 0, '2024-11-18 13:30:28', '2024-11-18 13:39:23', 12, 1, 25),
(91, 'MS54538411', 'BÍ MẬT TỬ CẤM THÀNH BẮC KINH', 'Thượng Quan Phong', 445, 1999, 9, 9, NULL, 119000, '<p>Cố cung, cũng gọi l&agrave; Từ Cấm th&agrave;nh, l&agrave; một Viện Bảo t&agrave;ng cực kỳ vĩ đại về văn h&oacute;a nghệ thuật của lịch sử cung đ&igrave;nh hai triều Minh - Thanh v&agrave; c&ocirc; đại Trung Quốc v&agrave; l&agrave; một quần thể kiến tr&uacute;c h&ugrave;ng vĩ v&agrave;o bậc nhất thế giới, hết sức ho&agrave;n chỉnh của Trung Quốc hiện c&ograve;n tồn tại, đến nay đ&atilde; c&oacute; tr&ecirc;n năm trăm bảy mươi năm lịch sử.</p>\r\n\r\n<p>Trước đ&acirc;y, do cung cấm th&acirc;m nghi&ecirc;m, quy chế ngặt ngh&egrave;o, bao nhi&ecirc;u điều b&iacute; mật &iacute;t ai được biết. Nhưng trong d&acirc;n gian lại lưu truyền kh&ocirc;ng biết bao nhi&ecirc;u chuyện về đế hậu, phi tần, vương hầu, quan hoạn, trầm trồ về bao nhi&ecirc;u cổ vật quy b&aacute;u như những huyền thoại, c&ugrave;ng với bao nhi&ecirc;u l&acirc;u đ&agrave;i điện c&aacute;c hay huy ho&agrave;ng như chốn bồng lai lại c&agrave;ng g&acirc;y nhiều hứng th&uacute; tham quan đối với du kh&aacute;ch bốn phương.</p>\r\n\r\n<p>Từ Cấm th&agrave;nh l&agrave; niềm tự h&agrave;o của nh&acirc;n d&acirc;n Trung Quốc v&agrave; sự ngưỡng mộ của thế giới.</p>\r\n\r\n<p>H&agrave; Nội c&oacute; c&aacute;c nh&agrave; H&agrave; Nội học - Bắc Kinh c&oacute; c&aacute;c nh&agrave; Bắc Kinh học. Ri&ecirc;ng Từ Cấm th&agrave;nh cũng c&oacute; rất nhiều nh&agrave; Từ Cấm th&agrave;nh học. Xưa nay kh&ocirc;ng hiếm những nh&agrave; văn h&oacute;a, sử gia, kiến tr&uacute;c sư, d&acirc;n tộc học, dịch học, phong thủy học, &acirc;m nhạc, hội họa t&igrave;m t&ograve;i nghi&ecirc;n cứu hoặc viết lẻ tẻ đăng b&aacute;o, hoặc viết th&agrave;nh s&aacute;ch nhiều kh&ocirc;ng sao đếm xuể.</p>\r\n\r\n<p>Lần n&agrave;y, dưới tay bạn đọc c&oacute; cuốn &ldquo;B&iacute; mật Từ Cấm th&agrave;nh&rdquo; do học giả Thượng Quan Phong chủ bi&ecirc;n c&ugrave;ng với hơn hai mươi chuy&ecirc;n gia về Bắc Kinh sử, cung đ&igrave;nh sử, vương phủ sử, sắc kiều miếu vũ sử, đi&ecirc;u khắc, mỹ thuật, kiến tr&uacute;c tham gia viết n&ecirc;n.</p>', 521, 0, 0, 0, '2024-11-18 13:31:46', '2024-11-18 13:39:17', 12, 1, 25),
(92, 'MS23968573', 'VẬT LIỆU XÂY DỰNG MỚI', 'Phạm Duy Hữu', 132, 2016, 6, 6, NULL, 55000, '<p>Hiện nay xu thế tr&ecirc;n thế giới v&agrave; ở Việt Nam l&agrave; ng&agrave;y c&agrave;ng n&acirc;ng cao chất lượng vật liệu, chất lượng c&ocirc;ng tr&igrave;nh x&acirc;y dựng nhất l&agrave; c&aacute;c c&ocirc;ng tr&igrave;nh cầu đường. Cuốn s&aacute;ch n&agrave;y phần n&agrave;o cung cấp cho độc giả c&aacute;c kiến thức hiện đại về b&ecirc; t&ocirc;ng xi măng, b&ecirc; t&ocirc;ng cường độ cao, b&ecirc; t&ocirc;ng &aacute;t phan v&agrave; vật liệu Polime. C&aacute;c l&yacute; thuyết v&agrave; c&aacute;c ti&ecirc;u chuẩn mới cũng &ntilde;ược tr&igrave;nh b&agrave;y trong cuốn s&aacute;ch n&agrave;y. Lần t&aacute;i bản n&agrave;y c&oacute; bổ sung th&ecirc;m c&aacute;c kết quả nghi&ecirc;n cứu về b&ecirc; t&ocirc;ng năm 2003-2005.</p>\r\n\r\n<p>S&aacute;ch được d&ugrave;ng l&agrave;m t&agrave;i liệu học tập ch&iacute;nh cho học vi&ecirc;n cao học ng&agrave;nh X&acirc;y dựng C&ocirc;ng tr&igrave;nh Giao th&ocirc;ng, ngo&agrave;i ra c&ograve;n l&agrave; t&agrave;i liệu tham khảo cho c&aacute;n bộ nghi&ecirc;n cứu v&agrave; kỹ sư.</p>\r\n\r\n<p>Do thời gian v&agrave; tr&igrave;nh độ c&oacute; hạn, chắc chắn cuốn s&aacute;ch c&ograve;n c&oacute; những thiếu s&oacute;t.</p>\r\n\r\n<p>T&aacute;c giả mong nhận được những &yacute; kiến đ&oacute;ng g&oacute;p của c&aacute;c độc giả v&agrave; &ntilde;ồng nghiệp &ntilde;ể lần t&aacute;i bản sau được ho&agrave;n thiện hơn.</p>', 890, 0, 0, 0, '2024-11-18 13:33:00', '2024-11-18 13:39:09', 20, 1, 25),
(93, 'MS28456521', 'SỨC BỀN VẬT LIỆU VÀ KẾT CẤU', 'Nguyễn Đình Đức', 300, 2007, 4, 4, NULL, 99000, '<p>Sức bền vật liệu l&agrave; m&ocirc;n học cơ sở quan trọng, cung cấp cho người học những kiến thức cơ bản nhất để giải c&aacute;c b&agrave;i to&aacute;n li&ecirc;n quan đến hệ thanh, t&iacute;nh to&aacute;n sức bền của vật liệu v&agrave; kết cấu. Ch&iacute;nh v&igrave; vậy sức bền vật liệu v&agrave; cơ học kết cấu được giảng dạy cho sinh vi&ecirc;n tất cả c&aacute;c trường đại học kỹ thuật ở Việt Nam cũng như tr&ecirc;n thế giới. Tuy nhi&ecirc;n, hiện nay c&oacute; rất nhiều gi&aacute;o tr&igrave;nh sức bền vật liệu kh&aacute;c nhau, được bi&ecirc;n soạn phục vụ ph&ugrave; hợp cho c&aacute;c đối tượng l&agrave; người học trong c&aacute;c trường đại học kh&aacute;c nhau.</p>\r\n\r\n<p>Gi&aacute;o tr&igrave;nh n&agrave;y được bi&ecirc;n soạn cho sinh vi&ecirc;n ng&agrave;nh Cơ học Kỹ thuật v&agrave; ng&agrave;nh C&ocirc;ng nghệ Cơ điện tử của trường Đại học C&ocirc;ng nghệ - Đại học Quốc gia H&agrave; Nội, với thời lượng giảng dạy từ 2 đến 3 t&iacute;n chỉ. Gi&aacute;o tr&igrave;nh đề cập đến những nội dung căn bản nhất của m&ocirc;n học Sức bền vật liệu v&agrave; Cơ học kết cấu, được bi&ecirc;n soạn tr&ecirc;n cơ sở c&aacute;c b&agrave;i giảng về Sức bền vật liệu v&agrave; Cơ học kết cấu trong khung chương tr&igrave;nh đ&agrave;o tạo cho sinh vi&ecirc;n Khoa Cơ học Kỹ thuật v&agrave; Tự động h&oacute;a trong 5 năm qua, đồng thời c&oacute; tham khảo kinh nghiệm v&agrave; nội dung giảng dạy m&ocirc;n học n&agrave;y đ&atilde; được &aacute;p dụng ở một số trường đại học kỹ thuật trong v&agrave; ngo&agrave;i nước, với mục đ&iacute;ch kịp thời cung cấp cho sinh vi&ecirc;n t&agrave;i liệu phục vụ học tập.</p>\r\n\r\n<p>C&aacute;c t&aacute;c giả ch&acirc;n th&agrave;nh cảm ơn PGS. TS. Kh&uacute;c Văn Ph&uacute;, PGS. TS. Trần Minh T&uacute;, TS Vũ Đỗ Long, TS Lương Xu&acirc;n B&iacute;nh v&igrave; những đ&oacute;ng g&oacute;p qu&yacute; b&aacute;u cả về nội dung v&agrave; h&igrave;nh thức cho quyển s&aacute;ch n&agrave;y. C&aacute;c t&aacute;c giả b&agrave;y tỏ sự c&aacute;m ơn Trường Đại học C&ocirc;ng nghệ, Khoa Cơ kĩ thuật v&agrave; tự động h&oacute;a đ&atilde; tạo điều kiện về mọi mặt để c&aacute;c t&aacute;c giả ho&agrave;n th&agrave;nh quyển s&aacute;ch n&agrave;y. Quyển s&aacute;ch được viết ra c&oacute; c&ocirc;ng kh&ocirc;ng nhỏ của c&aacute;c em sinh vi&ecirc;n đ&atilde; g&oacute;p &yacute; cho c&aacute;c t&aacute;c giả trong qu&aacute; tr&igrave;nh giảng dạy.</p>\r\n\r\n<p>V&igrave; gi&aacute;o tr&igrave;nh xuất bản lần đầu n&ecirc;n kh&ocirc;ng tr&aacute;nh khỏi thiếu s&oacute;t, ch&uacute;ng t&ocirc;i rất mong nhận được c&aacute;c &yacute; kiến đ&oacute;ng g&oacute;p của bạn đọc, đặc biệt l&agrave; của c&aacute;c đồng nghiệp v&agrave; c&aacute;c em si</p>', 690, 0, 0, 0, '2024-11-18 13:34:27', '2024-11-18 13:51:05', 20, 1, 25),
(94, 'MS65476738', 'BỐ TRÍ NỘI THẤT VĂN PHÒNG THEO PHONG THỦY', 'Đào Hoàng Bích Trâm', 321, 2012, 10, 10, NULL, 99000, '<p>Phong thuỷ tức l&agrave; nước v&agrave; gi&oacute;, l&agrave; học thuyết chuy&ecirc;n nghi&ecirc;n cứu sự ảnh hưởng của địa l&yacute; đến đời sống hoạ ph&uacute;c của con người. Cụ thể l&agrave; sự ảnh hưởng của hướng gi&oacute;, hướng kh&iacute;, mạch nước đến mỗi c&aacute; nh&acirc;n. Phong thuỷ c&oacute; vai tr&ograve; rất to lớn, tuy nhi&ecirc;n n&oacute; chỉ hỗ trợ, c&oacute; t&aacute;c dụng cải biến chứ kh&ocirc;ng thể l&agrave;m thay đổi ho&agrave;n to&agrave;n mệnh vận. N&oacute; l&agrave; nh&acirc;n tố quyết định sự th&agrave;nh bại. Nếu phong thuỷ tốt sẽ gi&uacute;p giảm thiểu được tai hoạ khi v&agrave;o vận xấu, gi&uacute;p gia tăng sự th&agrave;nh c&ocirc;ng v&agrave; may mắn khi v&agrave;o vận tốt.</p>\r\n\r\n<p>Mời c&aacute;c bạn đ&oacute;n đọc!</p>\r\n\r\n<p>Độc giả c&oacute; thể t&igrave;m mua ấn phẩm tại c&aacute;c nh&agrave; s&aacute;ch hoặc tham khảo bản ebook&nbsp;<strong>Bố Tr&iacute; Nội Thất Văn Ph&ograve;ng Theo Phong Thủy PDF</strong>&nbsp;của t&aacute;c giả&nbsp;<strong>Đ&agrave;o Ho&agrave;ng B&iacute;ch Tr&acirc;m</strong>&nbsp;nếu chưa c&oacute; điều kiện.</p>\r\n\r\n<p>Tất cả s&aacute;ch điện tử, ebook tr&ecirc;n website thuviensach.vn đều c&oacute; bản quyền thuộc về t&aacute;c giả. Ch&uacute;ng t&ocirc;i khuyến kh&iacute;ch c&aacute;c bạn nếu c&oacute; điều kiện, khả năng xin h&atilde;</p>', 621, 0, 0, 0, '2024-11-18 13:36:00', '2024-11-18 13:39:01', 17, 1, 25),
(95, 'MS52437766', 'GIÁO TRÌNH AUTOCAD CHO NHÀ THIẾT KẾ CHUYÊN NGHIỆP', 'Dương Đức Canh', 102, 2015, 5, 5, NULL, 89000, '<p>L&agrave; một t&agrave;i liệu hay v&agrave; qu&yacute; gi&aacute; cho những bạn tự học Autocad, Gi&uacute;p bạn hiểu v&agrave; sử dụng được Autocad cho thiết kế. Khuyến Kh&iacute;ch c&aacute;c bạn sử dụng bản Autocad mới nhất để sử dụng nhiều t&iacute;nh năng mới, trong Gi&aacute;o tr&igrave;nh n&agrave;y chủ yếu hướng dẫn tr&ecirc;n Autocad 2015.</p>', 422, 0, 0, 0, '2024-11-18 13:37:21', '2024-11-18 13:43:00', 23, 1, 25);

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
(7, 'SV8023979', 2, 6, 5, 10),
(8, 'SV1949090', 2, 6, 6, 12),
(9, 'SV8527834', 2, 6, 6, 13),
(10, 'SV9772421', 1, 1, 1, 14),
(11, 'SV6877818', 1, 1, 1, 15),
(12, 'SV9163564', 1, 1, 1, 16),
(13, 'SV1471460', 1, 1, 1, 17);

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
(30, 'MTL25507907', 'Triết Học - Lý Luận', '2024-09-21 10:51:13', '2024-10-23 10:30:21'),
(31, 'MTL75078442', 'Ẩm Thực - Món Ăn', '2024-11-17 11:05:09', '2024-11-17 11:05:42'),
(32, 'MTL12321050', 'Kiến Trúc - Xây Dựng', '2024-11-18 13:28:52', '2024-11-18 13:28:52');

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
(6, 'MVT95623285', 'B.1.3', 2, 40, 40, '2024-11-17 15:34:39', '2024-08-19 11:42:47'),
(7, 'MVT49740613', 'A.2.1', 1, 20, 20, '2024-08-29 18:10:55', '2024-08-19 11:43:01'),
(8, 'MVT29943289', 'A.2.2', 1, 20, 20, '2024-10-07 11:24:14', '2024-08-19 11:43:59'),
(9, 'MVT29759124', 'A.2.3', 1, 30, 30, '2024-10-07 11:24:21', '2024-08-19 11:44:08'),
(10, 'MVT21261371', 'C.1.1', 3, 15, 15, '2024-09-08 13:07:11', '2024-08-19 11:53:41'),
(11, 'MVT21080121', 'C.1.2', 3, 15, 15, '2024-09-20 16:57:30', '2024-08-19 11:54:46'),
(12, 'MVT75836393', 'C.1.3', 3, 20, 20, '2024-09-21 10:24:35', '2024-08-19 13:56:04'),
(13, 'MVT38171683', 'C.2.1', 3, 15, 15, '2024-11-17 16:20:13', '2024-08-19 14:03:57'),
(14, 'MVT97405866', 'C.2.2', 3, 35, 35, '2024-10-02 14:12:35', '2024-08-19 14:44:59'),
(15, 'MVT30754602', 'D.1.1', 4, 30, 30, '2024-09-21 10:54:00', '2024-09-08 13:15:40'),
(16, 'MVT88518666', 'D.1.2', 4, 35, 35, '2024-11-17 15:50:57', '2024-09-27 13:36:08'),
(17, 'MVT13631683', 'E.1.1', 5, 30, 30, '2024-11-17 15:40:57', '2024-11-17 11:18:47'),
(18, 'MVT55199875', 'D.1.3', 4, 40, 40, '2024-11-17 16:05:01', '2024-11-17 15:52:31'),
(19, 'MVT80747660', 'D.2.1', 4, 30, 30, '2024-11-17 16:10:22', '2024-11-17 15:53:02'),
(20, 'MVT52873105', 'D.2.2', 4, 40, 40, '2024-11-17 16:24:30', '2024-11-17 15:53:10'),
(21, 'MVT19021781', 'D.2.3', 4, 40, 40, '2024-11-17 16:39:43', '2024-11-17 15:53:31'),
(22, 'MVT85818404', 'A.3.2', 1, 50, 50, '2024-11-18 13:10:23', '2024-11-18 12:38:21'),
(23, 'MVT96001799', 'A.3.1', 1, 50, 50, '2024-11-18 12:58:26', '2024-11-18 12:38:30'),
(24, 'MVT66087656', 'A.3.3', 1, 50, 50, '2024-11-18 13:26:44', '2024-11-18 12:38:57'),
(25, 'MVT16076892', 'A.4.1', 1, 50, 45, '2024-11-18 13:37:21', '2024-11-18 12:39:05'),
(26, 'MVT92235817', 'A.4.2', 1, 50, 0, '2024-11-18 12:39:12', '2024-11-18 12:39:12'),
(27, 'MVT48632986', 'A.4.3', 1, 50, 0, '2024-11-18 12:39:19', '2024-11-18 12:39:19');

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
  MODIFY `id_BinhLuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `chitietgiosach`
--
ALTER TABLE `chitietgiosach`
  MODIFY `id_ChiTietGioSach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT cho bảng `danhgia`
--
ALTER TABLE `danhgia`
  MODIFY `id_DanhGia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `giangvien`
--
ALTER TABLE `giangvien`
  MODIFY `id_GiangVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `giosach`
--
ALTER TABLE `giosach`
  MODIFY `id_GioSach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `hinhanh`
--
ALTER TABLE `hinhanh`
  MODIFY `id_HinhAnh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT cho bảng `khoa`
--
ALTER TABLE `khoa`
  MODIFY `id_Khoa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `khoahoc`
--
ALTER TABLE `khoahoc`
  MODIFY `id_KhoaHoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `lop`
--
ALTER TABLE `lop`
  MODIFY `id_Lop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `ngan`
--
ALTER TABLE `ngan`
  MODIFY `id_Ngan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `nganhhoc`
--
ALTER TABLE `nganhhoc`
  MODIFY `id_NganhHoc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `ngonngu`
--
ALTER TABLE `ngonngu`
  MODIFY `id_NgonNgu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id_NguoiDung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `nhatkyhoatdong`
--
ALTER TABLE `nhatkyhoatdong`
  MODIFY `id_HoatDong` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT cho bảng `nhaxuatban`
--
ALTER TABLE `nhaxuatban`
  MODIFY `id_NhaXuatBan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `phieumuon`
--
ALTER TABLE `phieumuon`
  MODIFY `id_PhieuMuon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `phieutra`
--
ALTER TABLE `phieutra`
  MODIFY `id_PhieuTra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `sach`
--
ALTER TABLE `sach`
  MODIFY `id_Sach` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  MODIFY `id_SinhVien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `theloai`
--
ALTER TABLE `theloai`
  MODIFY `id_TheLoai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

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
  MODIFY `id_ViTri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
