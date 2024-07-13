-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 02:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `borrow`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_borrow`
--

CREATE TABLE `app_borrow` (
  `id` int(11) NOT NULL,
  `borrow_no` varchar(20) NOT NULL COMMENT 'เลขที่ใบเบิก',
  `transaction_date` date NOT NULL COMMENT 'วันเวลาที่ทำรายการ',
  `borrower_id` int(11) NOT NULL COMMENT 'ผู้เบิก',
  `borrow_date` date NOT NULL COMMENT 'วันที่ต้องการเบิก',
  `return_date` date DEFAULT NULL COMMENT 'กำหนดคืน'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_borrow_items`
--

CREATE TABLE `app_borrow_items` (
  `id` int(11) NOT NULL,
  `borrow_id` int(11) NOT NULL,
  `topic` varchar(90) NOT NULL,
  `num_requests` int(11) NOT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `product_no` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_category`
--

CREATE TABLE `app_category` (
  `type` varchar(20) NOT NULL,
  `category_id` varchar(10) DEFAULT '0',
  `language` varchar(2) DEFAULT '',
  `topic` varchar(150) NOT NULL,
  `color` varchar(16) DEFAULT NULL,
  `published` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `app_category`
--

INSERT INTO `app_category` (`type`, `category_id`, `language`, `topic`, `color`, `published`) VALUES
('model_id', '2', '', 'Asus', '', 1),
('type_id', '3', '', 'โปรเจ็คเตอร์', '', 1),
('type_id', '2', '', 'เครื่องพิมพ์', '', 1),
('model_id', '3', '', 'Cannon', '', 1),
('category_id', '2', '', 'วัสดุสำนักงาน', NULL, 1),
('model_id', '1', '', 'Apple', '', 1),
('type_id', '1', '', 'เครื่องคอมพิวเตอร์', '', 1),
('model_id', '4', '', 'ACER', '', 1),
('type_id', '4', '', 'จอมอนิเตอร์', '', 1),
('category_id', '1', '', 'เครื่องใช้ไฟฟ้า', NULL, 1),
('category_id', '3', '', 'Ram', NULL, 1),
('category_id', '4', '', 'คอมพิวเตอร์', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_inventory`
--

CREATE TABLE `app_inventory` (
  `id` int(11) NOT NULL,
  `category_id` varchar(10) DEFAULT NULL,
  `model_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `topic` varchar(64) NOT NULL,
  `inuse` tinyint(1) DEFAULT 1,
  `count_stock` tinyint(1) DEFAULT 1,
  `cheme_no` varchar(100) NOT NULL,
  `un_class` varchar(10) NOT NULL,
  `grade` varchar(100) NOT NULL,
  `exp` varchar(100) NOT NULL,
  `sds` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `app_inventory`
--

INSERT INTO `app_inventory` (`id`, `category_id`, `model_id`, `type_id`, `topic`, `inuse`, `count_stock`, `cheme_no`, `un_class`, `grade`, `exp`, `sds`) VALUES
(5, '1', 1, 2, 'โซเดียมไฮดรอกไซด์ เม็ด (โซดาไฟ) (Sodium Hydroxide Pellet)', 1, 1, '', '0', '', '', ''),
(6, '1', 1, 1, 'โพแทสเซียมคลอไรด์ (Potassium Chloride)', 1, 1, '', '0', '', '', ''),
(7, '1', 1, 0, 'โพแทสเซียมเปอร์แมงกาแนต (ด่างทับทิม) (Potassium Permanganate)', 1, 1, '', '0', '', '', ''),
(8, '2', 1, 1, 'กรดไฮโดรคลอริก(กรดเกลือ) เข้มข้น', 1, 1, 'C1', '9', 'AR', '2024-07-10', 'C1'),
(12, '2', 2, 1, 'test', 1, 1, '1', '2', '1', '2024-07-09', '1');

-- --------------------------------------------------------

--
-- Table structure for table `app_inventory_items`
--

CREATE TABLE `app_inventory_items` (
  `product_no` varchar(150) NOT NULL,
  `inventory_id` int(11) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `stock` float NOT NULL DEFAULT 0,
  `cheme_no` varchar(10) NOT NULL,
  `un_class` varchar(50) NOT NULL,
  `sds` varchar(50) NOT NULL,
  `grade` varchar(50) NOT NULL,
  `exp` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `app_inventory_items`
--

INSERT INTO `app_inventory_items` (`product_no`, `inventory_id`, `unit`, `stock`, `cheme_no`, `un_class`, `sds`, `grade`, `exp`) VALUES
('STA-101', 5, 'CC', 215, '', '', '', '', '0000-00-00'),
('STA-102', 6, 'CC', 100, '', '', '', '', '0000-00-00'),
('STA-103', 7, 'CC', 35, '', '', '', '', '0000-00-00'),
('STA-104', 8, 'กรัม', 330, '', '', '', '', '0000-00-00'),
('test-1', 12, 'กรัม', 1, '1', '2', '1', '1', '2024-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `app_inventory_meta`
--

CREATE TABLE `app_inventory_meta` (
  `inventory_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `app_inventory_meta`
--

INSERT INTO `app_inventory_meta` (`inventory_id`, `name`, `value`) VALUES
(1, 'detail', 'โทรศัพท์ใช้ภายในสำนักงาน ห้ามติตั้งโปรแกรมเพิ่มเติม'),
(3, 'detail', 'สว่านเจาะกระแทก โรตารี่ 10 หุน');

-- --------------------------------------------------------

--
-- Table structure for table `app_language`
--

CREATE TABLE `app_language` (
  `id` int(11) NOT NULL,
  `key` text NOT NULL,
  `type` varchar(5) NOT NULL,
  `owner` varchar(20) NOT NULL,
  `js` tinyint(1) NOT NULL,
  `th` text DEFAULT NULL,
  `en` text DEFAULT NULL,
  `la` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `app_language`
--

INSERT INTO `app_language` (`id`, `key`, `type`, `owner`, `js`, `th`, `en`, `la`) VALUES
(1, 'ACCEPT_ALL', 'text', 'index', 1, 'ยอมรับทั้งหมด', 'Accept all', 'ຍອມຮັບທັງຫມົດ'),
(2, 'CANCEL', 'text', 'index', 1, 'ยกเลิก', 'Cancel', 'ຍົກເລີກ'),
(3, 'CHANGE_COLOR', 'text', 'index', 1, 'เปลี่ยนสี', 'change color', 'ປ່ຽນສີ'),
(4, 'CHECK', 'text', 'index', 1, 'เลือก', 'check', 'ເລືອກ'),
(5, 'CHECKBOX', 'text', 'index', 1, 'ตัวเลือก', 'Checkbox', 'ກ່ອງກາເຄື່ອງໝາຍ'),
(6, 'COOKIES_SETTINGS', 'text', 'index', 1, 'ตั้งค่าคุกกี้', 'Cookies settings', 'ຕັ້ງຄ່າຄຸກກີ'),
(7, 'DELETE', 'text', 'index', 1, 'ลบ', 'delete', 'ລຶບ'),
(8, 'DISABLE', 'text', 'index', 1, 'ปิดใช้งาน', 'Disable', 'ປິດໃຊ້ການ'),
(9, 'ENABLE', 'text', 'index', 1, 'เปิดใช้งาน', 'Enable', 'ເປີດໃຊ້ການ'),
(10, 'INVALID_DATA', 'text', 'index', 1, 'ข้อมูล XXX ไม่ถูกต้อง', 'XXX Invalid data', 'ຂໍ້ມູນ XXX ບໍ່ຖືກຕ້ອງ'),
(11, 'NEXT_MONTH', 'text', 'index', 1, 'เดือนถัดไป', 'Next Month', 'ເດືອນຕໍ່ໄປ'),
(12, 'PLEASE_BROWSE_FILE', 'text', 'index', 1, 'กรุณาเลือกไฟล์', 'Please browse file', 'ກະລຸນາເລືອກແຟ້ມຂໍ້ມູນ'),
(13, 'PLEASE_FILL_IN', 'text', 'index', 1, 'กรุณากรอก', 'Please fill in', 'ກະລຸນາພີ່ມ'),
(14, 'PLEASE_SAVE_BEFORE_CONTINUING', 'text', 'index', 1, 'กรุณาบันทึก ก่อนดำเนินการต่อ', 'Please save before continuing', 'ກະລຸນາບັນທຶກກ່ອນດຳເນີນການຕໍ່'),
(15, 'PLEASE_SELECT', 'text', 'index', 1, 'กรุณาเลือก', 'Please select', 'ກະລຸນາເລືອກ'),
(16, 'PLEASE_SELECT_AT_LEAST_ONE_ITEM', 'text', 'index', 1, 'กรุณาเลือก XXX อย่างน้อย 1 รายการ', 'Please select XXX at least one item', 'ກະລຸນາເລືອກ XXX ຢ່າງໜ້ອຍໜຶ່ງລາຍການ'),
(17, 'PREV_MONTH', 'text', 'index', 1, 'เดือนก่อนหน้า', 'Prev Month', 'ເດືອນທີ່ຜ່ານມາ'),
(18, 'SELECT_ALL', 'text', 'index', 1, 'เลือกทั้งหมด', 'select all', 'ເລືອກທັງໝົດ'),
(19, 'SELECT_NONE', 'text', 'index', 1, 'ไม่เลือกรายการใดเลย', 'select none', 'ບໍ່ເລືອກລາຍການໃດເລີຍ'),
(20, 'SORRY_XXX_NOT_FOUND', 'text', 'index', 1, 'ขออภัย ไม่พบ XXX ที่ต้องการ', 'Sorry XXX not found', 'ຂໍອະໄພບໍ່ພົບ XXX ທີ່ຕ້ອງການ'),
(21, 'SUCCESSFULLY_COPIED_TO_CLIPBOARD', 'text', 'index', 1, 'สำเนาไปยังคลิปบอร์ดเรียบร้อย', 'Successfully copied to clipboard', 'ສຳເນົາໄປຍັງຄິບບອດຮຽບຮ້ອຍ'),
(22, 'SUCCESSFULLY_UPLOADED_XXX_FILES', 'text', 'index', 1, 'อัปโหลดเรียบร้อย XXX ไฟล์', 'Successfully uploaded XXX files', 'ອັບໂຫຼດຮຽບຮ້ອຍ XXX ແຟ້ມ'),
(23, 'THE_TYPE_OF_FILE_IS_INVALID', 'text', 'index', 1, 'ชนิดของไฟล์ไม่ถูกต้อง', 'The type of file is invalid', 'ຊະນິດຂອງແຟ້ມບໍ່ຖືກຕ້ອງ'),
(24, 'UNCHECK', 'text', 'index', 1, 'ไม่เลือก', 'uncheck', 'ບໍ່ເລືອກ'),
(25, 'YOU_WANT_TO_XXX', 'text', 'index', 1, 'คุณต้องการ XXX ?', 'You want to XXX ?', 'ທ່ານບໍ່ຕ້ອງການ XXX ?'),
(26, 'YOU_WANT_TO_XXX_THE_SELECTED_ITEMS', 'text', 'index', 1, 'คุณต้องการ XXX รายการที่เลือก ?', 'You want to XXX the selected items ?', 'ທ່ານຕ້ອງການ XXX ລາຍການທີ່ເລືອກ?'),
(27, 'BOOLEANS', 'array', 'index', 0, 'a:2:{i:0;s:27:\"ปิดใช้งาน\";i:1;s:30:\"เปิดใช้งาน\";}', 'a:2:{i:0;s:7:\"Disable\";i:1;s:7:\"Enabled\";}', 'a:2:{i:0;s:27:\"ປິດໃຊ້ວຽກ\";i:1;s:30:\"ເປີດໃຊ້ວຽກ\";}'),
(28, 'BORROW_STATUS', 'array', 'index', 0, 'a:4:{i:0;s:27:\"รอตรวจสอบ\";i:1;s:30:\"ไม่อนุมัติ\";i:2;s:21:\"อนุมัติ\";i:3;s:21:\"คืนแล้ว\";}', 'a:4:{i:0;s:7:\"Pending\";i:1;s:11:\"Not allowed\";i:2;s:7:\"Approve\";i:3;s:8:\"Returned\";}', 'a:4:{i:0;s:15:\"ລໍຖ້າ\";i:1;s:30:\"ບໍ່ອະນຸຍາດ\";i:2;s:21:\"ອະນຸມັດ\";i:3;s:18:\"ກັບຄືນ\";}'),
(29, 'DATE_FORMAT', 'text', 'index', 0, 'd M Y เวลา H:i น.', 'd M Y, H:i', 'd M Y ເວລາ H:i'),
(30, 'DATE_LONG', 'array', 'index', 0, 'a:7:{i:0;s:21:\"อาทิตย์\";i:1;s:18:\"จันทร์\";i:2;s:18:\"อังคาร\";i:3;s:9:\"พุธ\";i:4;s:24:\"พฤหัสบดี\";i:5;s:15:\"ศุกร์\";i:6;s:15:\"เสาร์\";}', 'a:7:{i:0;s:6:\"Sunday\";i:1;s:6:\"Monday\";i:2;s:7:\"Tuesday\";i:3;s:9:\"Wednesday\";i:4;s:8:\"Thursday\";i:5;s:6:\"Friday\";i:6;s:8:\"Saturday\";}', 'a:7:{i:0;s:15:\"ອາທິດ\";i:1;s:9:\"ຈັນ\";i:2;s:18:\"ອັງຄານ\";i:3;s:9:\"ພຸດ\";i:4;s:15:\"ພະຫັດ\";i:5;s:9:\"ສຸກ\";i:6;s:12:\"ເສົາ\";}'),
(31, 'DATE_SHORT', 'array', 'index', 0, 'a:7:{i:0;s:7:\"อา.\";i:1;s:4:\"จ.\";i:2;s:4:\"อ.\";i:3;s:4:\"พ.\";i:4;s:7:\"พฤ.\";i:5;s:4:\"ศ.\";i:6;s:4:\"ส.\";}', 'a:7:{i:0;s:2:\"Su\";i:1;s:2:\"Mo\";i:2;s:2:\"Tu\";i:3;s:2:\"We\";i:4;s:2:\"Th\";i:5;s:2:\"Fr\";i:6;s:2:\"Sa\";}', 'a:7:{i:0;s:4:\"ທ.\";i:1;s:4:\"ຈ.\";i:2;s:4:\"ຄ.\";i:3;s:4:\"ພ.\";i:4;s:4:\"ພ.\";i:5;s:4:\"ສ.\";i:6;s:4:\"ສ.\";}'),
(32, 'Inventory', 'text', 'index', 0, 'คลังสินค้า', 'Inventory', 'ຄັງສິນຄ້າ'),
(33, 'INVENTORY_CATEGORIES', 'array', 'index', 0, 'a:3:{s:11:\"category_id\";s:24:\"หมวดหมู่\";s:7:\"type_id\";s:18:\"ประเภท\";s:8:\"model_id\";s:18:\"ยี่ห้อ\";}', 'a:3:{s:11:\"category_id\";s:8:\"Category\";s:7:\"type_id\";s:4:\"Type\";s:8:\"model_id\";s:5:\"Model\";}', 'a:3:{s:11:\"category_id\";s:24:\"ຫມວດຫມູ່\";s:7:\"type_id\";s:15:\"ປະເພດ\";s:8:\"model_id\";s:18:\"ຍີ່ຫໍ້\";}'),
(34, 'INVENTORY_METAS', 'array', 'index', 0, 'a:1:{s:6:\"detail\";s:30:\"รายละเอียด\";}', 'a:1:{s:6:\"detail\";s:6:\"Detail\";}', 'a:1:{s:6:\"detail\";s:27:\"ລາຍະລະອຽດ\";}'),
(35, 'INVENTORY_STATUS', 'array', 'index', 0, 'a:2:{i:0;s:42:\"เลิกใช้งานแล้ว\";i:1;s:30:\"ใช้งานอยู่\";}', 'a:2:{i:0;s:8:\"Inactive\";i:1;s:6:\"Active\";}', 'a:2:{i:0;s:36:\"ປິດການໃຊ້ວຽກ\";i:1;s:30:\"ຍັງເຮັດວຽກ\";}'),
(36, 'LINE_FOLLOW_MESSAGE', 'text', 'index', 0, 'สวัสดี คุณ :name นี่คือบัญชีทางการของ :title เราจะส่งข่าวสารถึงคุณผ่านช่องทางนี้', 'Hello, :name This is :title official account. We will send you news via this channel.', 'ສະບາຍດີ, :name ນີ້ແມ່ນບັນຊີທາງການຂອງ :title ພວກເຮົາຈະສົ່ງຂ່າວໃຫ້ທ່ານຜ່ານຊ່ອງທາງນີ້.'),
(37, 'LINE_REPLY_MESSAGE', 'text', 'index', 0, 'ขออภัยไม่สามารถตอบกลับข้อความนี้ได้', 'Sorry, can&#039;t reply to this message.', 'ຂໍອະໄພ, ບໍ່ສາມາດຕອບກັບຂໍ້ຄວາມນີ້ໄດ້.'),
(38, 'LOGIN_FIELDS', 'array', 'index', 0, 'a:4:{s:8:\"username\";s:30:\"ชื่อผู้ใช้\";s:5:\"email\";s:15:\"อีเมล\";s:5:\"phone\";s:39:\"เบอร์โทรศัพท์\";s:7:\"id_card\";s:30:\"เลขประชาชน\";}', 'a:4:{s:8:\"username\";s:8:\"Username\";s:5:\"email\";s:5:\"Email\";s:5:\"phone\";s:5:\"Phone\";s:7:\"id_card\";s:18:\"Identification No.\";}', 'a:4:{s:8:\"username\";s:27:\"ຊື່ຜູ້ໃຊ້\";s:5:\"email\";s:15:\"ອີເມວ\";s:5:\"phone\";s:30:\"ເບີໂທລະສັບ\";s:7:\"id_card\";s:39:\"ເລກບັດປະຈຳຕົວ\";}'),
(39, 'MAIL_PROGRAMS', 'array', 'index', 0, 'a:3:{i:0;s:43:\"ส่งจดหมายด้วย PHP\";i:1;s:72:\"ส่งจดหมายด้วย PHPMailer+SMTP (แนะนำ)\";i:2;s:58:\"ส่งจดหมายด้วย PHPMailer+PHP Mail\";}', 'a:3:{i:0;s:13:\"Send with PHP\";i:1;s:38:\"Send with PHPMailer+SMTP (recommended)\";i:2;s:28:\"Send with PHPMailer+PHP Mail\";}', 'a:3:{i:0;s:46:\"ສົ່ງຈົດໝາຍດ້ວຍ PHP\";i:1;s:75:\"ສົ່ງຈົດໝາຍດ້ວຍ PHPMailer+SMTP (ແນະນຳ)\";i:2;s:61:\"ສົ່ງຈົດໝາຍດ້ວຍ PHPMailer+PHP Mail\";}'),
(40, 'MONTH_LONG', 'array', 'index', 0, 'a:12:{i:1;s:18:\"มกราคม\";i:2;s:30:\"กุมภาพันธ์\";i:3;s:18:\"มีนาคม\";i:4;s:18:\"เมษายน\";i:5;s:21:\"พฤษภาคม\";i:6;s:24:\"มิถุนายน\";i:7;s:21:\"กรกฎาคม\";i:8;s:21:\"สิงหาคม\";i:9;s:21:\"กันยายน\";i:10;s:18:\"ตุลาคม\";i:11;s:27:\"พฤศจิกายน\";i:12;s:21:\"ธันวาคม\";}', 'a:12:{i:1;s:7:\"January\";i:2;s:8:\"February\";i:3;s:5:\"March\";i:4;s:5:\"April\";i:5;s:3:\"May\";i:6;s:4:\"June\";i:7;s:4:\"July\";i:8;s:6:\"August\";i:9;s:9:\"September\";i:10;s:7:\"October\";i:11;s:8:\"November\";i:12;s:8:\"December\";}', 'a:12:{i:1;s:18:\"ມັງກອນ\";i:2;s:15:\"ກຸມພາ\";i:3;s:12:\"ມີນາ\";i:4;s:12:\"ເມສາ\";i:5;s:21:\"ພຶດສະພາ\";i:6;s:18:\"ມິຖຸນາ\";i:7;s:21:\"ກໍລະກົດ\";i:8;s:15:\"ສິງຫາ\";i:9;s:15:\"ກັນຍາ\";i:10;s:12:\"ຕຸລາ\";i:11;s:15:\"ພະຈິກ\";i:12;s:15:\"ທັນວາ\";}'),
(41, 'MONTH_SHORT', 'array', 'index', 0, 'a:12:{i:1;s:8:\"ม.ค.\";i:2;s:8:\"ก.พ.\";i:3;s:11:\"มี.ค.\";i:4;s:11:\"เม.ย.\";i:5;s:8:\"พ.ค.\";i:6;s:11:\"มิ.ย.\";i:7;s:8:\"ก.ค.\";i:8;s:8:\"ส.ค.\";i:9;s:8:\"ก.ย.\";i:10;s:8:\"ต.ค.\";i:11;s:8:\"พ.ย.\";i:12;s:8:\"ธ.ค.\";}', 'a:12:{i:1;s:3:\"Jan\";i:2;s:3:\"Feb\";i:3;s:3:\"Mar\";i:4;s:3:\"Apr\";i:5;s:3:\"May\";i:6;s:3:\"Jun\";i:7;s:3:\"Jul\";i:8;s:3:\"Aug\";i:9;s:3:\"Sep\";i:10;s:3:\"Oct\";i:11;s:3:\"Nov\";i:12;s:3:\"Dec\";}', 'a:12:{i:1;s:8:\"ມ.ກ.\";i:2;s:8:\"ກ.ພ.\";i:3;s:11:\"ມີ.ນ.\";i:4;s:11:\"ເມ.ສ.\";i:5;s:8:\"ພ.ພ.\";i:6;s:11:\"ມິ.ນ.\";i:7;s:8:\"ກ.ກ.\";i:8;s:8:\"ສ.ຫ.\";i:9;s:8:\"ກ.ຍ.\";i:10;s:8:\"ຕ.ລ.\";i:11;s:8:\"ພ.ຈ.\";i:12;s:8:\"ທ.ວ.\";}'),
(42, 'Name', 'text', 'index', 0, 'ชื่อ นามสกุล', 'Name Surname', 'ຊື່ ນາມສະກຸນ'),
(43, 'PERMISSIONS', 'array', 'index', 0, 'a:2:{s:10:\"can_config\";s:60:\"สามารถตั้งค่าระบบได้\";s:22:\"can_view_usage_history\";s:93:\"สามารถดูประวัติการใช้งานระบบได้\";}', 'a:2:{s:10:\"can_config\";s:24:\"Can configure the system\";s:22:\"can_view_usage_history\";s:33:\"Able to view system usage history\";}', 'a:2:{s:10:\"can_config\";s:60:\"ສາມາດຕັ້ງຄ່າລະບົບໄດ້\";s:22:\"can_view_usage_history\";s:90:\"ສາມາດເບິ່ງປະຫວັດການນໍາໃຊ້ລະບົບ\";}'),
(44, 'PUBLISHEDS', 'array', 'index', 0, 'a:2:{i:0;s:45:\"ระงับการเผยแพร่\";i:1;s:21:\"เผยแพร่\";}', 'a:2:{i:0;s:11:\"Unpublished\";i:1;s:9:\"Published\";}', 'a:2:{i:0;s:45:\"ລະງັບການເຜີຍແຜ່\";i:1;s:21:\"ເຜີຍແຜ່\";}'),
(45, 'SEXES', 'array', 'index', 0, 'a:3:{s:1:\"u\";s:21:\"ไม่ระบุ\";s:1:\"f\";s:12:\"หญิง\";s:1:\"m\";s:9:\"ชาย\";}', 'a:3:{s:1:\"u\";s:13:\"Not specified\";s:1:\"f\";s:6:\"Female\";s:1:\"m\";s:4:\"Male\";}', 'a:3:{s:1:\"u\";s:30:\"ບໍ່ໄດ້ລະບຸ\";s:1:\"f\";s:9:\"ຍິງ\";s:1:\"m\";s:9:\"ຊາຍ\";}'),
(46, 'SMS_SENDER_COMMENT', 'text', 'index', 0, 'บาง Package อาจไม่สามารถกำหนดชื่อผู้ส่งได้ กรุณาตรวจสอบกับผู้ให้บริการ', 'Some packages may not be able to assign the sender name. Please check with the service provider.', 'ບາງແພັກເກັດອາດບໍ່ສາມາດມອບຊື່ຜູ້ສົ່ງໄດ້. ກະລຸນາກວດສອບກັບຜູ້ໃຫ້ບໍລິການ.'),
(47, 'SMTPSECURIES', 'array', 'index', 0, 'a:2:{s:0:\"\";s:57:\"การเชื่อมต่อแบบปกติ\";s:3:\"ssl\";s:72:\"การเชื่อมต่อที่ปลอดภัย (SSL)\";}', 'a:2:{s:0:\"\";s:10:\"Clear Text\";s:3:\"ssl\";s:38:\"Server using a secure connection (SSL)\";}', 'a:2:{s:0:\"\";s:66:\"ການເຊື່ອມຕໍ່ແບບປົກກະຕິ\";s:3:\"ssl\";s:66:\"ການເຊື່ອມຕໍ່ທີ່ປອດໄຟ (SSL)\";}'),
(48, 'THEME_WIDTH', 'array', 'index', 0, 'a:3:{s:7:\"default\";s:33:\"ค่าเริ่มต้น\";s:4:\"wide\";s:15:\"กว้าง\";s:9:\"fullwidth\";s:30:\"กว้างพิเศษ\";}', 'a:3:{s:7:\"default\";s:7:\"Default\";s:4:\"wide\";s:4:\"Wide\";s:9:\"fullwidth\";s:10:\"Extra wide\";}', 'a:3:{s:7:\"default\";s:36:\"ຄ່າເລີ່ມຕົ້ນ\";s:4:\"wide\";s:15:\"ກວ້າງ\";s:9:\"fullwidth\";s:30:\"ກວ້າງພິເສດ\";}'),
(49, 'TIME_FORMAT', 'text', 'index', 0, 'H:i น.', 'H:i', 'H:i'),
(50, 'YEAR_OFFSET', 'int', 'index', 0, '543', '0', '0'),
(51, ':name for new members Used when members need to specify', 'text', 'index', 0, ':name เริ่มต้นสำหรับสมาชิกใหม่ ใช้ในกรณีที่สมาชิกจำเป็นต้องระบุ', NULL, ':name ສໍາລັບສະມາຊິກໃຫມ່ ໃຊ້ໃນເວລາທີ່ສະມາຊິກຕ້ອງການກໍານົດ'),
(52, '0.0.0.0 mean all IP addresses', 'text', 'index', 0, '0.0.0.0 หมายถึงอนุญาตทั้งหมด', NULL, '0.0.0.0 ຫມາຍຄວາມວ່າອະນຸຍາດໃຫ້ທັງຫມົດ'),
(53, 'Accept all', 'text', 'index', 0, 'ยอมรับทั้งหมด', NULL, 'ຍອມຮັບທັງຫມົດ'),
(54, 'Accept member verification request', 'text', 'index', 0, 'ยอมรับคำขอยืนยันสมาชิก', NULL, 'ຍອມຮັບການຮ້ອງຂໍການຢັ້ງຢືນສະມາຊິກ'),
(55, 'Accept this agreement', 'text', 'index', 0, 'ยอมรับข้อตกลง', NULL, 'ຍອມຮັບຂໍ້ຕົກລົງ'),
(56, 'Add', 'text', 'index', 0, 'เพิ่ม', NULL, 'ເພີ່ມ'),
(57, 'Add Borrow', 'text', 'index', 0, 'ทำรายการยืม', NULL, 'ເຮັດລາຍະການຍືມ'),
(58, 'Add friend', 'text', 'index', 0, 'เพิ่มเพื่อน', NULL, 'ເພີ່ມເພື່ອນ'),
(59, 'Address', 'text', 'index', 0, 'ที่อยู่', NULL, 'ທີ່ຢູ່'),
(60, 'Address details', 'text', 'index', 0, 'รายละเอียดที่อยู่', NULL, 'ລາຍລະອຽດທີ່ຢູ່'),
(61, 'Administrator status It is of utmost importance to do everything', 'text', 'index', 0, 'สถานะผู้ดูแลระบบ มีความสำคัญสูงสุดสามารถทำได้ทุกอย่าง', NULL, 'ສະຖານະຜູ້ເບິ່ງແຍງລະບົບມີຄວາມສຳຄັນສຸງທີ່ສຸດສາມາດເຮັດໄດ້ທຸກຢ່າງ'),
(62, 'age', 'text', 'index', 0, 'อายุ', NULL, 'ອາຍຸ'),
(63, 'All :count entries, displayed :start to :end, page :page of :total pages', 'text', 'index', 0, 'ทั้งหมด :count รายการ, แสดง :start ถึง :end, หน้าที่ :page จากทั้งหมด :total หน้า', NULL, 'ທັງໝົດ :count ລາຍການ, ສະແດງ :start ເຖິງ :end, ໜ້າທີ່ :page ຈາກທັງໝົດ:total ໜ້າ'),
(64, 'all items', 'text', 'index', 0, 'ทั้งหมด', NULL, 'ທັງໝົດ'),
(65, 'Already registered The system has sent an OTP code to the number you registered. Please check the SMS and enter the code to confirm your phone number.', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อยแล้ว ระบบได้ส่งรหัส OTP ไปยังเบอร์ที่ท่านได้ลงทะเบียนไว้ กรุณาตรวจสอบ SMS แล้วให้นำรหัสมากรอกเพื่อเป็นการยืนยันเบอร์โทรศัพท์', NULL, 'ລົງ​ທະ​ບຽນ​ແລ້ວ ລະບົບໄດ້ສົ່ງລະຫັດ OTP ໄປຫາເບີໂທລະສັບທີ່ທ່ານລົງທະບຽນ, ກະລຸນາກວດເບິ່ງ SMS ແລະໃສ່ລະຫັດເພື່ອຢືນຢັນເບີໂທລະສັບຂອງທ່ານ.'),
(66, 'Always enabled', 'text', 'index', 0, 'เปิดใช้งานตลอดเวลา', NULL, 'ເປີດສະເໝີ'),
(67, 'anyone', 'text', 'index', 0, 'ใครก็ได้', NULL, 'ໃຜ'),
(68, 'API settings', 'text', 'index', 0, 'ตั้งค่า API', NULL, 'ຕັ້ງຄ່າ API'),
(69, 'Appointment date', 'text', 'index', 0, 'วันนัดรับ', NULL, 'ວັນນັດຫມາຍ'),
(70, 'Appraiser', 'text', 'index', 0, 'ประเมินราคา', NULL, 'ຕີລາຄາ'),
(71, 'Authentication require', 'text', 'index', 0, 'การตรวจสอบความถูกต้อง', NULL, 'ການກວດກາຄວາມຖືກຕ້ອງ'),
(72, 'Avatar', 'text', 'index', 0, 'รูปสมาชิก', NULL, 'ຮູບແທນຕົວ'),
(73, 'Background color', 'text', 'index', 0, 'สีพื้นหลัง', NULL, 'ສີພື້ນຫລັງ'),
(74, 'Background image', 'text', 'index', 0, 'รูปภาพพื้นหลัง', NULL, 'ພາບພື້ນຫລັງ'),
(75, 'Begin date', 'text', 'index', 0, 'วันที่เริ่มต้น', NULL, 'ວັນເລີ່ມຕົ້ນ'),
(76, 'Begin time', 'text', 'index', 0, 'เวลาเริ่มต้น', NULL, 'ເລີ່ມເວລາ'),
(77, 'Borrow', 'text', 'index', 0, 'ยืม', NULL, 'ຍືມ'),
(78, 'Borrowed date', 'text', 'index', 0, 'วันที่ยืม', NULL, 'ວັນທີ່ຍືມ'),
(79, 'Borrower', 'text', 'index', 0, 'ผู้ยืม', NULL, 'ຜູ້ຢືມ'),
(80, 'Browse file', 'text', 'index', 0, 'เลือกไฟล์', NULL, 'ເລືອກໄຟລ໌'),
(81, 'Browse image uploaded, type :type', 'text', 'index', 0, 'เลือกรูปภาพอัปโหลด ชนิด :type', NULL, 'ເລືອກຮູບພາບອັບໂຫຼດຊະນິດ :type'),
(82, 'Can be approve', 'text', 'index', 0, 'สามารถอนุมัติได้', NULL, 'ສາມາດອະນຸມັດ'),
(83, 'Can login', 'text', 'index', 0, 'สามารถเข้าระบบได้', NULL, 'ສາມາດເຂົ້າສູ່ລະບົບ'),
(84, 'Can manage borrow', 'text', 'index', 0, 'สามารถจัดการการยืม', NULL, 'ສາມາດຈັດການການຍືມ'),
(85, 'Can manage the', 'text', 'index', 0, 'สามารถจัดการ', NULL, 'ສາມາດຈັດການ'),
(86, 'Can manage the inventory', 'text', 'index', 0, 'สามารถจัดการคลังสินค้าได้', NULL, 'ສາມາດຈັດການຄັງສິນຄ້າໄດ້'),
(87, 'Can not be performed this request. Because they do not find the information you need or you are not allowed', 'text', 'index', 0, 'ไม่สามารถดำเนินการตามที่ร้องขอได้ เนื่องจากไม่พบข้อมูลที่ต้องการ หรือ คุณไม่มีสิทธิ์', NULL, 'ບໍ່ສາມາດດຳເນີນການຕາມທີ່ຮ້ອງຂໍໄດ້ເນື່ອງຈາກບໍ່ພົບຂໍ້ມູນທີ່ຕ້ອງການ ຫຼື ທ່ານບໍ່ມີສິດ'),
(88, 'Can&#039;t login', 'text', 'index', 0, 'ไม่สามารถเข้าระบบได้', NULL, 'ບໍ່ສາມາດເຂົ້າສູ່ລະບົບໄດ້'),
(89, 'Cancel', 'text', 'index', 0, 'ยกเลิก', NULL, 'ຍົກເລີກ'),
(90, 'Canceled successfully', 'text', 'index', 0, 'ยกเลิกเรียบร้อย', NULL, 'ຍົກເລີກສົບຜົນສໍາເລັດ'),
(91, 'Cannot use :name', 'text', 'index', 0, 'ไม่สามารถใช้ :name ได้', NULL, 'ບໍ່ສາມາດໃຊ້ :name'),
(92, 'Category', 'text', 'index', 0, 'หมวดหมู่', NULL, 'ຫມວດຫມູ່'),
(93, 'Change language', 'text', 'index', 0, 'สลับภาษา', NULL, 'ປ່ຽນພາສາ'),
(94, 'Click to edit', 'text', 'index', 0, 'คลิกเพื่อแก้ไข', NULL, 'ກົດເພື່ອແກ້ໄຂ'),
(95, 'Comment', 'text', 'index', 0, 'หมายเหตุ', NULL, 'ຫມາຍ​ເຫດ​'),
(96, 'Confirm password', 'text', 'index', 0, 'ยืนยันรหัสผ่าน', NULL, 'ຢືນຢັນລະຫັດຜ່ານ'),
(97, 'Congratulations, your email address has been verified. please login', 'text', 'index', 0, 'ยินดีด้วย ที่อยู่อีเมลของคุณได้รับการยืนยันเรียบร้อยแล้ว กรุณาเข้าสู่ระบบ', NULL, 'ຂໍສະແດງຄວາມຍິນດີ, ທີ່ຢູ່ອີເມວຂອງທ່ານໄດ້ຮັບການຢັ້ງຢືນແລ້ວ. ກະລຸນາເຂົ້າສູ່ລະບົບ'),
(98, 'Contact name', 'text', 'index', 0, 'ชื่อผู้จอง', NULL, 'ຕົວແທນການຈອງ'),
(99, 'Cookie Policy', 'text', 'index', 0, 'นโยบายคุกกี้', NULL, 'ນະໂຍບາຍຄຸກກີ'),
(100, 'COOKIE_NECESSARY_DETAILS', 'text', 'index', 0, 'คุกกี้พื้นฐาน จำเป็นต่อการใช้งานเว็บไซต์ ใช้เพื่อการรักษาความปลอดภัยและให้เว็บไซต์สามารถทำงานได้อย่างถูกต้อง', NULL, 'ຄຸກກີພື້ນຖານ ມີຄວາມຈໍາເປັນໃນການນໍາໃຊ້ເວັບໄຊທ໌ ມັນຖືກນໍາໃຊ້ເພື່ອຈຸດປະສົງຄວາມປອດໄພແລະເພື່ອໃຫ້ເວັບໄຊທ໌ເຮັດວຽກຢ່າງຖືກຕ້ອງ.'),
(101, 'COOKIE_POLICY_DETAILS', 'text', 'index', 0, 'เราใช้คุกกี้ (Cookies) หรือเทคโนโลยีที่คล้ายคลึงกันเท่าที่จำเป็น เพื่อใช้ในการเข้าถึงสินค้าหรือบริการ และติดตามการใช้งานของคุณเท่านั้น หากคุณไม่ต้องการให้มีคุกกี้ไว้ในคอมพิวเตอร์ของคุณ คุณสามารถตั้งค่าบราวเซอร์เพื่อปฏิเสธการจัดเก็บคุกกี้ก่อนที่จะใช้งานเว็บไซต์ หรือใช้โหมดไม่ระบุตัวตนเพื่อเข้าใช้งานเว็บไซต์ก็ได้', NULL, 'ພວກເຮົາໃຊ້ຄຸກກີ (Cookies) ຫຼືເຕັກໂນໂລຢີທີ່ຄ້າຍຄືກັນໃນຂອບເຂດທີ່ຈໍາເປັນ. ສໍາລັບການນໍາໃຊ້ໃນການເຂົ້າເຖິງສິນຄ້າຫຼືການບໍລິການ ແລະພຽງແຕ່ຕິດຕາມການນໍາໃຊ້ຂອງທ່ານ ຖ້າ​ຫາກ​ວ່າ​ທ່ານ​ບໍ່​ຕ້ອງ​ການ cookies ໃນ​ຄອມ​ພິວ​ເຕີ​ຂອງ​ທ່ານ​ ທ່ານສາມາດຕັ້ງຕົວທ່ອງເວັບຂອງທ່ານເພື່ອປະຕິເສດການເກັບຮັກສາ cookies. ກ່ອນທີ່ຈະນໍາໃຊ້ເວັບໄຊທ໌ ທ່ານຍັງສາມາດໃຊ້ໂໝດບໍ່ເປີດເຜີຍຕົວຕົນເພື່ອເຂົ້າຫາເວັບໄຊທ໌ໄດ້.'),
(102, 'Cost', 'text', 'index', 0, 'ค่าใช้จ่าย', NULL, 'ຄ່າໃຊ້ຈ່າຍ'),
(103, 'Country', 'text', 'index', 0, 'ประเทศ', NULL, 'ປະເທດ'),
(104, 'Create', 'text', 'index', 0, 'สร้าง', NULL, 'ສ້າງ'),
(105, 'Create new account', 'text', 'index', 0, 'สร้างบัญชีใหม่', NULL, 'ສ້າງບັນຊີໃໝ່'),
(106, 'Created', 'text', 'index', 0, 'สร้างเมื่อ', NULL, 'ສ້າງເມື່ອ'),
(107, 'Customer', 'text', 'index', 0, 'ลูกค้า', NULL, 'ລູກຄ້າ'),
(108, 'Customer Name', 'text', 'index', 0, 'ชื่อลูกค้า', NULL, 'ຊື່ລູກຄ້າ'),
(109, 'Dark mode', 'text', 'index', 0, 'โหมดมืด', NULL, 'ໂໝດມືດ'),
(110, 'Data controller', 'text', 'index', 0, 'ผู้ควบคุม/ใช้ ข้อมูล', NULL, 'ຜູ້​ຄວບ​ຄຸມຂໍ້ມູນ'),
(111, 'Date', 'text', 'index', 0, 'วันที่', NULL, 'ວັນທີ'),
(112, 'Date of return', 'text', 'index', 0, 'กำหนดคืน', NULL, 'ຕັ້ງຄືນ'),
(113, 'days', 'text', 'index', 0, 'วัน', NULL, 'ມື້'),
(114, 'Delete', 'text', 'index', 0, 'ลบ', NULL, 'ລືບ'),
(115, 'Delivery', 'text', 'index', 0, 'ส่งมอบ', NULL, 'ສົ່ງມອບ'),
(116, 'Demo Mode', 'text', 'index', 0, 'โหมดตัวอย่าง', NULL, 'ຕົວຢ່າງ'),
(117, 'Department', 'text', 'index', 0, 'แผนก', NULL, 'ຜະແນກ'),
(118, 'Description', 'text', 'index', 0, 'คำอธิบาย', NULL, 'ຄຳອະທິບາຍ'),
(119, 'Detail', 'text', 'index', 0, 'รายละเอียด', NULL, 'ລາຍະລະອຽດ'),
(120, 'Details of', 'text', 'index', 0, 'รายละเอียดของ', NULL, 'ລາຍລະອຽດຂອງ'),
(121, 'Didn&#039;t receive code?', 'text', 'index', 0, 'ไม่ได้รับโค้ด?', NULL, 'ບໍ່ໄດ້ຮັບລະຫັດບໍ?'),
(122, 'Do not want', 'text', 'index', 0, 'ไม่ต้องการ', NULL, 'ບໍ່ຕ້ອງການ'),
(123, 'Drag and drop to reorder', 'text', 'index', 0, 'ลากและวางเพื่อจัดลำดับใหม่', NULL, 'ລາກແລ້ວວາງລົງເພື່ອຈັດຮຽງໃໝ່'),
(124, 'Edit', 'text', 'index', 0, 'แก้ไข', NULL, 'ແກ້ໄຂ'),
(125, 'Editing your account', 'text', 'index', 0, 'แก้ไขข้อมูลส่วนตัว', NULL, 'ແກ້ໄຂຂໍ້ມູນສ່ວນຕົວສະມາຊິກ'),
(126, 'Email', 'text', 'index', 0, 'อีเมล', NULL, 'ອີເມວ'),
(127, 'Email address used for login or request a new password', 'text', 'index', 0, 'ที่อยู่อีเมล ใช้สำหรับการเข้าระบบหรือการขอรหัสผ่านใหม่', NULL, 'ທີ່ຢູ່ອີເມວໃຊ້ສຳລັບການເຂົ້າລະບົບຫຼືການຂໍລະຫັດໃໝ່'),
(128, 'Email address verification', 'text', 'index', 0, 'ยืนยันที่อยู่อีเมล', NULL, 'ຢືນຢັນທີ່ຢູ່ອີເມວ'),
(129, 'Email addresses for sender and do not reply such as no-reply@domain.tld', 'text', 'index', 0, 'ทีอยู่อีเมลใช้เป็นผู้ส่งจดหมาย สำหรับจดหมายที่ไม่ต้องการตอบกลับ เช่น no-reply@domain.tld', NULL, 'ທີ່ຢູ່ອີເມວໃຊ້ເປັນຜູ້ສົ່ງຈົດໝາຍ ສຳລັບຈົດໝາຍທີ່ບໍ່ຕ້ອງການຕອບກັບເຊັ່ນ no-reply@domain.tld'),
(130, 'Email encoding', 'text', 'index', 0, 'รหัสภาษาของจดหมาย', NULL, 'ລະຫັດພາສາຂອງຈົດໝາຍ'),
(131, 'Email settings', 'text', 'index', 0, 'ตั้งค่าอีเมล', NULL, 'ຕັ້ງຄ່າອີເມວ'),
(132, 'Email the relevant person', 'text', 'index', 0, 'ส่งอีเมลแจ้งผู้ที่เกี่ยวข้องด้วย', NULL, 'ສົ່ງອີເມວຫາບຸກຄົນທີ່ກ່ຽວຂ້ອງ.'),
(133, 'Email was not verified', 'text', 'index', 0, 'ยังไม่ได้ยืนยันอีเมล', NULL, 'ອີເມວບໍ່ໄດ້ຖືກຢືນຢັນ'),
(134, 'Enable SSL encryption for sending email', 'text', 'index', 0, 'เปิดใช้งานการเข้ารหัส SSL สำหรับการส่งอีเมล', NULL, 'ເປີດໃຊ້ການເຂົ້າລະຫັດ SSL ສຳລັບການສົ່ງອີເມວ'),
(135, 'End date', 'text', 'index', 0, 'วันที่สิ้นสุด', NULL, 'ວັນສິ້ນສຸດ'),
(136, 'End date must be greater than begin date', 'text', 'index', 0, 'วันที่สิ้นสุดต้องมากกว่าวันที่เริ่มต้น', NULL, 'ວັນສິ້ນສຸດຕ້ອງຫຼາຍກວ່າວັນທີເລີ່ມຕົ້ນ.'),
(137, 'End time', 'text', 'index', 0, 'เวลาสิ้นสุด', NULL, 'ເວລາສິ້ນສຸດ'),
(138, 'English lowercase letters and numbers, not less than 6 digits', 'text', 'index', 0, 'ภาษาอังกฤษตัวพิมพ์เล็กและตัวเลข ไม่น้อยกว่า 6 หลัก', NULL, 'ໂຕພິມນ້ອຍພາສາອັງກິດ ແລະຕົວເລກ, ບໍ່ຕໍ່າກວ່າ 6 ຕົວເລກ'),
(139, 'Enter the 4-digit verification code that was sent to your phone number.', 'text', 'index', 0, 'ป้อนรหัสยืนยัน 4 หลักที่ส่งไปยังหมายเลขโทรศัพท์ของคุณ', NULL, 'ໃສ່ລະຫັດຢືນຢັນ 4 ຕົວເລກທີ່ສົ່ງໄປຫາເບີໂທລະສັບຂອງທ່ານ.'),
(140, 'Enter the domain name you want to allow or enter * for all domains. or leave it blank if you want to use it on this domain only', 'text', 'index', 0, 'กรอกชื่อโดเมนที่ต้องการอนุญาต หรือกรอก * สำหรับทุกโดเมน หรือเว้นว่างไว้ถ้าต้องการให้ใช้งานได้บนโดเมนนี้เท่านั้น', NULL, 'ໃສ່ຊື່ໂດເມນທີ່ທ່ານຕ້ອງການທີ່ຈະອະນຸຍາດໃຫ້ຫຼືໃສ່ * ສໍາລັບໂດເມນທັງຫມົດ. ຫຼືປ່ອຍໃຫ້ມັນຫວ່າງຖ້າທ່ານຕ້ອງການໃຊ້ມັນຢູ່ໃນໂດເມນນີ້ເທົ່ານັ້ນ'),
(141, 'Enter the email address registered. A new password will be sent to this email address.', 'text', 'index', 0, 'กรอกที่อยู่อีเมลที่ลงทะเบียนไว้ ระบบจะส่งรหัสผ่านใหม่ไปยังที่อยู่อีเมลนี้', NULL, 'ເພີ່ມທີ່ຢູ່ອີເມວທີ່ລົງທະບຽນໄວ້ ລະບົບຈະສົ່ງລະຫັດຜ່ານໃໝ່ໄປຍັງທີ່ຢູ່ອີເມວນີ້'),
(142, 'Enter the LINE user ID you received when adding friends. Or type userId sent to the official account to request a new user ID. This information is used for receiving private messages from the system via LINE.', 'text', 'index', 0, 'กรอก user ID ของไลน์ที่ได้ตอนเพิ่มเพื่อน หรือพิมพ์คำว่า userId ส่งไปยังบัญชีทางการเพื่อขอ user ID ใหม่ ข้อมูลนี้ใช้สำหรับการรับข้อความส่วนตัวที่มาจากระบบผ่านไลน์', NULL, 'ໃສ່ user ID ຂອງ LINE ທີ່ທ່ານໄດ້ຮັບໃນເວລາເພີ່ມເພື່ອນ. ຫຼືພິມ userId ທີ່ຖືກສົ່ງໄປຫາບັນຊີທາງການເພື່ອຮ້ອງຂໍ user ID ໃຫມ່. ຂໍ້ມູນນີ້ແມ່ນໃຊ້ສໍາລັບການຮັບຂໍ້ຄວາມສ່ວນຕົວຈາກລະບົບຜ່ານ LINE.'),
(143, 'Enter your password again', 'text', 'index', 0, 'กรอกรหัสผ่านของคุณอีกครั้ง', NULL, 'ໃສ່ລະຫັດຜ່ານຂອງທ່ານອີກຄັ້ງ'),
(144, 'Enter your registered username. A new password will be sent to this username.', 'text', 'index', 0, 'กรอกชื่อผู้ใช้ที่ลงทะเบียนไว้ ระบบจะส่งรหัสผ่านใหม่ไปยังชื่อผู้ใช้นี้', NULL, 'ໃສ່ຊື່ຜູ້ໃຊ້ທີ່ລົງທະບຽນຂອງທ່ານ. ລະຫັດຜ່ານໃໝ່ຈະຖືກສົ່ງໄປຫາຊື່ຜູ້ໃຊ້ນີ້'),
(145, 'entries', 'text', 'index', 0, 'รายการ', NULL, 'ລາຍການ'),
(146, 'Equipment', 'text', 'index', 0, 'พัสดุ', NULL, 'ພັສດຸ'),
(147, 'Expiration date', 'text', 'index', 0, 'วันหมดอายุ', NULL, 'ວັນໝົດອາຍຸ'),
(148, 'Fax', 'text', 'index', 0, 'โทรสาร', NULL, 'ແຟັກ'),
(149, 'File', 'text', 'index', 0, 'ไฟล์', NULL, 'ແຟ້ມ'),
(150, 'Fill some of the :name to find', 'text', 'index', 0, 'กรอกบางส่วนของ :name เพื่อค้นหา', NULL, 'ຕື່ມຂໍ້ມູນໃສ່ບາງສ່ວນຂອງ :name ເພື່ອຄົ້ນຫາ'),
(151, 'Find equipment by', 'text', 'index', 0, 'ค้นหาพัสดุโดย', NULL, 'ຄົ້ນຫາພັສດຸຈາກ'),
(152, 'Footer', 'text', 'index', 0, 'ส่วนท้าย', NULL, 'ສ່ວນທ້າຍ'),
(153, 'for login by LINE account', 'text', 'index', 0, 'สำหรับการเข้าระบบโดยบัญชีไลน์', NULL, 'ສໍາລັບການເຂົ້າສູ່ລະບົບດ້ວຍບັນຊີ LINE'),
(154, 'Forgot', 'text', 'index', 0, 'ลืมรหัสผ่าน', NULL, 'ລືມລະຫັດຜ່ານ'),
(155, 'from', 'text', 'index', 0, 'จาก', NULL, 'ຈາກ'),
(156, 'General', 'text', 'index', 0, 'ทั่วไป', NULL, 'ທົ່ວໄປ'),
(157, 'General site settings', 'text', 'index', 0, 'ตั้งค่าพื้นฐานของเว็บไซต์', NULL, 'ຕັ້ງຄ່າພື້ນຖານຂອງເວັບໄຊ'),
(158, 'Get new password', 'text', 'index', 0, 'ขอรหัสผ่าน', NULL, 'ຂໍລະຫັດຜ່ານ'),
(159, 'go to page', 'text', 'index', 0, 'ไปหน้าที่', NULL, 'ໄປທີ່ໜ້າ'),
(160, 'Header', 'text', 'index', 0, 'ส่วนหัว', NULL, 'ສ່ວນຫົວ'),
(161, 'Home', 'text', 'index', 0, 'หน้าหลัก', NULL, 'ໜ້າຫຼັກ'),
(162, 'How to define user authentication for mail servers. If you enable it, you must configure below correctly.', 'text', 'index', 0, 'กำหนดวิธีการตรวจสอบผู้ใช้สำหรับเมล์เซิร์ฟเวอร์ หากคุณเปิดใช้งานคุณต้องกำหนดค่าต่างๆด้านล่างถูกต้อง', NULL, 'ກຳນົດວິທີການກວດສອບຜູ້ໃຊ້ສຳລັບເມນເຊິບເວີຫາກທ່ານເປີດໃຊ້ການທ່ານຕ້ອງກຳນົດຄ່າຕ່າງໆດ້ານລຸ່ມຖືກຕ້ອງ'),
(163, 'Identification No.', 'text', 'index', 0, 'เลขประชาชน', NULL, 'ເລກບັດປະຈຳຕົວ'),
(164, 'Image', 'text', 'index', 0, 'รูปภาพ', NULL, 'ຮູບພາບ'),
(165, 'Image size is in pixels', 'text', 'index', 0, 'ขนาดของรูปภาพเป็นพิกเซล', NULL, 'ຂະໜາດຂອງຮູບພາບເປັນພິກເຊວ'),
(166, 'Import', 'text', 'index', 0, 'นำเข้า', NULL, 'ນຳເຂົ້າ'),
(167, 'Installed modules', 'text', 'index', 0, 'โมดูลที่ติดตั้งแล้ว', NULL, 'ໂມດູນທີ່ຕິດຕັ້ງ'),
(168, 'Invalid :name', 'text', 'index', 0, ':name ไม่ถูกต้อง', NULL, ':name ບໍ່ຖືກຕ້ອງ'),
(169, 'Job today', 'text', 'index', 0, 'งานซ่อมวันนี้', NULL, 'ວຽກຊ່ອມວັນນີ້'),
(170, 'Key', 'text', 'index', 0, 'คีย์', NULL, 'ແປ້ນພີມ'),
(171, 'Language', 'text', 'index', 0, 'ภาษา', NULL, 'ພາສາ'),
(172, 'Leave empty for generate auto', 'text', 'index', 0, 'เว้นว่างไว้เพื่อสร้างโดยอัตโนมัติ', NULL, 'ປ່ອຍຫວ່າງໄວ້ເພື່ອສ້າງອັດໂນມັດ'),
(173, 'LINE official account (with @ prefix, e.g. @xxxx)', 'text', 'index', 0, 'บัญชีทางการของไลน์ (มี @ นำหน้า เช่น @xxxx)', NULL, 'ບັນຊີທາງການຂອງ LINE (ມີ @ ຄໍານໍາຫນ້າ, ເຊັ່ນ: @xxxx)'),
(174, 'LINE settings', 'text', 'index', 0, 'ตั้งค่าไลน์', NULL, 'ຕັ້ງ​ຄ່າ LINE'),
(175, 'List of', 'text', 'index', 0, 'รายการ', NULL, 'ລາຍການ'),
(176, 'List of IPs that allow connection 1 line per 1 IP', 'text', 'index', 0, 'รายการไอพีแอดเดรสทั้งหมดที่อนุญาต 1 บรรทัดต่อ 1 ไอพี', NULL, 'ລາຍຊື່ IP ທີ່ອະນຸຍາດໃຫ້ເຊື່ອມຕໍ່ 1 ເສັ້ນຕໍ່ 1 IP'),
(177, 'Local time', 'text', 'index', 0, 'เวลาท้องถิ่น', NULL, 'ເວລາທ້ອງຖິ່ນ'),
(178, 'Login', 'text', 'index', 0, 'เข้าสู่ระบบ', NULL, 'ເຂົ້າສູ່ລະບົບ'),
(179, 'Login as', 'text', 'index', 0, 'เข้าระบบเป็น', NULL, 'ເຂົ້າ​ສູ່​ລະ​ບົບ​ເປັນ'),
(180, 'Login by', 'text', 'index', 0, 'เข้าระบบโดย', NULL, 'ເຂົ້າສູ່ລະບົບໂດຍ'),
(181, 'Login information', 'text', 'index', 0, 'ข้อมูลการเข้าระบบ', NULL, 'ຂໍ້ມູນການເຂົ້າລະບົບ'),
(182, 'Login page', 'text', 'index', 0, 'หน้าเข้าสู่ระบบ', NULL, 'ໜ້າເຂົ້າສູ່ລະບົບ'),
(183, 'Login with an existing account', 'text', 'index', 0, 'เข้าระบบด้วยบัญชีสมาชิกที่มีอยู่แล้ว', NULL, 'ເຂົ້າລະບົບດ້ວຍບັນຊີສະມາຊິກທີ່ມີຢູ່ແລ້ວ'),
(184, 'Logo', 'text', 'index', 0, 'โลโก', NULL, 'ໂລໂກ'),
(185, 'Logout', 'text', 'index', 0, 'ออกจากระบบ', NULL, 'ອອກຈາກລະບົບ'),
(186, 'Logout successful', 'text', 'index', 0, 'ออกจากระบบเรียบร้อย', NULL, 'ອອກຈາກລະບົບຮຽບຮ້ອຍ'),
(187, 'Mail program', 'text', 'index', 0, 'โปรแกรมส่งอีเมล', NULL, 'ໂປຮແກຮມສົ່ງອີເມວ'),
(188, 'Mail server', 'text', 'index', 0, 'เซิร์ฟเวอร์อีเมล', NULL, 'ເຊີບເວີອີເມວ'),
(189, 'Mail server port number (default is 25, for GMail used 465, 587 for DirectAdmin).', 'text', 'index', 0, 'หมายเลขพอร์ตของเมล์เซิร์ฟเวอร์ (ค่าปกติคือ 25, สำหรับ gmail ใช้ 465, 587 สำหรับ DirectAdmin)', NULL, 'ໝາຍເລກພອດຂອງເມວເຊີບເວີ(ຄ່າປົກກະຕິຄື 25, ສຳລັບ gmail ໃຊ້ 465, 587 ສຳລັບ DirectAdmin)'),
(190, 'Mail server settings', 'text', 'index', 0, 'ค่ากำหนดของเมล์เซิร์ฟเวอร์', NULL, 'ຄ່າກຳນົດຂອງເມວເຊີບເວີ'),
(191, 'Manage languages', 'text', 'index', 0, 'จัดการภาษา', NULL, 'ຈັດການພາສາ'),
(192, 'Member list', 'text', 'index', 0, 'รายชื่อสมาชิก', NULL, 'ລາຍຊື່ສະມາຊິກ'),
(193, 'Member status', 'text', 'index', 0, 'สถานะสมาชิก', NULL, 'ສະຖານະສະມາຊິກ'),
(194, 'Membership has not been confirmed yet.', 'text', 'index', 0, 'ยังไม่ได้ยืนยันสมาชิก', NULL, 'ສະມາຊິກຍັງບໍ່ທັນໄດ້ຮັບການຢືນຢັນ'),
(195, 'Message', 'text', 'index', 0, 'ข้อความ', NULL, 'ຂໍ້ຄວາມ'),
(196, 'Message displayed on login page', 'text', 'index', 0, 'ข้อความแสดงในหน้าเข้าสู่ระบบ', NULL, 'ຂໍ້ຄວາມສະແດງຢູ່ໃນຫນ້າເຂົ້າສູ່ລະບົບ'),
(197, 'Mobile Phone Verification', 'text', 'index', 0, 'ยืนยันหมายเลขโทรศัพท์', NULL, 'ຢືນຢັນເບີໂທລະສັບ'),
(198, 'Model', 'text', 'index', 0, 'ยี่ห้อ', NULL, 'ຍີ່ຫໍ້'),
(199, 'Module', 'text', 'index', 0, 'โมดูล', NULL, 'ໂມດູນ'),
(200, 'Module settings', 'text', 'index', 0, 'ตั้งค่าโมดูล', NULL, 'ຕັ້ງຄ່າໂມດູນ'),
(201, 'month', 'text', 'index', 0, 'เดือน', NULL, 'ເດືອນ'),
(202, 'My Borrow', 'text', 'index', 0, 'รายการยืมของฉัน', NULL, 'ລາຍະການຍືມຂອງຂ້ອຍ'),
(203, 'Necessary cookies', 'text', 'index', 0, 'คุกกี้พื้นฐานที่จำเป็น', NULL, 'ຄຸກກີພື້ນຖານທີ່ຈໍາເປັນ'),
(204, 'New members', 'text', 'index', 0, 'สมาชิกใหม่', NULL, 'ສະມາຊິກໃໝ່'),
(205, 'no larger than :size', 'text', 'index', 0, 'ขนาดไม่เกิน :size', NULL, 'ຂະໜາດບໍ່ເກີນ :size'),
(206, 'No need to fill in English text. If the English text matches the Key', 'text', 'index', 0, 'ไม่จำเป็นต้องกรอกข้อความในภาษาอังกฤษ หากข้อความในภาษาอังกฤษตรงกับคีย์', NULL, 'ບໍ່ຈຳເປັນເພີ່ມຂໍ້ຄວາມໃນພາສາອັງກິດຫາກຂໍ້ຄວາມໃນພາສານອັງກົງກັບແປ້ນພີມ'),
(207, 'not a registered user', 'text', 'index', 0, 'ไม่พบสมาชิกนี้ลงทะเบียนไว้', NULL, 'ບໍ່ພົບສະມາຊິກນີ້ລົງທະບຽນໄວ້'),
(208, 'Not specified', 'text', 'index', 0, 'ไม่ระบุ', NULL, 'ບໍ່ໄດ້ກໍານົດ'),
(209, 'Note or additional notes', 'text', 'index', 0, 'คำอธิบายหรือหมายเหตุเพิ่มเติม', NULL, 'ຄໍາອະທິບາຍຫລືຫມາຍເຫດເພີ່ມເຕີມ'),
(210, 'Number such as %04d (%04d means 4 digits, maximum 11 digits)', 'text', 'index', 0, 'เลขที่ เช่น %04d (%04d หมายถึง ตัวเลข 4 หลัก สูงสุด 11 หลัก)', NULL, 'ຕົວເລກເຊັ່ນ %04d (%04d ຫມາຍຄວາມວ່າ 4 ຕົວເລກ, ສູງສຸດ 11 ຕົວເລກ)'),
(211, 'Other', 'text', 'index', 0, 'อื่นๆ', NULL, 'ອື່ນໆ'),
(212, 'OTP is invalid or expired. Please request a new OTP.', 'text', 'index', 0, 'OTP ไม่ถูกต้องหรือหมดอายุ กรุณาขอ OTP ใหม่', NULL, 'OTP ບໍ່ຖືກຕ້ອງ ຫຼືໝົດອາຍຸ ກະລຸນາຮ້ອງຂໍ OTP ໃໝ່.'),
(213, 'Page details', 'text', 'index', 0, 'รายละเอียดของหน้า', NULL, 'ລາຍລະອຽດຂອງໜ້າ'),
(214, 'Password', 'text', 'index', 0, 'รหัสผ่าน', NULL, 'ລະຫັດຜ່ານ'),
(215, 'Password of the mail server. (To change the fill.)', 'text', 'index', 0, 'รหัสผ่านของเมล์เซิร์ฟเวอร์ (ต้องการเปลี่ยน ให้กรอก)', NULL, 'ລະຫັດຜ່ານຂອງເມວເຊີບເວີ (ຕ້ອງການປ່ຽນ ໃຫ້ເພີ່ມ)'),
(216, 'Passwords must be at least four characters', 'text', 'index', 0, 'รหัสผ่านต้องไม่น้อยกว่า 4 ตัวอักษร', NULL, 'ລະຫັດຜ່ານຕ້ອງບໍ່ຕ່ຳກວ່າ 4 ຕົວອັກສອນ'),
(217, 'Permission', 'text', 'index', 0, 'สิทธิ์การใช้งาน', NULL, 'ສິດໃນການໃຊ້ວຽກ'),
(218, 'persons', 'text', 'index', 0, 'ท่าน', NULL, 'ຄົນ'),
(219, 'Phone', 'text', 'index', 0, 'โทรศัพท์', NULL, 'ເບີໂທລະສັບ'),
(220, 'Please check the new member registration.', 'text', 'index', 0, 'กรุณาตรวจสอบการลงทะเบียนสมาชิกใหม่', NULL, 'ກະລຸນາກວດສອບການລົງທະບຽນສະມາຊິກໃໝ່.'),
(221, 'Please click the link to verify your email address.', 'text', 'index', 0, 'กรุณาคลิกลิงค์เพื่อยืนยันที่อยู่อีเมล', NULL, 'ກະລຸນາຄລິກທີ່ລິ້ງເພື່ອຢືນຢັນທີ່ຢູ່ອີເມວຂອງທ່ານ'),
(222, 'Please fill in', 'text', 'index', 0, 'กรุณากรอก', NULL, 'ກະລຸນາຕື່ມຂໍ້ມູນໃສ່'),
(223, 'Please fill up this form', 'text', 'index', 0, 'กรุณากรอกแบบฟอร์มนี้', NULL, 'ກະລຸນາຕື່ມແບບຟອມນີ້'),
(224, 'Please login', 'text', 'index', 0, 'กรุณาเข้าระบบ', NULL, 'ກະລຸນາເຂົ້າສູ່ລະບົບ'),
(225, 'Please select', 'text', 'index', 0, 'กรุณาเลือก', NULL, 'ກະລຸນາເລືອກ'),
(226, 'Please select :name at least one item', 'text', 'index', 0, 'กรุณาเลือก :name อย่างน้อย 1 รายการ', NULL, 'ກະລຸນາເລືອກ :name ຢ່າງໜ້ອຍ 1 ລາຍການ'),
(227, 'Please select from the search results', 'text', 'index', 0, 'กรุณาเลือกจากผลการค้นหา', NULL, 'ກະລຸນາເລືອກຈາກຜົນການຄົ້ນຫາ'),
(228, 'Port', 'text', 'index', 0, 'พอร์ต', NULL, 'ພອດ'),
(229, 'Prefix', 'text', 'index', 0, 'คำนำหน้า', NULL, 'ຄຳນຳໜ້າ'),
(230, 'Prefix, if changed The number will be counted again. You can enter %Y%M (year, month).', 'text', 'index', 0, 'คำนำหน้า ถ้ามีการเปลี่ยนแปลง เลขที่จะนับหนึ่งใหม่ สามารถใส่ %Y%M (ปี, เดือน) ได้', NULL, 'ຄໍານໍາຫນ້າ, ຖ້າມີການປ່ຽນແປງ ຕົວເລກທີ່ຈະນັບອີກຄັ້ງສາມາດໃສ່ເປັນ %Y%M (ປີ, ເດືອນ).'),
(231, 'Privacy Policy', 'text', 'index', 0, 'นโยบายความเป็นส่วนตัว', NULL, 'ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ'),
(232, 'Product code', 'text', 'index', 0, 'รหัสสินค้า', NULL, 'ລະຫັດສິນຄ້າ'),
(233, 'Profile', 'text', 'index', 0, 'ข้อมูลส่วนตัว', NULL, 'ຂໍ້ມູນສ່ວນຕົວ'),
(234, 'Province', 'text', 'index', 0, 'จังหวัด', NULL, 'ແຂວງ'),
(235, 'Quantity', 'text', 'index', 0, 'จำนวน', NULL, 'ຈໍານວນ'),
(236, 'Reason', 'text', 'index', 0, 'เหตุผล', NULL, 'ເຫດ​ຜົນ'),
(237, 'Register', 'text', 'index', 0, 'สมัครสมาชิก', NULL, 'ສະໝັກສະມາຊິກ'),
(238, 'Register successfully Please log in', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อยแล้วกรุณาเข้าสู่ระบบ', NULL, 'ລົງທະບຽນຢ່າງສຳເລັດຜົນກະລຸນາເຂົ້າສູ່ລະບົບ'),
(239, 'Register successfully, We have sent complete registration information to :email', 'text', 'index', 0, 'ลงทะเบียนสมาชิกใหม่เรียบร้อย เราได้ส่งข้อมูลการลงทะเบียนไปยัง :email', NULL, 'ລົງທະບຽນສຳເລັດແລ້ວ ເຮົາໄດ້ສົ່ງຂໍ້ມູນການລົງທະບຽນໄປທີ່ :email'),
(240, 'Registered successfully Please check your email :email and click the link to verify your email.', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อย กรุณาตรวจสอบอีเมล์ :email และคลิงลิงค์ยืนยันอีเมล', NULL, 'ລົງທະບຽນສົບຜົນສໍາເລັດ ກະ​ລຸ​ນາ​ກວດ​ສອບ​ອີ​ເມວ​ຂອງ​ທ່ານ :email ແລະ​ຄລິກ​ໃສ່​ການ​ເຊື່ອມ​ຕໍ່​ເພື່ອ​ກວດ​ສອບ​ອີ​ເມວ​ຂອງ​ທ່ານ​.'),
(241, 'Remain', 'text', 'index', 0, 'คงเหลือ', NULL, 'ຄົງເຫລືອ'),
(242, 'Remember me', 'text', 'index', 0, 'จำการเข้าระบบ', NULL, 'ຈົດຈຳການເຂົ້າລະບົບ'),
(243, 'Remove', 'text', 'index', 0, 'ลบ', NULL, 'ລຶບ'),
(244, 'Report', 'text', 'index', 0, 'รายงาน', NULL, 'ບົດລາຍງານ'),
(245, 'Resend', 'text', 'index', 0, 'ส่งใหม่', NULL, 'ສົ່ງຄືນ'),
(246, 'resized automatically', 'text', 'index', 0, 'ปรับขนาดอัตโนมัติ', NULL, 'ປັບຂະໜາດອັດຕະໂນມັດ'),
(247, 'Return', 'text', 'index', 0, 'คืน', NULL, 'ຄືນ'),
(248, 'Returned', 'text', 'index', 0, 'ส่งคืน', NULL, 'ສົ່ງຄືນ'),
(249, 'Save', 'text', 'index', 0, 'บันทึก', NULL, 'ບັນທຶກ'),
(250, 'Save and email completed', 'text', 'index', 0, 'บันทึกและส่งอีเมลเรียบร้อย', NULL, 'ບັນທຶກແລະສົ່ງອີເມວຮຽນຮ້ອຍ'),
(251, 'Saved successfully', 'text', 'index', 0, 'บันทึกเรียบร้อย', NULL, 'ບັນທຶກຮຽບຮ້ອຍ'),
(252, 'scroll to top', 'text', 'index', 0, 'เลื่อนขึ้นด้านบน', NULL, 'ເລື່ອນຂື້ນດ້ານເທິງ'),
(253, 'Search', 'text', 'index', 0, 'ค้นหา', NULL, 'ຄົ້ນຫາ'),
(254, 'Search <strong>:search</strong> found :count entries, displayed :start to :end, page :page of :total pages', 'text', 'index', 0, 'ค้นหา <strong>:search</strong> พบ :count รายการ แสดงรายการที่ :start - :end หน้าที่ :page จากทั้งหมด :total หน้า', NULL, 'ຄົ້ນຫາ <strong>:search</strong> ພົບ :count ລາຍການ ສະແດງລາຍການທີ່:start - :end ໜ້າທີ່:page ຈາກທັງໝົດ :total ໜ້າ'),
(255, 'Search for equipment and then choose from the list', 'text', 'index', 0, 'ค้นหาพัสดุ แล้วเลือกจากรายการ', NULL, 'ຄົ້ນຫາພັສດຸແລ້ວເລືອກຈາກລາຍະການ'),
(256, 'Send a new password request', 'text', 'index', 0, 'ส่งคำขอ ขอรหัสผ่านใหม่', NULL, 'ສົ່ງຄໍາຮ້ອງຂໍຮ້ອງຂໍລະຫັດຜ່ານໃຫມ່'),
(257, 'Send a welcome email to new members', 'text', 'index', 0, 'ส่งข้อความต้อนรับสมาชิกใหม่', NULL, 'ສົ່ງອີເມວຕ້ອນຮັບກັບສະມາຊິກໃຫມ່'),
(258, 'Send again in', 'text', 'index', 0, 'ส่งใหม่ในอีก', NULL, 'ສົ່ງຄືນໃນເວລາອື່ນ'),
(259, 'Send login approval notification', 'text', 'index', 0, 'ส่งแจ้งเตือนอนุมัติการเข้าระบบ', NULL, 'ສົ່ງການແຈ້ງເຕືອນການອະນຸມັດການເຂົ້າສູ່ລະບົບ'),
(260, 'Send login authorization email', 'text', 'index', 0, 'ส่งอีเมลอนุมัติการเข้าระบบ', NULL, 'ສົ່ງອີເມວການອະນຸຍາດເຂົ້າສູ່ລະບົບ'),
(261, 'Send member confirmation email', 'text', 'index', 0, 'ส่งอีเมลยืนยันสมาชิก', NULL, 'ສົ່ງອີເມລ໌ຢືນຢັນສະມາຊິກ'),
(262, 'Send member confirmation message', 'text', 'index', 0, 'ส่งข้อความยืนยันสมาชิก', NULL, 'ສົ່ງຂໍ້ຄວາມຢືນຢັນສະມາຊິກ'),
(263, 'send message to user When a user adds LINE&#039;s official account as a friend', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ใช้ เมื่อผู้ใช้เพิ่มบัญชีทางการของไลน์เป็นเพื่อน', NULL, 'ສົ່ງຂໍ້ຄວາມຫາຜູ້ໃຊ້ ເມື່ອຜູ້ໃຊ້ເພີ່ມບັນຊີທາງການຂອງ LINE ເປັນໝູ່'),
(264, 'Send notification messages When making a transaction', 'text', 'index', 0, 'ส่งข้อความแจ้งเตือนเมื่อมีการทำรายการ', NULL, 'ສົ່ງຂໍ້ຄວາມແຈ້ງເຕືອນເມື່ອມີການເຮັດທຸລະກຳ'),
(265, 'Sender Name', 'text', 'index', 0, 'ชื่อผู้ส่ง', NULL, 'ຊື່ຜູ້ສົ່ງ'),
(266, 'Serial/Registration No.', 'text', 'index', 0, 'หมายเลขเครื่อง/เลขทะเบียน', NULL, 'ຫມາຍເລກເຄື່ອງ/ເລກທະບຽນ'),
(267, 'Server time', 'text', 'index', 0, 'เวลาเซิร์ฟเวอร์', NULL, 'ເວລາຂອງເຊີບເວີ'),
(268, 'Set the application for send an email', 'text', 'index', 0, 'เลือกโปรแกรมที่ใช้ในการส่งอีเมล', NULL, 'ເລືອກໂປຮແກຮມທີ່ໃຊ້ໃນການສົ່ງອີເມວ'),
(269, 'Setting up the email system', 'text', 'index', 0, 'การตั้งค่าเกี่ยวกับระบบอีเมล', NULL, 'ການຕັ້ງຄ່າກ່ຽວກັບລະບົບອີເມວ'),
(270, 'Settings', 'text', 'index', 0, 'ตั้งค่า', NULL, 'ຕັ້ງຄ່າ'),
(271, 'Settings the conditions for member login', 'text', 'index', 0, 'ตั้งค่าเงื่อนไขในการตรวจสอบการเข้าสู่ระบบ', NULL, 'ຕັ້ງເງື່ອນໄຂການກວດສອບການເຂົ້າລະບົບ'),
(272, 'Settings the timing of the server to match the local time', 'text', 'index', 0, 'ตั้งค่าเขตเวลาของเซิร์ฟเวอร์ ให้ตรงกันกับเวลาท้องถิ่น', NULL, 'ຕັ້ງຄ່າເຂດເວລາຂອງເຊີບເວີ ໃຫ້ກົງກັບເວລາທ້ອງຖີ່ນ'),
(273, 'Sex', 'text', 'index', 0, 'เพศ', NULL, 'ເພດ'),
(274, 'Short description about your website', 'text', 'index', 0, 'ข้อความสั้นๆอธิบายว่าเป็นเว็บไซต์เกี่ยวกับอะไร', NULL, 'ຂໍ້ຄວາມສັ້ນໆ ອະທິບາຍວ່າເປັນເວັບໄຊກ່ຽວກັບຫຍັງ'),
(275, 'Show', 'text', 'index', 0, 'แสดง', NULL, 'ສະແດງ'),
(276, 'Show web title with logo', 'text', 'index', 0, 'แสดงชื่อเว็บและโลโก', NULL, 'ສະແດງຊື່ເວັບແລະໂລໂກ້'),
(277, 'Site Name', 'text', 'index', 0, 'ชื่อของเว็บไซต์', NULL, 'ຊື່ຂອງເວັບໄຊ'),
(278, 'Site settings', 'text', 'index', 0, 'ตั้งค่าเว็บไซต์', NULL, 'ຕັ້ງຄ່າເວັບໄຊ'),
(279, 'size :width*:height pixel', 'text', 'index', 0, 'ขนาด :width*:height พิกเซล', NULL, 'ຂະໜາດ :width*:height ຟິດເຊວล'),
(280, 'Size of', 'text', 'index', 0, 'ขนาดของ', NULL, 'ຂະໜາດຂອງ'),
(281, 'skip to content', 'text', 'index', 0, 'ข้ามไปยังเนื้อหา', NULL, 'ຂ້າມໄປຍັງເນື້ອຫາ'),
(282, 'SMS Settings', 'text', 'index', 0, 'ตั้งค่า SMS', NULL, 'ຕັ້ງຄ່າ SMS'),
(283, 'Sorry', 'text', 'index', 0, 'ขออภัย', NULL, 'ຂໍໂທດ'),
(284, 'Sorry, cannot find a page called Please check the URL or try the call again.', 'text', 'index', 0, 'ขออภัย ไม่พบหน้าที่เรียก โปรดตรวจสอบ URL หรือลองเรียกอีกครั้ง', NULL, 'ຂໍ​ອະ​ໄພ, ບໍ່​ສາ​ມາດ​ຊອກ​ຫາ​ຫນ້າ​ທີ່​ຮ້ອງ​ຂໍ. ກະ​ລຸ​ນາ​ກວດ​ສອບ URL ຫຼື​ພະ​ຍາ​ຍາມ​ດຶງ​ຂໍ້​ມູນ​ອີກ​ເທື່ອ​ຫນຶ່ງ.'),
(285, 'Sorry, Item not found It&#39;s may be deleted', 'text', 'index', 0, 'ขออภัย ไม่พบรายการที่เลือก รายการนี้อาจถูกลบไปแล้ว', NULL, 'ຂໍໂທດ ບໍ່ພົບລາຍການທີ່ເລືອກ ລາຍການນີ້ອາດຖືກລຶບໄປແລ້ວ'),
(286, 'Specify the language code of the email, as utf-8', 'text', 'index', 0, 'ระบุรหัสภาษาของอีเมลที่ส่ง เช่น utf-8', NULL, 'ລະບຸລະຫັດພາສາຂອງອີເມວທີ່ສົ່ງເຊັ່ນ utf-8'),
(287, 'Start a new line with the web name', 'text', 'index', 0, 'ขึ้นบรรทัดใหม่ชื่อเว็บ', NULL, 'ເລີ່ມແຖວໃໝ່ຊື່ເວັບ'),
(288, 'Status', 'text', 'index', 0, 'สถานะ', NULL, 'ສະຖານະ'),
(289, 'Status for general members', 'text', 'index', 0, 'สถานะสำหรับสมาชิกทั่วไป', NULL, 'ສະຖານະສຳລັບສະມາຊິກທົ່ວໄປ'),
(290, 'Status update', 'text', 'index', 0, 'ปรับปรุงสถานะ', NULL, 'ປັບປຸງສະຖານະ'),
(291, 'Stock', 'text', 'index', 0, 'คงเหลือ', NULL, 'ທີ່ຍັງເຫຼືອ'),
(292, 'Style', 'text', 'index', 0, 'รูปแบบ', NULL, 'ຮູບແບບ'),
(293, 'Text color', 'text', 'index', 0, 'สีตัวอักษร', NULL, 'ສີຕົວອັກສອນ'),
(294, 'The amount delivered is greater than the amount borrowed', 'text', 'index', 0, 'จำนวนที่ส่งมอบมากกว่าจำนวนที่ยืม', NULL, 'ຈຳນວນທີ່ຖືກສົ່ງແມ່ນໃຫຍ່ກວ່າຈຳນວນທີ່ຖືກຢືມ.'),
(295, 'The amount returned is greater than the amount delivered', 'text', 'index', 0, 'จำนวนที่คืนมากกว่าจำนวนที่ส่งมอบ', NULL, 'ຈໍານວນທີ່ສົ່ງຄືນແມ່ນສູງກວ່າຈໍານວນທີ່ສົ່ງ'),
(296, 'The amount returned is not equal to the amount delivered', 'text', 'index', 0, 'จำนวนที่คืนไม่เท่ากับจำนวนที่ส่งมอบ', NULL, 'ຈໍານວນທີ່ສົ່ງຄືນແມ່ນບໍ່ເທົ່າກັບຈໍານວນທີ່ສົ່ງ'),
(297, 'The e-mail address of the person or entity that has the authority to make decisions about the collection, use or dissemination of personal data.', 'text', 'index', 0, 'ที่อยู่อีเมลของบุคคลหรือนิติบุคคลที่มีอำนาจตัดสินใจเกี่ยวกับการเก็บรวบรวม ใช้ หรือเผยแพร่ข้อมูลส่วนบุคคล', NULL, 'ທີ່ຢູ່ອີເມລ໌ຂອງບຸກຄົນຫຼືຫນ່ວຍງານທີ່ມີອໍານາດໃນການຕັດສິນໃຈກ່ຽວກັບການລວບລວມ, ການນໍາໃຊ້ຫຼືການເຜີຍແຜ່ຂໍ້ມູນສ່ວນບຸກຄົນ.'),
(298, 'The members status of the site', 'text', 'index', 0, 'สถานะของสมาชิกของเว็บไซต์', NULL, 'ສະຖານະຂອງສະມາຂິກຂອງເວັບໄຊ'),
(299, 'The message has been sent to the admin successfully. Please wait a moment for the admin to approve the registration. You can log back in later if approved.', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ดูแลระบบเรียบร้อยแล้ว กรุณารอสักครู่เพื่อให้ผู้ดูแลระบบอนุมัติการลงทะเบียน คุณสามารถกลับมาเข้าระบบได้ในภายหลังหากได้รับการอนุมัติแล้ว', NULL, 'ຂໍ້ຄວາມດັ່ງກ່າວໄດ້ຖືກສົ່ງໄປຫາຜູ້ເບິ່ງແຍງຢ່າງສໍາເລັດຜົນ. ກະລຸນາລໍຖ້າໃຫ້ຜູ້ເບິ່ງແຍງລະບົບອະນຸມັດການລົງທະບຽນ. ທ່ານສາມາດເຂົ້າສູ່ລະບົບຄືນໄດ້ໃນພາຍຫຼັງຖ້າໄດ້ຮັບການອະນຸມັດ.'),
(300, 'The name of the mail server as localhost or smtp.gmail.com (To change the settings of your email is the default. To remove this box entirely.)', 'text', 'index', 0, 'ชื่อของเมล์เซิร์ฟเวอร์ เช่น localhost หรือ smtp.gmail.com (ต้องการเปลี่ยนค่ากำหนดของอีเมลทั้งหมดเป็นค่าเริ่มต้น ให้ลบข้อความในช่องนี้ออกทั้งหมด)', NULL, 'ຊື່ຂອງເມວເຊີບເວີເຊັ່ນ localhost หรือ chitdpt@gmail.com (ຕ້ອງປ່ຽນຄ່າກຳນົດຂອງອີເມວທັງໝົດເປັນຄ່າເລີ່ມຕົ້ນ ໃຫ້ລຶບຂໍ້ຄວາມໃນຊ່ອງນີ້ອອກທັງໝົດ)'),
(301, 'The type of file is invalid', 'text', 'index', 0, 'ชนิดของไฟล์ไม่รองรับ', NULL, 'ປະເພດຂອງໄຟລ໌ບໍ່ຖືກຕ້ອງ'),
(302, 'Theme', 'text', 'index', 0, 'ธีม', NULL, 'ຮູບແບບສີສັນ'),
(303, 'There is not enough :name (remaining :stock :unit)', 'text', 'index', 0, 'มีสินค้า :name ไม่เพียงพอ (คงเหลือ :stock :unit)', NULL, 'ຜະລິດຕະພັນ :name ບໍ່ພຽງພໍ (ຍັງເຫຼືອ :stock :unit)'),
(304, 'This :name already exist', 'text', 'index', 0, 'มี :name นี้อยู่ก่อนแล้ว', NULL, 'ມີ :name ນີ້ຢູ່ກ່ອນແລ້ວ'),
(305, 'This website uses cookies to provide our services. To find out more about our use of cookies, please see our :privacy.', 'text', 'index', 0, 'เว็บไซต์นี้มีการใช้คุกกี้เพื่อปรับปรุงการให้บริการ หากต้องการข้อมูลเพิ่มเติมเกี่ยวกับการใช้คุกกี้ของเรา โปรดดู :privacy', NULL, 'ເວັບໄຊທ໌ນີ້ໃຊ້ຄຸກກີເພື່ອປັບປຸງການບໍລິການ. ສໍາລັບຂໍ້ມູນເພີ່ມເຕີມກ່ຽວກັບການນໍາໃຊ້ຄຸກກີຂອງພວກເຮົາ, ເບິ່ງ :privacy'),
(306, 'time', 'text', 'index', 0, 'เวลา', NULL, 'ເວລາ'),
(307, 'Time zone', 'text', 'index', 0, 'เขตเวลา', NULL, 'ເຂດເວລາ'),
(308, 'times', 'text', 'index', 0, 'ครั้ง', NULL, 'ຄັ້ງ'),
(309, 'to', 'text', 'index', 0, 'ถึง', NULL, 'ເຖິງ'),
(310, 'To change your password, enter your password to match the two inputs', 'text', 'index', 0, 'ถ้าต้องการเปลี่ยนรหัสผ่าน กรุณากรอกรหัสผ่านสองช่องให้ตรงกัน', NULL, 'ຖ້າຕ້ອງການປ່ຽນລະຫັດຜ່ານກະລຸນາເພີ່ມລະຫັດຜ່ານສອງຊ່ອງໃຫ້ກົງກັນ'),
(311, 'Topic', 'text', 'index', 0, 'หัวข้อ', NULL, 'ຫົວຂໍ້'),
(312, 'Transaction date', 'text', 'index', 0, 'วันที่ทำรายการ', NULL, 'ວັນທີ່ເຮັດລາຍະການ'),
(313, 'Transaction details', 'text', 'index', 0, 'รายละเอียดการทำรายการ', NULL, 'ລາຍະລະອຽດການເຮັດລາຍະການ'),
(314, 'Transaction history', 'text', 'index', 0, 'ประวัติการทำรายการ', NULL, 'ປະວັດການເຮັດລາຍະການ'),
(315, 'Transaction No.', 'text', 'index', 0, 'เลขที่การทำรายการ', NULL, 'ເລກທີ່ການເຮັດລາຍະການ'),
(316, 'Type', 'text', 'index', 0, 'ชนิด', NULL, 'ປະເພດ'),
(317, 'Un-Returned items', 'text', 'index', 0, 'รายการครบกำหนดคืน', NULL, 'ລາຍະການຄົບກໍາຫນົດຄືນ'),
(318, 'Unable to complete the transaction', 'text', 'index', 0, 'ไม่สามารถทำรายการนี้ได้', NULL, 'ບໍ່ສາມາດເຮັດລາຍການນີ້ໄດ້'),
(319, 'Unit', 'text', 'index', 0, 'หน่วย', NULL, 'ໜ່ວຍ'),
(320, 'Upload', 'text', 'index', 0, 'อัปโหลด', NULL, 'ອັບໂຫຼດ'),
(321, 'Upload :type files', 'text', 'index', 0, 'อัปโหลดไฟล์ :type', NULL, 'ອັບໂຫຼດແຟ້ມຂໍ້ມູນ :type'),
(322, 'URL must begin with http:// or https://', 'text', 'index', 0, 'URL ต้องขึ้นต้นด้วย http:// หรือ https://', NULL, 'URL ຕ້ອງເລີ່ມຕົ້ນດ້ວຍ http:// ຫຼື https://'),
(323, 'Usage history', 'text', 'index', 0, 'ประวัติการใช้งาน', NULL, 'ປະ​ຫວັດ​ການ​ນໍາ​ໃຊ້​'),
(324, 'Use the theme&#039;s default settings.', 'text', 'index', 0, 'ใช้การตั้งค่าเริ่มต้นของธีม', NULL, 'ໃຊ້ການຕັ້ງຄ່າເລີ່ມຕົ້ນຂອງຮູບແບບສີສັນ.'),
(325, 'User', 'text', 'index', 0, 'สมาชิก', NULL, 'ສະມາຊິກ'),
(326, 'Username', 'text', 'index', 0, 'ชื่อผู้ใช้', NULL, 'ຊື່ຜູ້ໃຊ້'),
(327, 'Username for the mail server. (To change, enter a new value.)', 'text', 'index', 0, 'ชื่อผู้ใช้ของเมล์เซิร์ฟเวอร์ (ต้องการเปลี่ยน ให้กรอก)', NULL, 'ຊື່ຜູ້ໃຊ້ຂອງເມວເຊີບເວີ (ຕ້ອງການປ່ຽນ ໃຫ້ເພີ່ມ)'),
(328, 'Username used for login or request a new password', 'text', 'index', 0, 'ชื่อผู้ใช้ ใช้สำหรับการเข้าระบบหรือการขอรหัสผ่านใหม่', NULL, 'ຊື່ຜູ້ໃຊ້ທີ່ໃຊ້ສໍາລັບການເຂົ້າສູ່ລະບົບຫຼືຮ້ອງຂໍລະຫັດຜ່ານໃຫມ່'),
(329, 'Users', 'text', 'index', 0, 'สมาชิก', NULL, 'ສະມາຊິກ'),
(330, 'Verify Account', 'text', 'index', 0, 'ยืนยันบัญชี', NULL, 'ຢືນຢັນບັນຊີ'),
(331, 'Version', 'text', 'index', 0, 'รุ่น', NULL, 'ຮຸ່ນ'),
(332, 'Waiting list', 'text', 'index', 0, 'รายการรอตรวจสอบ', NULL, 'ລາຍຊື່ລໍຖ້າ'),
(333, 'Waiting to check from the staff', 'text', 'index', 0, 'รอตรวจสอบจากเจ้าหน้าที่', NULL, 'ລໍຖ້າການກວດສອບຈາກພະນັກງານ'),
(334, 'Website template', 'text', 'index', 0, 'แม่แบบเว็บไซต์', NULL, 'ແມ່ແບບເວັບໄຊທ໌'),
(335, 'Website title', 'text', 'index', 0, 'ชื่อเว็บ', NULL, 'ຊື່ເວັບ'),
(336, 'Welcome', 'text', 'index', 0, 'สวัสดี', NULL, 'ສະບາຍດີ'),
(337, 'Welcome %s, login complete', 'text', 'index', 0, 'สวัสดี คุณ %s ยินดีต้อนรับเข้าสู่ระบบ', NULL, 'ສະບາຍດີທ່ານ %s ຍິນດີຕ້ອນຮັບເຂົ້າສູ່ລະບົບ'),
(338, 'Welcome new members', 'text', 'index', 0, 'ยินดีต้อนรับสมาชิกใหม่', NULL, 'ຍິນດີຕ້ອນຮັບສະມາຊິກໃໝ່'),
(339, 'Welcome. Phone number has been verified. Please log in again.', 'text', 'index', 0, 'ยินดีต้อนรับ หมายเลขโทรศัพท์ได้รับการยืนยันแล้ว กรุณาเข้าระบบอีกครั้ง', NULL, 'ຍິນດີຕ້ອນຮັບເບີໂທລະສັບ. ກະລຸນາເຂົ້າສູ່ລະບົບອີກຄັ້ງ.'),
(340, 'When enabled Social accounts can be logged in as an administrator. (Some abilities will not be available)', 'text', 'index', 0, 'เมื่อเปิดใช้งาน บัญชีโซเชียลจะสามารถเข้าระบบเป็นผู้ดูแลได้ (ความสามารถบางอย่างจะไม่สามารถใช้งานได้)', NULL, 'ເມື່ອເປີດໃຊ້ງານ ບັນຊີສັງຄົມສາມາດເຂົ້າສູ່ລະບົບເປັນຜູ້ບໍລິຫານ. (ຄວາມສາມາດບາງຢ່າງຈະບໍ່ມີ)'),
(341, 'When enabled, a cookies consent banner will be displayed.', 'text', 'index', 0, 'เมื่อเปิดใช้งานระบบจะแสดงแบนเนอร์ขออนุญาตใช้งานคุ้กกี้', NULL, 'ເມື່ອເປີດໃຊ້ງານແລ້ວ, ປ້າຍໂຄສະນາການຍິນຍອມຂອງ cookies ຈະສະແດງຂຶ້ນ.'),
(342, 'When enabled, Members registered with email must also verify their email address. It is not recommended to use in conjunction with other login methods.', 'text', 'index', 0, 'เมื่อเปิดใช้งาน สมาชิกที่ลงทะเบียนด้วยอีเมลจะต้องยืนยันที่อยู่อีเมลด้วย ไม่แนะนำให้ใช้ร่วมกับการเข้าระบบด้วยช่องทางอื่นๆ', NULL, 'ເມື່ອເປີດໃຊ້ ສະມາຊິກທີ່ລົງທະບຽນກັບອີເມລ໌ຈະຕ້ອງຢືນຢັນທີ່ຢູ່ອີເມວຂອງເຂົາເຈົ້າ. ມັນບໍ່ໄດ້ຖືກແນະນໍາໃຫ້ໃຊ້ຮ່ວມກັບວິທີການເຂົ້າສູ່ລະບົບອື່ນໆ.'),
(343, 'Width', 'text', 'index', 0, 'กว้าง', NULL, 'ກວ້າງ'),
(344, 'With selected', 'text', 'index', 0, 'ทำกับที่เลือก', NULL, 'ເຮັດກັບທີ່ເລືອກ'),
(345, 'year', 'text', 'index', 0, 'ปี', NULL, 'ປີ'),
(346, 'You can enter your LINE user ID below on your personal information page. to link your account to this official account', 'text', 'index', 0, 'คุณสามารถกรอก LINE user ID ด้านล่างในหน้าข้อมูลส่วนตัวของคุณ เพื่อผูกบัญชีของคุณเข้ากับบัญชีทางการนี้ได้', NULL, 'ທ່ານສາມາດໃສ່ LINE user ID ຂອງທ່ານຂ້າງລຸ່ມນີ້ຢູ່ໃນຫນ້າຂໍ້ມູນສ່ວນຕົວຂອງທ່ານ. ເພື່ອເຊື່ອມຕໍ່ບັນຊີຂອງທ່ານກັບບັນຊີທາງການນີ້'),
(347, 'You can login at', 'text', 'index', 0, 'คุณสามารถเข้าระบบได้ที่', NULL, 'ທ່ານສາມາດເຂົ້າສູ່ລະບົບໄດ້ທີ່'),
(348, 'You have not returned the equipment. Please return it first.', 'text', 'index', 0, 'คุณยังไม่ได้คืนพัสดุ กรุณาคืนพัสดุก่อน', NULL, 'ຄຸນຍັງບໍ່ໄດ້ຄືນພັສດຸກະລຸນາຄືນພັສດຸກ່ອນ'),
(349, 'You haven&#039;t verified your email address. Please check your email. and click the link in the email', 'text', 'index', 0, 'คุณยังไม่ได้ยืนยันที่อยู่อีเมล กรุณาตรวจสอบอีเมลของคุณ และคลิกลิงค์ในอีเมล', NULL, 'ທ່ານຍັງບໍ່ໄດ້ຢືນຢັນທີ່ຢູ່ອີເມວຂອງທ່ານ. ກະລຸນາກວດເບິ່ງອີເມວຂອງທ່ານ. ແລະຄລິກໃສ່ການເຊື່ອມຕໍ່ໃນອີເມລ໌'),
(350, 'You want to', 'text', 'index', 0, 'คุณต้องการ', NULL, 'ທ່ານຕ້ອງການ'),
(351, 'Your account has been approved.', 'text', 'index', 0, 'บัญชีของท่านได้รับการอนุมัติเรียบร้อยแล้ว', NULL, 'ບັນຊີຂອງທ່ານໄດ້ຮັບການອະນຸມັດແລ້ວ.'),
(352, 'Your account has not been approved, please wait or contact the administrator.', 'text', 'index', 0, 'บัญชีของท่านยังไม่ได้รับการอนุมัติ กรุณารอ หรือติดต่อสอบถามไปยังผู้ดูแล', NULL, 'ບັນຊີຂອງທ່ານບໍ່ໄດ້ຮັບການອະນຸມັດ, ກະລຸນາລໍຖ້າ ຫຼືຕິດຕໍ່ຜູ້ເບິ່ງແຍງລະບົບ.'),
(353, 'Your message was sent successfully', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ที่เกี่ยวข้องเรียบร้อยแล้ว', NULL, 'ສົ່ງຂໍ້ຄວາມໄປຍັງຜູ້ຮັບຮຽບຮ້ອຍແລ້ວ'),
(354, 'Your new password is', 'text', 'index', 0, 'รหัสผ่านใหม่ของคุณคือ', NULL, 'ລະຫັດຜ່ານໃໝ່ຂອງທ່ານຄື'),
(355, 'Your OTP code is :otp. Please enter this code on the website to confirm your phone number.', 'text', 'index', 0, 'รหัส OTP ของคุณคือ :otp กรุณาป้อนรหัสนี้บนเว็บไซต์เพื่อยืนยันหมายเลขโทรศัพท์ของคุณ', NULL, 'ລະຫັດ OTP ຂອງທ່ານແມ່ນ :otp ກະລຸນາໃສ່ລະຫັດນີ້ຢູ່ໃນເວັບໄຊທ໌ເພື່ອຢືນຢັນເບີໂທລະສັບຂອງທ່ານ.'),
(356, 'Your registration information', 'text', 'index', 0, 'ข้อมูลการลงทะเบียนของคุณ', NULL, 'ຂໍ້ມູນການລົງທະບຽນຂອງທ່ານ'),
(357, 'Zipcode', 'text', 'index', 0, 'รหัสไปรษณีย์', NULL, 'ລະຫັດໄປສະນີ');

-- --------------------------------------------------------

--
-- Table structure for table `app_logs`
--

CREATE TABLE `app_logs` (
  `id` int(11) NOT NULL,
  `src_id` int(11) NOT NULL,
  `module` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `create_date` datetime NOT NULL,
  `reason` text DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `topic` text NOT NULL,
  `datas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `app_logs`
--

INSERT INTO `app_logs` (`id`, `src_id`, `module`, `action`, `create_date`, `reason`, `member_id`, `topic`, `datas`) VALUES
(1, 1, 'index', 'User', '2024-07-13 19:45:32', NULL, 1, '{LNG_Login} IP ::1', NULL),
(2, 1, 'index', 'User', '2024-07-13 19:46:45', NULL, 1, '{LNG_Login} IP ::1', NULL),
(3, 1, 'index', 'User', '2024-07-13 19:48:06', NULL, 1, '{LNG_Login} IP ::1', NULL),
(4, 1, 'index', 'User', '2024-07-13 19:51:58', NULL, 1, '{LNG_Login} IP ::1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_number`
--

CREATE TABLE `app_number` (
  `type` varchar(20) NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `auto_increment` int(11) NOT NULL,
  `last_update` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_user`
--

CREATE TABLE `app_user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `salt` varchar(32) DEFAULT '',
  `password` varchar(50) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `permission` text DEFAULT '',
  `name` varchar(150) NOT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `id_card` varchar(13) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `provinceID` varchar(3) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `country` varchar(2) DEFAULT 'TH',
  `create_date` datetime DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `social` tinyint(1) DEFAULT 0,
  `line_uid` varchar(33) DEFAULT NULL,
  `activatecode` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `app_user`
--

INSERT INTO `app_user` (`id`, `username`, `salt`, `password`, `token`, `status`, `permission`, `name`, `sex`, `id_card`, `address`, `phone`, `provinceID`, `province`, `zipcode`, `country`, `create_date`, `active`, `social`, `line_uid`, `activatecode`) VALUES
(1, 'admin@localhost', '669276a67ab1d', 'f436befb90fffa5cdef1ae4b1fc6e3e1dce7d4a1', '099ff15c0e5bdf263e0a673d2aa45cbca3fb8038', 1, '', 'แอดมิน', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-07-13 14:44:22', 1, 0, NULL, ''),
(2, 'demo', '669276a67ab1d', '121924bfdb74763c07a2faff91b34cd66f9fd532', NULL, 0, '', 'ตัวอย่าง', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-07-13 14:44:22', 1, 0, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `app_user_meta`
--

CREATE TABLE `app_user_meta` (
  `value` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `member_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_borrow`
--
ALTER TABLE `app_borrow`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_borrow_items`
--
ALTER TABLE `app_borrow_items`
  ADD PRIMARY KEY (`borrow_id`,`id`);

--
-- Indexes for table `app_category`
--
ALTER TABLE `app_category`
  ADD KEY `type` (`type`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `language` (`language`);

--
-- Indexes for table `app_inventory`
--
ALTER TABLE `app_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `model_id` (`model_id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `app_inventory_items`
--
ALTER TABLE `app_inventory_items`
  ADD PRIMARY KEY (`product_no`),
  ADD KEY `inventory_id` (`inventory_id`);

--
-- Indexes for table `app_inventory_meta`
--
ALTER TABLE `app_inventory_meta`
  ADD KEY `inventory_id` (`inventory_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `app_language`
--
ALTER TABLE `app_language`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_logs`
--
ALTER TABLE `app_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `src_id` (`src_id`),
  ADD KEY `module` (`module`),
  ADD KEY `action` (`action`);

--
-- Indexes for table `app_number`
--
ALTER TABLE `app_number`
  ADD PRIMARY KEY (`type`,`prefix`);

--
-- Indexes for table `app_user`
--
ALTER TABLE `app_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `line_uid` (`line_uid`),
  ADD KEY `username` (`username`),
  ADD KEY `token` (`token`),
  ADD KEY `phone` (`phone`),
  ADD KEY `id_card` (`id_card`),
  ADD KEY `activatecode` (`activatecode`);

--
-- Indexes for table `app_user_meta`
--
ALTER TABLE `app_user_meta`
  ADD KEY `member_id` (`member_id`,`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_borrow`
--
ALTER TABLE `app_borrow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_inventory`
--
ALTER TABLE `app_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `app_language`
--
ALTER TABLE `app_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=358;

--
-- AUTO_INCREMENT for table `app_logs`
--
ALTER TABLE `app_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
