-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2024 at 06:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

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

--
-- Dumping data for table `app_borrow`
--

INSERT INTO `app_borrow` (`id`, `borrow_no`, `transaction_date`, `borrower_id`, `borrow_date`, `return_date`) VALUES
(3, 'B6705-0003', '2024-05-25', 2, '2024-05-25', NULL),
(4, 'B6705-0004', '2024-05-25', 2, '2024-05-25', NULL),
(5, 'B6705-0005', '2024-05-25', 4, '2024-05-25', NULL),
(6, 'B6706-0001', '2024-06-26', 2, '2024-06-26', NULL);

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

--
-- Dumping data for table `app_borrow_items`
--

INSERT INTO `app_borrow_items` (`id`, `borrow_id`, `topic`, `num_requests`, `amount`, `status`, `unit`, `product_no`) VALUES
(0, 3, 'โซเดียมไฮดรอกไซด์ เม็ด (โซดาไฟ) (Sodium Hydroxide Pellet)', 40, 35, 2, 'CC', 'STA-101'),
(0, 4, 'กรดไฮโดรคลอริก(กรดเกลือ) เข้มข้น', 60, 50, 2, 'CC', 'STA-104'),
(0, 5, 'โซเดียมไฮดรอกไซด์ เม็ด (โซดาไฟ) (Sodium Hydroxide Pellet)', 100, 100, 2, 'CC', 'STA-101'),
(0, 6, 'โซเดียมไฮดรอกไซด์ เม็ด (โซดาไฟ) (Sodium Hydroxide Pellet)', 100, 0, 1, 'CC', 'STA-101');

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
('category_id', '1', '', 'ของแข็ง', NULL, 1),
('category_id', '2', '', 'ของเหลว', NULL, 1),
('category_id', '3', '', 'แก๊ส', NULL, 1),
('type_id', '1', '', 'STC208', NULL, 1),
('model_id', '1', '', 'QREC', NULL, 1),
('model_id', '2', '', 'Loba Chemie', NULL, 1),
('unit', '1', '', 'กรัม', NULL, 1),
('unit', '2', '', 'มิลลิลิตร', NULL, 1);

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
(5, 'detail', 'ขนาดบรรจุ :  350 CC\r\nสูตรเคมี  :  NaOH\r\nมวลโมเลกุล       :  40 g/mol \r\nจุดหลอมเหลว    : 320 °C\r\nจุดเดือด :  1388 °C'),
(6, 'detail', 'ขนาดบรรจุ :  100 CC\r\nสูตรเคมี  :  KCl\r\nมวลโมเลกุล       :  74.56 g/mol \r\nจุดหลอมเหลว    : 770 °C\r\nจุดเดือด :  1420 °C'),
(8, 'detail', '12 โมล\r\nมวลโมเลกุล 36.46 จุดหลอมเหลว -27.32 องศา จุดเดือด 110 องศา\r\nขนาดบรรจุ  450 CC. \r\n**ข้อควรระวังมีฤทธ์กัดกร่อนโลหะ ทำให้เกิดแผลไหม้**');

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
(46, 'SMTPSECURIES', 'array', 'index', 0, 'a:2:{s:0:\"\";s:57:\"การเชื่อมต่อแบบปกติ\";s:3:\"ssl\";s:72:\"การเชื่อมต่อที่ปลอดภัย (SSL)\";}', 'a:2:{s:0:\"\";s:10:\"Clear Text\";s:3:\"ssl\";s:38:\"Server using a secure connection (SSL)\";}', 'a:2:{s:0:\"\";s:66:\"ການເຊື່ອມຕໍ່ແບບປົກກະຕິ\";s:3:\"ssl\";s:66:\"ການເຊື່ອມຕໍ່ທີ່ປອດໄຟ (SSL)\";}'),
(47, 'THEME_WIDTH', 'array', 'index', 0, 'a:3:{s:7:\"default\";s:33:\"ค่าเริ่มต้น\";s:4:\"wide\";s:15:\"กว้าง\";s:9:\"fullwidth\";s:30:\"กว้างพิเศษ\";}', 'a:3:{s:7:\"default\";s:7:\"Default\";s:4:\"wide\";s:4:\"Wide\";s:9:\"fullwidth\";s:10:\"Extra wide\";}', 'a:3:{s:7:\"default\";s:36:\"ຄ່າເລີ່ມຕົ້ນ\";s:4:\"wide\";s:15:\"ກວ້າງ\";s:9:\"fullwidth\";s:30:\"ກວ້າງພິເສດ\";}'),
(48, 'TIME_FORMAT', 'text', 'index', 0, 'H:i น.', 'H:i', 'H:i'),
(49, 'YEAR_OFFSET', 'int', 'index', 0, '543', '0', '0'),
(50, ':name for new members Used when members need to specify', 'text', 'index', 0, ':name เริ่มต้นสำหรับสมาชิกใหม่ ใช้ในกรณีที่สมาชิกจำเป็นต้องระบุ', NULL, ':name ສໍາລັບສະມາຊິກໃຫມ່ ໃຊ້ໃນເວລາທີ່ສະມາຊິກຕ້ອງການກໍານົດ'),
(51, '0.0.0.0 mean all IP addresses', 'text', 'index', 0, '0.0.0.0 หมายถึงอนุญาตทั้งหมด', NULL, '0.0.0.0 ຫມາຍຄວາມວ່າອະນຸຍາດໃຫ້ທັງຫມົດ'),
(52, 'Accept all', 'text', 'index', 0, 'ยอมรับทั้งหมด', NULL, 'ຍອມຮັບທັງຫມົດ'),
(53, 'Accept this agreement', 'text', 'index', 0, 'ยอมรับข้อตกลง', NULL, 'ຍອມຮັບຂໍ້ຕົກລົງ'),
(54, 'Add', 'text', 'index', 0, 'เพิ่ม', NULL, 'ເພີ່ມ'),
(55, 'Add Borrow', 'text', 'index', 0, 'ทำรายการยืม', NULL, 'ເຮັດລາຍະການຍືມ'),
(56, 'Add friend', 'text', 'index', 0, 'เพิ่มเพื่อน', NULL, 'ເພີ່ມເພື່ອນ'),
(57, 'Address', 'text', 'index', 0, 'ที่อยู่', NULL, 'ທີ່ຢູ່'),
(58, 'Address details', 'text', 'index', 0, 'รายละเอียดที่อยู่', NULL, 'ລາຍລະອຽດທີ່ຢູ່'),
(59, 'Administrator status It is of utmost importance to do everything', 'text', 'index', 0, 'สถานะผู้ดูแลระบบ มีความสำคัญสูงสุดสามารถทำได้ทุกอย่าง', NULL, 'ສະຖານະຜູ້ເບິ່ງແຍງລະບົບມີຄວາມສຳຄັນສຸງທີ່ສຸດສາມາດເຮັດໄດ້ທຸກຢ່າງ'),
(60, 'age', 'text', 'index', 0, 'อายุ', NULL, 'ອາຍຸ'),
(61, 'All :count entries, displayed :start to :end, page :page of :total pages', 'text', 'index', 0, 'ทั้งหมด :count รายการ, แสดง :start ถึง :end, หน้าที่ :page จากทั้งหมด :total หน้า', NULL, 'ທັງໝົດ :count ລາຍການ, ສະແດງ :start ເຖິງ :end, ໜ້າທີ່ :page ຈາກທັງໝົດ:total ໜ້າ'),
(62, 'all items', 'text', 'index', 0, 'ทั้งหมด', NULL, 'ທັງໝົດ'),
(63, 'Always enabled', 'text', 'index', 0, 'เปิดใช้งานตลอดเวลา', NULL, 'ເປີດສະເໝີ'),
(64, 'anyone', 'text', 'index', 0, 'ใครก็ได้', NULL, 'ໃຜ'),
(65, 'API settings', 'text', 'index', 0, 'ตั้งค่า API', NULL, 'ຕັ້ງຄ່າ API'),
(66, 'Appointment date', 'text', 'index', 0, 'วันนัดรับ', NULL, 'ວັນນັດຫມາຍ'),
(67, 'Appraiser', 'text', 'index', 0, 'ประเมินราคา', NULL, 'ຕີລາຄາ'),
(68, 'Authentication require', 'text', 'index', 0, 'การตรวจสอบความถูกต้อง', NULL, 'ການກວດກາຄວາມຖືກຕ້ອງ'),
(69, 'Avatar', 'text', 'index', 0, 'รูปสมาชิก', NULL, 'ຮູບແທນຕົວ'),
(70, 'Background color', 'text', 'index', 0, 'สีพื้นหลัง', NULL, 'ສີພື້ນຫລັງ'),
(71, 'Background image', 'text', 'index', 0, 'รูปภาพพื้นหลัง', NULL, 'ພາບພື້ນຫລັງ'),
(72, 'Begin date', 'text', 'index', 0, 'วันที่เริ่มต้น', NULL, 'ວັນເລີ່ມຕົ້ນ'),
(73, 'Begin time', 'text', 'index', 0, 'เวลาเริ่มต้น', NULL, 'ເລີ່ມເວລາ'),
(74, 'Borrow', 'text', 'index', 0, 'ยืม', NULL, 'ຍືມ'),
(75, 'Borrowed date', 'text', 'index', 0, 'วันที่ยืม', NULL, 'ວັນທີ່ຍືມ'),
(76, 'Borrower', 'text', 'index', 0, 'ผู้ยืม', NULL, 'ຜູ້ຢືມ'),
(77, 'Browse file', 'text', 'index', 0, 'เลือกไฟล์', NULL, 'ເລືອກໄຟລ໌'),
(78, 'Browse image uploaded, type :type', 'text', 'index', 0, 'เลือกรูปภาพอัปโหลด ชนิด :type', NULL, 'ເລືອກຮູບພາບອັບໂຫຼດຊະນິດ :type'),
(79, 'Can be approve', 'text', 'index', 0, 'สามารถอนุมัติได้', NULL, 'ສາມາດອະນຸມັດ'),
(80, 'Can login', 'text', 'index', 0, 'สามารถเข้าระบบได้', NULL, 'ສາມາດເຂົ້າສູ່ລະບົບ'),
(81, 'Can manage borrow', 'text', 'index', 0, 'สามารถจัดการการยืม', NULL, 'ສາມາດຈັດການການຍືມ'),
(82, 'Can manage the', 'text', 'index', 0, 'สามารถจัดการ', NULL, 'ສາມາດຈັດການ'),
(83, 'Can manage the inventory', 'text', 'index', 0, 'สามารถจัดการคลังสินค้าได้', NULL, 'ສາມາດຈັດການຄັງສິນຄ້າໄດ້'),
(84, 'Can not be performed this request. Because they do not find the information you need or you are not allowed', 'text', 'index', 0, 'ไม่สามารถดำเนินการตามที่ร้องขอได้ เนื่องจากไม่พบข้อมูลที่ต้องการ หรือ คุณไม่มีสิทธิ์', NULL, 'ບໍ່ສາມາດດຳເນີນການຕາມທີ່ຮ້ອງຂໍໄດ້ເນື່ອງຈາກບໍ່ພົບຂໍ້ມູນທີ່ຕ້ອງການ ຫຼື ທ່ານບໍ່ມີສິດ'),
(85, 'Can&#039;t login', 'text', 'index', 0, 'ไม่สามารถเข้าระบบได้', NULL, 'ບໍ່ສາມາດເຂົ້າສູ່ລະບົບໄດ້'),
(86, 'Cancel', 'text', 'index', 0, 'ยกเลิก', NULL, 'ຍົກເລີກ'),
(87, 'Canceled successfully', 'text', 'index', 0, 'ยกเลิกเรียบร้อย', NULL, 'ຍົກເລີກສົບຜົນສໍາເລັດ'),
(88, 'Cannot use :name', 'text', 'index', 0, 'ไม่สามารถใช้ :name ได้', NULL, 'ບໍ່ສາມາດໃຊ້ :name'),
(89, 'Category', 'text', 'index', 0, 'หมวดหมู่', NULL, 'ຫມວດຫມູ່'),
(90, 'Change language', 'text', 'index', 0, 'สลับภาษา', NULL, 'ປ່ຽນພາສາ'),
(91, 'Click to edit', 'text', 'index', 0, 'คลิกเพื่อแก้ไข', NULL, 'ກົດເພື່ອແກ້ໄຂ'),
(92, 'Comment', 'text', 'index', 0, 'หมายเหตุ', NULL, 'ຫມາຍ​ເຫດ​'),
(93, 'Confirm password', 'text', 'index', 0, 'ยืนยันรหัสผ่าน', NULL, 'ຢືນຢັນລະຫັດຜ່ານ'),
(94, 'Congratulations, your email address has been verified. please login', 'text', 'index', 0, 'ยินดีด้วย ที่อยู่อีเมลของคุณได้รับการยืนยันเรียบร้อยแล้ว กรุณาเข้าสู่ระบบ', NULL, 'ຂໍສະແດງຄວາມຍິນດີ, ທີ່ຢູ່ອີເມວຂອງທ່ານໄດ້ຮັບການຢັ້ງຢືນແລ້ວ. ກະລຸນາເຂົ້າສູ່ລະບົບ'),
(95, 'Contact name', 'text', 'index', 0, 'ชื่อผู้จอง', NULL, 'ຕົວແທນການຈອງ'),
(96, 'Cookie Policy', 'text', 'index', 0, 'นโยบายคุกกี้', NULL, 'ນະໂຍບາຍຄຸກກີ'),
(97, 'COOKIE_NECESSARY_DETAILS', 'text', 'index', 0, 'คุกกี้พื้นฐาน จำเป็นต่อการใช้งานเว็บไซต์ ใช้เพื่อการรักษาความปลอดภัยและให้เว็บไซต์สามารถทำงานได้อย่างถูกต้อง', NULL, 'ຄຸກກີພື້ນຖານ ມີຄວາມຈໍາເປັນໃນການນໍາໃຊ້ເວັບໄຊທ໌ ມັນຖືກນໍາໃຊ້ເພື່ອຈຸດປະສົງຄວາມປອດໄພແລະເພື່ອໃຫ້ເວັບໄຊທ໌ເຮັດວຽກຢ່າງຖືກຕ້ອງ.'),
(98, 'COOKIE_POLICY_DETAILS', 'text', 'index', 0, 'เราใช้คุกกี้ (Cookies) หรือเทคโนโลยีที่คล้ายคลึงกันเท่าที่จำเป็น เพื่อใช้ในการเข้าถึงสินค้าหรือบริการ และติดตามการใช้งานของคุณเท่านั้น หากคุณไม่ต้องการให้มีคุกกี้ไว้ในคอมพิวเตอร์ของคุณ คุณสามารถตั้งค่าบราวเซอร์เพื่อปฏิเสธการจัดเก็บคุกกี้ก่อนที่จะใช้งานเว็บไซต์ หรือใช้โหมดไม่ระบุตัวตนเพื่อเข้าใช้งานเว็บไซต์ก็ได้', NULL, 'ພວກເຮົາໃຊ້ຄຸກກີ (Cookies) ຫຼືເຕັກໂນໂລຢີທີ່ຄ້າຍຄືກັນໃນຂອບເຂດທີ່ຈໍາເປັນ. ສໍາລັບການນໍາໃຊ້ໃນການເຂົ້າເຖິງສິນຄ້າຫຼືການບໍລິການ ແລະພຽງແຕ່ຕິດຕາມການນໍາໃຊ້ຂອງທ່ານ ຖ້າ​ຫາກ​ວ່າ​ທ່ານ​ບໍ່​ຕ້ອງ​ການ cookies ໃນ​ຄອມ​ພິວ​ເຕີ​ຂອງ​ທ່ານ​ ທ່ານສາມາດຕັ້ງຕົວທ່ອງເວັບຂອງທ່ານເພື່ອປະຕິເສດການເກັບຮັກສາ cookies. ກ່ອນທີ່ຈະນໍາໃຊ້ເວັບໄຊທ໌ ທ່ານຍັງສາມາດໃຊ້ໂໝດບໍ່ເປີດເຜີຍຕົວຕົນເພື່ອເຂົ້າຫາເວັບໄຊທ໌ໄດ້.'),
(99, 'Cost', 'text', 'index', 0, 'ค่าใช้จ่าย', NULL, 'ຄ່າໃຊ້ຈ່າຍ'),
(100, 'Country', 'text', 'index', 0, 'ประเทศ', NULL, 'ປະເທດ'),
(101, 'Create', 'text', 'index', 0, 'สร้าง', NULL, 'ສ້າງ'),
(102, 'Create new account', 'text', 'index', 0, 'สร้างบัญชีใหม่', NULL, 'ສ້າງບັນຊີໃໝ່'),
(103, 'Created', 'text', 'index', 0, 'สร้างเมื่อ', NULL, 'ສ້າງເມື່ອ'),
(104, 'Customer', 'text', 'index', 0, 'ลูกค้า', NULL, 'ລູກຄ້າ'),
(105, 'Customer Name', 'text', 'index', 0, 'ชื่อลูกค้า', NULL, 'ຊື່ລູກຄ້າ'),
(106, 'Dark mode', 'text', 'index', 0, 'โหมดมืด', NULL, 'ໂໝດມືດ'),
(107, 'Data controller', 'text', 'index', 0, 'ผู้ควบคุม/ใช้ ข้อมูล', NULL, 'ຜູ້​ຄວບ​ຄຸມຂໍ້ມູນ'),
(108, 'Date', 'text', 'index', 0, 'วันที่', NULL, 'ວັນທີ'),
(109, 'Date of return', 'text', 'index', 0, 'กำหนดคืน', NULL, 'ຕັ້ງຄືນ'),
(110, 'days', 'text', 'index', 0, 'วัน', NULL, 'ມື້'),
(111, 'Delete', 'text', 'index', 0, 'ลบ', NULL, 'ລືບ'),
(112, 'Delivery', 'text', 'index', 0, 'ส่งมอบ', NULL, 'ສົ່ງມອບ'),
(113, 'Demo Mode', 'text', 'index', 0, 'โหมดตัวอย่าง', NULL, 'ຕົວຢ່າງ'),
(114, 'Department', 'text', 'index', 0, 'แผนก', NULL, 'ຜະແນກ'),
(115, 'Description', 'text', 'index', 0, 'คำอธิบาย', NULL, 'ຄຳອະທິບາຍ'),
(116, 'Detail', 'text', 'index', 0, 'รายละเอียด', NULL, 'ລາຍະລະອຽດ'),
(117, 'Details of', 'text', 'index', 0, 'รายละเอียดของ', NULL, 'ລາຍລະອຽດຂອງ'),
(118, 'Do not want', 'text', 'index', 0, 'ไม่ต้องการ', NULL, 'ບໍ່ຕ້ອງການ'),
(119, 'Drag and drop to reorder', 'text', 'index', 0, 'ลากและวางเพื่อจัดลำดับใหม่', NULL, 'ລາກແລ້ວວາງລົງເພື່ອຈັດຮຽງໃໝ່'),
(120, 'Edit', 'text', 'index', 0, 'แก้ไข', NULL, 'ແກ້ໄຂ'),
(121, 'Editing your account', 'text', 'index', 0, 'แก้ไขข้อมูลส่วนตัว', NULL, 'ແກ້ໄຂຂໍ້ມູນສ່ວນຕົວສະມາຊິກ'),
(122, 'Email', 'text', 'index', 0, 'อีเมล', NULL, 'ອີເມວ'),
(123, 'Email address used for login or request a new password', 'text', 'index', 0, 'ที่อยู่อีเมล ใช้สำหรับการเข้าระบบหรือการขอรหัสผ่านใหม่', NULL, 'ທີ່ຢູ່ອີເມວໃຊ້ສຳລັບການເຂົ້າລະບົບຫຼືການຂໍລະຫັດໃໝ່'),
(124, 'Email address verification', 'text', 'index', 0, 'ยืนยันที่อยู่อีเมล', NULL, 'ຢືນຢັນທີ່ຢູ່ອີເມວ'),
(125, 'Email addresses for sender and do not reply such as no-reply@domain.tld', 'text', 'index', 0, 'ทีอยู่อีเมลใช้เป็นผู้ส่งจดหมาย สำหรับจดหมายที่ไม่ต้องการตอบกลับ เช่น no-reply@domain.tld', NULL, 'ທີ່ຢູ່ອີເມວໃຊ້ເປັນຜູ້ສົ່ງຈົດໝາຍ ສຳລັບຈົດໝາຍທີ່ບໍ່ຕ້ອງການຕອບກັບເຊັ່ນ no-reply@domain.tld'),
(126, 'Email encoding', 'text', 'index', 0, 'รหัสภาษาของจดหมาย', NULL, 'ລະຫັດພາສາຂອງຈົດໝາຍ'),
(127, 'Email settings', 'text', 'index', 0, 'ตั้งค่าอีเมล', NULL, 'ຕັ້ງຄ່າອີເມວ'),
(128, 'Email the relevant person', 'text', 'index', 0, 'ส่งอีเมลแจ้งผู้ที่เกี่ยวข้องด้วย', NULL, 'ສົ່ງອີເມວຫາບຸກຄົນທີ່ກ່ຽວຂ້ອງ.'),
(129, 'Email was not verified', 'text', 'index', 0, 'ยังไม่ได้ยืนยันอีเมล', NULL, 'ອີເມວບໍ່ໄດ້ຖືກຢືນຢັນ'),
(130, 'Enable SSL encryption for sending email', 'text', 'index', 0, 'เปิดใช้งานการเข้ารหัส SSL สำหรับการส่งอีเมล', NULL, 'ເປີດໃຊ້ການເຂົ້າລະຫັດ SSL ສຳລັບການສົ່ງອີເມວ'),
(131, 'End date', 'text', 'index', 0, 'วันที่สิ้นสุด', NULL, 'ວັນສິ້ນສຸດ'),
(132, 'End date must be greater than begin date', 'text', 'index', 0, 'วันที่สิ้นสุดต้องมากกว่าวันที่เริ่มต้น', NULL, 'ວັນສິ້ນສຸດຕ້ອງຫຼາຍກວ່າວັນທີເລີ່ມຕົ້ນ.'),
(133, 'End time', 'text', 'index', 0, 'เวลาสิ้นสุด', NULL, 'ເວລາສິ້ນສຸດ'),
(134, 'English lowercase letters and numbers, not less than 6 digits', 'text', 'index', 0, 'ภาษาอังกฤษตัวพิมพ์เล็กและตัวเลข ไม่น้อยกว่า 6 หลัก', NULL, 'ໂຕພິມນ້ອຍພາສາອັງກິດ ແລະຕົວເລກ, ບໍ່ຕໍ່າກວ່າ 6 ຕົວເລກ'),
(135, 'Enter the domain name you want to allow or enter * for all domains. or leave it blank if you want to use it on this domain only', 'text', 'index', 0, 'กรอกชื่อโดเมนที่ต้องการอนุญาต หรือกรอก * สำหรับทุกโดเมน หรือเว้นว่างไว้ถ้าต้องการให้ใช้งานได้บนโดเมนนี้เท่านั้น', NULL, 'ໃສ່ຊື່ໂດເມນທີ່ທ່ານຕ້ອງການທີ່ຈະອະນຸຍາດໃຫ້ຫຼືໃສ່ * ສໍາລັບໂດເມນທັງຫມົດ. ຫຼືປ່ອຍໃຫ້ມັນຫວ່າງຖ້າທ່ານຕ້ອງການໃຊ້ມັນຢູ່ໃນໂດເມນນີ້ເທົ່ານັ້ນ'),
(136, 'Enter the email address registered. A new password will be sent to this email address.', 'text', 'index', 0, 'กรอกที่อยู่อีเมลที่ลงทะเบียนไว้ ระบบจะส่งรหัสผ่านใหม่ไปยังที่อยู่อีเมลนี้', NULL, 'ເພີ່ມທີ່ຢູ່ອີເມວທີ່ລົງທະບຽນໄວ້ ລະບົບຈະສົ່ງລະຫັດຜ່ານໃໝ່ໄປຍັງທີ່ຢູ່ອີເມວນີ້'),
(137, 'Enter the LINE user ID you received when adding friends. Or type userId sent to the official account to request a new user ID. This information is used for receiving private messages from the system via LINE.', 'text', 'index', 0, 'กรอก user ID ของไลน์ที่ได้ตอนเพิ่มเพื่อน หรือพิมพ์คำว่า userId ส่งไปยังบัญชีทางการเพื่อขอ user ID ใหม่ ข้อมูลนี้ใช้สำหรับการรับข้อความส่วนตัวที่มาจากระบบผ่านไลน์', NULL, 'ໃສ່ user ID ຂອງ LINE ທີ່ທ່ານໄດ້ຮັບໃນເວລາເພີ່ມເພື່ອນ. ຫຼືພິມ userId ທີ່ຖືກສົ່ງໄປຫາບັນຊີທາງການເພື່ອຮ້ອງຂໍ user ID ໃຫມ່. ຂໍ້ມູນນີ້ແມ່ນໃຊ້ສໍາລັບການຮັບຂໍ້ຄວາມສ່ວນຕົວຈາກລະບົບຜ່ານ LINE.'),
(138, 'Enter your password again', 'text', 'index', 0, 'กรอกรหัสผ่านของคุณอีกครั้ง', NULL, 'ໃສ່ລະຫັດຜ່ານຂອງທ່ານອີກຄັ້ງ'),
(139, 'entries', 'text', 'index', 0, 'รายการ', NULL, 'ລາຍການ'),
(140, 'Equipment', 'text', 'index', 0, 'พัสดุ', NULL, 'ພັສດຸ'),
(141, 'Expiration date', 'text', 'index', 0, 'วันหมดอายุ', NULL, 'ວັນໝົດອາຍຸ'),
(142, 'Fax', 'text', 'index', 0, 'โทรสาร', NULL, 'ແຟັກ'),
(143, 'File', 'text', 'index', 0, 'ไฟล์', NULL, 'ແຟ້ມ'),
(144, 'Fill some of the :name to find', 'text', 'index', 0, 'กรอกบางส่วนของ :name เพื่อค้นหา', NULL, 'ຕື່ມຂໍ້ມູນໃສ່ບາງສ່ວນຂອງ :name ເພື່ອຄົ້ນຫາ'),
(145, 'Find equipment by', 'text', 'index', 0, 'ค้นหาพัสดุโดย', NULL, 'ຄົ້ນຫາພັສດຸຈາກ'),
(146, 'Footer', 'text', 'index', 0, 'ส่วนท้าย', NULL, 'ສ່ວນທ້າຍ'),
(147, 'for login by LINE account', 'text', 'index', 0, 'สำหรับการเข้าระบบโดยบัญชีไลน์', NULL, 'ສໍາລັບການເຂົ້າສູ່ລະບົບດ້ວຍບັນຊີ LINE'),
(148, 'Forgot', 'text', 'index', 0, 'ลืมรหัสผ่าน', NULL, 'ລືມລະຫັດຜ່ານ'),
(149, 'from', 'text', 'index', 0, 'จาก', NULL, 'ຈາກ'),
(150, 'General', 'text', 'index', 0, 'ทั่วไป', NULL, 'ທົ່ວໄປ'),
(151, 'General site settings', 'text', 'index', 0, 'ตั้งค่าพื้นฐานของเว็บไซต์', NULL, 'ຕັ້ງຄ່າພື້ນຖານຂອງເວັບໄຊ'),
(152, 'Get new password', 'text', 'index', 0, 'ขอรหัสผ่าน', NULL, 'ຂໍລະຫັດຜ່ານ'),
(153, 'go to page', 'text', 'index', 0, 'ไปหน้าที่', NULL, 'ໄປທີ່ໜ້າ'),
(154, 'Header', 'text', 'index', 0, 'ส่วนหัว', NULL, 'ສ່ວນຫົວ'),
(155, 'Home', 'text', 'index', 0, 'หน้าหลัก', NULL, 'ໜ້າຫຼັກ'),
(156, 'How to define user authentication for mail servers. If you enable it, you must configure below correctly.', 'text', 'index', 0, 'กำหนดวิธีการตรวจสอบผู้ใช้สำหรับเมล์เซิร์ฟเวอร์ หากคุณเปิดใช้งานคุณต้องกำหนดค่าต่างๆด้านล่างถูกต้อง', NULL, 'ກຳນົດວິທີການກວດສອບຜູ້ໃຊ້ສຳລັບເມນເຊິບເວີຫາກທ່ານເປີດໃຊ້ການທ່ານຕ້ອງກຳນົດຄ່າຕ່າງໆດ້ານລຸ່ມຖືກຕ້ອງ'),
(157, 'Identification No.', 'text', 'index', 0, 'เลขประชาชน', NULL, 'ເລກບັດປະຈຳຕົວ'),
(158, 'Image', 'text', 'index', 0, 'รูปภาพ', NULL, 'ຮູບພາບ'),
(159, 'Image size is in pixels', 'text', 'index', 0, 'ขนาดของรูปภาพเป็นพิกเซล', NULL, 'ຂະໜາດຂອງຮູບພາບເປັນພິກເຊວ'),
(160, 'Import', 'text', 'index', 0, 'นำเข้า', NULL, 'ນຳເຂົ້າ'),
(161, 'Installed modules', 'text', 'index', 0, 'โมดูลที่ติดตั้งแล้ว', NULL, 'ໂມດູນທີ່ຕິດຕັ້ງ'),
(162, 'Invalid :name', 'text', 'index', 0, ':name ไม่ถูกต้อง', NULL, ':name ບໍ່ຖືກຕ້ອງ'),
(163, 'Job today', 'text', 'index', 0, 'งานซ่อมวันนี้', NULL, 'ວຽກຊ່ອມວັນນີ້'),
(164, 'Key', 'text', 'index', 0, 'คีย์', NULL, 'ແປ້ນພີມ'),
(165, 'Language', 'text', 'index', 0, 'ภาษา', NULL, 'ພາສາ'),
(166, 'Leave empty for generate auto', 'text', 'index', 0, 'เว้นว่างไว้เพื่อสร้างโดยอัตโนมัติ', NULL, 'ປ່ອຍຫວ່າງໄວ້ເພື່ອສ້າງອັດໂນມັດ'),
(167, 'LINE official account (with @ prefix, e.g. @xxxx)', 'text', 'index', 0, 'บัญชีทางการของไลน์ (มี @ นำหน้า เช่น @xxxx)', NULL, 'ບັນຊີທາງການຂອງ LINE (ມີ @ ຄໍານໍາຫນ້າ, ເຊັ່ນ: @xxxx)'),
(168, 'LINE settings', 'text', 'index', 0, 'ตั้งค่าไลน์', NULL, 'ຕັ້ງ​ຄ່າ LINE'),
(169, 'List of', 'text', 'index', 0, 'รายการ', NULL, 'ລາຍການ'),
(170, 'List of IPs that allow connection 1 line per 1 IP', 'text', 'index', 0, 'รายการไอพีแอดเดรสทั้งหมดที่อนุญาต 1 บรรทัดต่อ 1 ไอพี', NULL, 'ລາຍຊື່ IP ທີ່ອະນຸຍາດໃຫ້ເຊື່ອມຕໍ່ 1 ເສັ້ນຕໍ່ 1 IP'),
(171, 'Local time', 'text', 'index', 0, 'เวลาท้องถิ่น', NULL, 'ເວລາທ້ອງຖິ່ນ'),
(172, 'Login', 'text', 'index', 0, 'เข้าสู่ระบบ', NULL, 'ເຂົ້າສູ່ລະບົບ'),
(173, 'Login as', 'text', 'index', 0, 'เข้าระบบเป็น', NULL, 'ເຂົ້າ​ສູ່​ລະ​ບົບ​ເປັນ'),
(174, 'Login by', 'text', 'index', 0, 'เข้าระบบโดย', NULL, 'ເຂົ້າສູ່ລະບົບໂດຍ'),
(175, 'Login information', 'text', 'index', 0, 'ข้อมูลการเข้าระบบ', NULL, 'ຂໍ້ມູນການເຂົ້າລະບົບ'),
(176, 'Login page', 'text', 'index', 0, 'หน้าเข้าสู่ระบบ', NULL, 'ໜ້າເຂົ້າສູ່ລະບົບ'),
(177, 'Login with an existing account', 'text', 'index', 0, 'เข้าระบบด้วยบัญชีสมาชิกที่มีอยู่แล้ว', NULL, 'ເຂົ້າລະບົບດ້ວຍບັນຊີສະມາຊິກທີ່ມີຢູ່ແລ້ວ'),
(178, 'Logo', 'text', 'index', 0, 'โลโก', NULL, 'ໂລໂກ'),
(179, 'Logout', 'text', 'index', 0, 'ออกจากระบบ', NULL, 'ອອກຈາກລະບົບ'),
(180, 'Logout successful', 'text', 'index', 0, 'ออกจากระบบเรียบร้อย', NULL, 'ອອກຈາກລະບົບຮຽບຮ້ອຍ'),
(181, 'Mail program', 'text', 'index', 0, 'โปรแกรมส่งอีเมล', NULL, 'ໂປຮແກຮມສົ່ງອີເມວ'),
(182, 'Mail server', 'text', 'index', 0, 'เซิร์ฟเวอร์อีเมล', NULL, 'ເຊີບເວີອີເມວ'),
(183, 'Mail server port number (default is 25, for GMail used 465, 587 for DirectAdmin).', 'text', 'index', 0, 'หมายเลขพอร์ตของเมล์เซิร์ฟเวอร์ (ค่าปกติคือ 25, สำหรับ gmail ใช้ 465, 587 สำหรับ DirectAdmin)', NULL, 'ໝາຍເລກພອດຂອງເມວເຊີບເວີ(ຄ່າປົກກະຕິຄື 25, ສຳລັບ gmail ໃຊ້ 465, 587 ສຳລັບ DirectAdmin)'),
(184, 'Mail server settings', 'text', 'index', 0, 'ค่ากำหนดของเมล์เซิร์ฟเวอร์', NULL, 'ຄ່າກຳນົດຂອງເມວເຊີບເວີ'),
(185, 'Manage languages', 'text', 'index', 0, 'จัดการภาษา', NULL, 'ຈັດການພາສາ'),
(186, 'Member list', 'text', 'index', 0, 'รายชื่อสมาชิก', NULL, 'ລາຍຊື່ສະມາຊິກ'),
(187, 'Member status', 'text', 'index', 0, 'สถานะสมาชิก', NULL, 'ສະຖານະສະມາຊິກ'),
(188, 'Message', 'text', 'index', 0, 'ข้อความ', NULL, 'ຂໍ້ຄວາມ'),
(189, 'Message displayed on login page', 'text', 'index', 0, 'ข้อความแสดงในหน้าเข้าสู่ระบบ', NULL, 'ຂໍ້ຄວາມສະແດງຢູ່ໃນຫນ້າເຂົ້າສູ່ລະບົບ'),
(190, 'Model', 'text', 'index', 0, 'ยี่ห้อ', NULL, 'ຍີ່ຫໍ້'),
(191, 'Module', 'text', 'index', 0, 'โมดูล', NULL, 'ໂມດູນ'),
(192, 'Module settings', 'text', 'index', 0, 'ตั้งค่าโมดูล', NULL, 'ຕັ້ງຄ່າໂມດູນ'),
(193, 'month', 'text', 'index', 0, 'เดือน', NULL, 'ເດືອນ'),
(194, 'My Borrow', 'text', 'index', 0, 'รายการยืมของฉัน', NULL, 'ລາຍະການຍືມຂອງຂ້ອຍ'),
(195, 'Necessary cookies', 'text', 'index', 0, 'คุกกี้พื้นฐานที่จำเป็น', NULL, 'ຄຸກກີພື້ນຖານທີ່ຈໍາເປັນ'),
(196, 'New members', 'text', 'index', 0, 'สมาชิกใหม่', NULL, 'ສະມາຊິກໃໝ່'),
(197, 'no larger than :size', 'text', 'index', 0, 'ขนาดไม่เกิน :size', NULL, 'ຂະໜາດບໍ່ເກີນ :size'),
(198, 'No need to fill in English text. If the English text matches the Key', 'text', 'index', 0, 'ไม่จำเป็นต้องกรอกข้อความในภาษาอังกฤษ หากข้อความในภาษาอังกฤษตรงกับคีย์', NULL, 'ບໍ່ຈຳເປັນເພີ່ມຂໍ້ຄວາມໃນພາສາອັງກິດຫາກຂໍ້ຄວາມໃນພາສານອັງກົງກັບແປ້ນພີມ'),
(199, 'not a registered user', 'text', 'index', 0, 'ไม่พบสมาชิกนี้ลงทะเบียนไว้', NULL, 'ບໍ່ພົບສະມາຊິກນີ້ລົງທະບຽນໄວ້'),
(200, 'Not specified', 'text', 'index', 0, 'ไม่ระบุ', NULL, 'ບໍ່ໄດ້ກໍານົດ'),
(201, 'Note or additional notes', 'text', 'index', 0, 'คำอธิบายหรือหมายเหตุเพิ่มเติม', NULL, 'ຄໍາອະທິບາຍຫລືຫມາຍເຫດເພີ່ມເຕີມ'),
(202, 'Number such as %04d (%04d means 4 digits, maximum 11 digits)', 'text', 'index', 0, 'เลขที่ เช่น %04d (%04d หมายถึง ตัวเลข 4 หลัก สูงสุด 11 หลัก)', NULL, 'ຕົວເລກເຊັ່ນ %04d (%04d ຫມາຍຄວາມວ່າ 4 ຕົວເລກ, ສູງສຸດ 11 ຕົວເລກ)'),
(203, 'Other', 'text', 'index', 0, 'อื่นๆ', NULL, 'ອື່ນໆ'),
(204, 'Page details', 'text', 'index', 0, 'รายละเอียดของหน้า', NULL, 'ລາຍລະອຽດຂອງໜ້າ'),
(205, 'Password', 'text', 'index', 0, 'รหัสผ่าน', NULL, 'ລະຫັດຜ່ານ'),
(206, 'Password of the mail server. (To change the fill.)', 'text', 'index', 0, 'รหัสผ่านของเมล์เซิร์ฟเวอร์ (ต้องการเปลี่ยน ให้กรอก)', NULL, 'ລະຫັດຜ່ານຂອງເມວເຊີບເວີ (ຕ້ອງການປ່ຽນ ໃຫ້ເພີ່ມ)'),
(207, 'Passwords must be at least four characters', 'text', 'index', 0, 'รหัสผ่านต้องไม่น้อยกว่า 4 ตัวอักษร', NULL, 'ລະຫັດຜ່ານຕ້ອງບໍ່ຕ່ຳກວ່າ 4 ຕົວອັກສອນ'),
(208, 'Permission', 'text', 'index', 0, 'สิทธิ์การใช้งาน', NULL, 'ສິດໃນການໃຊ້ວຽກ'),
(209, 'persons', 'text', 'index', 0, 'ท่าน', NULL, 'ຄົນ'),
(210, 'Phone', 'text', 'index', 0, 'โทรศัพท์', NULL, 'ເບີໂທລະສັບ'),
(211, 'Please check the new member registration.', 'text', 'index', 0, 'กรุณาตรวจสอบการลงทะเบียนสมาชิกใหม่', NULL, 'ກະລຸນາກວດສອບການລົງທະບຽນສະມາຊິກໃໝ່.'),
(212, 'Please click the link to verify your email address.', 'text', 'index', 0, 'กรุณาคลิกลิงค์เพื่อยืนยันที่อยู่อีเมล', NULL, 'ກະລຸນາຄລິກທີ່ລິ້ງເພື່ອຢືນຢັນທີ່ຢູ່ອີເມວຂອງທ່ານ'),
(213, 'Please fill in', 'text', 'index', 0, 'กรุณากรอก', NULL, 'ກະລຸນາຕື່ມຂໍ້ມູນໃສ່'),
(214, 'Please fill up this form', 'text', 'index', 0, 'กรุณากรอกแบบฟอร์มนี้', NULL, 'ກະລຸນາຕື່ມແບບຟອມນີ້'),
(215, 'Please login', 'text', 'index', 0, 'กรุณาเข้าระบบ', NULL, 'ກະລຸນາເຂົ້າສູ່ລະບົບ'),
(216, 'Please select', 'text', 'index', 0, 'กรุณาเลือก', NULL, 'ກະລຸນາເລືອກ'),
(217, 'Please select :name at least one item', 'text', 'index', 0, 'กรุณาเลือก :name อย่างน้อย 1 รายการ', NULL, 'ກະລຸນາເລືອກ :name ຢ່າງໜ້ອຍ 1 ລາຍການ'),
(218, 'Please select from the search results', 'text', 'index', 0, 'กรุณาเลือกจากผลการค้นหา', NULL, 'ກະລຸນາເລືອກຈາກຜົນການຄົ້ນຫາ'),
(219, 'Port', 'text', 'index', 0, 'พอร์ต', NULL, 'ພອດ'),
(220, 'Prefix', 'text', 'index', 0, 'คำนำหน้า', NULL, 'ຄຳນຳໜ້າ'),
(221, 'Prefix, if changed The number will be counted again. You can enter %Y%M (year, month).', 'text', 'index', 0, 'คำนำหน้า ถ้ามีการเปลี่ยนแปลง เลขที่จะนับหนึ่งใหม่ สามารถใส่ %Y%M (ปี, เดือน) ได้', NULL, 'ຄໍານໍາຫນ້າ, ຖ້າມີການປ່ຽນແປງ ຕົວເລກທີ່ຈະນັບອີກຄັ້ງສາມາດໃສ່ເປັນ %Y%M (ປີ, ເດືອນ).'),
(222, 'Privacy Policy', 'text', 'index', 0, 'นโยบายความเป็นส่วนตัว', NULL, 'ນະໂຍບາຍຄວາມເປັນສ່ວນຕົວ'),
(223, 'Product code', 'text', 'index', 0, 'รหัสสินค้า', NULL, 'ລະຫັດສິນຄ້າ'),
(224, 'Profile', 'text', 'index', 0, 'ข้อมูลส่วนตัว', NULL, 'ຂໍ້ມູນສ່ວນຕົວ'),
(225, 'Province', 'text', 'index', 0, 'จังหวัด', NULL, 'ແຂວງ'),
(226, 'Quantity', 'text', 'index', 0, 'จำนวน', NULL, 'ຈໍານວນ'),
(227, 'Reason', 'text', 'index', 0, 'เหตุผล', NULL, 'ເຫດ​ຜົນ'),
(228, 'Register', 'text', 'index', 0, 'สมัครสมาชิก', NULL, 'ສະໝັກສະມາຊິກ'),
(229, 'Register successfully Please log in', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อยแล้วกรุณาเข้าสู่ระบบ', NULL, 'ລົງທະບຽນຢ່າງສຳເລັດຜົນກະລຸນາເຂົ້າສູ່ລະບົບ'),
(230, 'Register successfully, We have sent complete registration information to :email', 'text', 'index', 0, 'ลงทะเบียนสมาชิกใหม่เรียบร้อย เราได้ส่งข้อมูลการลงทะเบียนไปยัง :email', NULL, 'ລົງທະບຽນສຳເລັດແລ້ວ ເຮົາໄດ້ສົ່ງຂໍ້ມູນການລົງທະບຽນໄປທີ່ :email'),
(231, 'Registered successfully Please check your email :email and click the link to verify your email.', 'text', 'index', 0, 'ลงทะเบียนเรียบร้อย กรุณาตรวจสอบอีเมล์ :email และคลิงลิงค์ยืนยันอีเมล', NULL, 'ລົງທະບຽນສົບຜົນສໍາເລັດ ກະ​ລຸ​ນາ​ກວດ​ສອບ​ອີ​ເມວ​ຂອງ​ທ່ານ :email ແລະ​ຄລິກ​ໃສ່​ການ​ເຊື່ອມ​ຕໍ່​ເພື່ອ​ກວດ​ສອບ​ອີ​ເມວ​ຂອງ​ທ່ານ​.'),
(232, 'Remain', 'text', 'index', 0, 'คงเหลือ', NULL, 'ຄົງເຫລືອ'),
(233, 'Remember me', 'text', 'index', 0, 'จำการเข้าระบบ', NULL, 'ຈົດຈຳການເຂົ້າລະບົບ'),
(234, 'Remove', 'text', 'index', 0, 'ลบ', NULL, 'ລຶບ'),
(235, 'Report', 'text', 'index', 0, 'รายงาน', NULL, 'ບົດລາຍງານ'),
(236, 'resized automatically', 'text', 'index', 0, 'ปรับขนาดอัตโนมัติ', NULL, 'ປັບຂະໜາດອັດຕະໂນມັດ'),
(237, 'Return', 'text', 'index', 0, 'คืน', NULL, 'ຄືນ'),
(238, 'Returned', 'text', 'index', 0, 'ส่งคืน', NULL, 'ສົ່ງຄືນ'),
(239, 'Save', 'text', 'index', 0, 'บันทึก', NULL, 'ບັນທຶກ'),
(240, 'Save and email completed', 'text', 'index', 0, 'บันทึกและส่งอีเมลเรียบร้อย', NULL, 'ບັນທຶກແລະສົ່ງອີເມວຮຽນຮ້ອຍ'),
(241, 'Saved successfully', 'text', 'index', 0, 'บันทึกเรียบร้อย', NULL, 'ບັນທຶກຮຽບຮ້ອຍ'),
(242, 'scroll to top', 'text', 'index', 0, 'เลื่อนขึ้นด้านบน', NULL, 'ເລື່ອນຂື້ນດ້ານເທິງ'),
(243, 'Search', 'text', 'index', 0, 'ค้นหา', NULL, 'ຄົ້ນຫາ'),
(244, 'Search <strong>:search</strong> found :count entries, displayed :start to :end, page :page of :total pages', 'text', 'index', 0, 'ค้นหา <strong>:search</strong> พบ :count รายการ แสดงรายการที่ :start - :end หน้าที่ :page จากทั้งหมด :total หน้า', NULL, 'ຄົ້ນຫາ <strong>:search</strong> ພົບ :count ລາຍການ ສະແດງລາຍການທີ່:start - :end ໜ້າທີ່:page ຈາກທັງໝົດ :total ໜ້າ'),
(245, 'Search for equipment and then choose from the list', 'text', 'index', 0, 'ค้นหาพัสดุ แล้วเลือกจากรายการ', NULL, 'ຄົ້ນຫາພັສດຸແລ້ວເລືອກຈາກລາຍະການ'),
(246, 'Send a welcome email to new members', 'text', 'index', 0, 'ส่งข้อความต้อนรับสมาชิกใหม่', NULL, 'ສົ່ງອີເມວຕ້ອນຮັບກັບສະມາຊິກໃຫມ່'),
(247, 'Send login authorization email', 'text', 'index', 0, 'ส่งอีเมลอนุมัติการเข้าระบบ', NULL, 'ສົ່ງອີເມວການອະນຸຍາດເຂົ້າສູ່ລະບົບ'),
(248, 'Send member confirmation email', 'text', 'index', 0, 'ส่งอีเมลยืนยันสมาชิก', NULL, 'ສົ່ງອີເມລ໌ຢືນຢັນສະມາຊິກ'),
(249, 'send message to user When a user adds LINE&#039;s official account as a friend', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ใช้ เมื่อผู้ใช้เพิ่มบัญชีทางการของไลน์เป็นเพื่อน', NULL, 'ສົ່ງຂໍ້ຄວາມຫາຜູ້ໃຊ້ ເມື່ອຜູ້ໃຊ້ເພີ່ມບັນຊີທາງການຂອງ LINE ເປັນໝູ່'),
(250, 'Send notification messages When making a transaction', 'text', 'index', 0, 'ส่งข้อความแจ้งเตือนเมื่อมีการทำรายการ', NULL, 'ສົ່ງຂໍ້ຄວາມແຈ້ງເຕືອນເມື່ອມີການເຮັດທຸລະກຳ'),
(251, 'Serial/Registration No.', 'text', 'index', 0, 'หมายเลขเครื่อง/เลขทะเบียน', NULL, 'ຫມາຍເລກເຄື່ອງ/ເລກທະບຽນ'),
(252, 'Server time', 'text', 'index', 0, 'เวลาเซิร์ฟเวอร์', NULL, 'ເວລາຂອງເຊີບເວີ'),
(253, 'Set the application for send an email', 'text', 'index', 0, 'เลือกโปรแกรมที่ใช้ในการส่งอีเมล', NULL, 'ເລືອກໂປຮແກຮມທີ່ໃຊ້ໃນການສົ່ງອີເມວ'),
(254, 'Setting up the email system', 'text', 'index', 0, 'การตั้งค่าเกี่ยวกับระบบอีเมล', NULL, 'ການຕັ້ງຄ່າກ່ຽວກັບລະບົບອີເມວ'),
(255, 'Settings', 'text', 'index', 0, 'ตั้งค่า', NULL, 'ຕັ້ງຄ່າ'),
(256, 'Settings the conditions for member login', 'text', 'index', 0, 'ตั้งค่าเงื่อนไขในการตรวจสอบการเข้าสู่ระบบ', NULL, 'ຕັ້ງເງື່ອນໄຂການກວດສອບການເຂົ້າລະບົບ'),
(257, 'Settings the timing of the server to match the local time', 'text', 'index', 0, 'ตั้งค่าเขตเวลาของเซิร์ฟเวอร์ ให้ตรงกันกับเวลาท้องถิ่น', NULL, 'ຕັ້ງຄ່າເຂດເວລາຂອງເຊີບເວີ ໃຫ້ກົງກັບເວລາທ້ອງຖີ່ນ'),
(258, 'Sex', 'text', 'index', 0, 'เพศ', NULL, 'ເພດ'),
(259, 'Short description about your website', 'text', 'index', 0, 'ข้อความสั้นๆอธิบายว่าเป็นเว็บไซต์เกี่ยวกับอะไร', NULL, 'ຂໍ້ຄວາມສັ້ນໆ ອະທິບາຍວ່າເປັນເວັບໄຊກ່ຽວກັບຫຍັງ'),
(260, 'Show', 'text', 'index', 0, 'แสดง', NULL, 'ສະແດງ'),
(261, 'Show web title with logo', 'text', 'index', 0, 'แสดงชื่อเว็บและโลโก', NULL, 'ສະແດງຊື່ເວັບແລະໂລໂກ້'),
(262, 'Site Name', 'text', 'index', 0, 'ชื่อของเว็บไซต์', NULL, 'ຊື່ຂອງເວັບໄຊ'),
(263, 'Site settings', 'text', 'index', 0, 'ตั้งค่าเว็บไซต์', NULL, 'ຕັ້ງຄ່າເວັບໄຊ'),
(264, 'size :width*:height pixel', 'text', 'index', 0, 'ขนาด :width*:height พิกเซล', NULL, 'ຂະໜາດ :width*:height ຟິດເຊວล'),
(265, 'Size of', 'text', 'index', 0, 'ขนาดของ', NULL, 'ຂະໜາດຂອງ'),
(266, 'skip to content', 'text', 'index', 0, 'ข้ามไปยังเนื้อหา', NULL, 'ຂ້າມໄປຍັງເນື້ອຫາ'),
(267, 'Sorry', 'text', 'index', 0, 'ขออภัย', NULL, 'ຂໍໂທດ'),
(268, 'Sorry, cannot find a page called Please check the URL or try the call again.', 'text', 'index', 0, 'ขออภัย ไม่พบหน้าที่เรียก โปรดตรวจสอบ URL หรือลองเรียกอีกครั้ง', NULL, 'ຂໍ​ອະ​ໄພ, ບໍ່​ສາ​ມາດ​ຊອກ​ຫາ​ຫນ້າ​ທີ່​ຮ້ອງ​ຂໍ. ກະ​ລຸ​ນາ​ກວດ​ສອບ URL ຫຼື​ພະ​ຍາ​ຍາມ​ດຶງ​ຂໍ້​ມູນ​ອີກ​ເທື່ອ​ຫນຶ່ງ.'),
(269, 'Sorry, Item not found It&#39;s may be deleted', 'text', 'index', 0, 'ขออภัย ไม่พบรายการที่เลือก รายการนี้อาจถูกลบไปแล้ว', NULL, 'ຂໍໂທດ ບໍ່ພົບລາຍການທີ່ເລືອກ ລາຍການນີ້ອາດຖືກລຶບໄປແລ້ວ'),
(270, 'Specify the language code of the email, as utf-8', 'text', 'index', 0, 'ระบุรหัสภาษาของอีเมลที่ส่ง เช่น utf-8', NULL, 'ລະບຸລະຫັດພາສາຂອງອີເມວທີ່ສົ່ງເຊັ່ນ utf-8'),
(271, 'Start a new line with the web name', 'text', 'index', 0, 'ขึ้นบรรทัดใหม่ชื่อเว็บ', NULL, 'ເລີ່ມແຖວໃໝ່ຊື່ເວັບ'),
(272, 'Status', 'text', 'index', 0, 'สถานะ', NULL, 'ສະຖານະ'),
(273, 'Status for general members', 'text', 'index', 0, 'สถานะสำหรับสมาชิกทั่วไป', NULL, 'ສະຖານະສຳລັບສະມາຊິກທົ່ວໄປ'),
(274, 'Status update', 'text', 'index', 0, 'ปรับปรุงสถานะ', NULL, 'ປັບປຸງສະຖານະ'),
(275, 'Stock', 'text', 'index', 0, 'คงเหลือ', NULL, 'ທີ່ຍັງເຫຼືອ'),
(276, 'Style', 'text', 'index', 0, 'รูปแบบ', NULL, 'ຮູບແບບ'),
(277, 'Text color', 'text', 'index', 0, 'สีตัวอักษร', NULL, 'ສີຕົວອັກສອນ'),
(278, 'The amount delivered is greater than the amount borrowed', 'text', 'index', 0, 'จำนวนที่ส่งมอบมากกว่าจำนวนที่ยืม', NULL, 'ຈຳນວນທີ່ຖືກສົ່ງແມ່ນໃຫຍ່ກວ່າຈຳນວນທີ່ຖືກຢືມ.'),
(279, 'The amount returned is greater than the amount delivered', 'text', 'index', 0, 'จำนวนที่คืนมากกว่าจำนวนที่ส่งมอบ', NULL, 'ຈໍານວນທີ່ສົ່ງຄືນແມ່ນສູງກວ່າຈໍານວນທີ່ສົ່ງ'),
(280, 'The amount returned is not equal to the amount delivered', 'text', 'index', 0, 'จำนวนที่คืนไม่เท่ากับจำนวนที่ส่งมอบ', NULL, 'ຈໍານວນທີ່ສົ່ງຄືນແມ່ນບໍ່ເທົ່າກັບຈໍານວນທີ່ສົ່ງ'),
(281, 'The e-mail address of the person or entity that has the authority to make decisions about the collection, use or dissemination of personal data.', 'text', 'index', 0, 'ที่อยู่อีเมลของบุคคลหรือนิติบุคคลที่มีอำนาจตัดสินใจเกี่ยวกับการเก็บรวบรวม ใช้ หรือเผยแพร่ข้อมูลส่วนบุคคล', NULL, 'ທີ່ຢູ່ອີເມລ໌ຂອງບຸກຄົນຫຼືຫນ່ວຍງານທີ່ມີອໍານາດໃນການຕັດສິນໃຈກ່ຽວກັບການລວບລວມ, ການນໍາໃຊ້ຫຼືການເຜີຍແຜ່ຂໍ້ມູນສ່ວນບຸກຄົນ.'),
(282, 'The members status of the site', 'text', 'index', 0, 'สถานะของสมาชิกของเว็บไซต์', NULL, 'ສະຖານະຂອງສະມາຂິກຂອງເວັບໄຊ'),
(283, 'The message has been sent to the admin successfully. Please wait a moment for the admin to approve the registration. You can log back in later if approved.', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ดูแลระบบเรียบร้อยแล้ว กรุณารอสักครู่เพื่อให้ผู้ดูแลระบบอนุมัติการลงทะเบียน คุณสามารถกลับมาเข้าระบบได้ในภายหลังหากได้รับการอนุมัติแล้ว', NULL, 'ຂໍ້ຄວາມດັ່ງກ່າວໄດ້ຖືກສົ່ງໄປຫາຜູ້ເບິ່ງແຍງຢ່າງສໍາເລັດຜົນ. ກະລຸນາລໍຖ້າໃຫ້ຜູ້ເບິ່ງແຍງລະບົບອະນຸມັດການລົງທະບຽນ. ທ່ານສາມາດເຂົ້າສູ່ລະບົບຄືນໄດ້ໃນພາຍຫຼັງຖ້າໄດ້ຮັບການອະນຸມັດ.'),
(284, 'The name of the mail server as localhost or smtp.gmail.com (To change the settings of your email is the default. To remove this box entirely.)', 'text', 'index', 0, 'ชื่อของเมล์เซิร์ฟเวอร์ เช่น localhost หรือ smtp.gmail.com (ต้องการเปลี่ยนค่ากำหนดของอีเมลทั้งหมดเป็นค่าเริ่มต้น ให้ลบข้อความในช่องนี้ออกทั้งหมด)', NULL, 'ຊື່ຂອງເມວເຊີບເວີເຊັ່ນ localhost หรือ chitdpt@gmail.com (ຕ້ອງປ່ຽນຄ່າກຳນົດຂອງອີເມວທັງໝົດເປັນຄ່າເລີ່ມຕົ້ນ ໃຫ້ລຶບຂໍ້ຄວາມໃນຊ່ອງນີ້ອອກທັງໝົດ)'),
(285, 'The type of file is invalid', 'text', 'index', 0, 'ชนิดของไฟล์ไม่รองรับ', NULL, 'ປະເພດຂອງໄຟລ໌ບໍ່ຖືກຕ້ອງ'),
(286, 'Theme', 'text', 'index', 0, 'ธีม', NULL, 'ຮູບແບບສີສັນ'),
(287, 'There is not enough :name (remaining :stock :unit)', 'text', 'index', 0, 'มีสินค้า :name ไม่เพียงพอ (คงเหลือ :stock :unit)', NULL, 'ຜະລິດຕະພັນ :name ບໍ່ພຽງພໍ (ຍັງເຫຼືອ :stock :unit)'),
(288, 'This :name already exist', 'text', 'index', 0, 'มี :name นี้อยู่ก่อนแล้ว', NULL, 'ມີ :name ນີ້ຢູ່ກ່ອນແລ້ວ'),
(289, 'This website uses cookies to provide our services. To find out more about our use of cookies, please see our :privacy.', 'text', 'index', 0, 'เว็บไซต์นี้มีการใช้คุกกี้เพื่อปรับปรุงการให้บริการ หากต้องการข้อมูลเพิ่มเติมเกี่ยวกับการใช้คุกกี้ของเรา โปรดดู :privacy', NULL, 'ເວັບໄຊທ໌ນີ້ໃຊ້ຄຸກກີເພື່ອປັບປຸງການບໍລິການ. ສໍາລັບຂໍ້ມູນເພີ່ມເຕີມກ່ຽວກັບການນໍາໃຊ້ຄຸກກີຂອງພວກເຮົາ, ເບິ່ງ :privacy'),
(290, 'time', 'text', 'index', 0, 'เวลา', NULL, 'ເວລາ'),
(291, 'Time zone', 'text', 'index', 0, 'เขตเวลา', NULL, 'ເຂດເວລາ'),
(292, 'times', 'text', 'index', 0, 'ครั้ง', NULL, 'ຄັ້ງ'),
(293, 'to', 'text', 'index', 0, 'ถึง', NULL, 'ເຖິງ'),
(294, 'To change your password, enter your password to match the two inputs', 'text', 'index', 0, 'ถ้าต้องการเปลี่ยนรหัสผ่าน กรุณากรอกรหัสผ่านสองช่องให้ตรงกัน', NULL, 'ຖ້າຕ້ອງການປ່ຽນລະຫັດຜ່ານກະລຸນາເພີ່ມລະຫັດຜ່ານສອງຊ່ອງໃຫ້ກົງກັນ'),
(295, 'Topic', 'text', 'index', 0, 'หัวข้อ', NULL, 'ຫົວຂໍ້'),
(296, 'Transaction date', 'text', 'index', 0, 'วันที่ทำรายการ', NULL, 'ວັນທີ່ເຮັດລາຍະການ'),
(297, 'Transaction details', 'text', 'index', 0, 'รายละเอียดการทำรายการ', NULL, 'ລາຍະລະອຽດການເຮັດລາຍະການ'),
(298, 'Transaction history', 'text', 'index', 0, 'ประวัติการทำรายการ', NULL, 'ປະວັດການເຮັດລາຍະການ'),
(299, 'Transaction No.', 'text', 'index', 0, 'เลขที่การทำรายการ', NULL, 'ເລກທີ່ການເຮັດລາຍະການ'),
(300, 'Type', 'text', 'index', 0, 'ชนิด', NULL, 'ປະເພດ'),
(301, 'Un-Returned items', 'text', 'index', 0, 'รายการครบกำหนดคืน', NULL, 'ລາຍະການຄົບກໍາຫນົດຄືນ'),
(302, 'Unable to complete the transaction', 'text', 'index', 0, 'ไม่สามารถทำรายการนี้ได้', NULL, 'ບໍ່ສາມາດເຮັດລາຍການນີ້ໄດ້'),
(303, 'Unit', 'text', 'index', 0, 'หน่วย', NULL, 'ໜ່ວຍ'),
(304, 'Upload', 'text', 'index', 0, 'อัปโหลด', NULL, 'ອັບໂຫຼດ'),
(305, 'Upload :type files', 'text', 'index', 0, 'อัปโหลดไฟล์ :type', NULL, 'ອັບໂຫຼດແຟ້ມຂໍ້ມູນ :type'),
(306, 'URL must begin with http:// or https://', 'text', 'index', 0, 'URL ต้องขึ้นต้นด้วย http:// หรือ https://', NULL, 'URL ຕ້ອງເລີ່ມຕົ້ນດ້ວຍ http:// ຫຼື https://'),
(307, 'Usage history', 'text', 'index', 0, 'ประวัติการใช้งาน', NULL, 'ປະ​ຫວັດ​ການ​ນໍາ​ໃຊ້​'),
(308, 'Use the theme&#039;s default settings.', 'text', 'index', 0, 'ใช้การตั้งค่าเริ่มต้นของธีม', NULL, 'ໃຊ້ການຕັ້ງຄ່າເລີ່ມຕົ້ນຂອງຮູບແບບສີສັນ.'),
(309, 'User', 'text', 'index', 0, 'สมาชิก', NULL, 'ສະມາຊິກ'),
(310, 'Username', 'text', 'index', 0, 'ชื่อผู้ใช้', NULL, 'ຊື່ຜູ້ໃຊ້'),
(311, 'Username for the mail server. (To change, enter a new value.)', 'text', 'index', 0, 'ชื่อผู้ใช้ของเมล์เซิร์ฟเวอร์ (ต้องการเปลี่ยน ให้กรอก)', NULL, 'ຊື່ຜູ້ໃຊ້ຂອງເມວເຊີບເວີ (ຕ້ອງການປ່ຽນ ໃຫ້ເພີ່ມ)'),
(312, 'Users', 'text', 'index', 0, 'สมาชิก', NULL, 'ສະມາຊິກ'),
(313, 'Version', 'text', 'index', 0, 'รุ่น', NULL, 'ຮຸ່ນ'),
(314, 'Waiting list', 'text', 'index', 0, 'รายการรอตรวจสอบ', NULL, 'ລາຍຊື່ລໍຖ້າ'),
(315, 'Waiting to check from the staff', 'text', 'index', 0, 'รอตรวจสอบจากเจ้าหน้าที่', NULL, 'ລໍຖ້າການກວດສອບຈາກພະນັກງານ'),
(316, 'Website template', 'text', 'index', 0, 'แม่แบบเว็บไซต์', NULL, 'ແມ່ແບບເວັບໄຊທ໌'),
(317, 'Website title', 'text', 'index', 0, 'ชื่อเว็บ', NULL, 'ຊື່ເວັບ'),
(318, 'Welcome', 'text', 'index', 0, 'สวัสดี', NULL, 'ສະບາຍດີ'),
(319, 'Welcome %s, login complete', 'text', 'index', 0, 'สวัสดี คุณ %s ยินดีต้อนรับเข้าสู่ระบบ', NULL, 'ສະບາຍດີທ່ານ %s ຍິນດີຕ້ອນຮັບເຂົ້າສູ່ລະບົບ'),
(320, 'Welcome new members', 'text', 'index', 0, 'ยินดีต้อนรับสมาชิกใหม่', NULL, 'ຍິນດີຕ້ອນຮັບສະມາຊິກໃໝ່'),
(321, 'When enabled Social accounts can be logged in as an administrator. (Some abilities will not be available)', 'text', 'index', 0, 'เมื่อเปิดใช้งาน บัญชีโซเชียลจะสามารถเข้าระบบเป็นผู้ดูแลได้ (ความสามารถบางอย่างจะไม่สามารถใช้งานได้)', NULL, 'ເມື່ອເປີດໃຊ້ງານ ບັນຊີສັງຄົມສາມາດເຂົ້າສູ່ລະບົບເປັນຜູ້ບໍລິຫານ. (ຄວາມສາມາດບາງຢ່າງຈະບໍ່ມີ)'),
(322, 'When enabled, a cookies consent banner will be displayed.', 'text', 'index', 0, 'เมื่อเปิดใช้งานระบบจะแสดงแบนเนอร์ขออนุญาตใช้งานคุ้กกี้', NULL, 'ເມື່ອເປີດໃຊ້ງານແລ້ວ, ປ້າຍໂຄສະນາການຍິນຍອມຂອງ cookies ຈະສະແດງຂຶ້ນ.'),
(323, 'When enabled, Members registered with email must also verify their email address. It is not recommended to use in conjunction with other login methods.', 'text', 'index', 0, 'เมื่อเปิดใช้งาน สมาชิกที่ลงทะเบียนด้วยอีเมลจะต้องยืนยันที่อยู่อีเมลด้วย ไม่แนะนำให้ใช้ร่วมกับการเข้าระบบด้วยช่องทางอื่นๆ', NULL, 'ເມື່ອເປີດໃຊ້ ສະມາຊິກທີ່ລົງທະບຽນກັບອີເມລ໌ຈະຕ້ອງຢືນຢັນທີ່ຢູ່ອີເມວຂອງເຂົາເຈົ້າ. ມັນບໍ່ໄດ້ຖືກແນະນໍາໃຫ້ໃຊ້ຮ່ວມກັບວິທີການເຂົ້າສູ່ລະບົບອື່ນໆ.'),
(324, 'Width', 'text', 'index', 0, 'กว้าง', NULL, 'ກວ້າງ'),
(325, 'With selected', 'text', 'index', 0, 'ทำกับที่เลือก', NULL, 'ເຮັດກັບທີ່ເລືອກ'),
(326, 'year', 'text', 'index', 0, 'ปี', NULL, 'ປີ'),
(327, 'You can enter your LINE user ID below on your personal information page. to link your account to this official account', 'text', 'index', 0, 'คุณสามารถกรอก LINE user ID ด้านล่างในหน้าข้อมูลส่วนตัวของคุณ เพื่อผูกบัญชีของคุณเข้ากับบัญชีทางการนี้ได้', NULL, 'ທ່ານສາມາດໃສ່ LINE user ID ຂອງທ່ານຂ້າງລຸ່ມນີ້ຢູ່ໃນຫນ້າຂໍ້ມູນສ່ວນຕົວຂອງທ່ານ. ເພື່ອເຊື່ອມຕໍ່ບັນຊີຂອງທ່ານກັບບັນຊີທາງການນີ້'),
(328, 'You can login at', 'text', 'index', 0, 'คุณสามารถเข้าระบบได้ที่', NULL, 'ທ່ານສາມາດເຂົ້າສູ່ລະບົບໄດ້ທີ່'),
(329, 'You have not returned the equipment. Please return it first.', 'text', 'index', 0, 'คุณยังไม่ได้คืนพัสดุ กรุณาคืนพัสดุก่อน', NULL, 'ຄຸນຍັງບໍ່ໄດ້ຄືນພັສດຸກະລຸນາຄືນພັສດຸກ່ອນ'),
(330, 'You haven&#039;t verified your email address. Please check your email. and click the link in the email', 'text', 'index', 0, 'คุณยังไม่ได้ยืนยันที่อยู่อีเมล กรุณาตรวจสอบอีเมลของคุณ และคลิกลิงค์ในอีเมล', NULL, 'ທ່ານຍັງບໍ່ໄດ້ຢືນຢັນທີ່ຢູ່ອີເມວຂອງທ່ານ. ກະລຸນາກວດເບິ່ງອີເມວຂອງທ່ານ. ແລະຄລິກໃສ່ການເຊື່ອມຕໍ່ໃນອີເມລ໌'),
(331, 'You want to', 'text', 'index', 0, 'คุณต้องการ', NULL, 'ທ່ານຕ້ອງການ'),
(332, 'Your account has been approved.', 'text', 'index', 0, 'บัญชีของท่านได้รับการอนุมัติเรียบร้อยแล้ว', NULL, 'ບັນຊີຂອງທ່ານໄດ້ຮັບການອະນຸມັດແລ້ວ.'),
(333, 'Your account has not been approved, please wait or contact the administrator.', 'text', 'index', 0, 'บัญชีของท่านยังไม่ได้รับการอนุมัติ กรุณารอ หรือติดต่อสอบถามไปยังผู้ดูแล', NULL, 'ບັນຊີຂອງທ່ານບໍ່ໄດ້ຮັບການອະນຸມັດ, ກະລຸນາລໍຖ້າ ຫຼືຕິດຕໍ່ຜູ້ເບິ່ງແຍງລະບົບ.'),
(334, 'Your message was sent successfully', 'text', 'index', 0, 'ส่งข้อความไปยังผู้ที่เกี่ยวข้องเรียบร้อยแล้ว', NULL, 'ສົ່ງຂໍ້ຄວາມໄປຍັງຜູ້ຮັບຮຽບຮ້ອຍແລ້ວ'),
(335, 'Your new password is', 'text', 'index', 0, 'รหัสผ่านใหม่ของคุณคือ', NULL, 'ລະຫັດຜ່ານໃໝ່ຂອງທ່ານຄື'),
(336, 'Your registration information', 'text', 'index', 0, 'ข้อมูลการลงทะเบียนของคุณ', NULL, 'ຂໍ້ມູນການລົງທະບຽນຂອງທ່ານ'),
(337, 'Zipcode', 'text', 'index', 0, 'รหัสไปรษณีย์', NULL, 'ລະຫັດໄປສະນີ');

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
(1, 1, 'inventory', 'Save', '2024-05-25 16:14:49', NULL, 1, '{LNG_Serial/Registration No.} ID : 1', NULL),
(2, 4, 'inventory', 'Save', '2024-05-25 16:16:02', NULL, 1, '{LNG_Equipment} ID : 4', NULL),
(3, 1, 'index', 'User', '2024-05-25 17:28:19', NULL, 1, '{LNG_Login} IP ::1', NULL),
(4, 0, 'index', 'Save', '2024-05-25 17:51:18', NULL, 1, '{LNG_General site settings}', NULL),
(5, 0, 'inventory', 'Delete', '2024-05-25 17:51:53', NULL, 1, '{LNG_Delete} {LNG_Inventory} ID : 3, 2, 1', NULL),
(6, 0, 'inventory', 'Save', '2024-05-25 17:52:47', NULL, 1, 'หมวดหมู่', NULL),
(7, 0, 'inventory', 'Save', '2024-05-25 17:53:18', NULL, 1, 'ประเภท', NULL),
(8, 4, 'inventory', 'Save', '2024-05-25 17:53:39', NULL, 1, '{LNG_Equipment} ID : 4', NULL),
(9, 0, 'inventory', 'Save', '2024-05-25 17:54:07', NULL, 1, 'ยี่ห้อ', NULL),
(10, 4, 'inventory', 'Save', '2024-05-25 17:54:20', NULL, 1, '{LNG_Equipment} ID : 4', NULL),
(11, 4, 'inventory', 'Save', '2024-05-25 17:55:53', NULL, 1, '{LNG_Equipment} ID : 4', NULL),
(12, 0, 'inventory', 'Save', '2024-05-25 17:56:04', NULL, 1, 'unit', NULL),
(13, 4, 'inventory', 'Save', '2024-05-25 17:56:25', NULL, 1, '{LNG_Equipment} ID : 4', NULL),
(14, 5, 'inventory', 'Save', '2024-05-25 17:57:49', NULL, 1, '{LNG_Equipment} ID : 5', NULL),
(15, 4, 'inventory', 'Save', '2024-05-25 17:58:14', NULL, 1, '{LNG_Equipment} ID : 4', NULL),
(16, 5, 'inventory', 'Save', '2024-05-25 18:24:16', NULL, 1, '{LNG_Equipment} ID : 5', NULL),
(17, 4, 'inventory', 'Save', '2024-05-25 18:24:35', NULL, 1, '{LNG_Equipment} ID : 4', NULL),
(18, 1, 'index', 'User', '2024-05-25 18:28:20', NULL, 1, '{LNG_Login} IP ::1', NULL),
(19, 5, 'inventory', 'Save', '2024-05-25 18:44:35', NULL, 1, '{LNG_Equipment} ID : 5', NULL),
(20, 4, 'inventory', 'Save', '2024-05-25 18:44:44', NULL, 1, '{LNG_Equipment} ID : 4', NULL),
(21, 0, 'index', 'Save', '2024-05-25 18:55:02', NULL, 1, '{LNG_The members status of the site}', NULL),
(22, 0, 'index', 'Save', '2024-05-25 18:55:10', NULL, 1, '{LNG_The members status of the site}', NULL),
(23, 0, 'index', 'Save', '2024-05-25 18:55:17', NULL, 1, '{LNG_The members status of the site}', NULL),
(24, 0, 'inventory', 'Delete', '2024-05-25 18:56:27', NULL, 1, '{LNG_Delete} {LNG_Inventory} ID : 4', NULL),
(25, 5, 'inventory', 'Save', '2024-05-25 18:57:19', NULL, 1, '{LNG_Serial/Registration No.} ID : 5', NULL),
(26, 5, 'inventory', 'Save', '2024-05-25 18:58:04', NULL, 1, '{LNG_Equipment} ID : 5', NULL),
(27, 3, 'index', 'User', '2024-05-25 19:23:34', NULL, 3, '{LNG_Create new account} ID : 3', NULL),
(28, 3, 'index', 'User', '2024-05-25 19:23:48', NULL, 3, '{LNG_Login} IP ::1', NULL),
(29, 0, 'index', 'User', '2024-05-25 19:24:17', NULL, 1, '{LNG_Update permission} ID : 3', NULL),
(30, 0, 'index', 'User', '2024-05-25 19:24:19', NULL, 1, '{LNG_Update permission} ID : 3', NULL),
(31, 3, 'index', 'User', '2024-05-25 19:24:37', NULL, 3, '{LNG_Login} IP ::1', NULL),
(32, 1, 'index', 'User', '2024-05-25 19:29:05', NULL, 1, '{LNG_Login} IP ::1', NULL),
(33, 6, 'inventory', 'Save', '2024-05-25 19:30:54', NULL, 1, '{LNG_Equipment} ID : 6', NULL),
(34, 7, 'inventory', 'Save', '2024-05-25 19:33:42', NULL, 1, '{LNG_Equipment} ID : 7', NULL),
(35, 8, 'inventory', 'Save', '2024-05-25 19:35:56', NULL, 1, '{LNG_Equipment} ID : 8', NULL),
(36, 2, 'index', 'User', '2024-05-25 19:36:45', NULL, 2, '{LNG_Login} IP ::1', NULL),
(37, 0, 'inventory', 'Save', '2024-05-25 19:47:53', NULL, 1, 'unit', NULL),
(38, 0, 'index', 'Save', '2024-05-25 20:14:03', NULL, 1, '{LNG_General site settings}', NULL),
(39, 0, 'index', 'User', '2024-05-25 20:19:47', NULL, 1, '{LNG_Update permission} ID : 3', NULL),
(40, 0, 'index', 'User', '2024-05-25 20:19:48', NULL, 1, '{LNG_Update permission} ID : 3', NULL),
(41, 0, 'index', 'User', '2024-05-25 20:19:48', NULL, 1, '{LNG_Update permission} ID : 3', NULL),
(42, 0, 'index', 'User', '2024-05-25 20:19:49', NULL, 1, '{LNG_Update permission} ID : 3', NULL),
(43, 3, 'index', 'User', '2024-05-25 20:20:41', NULL, 3, '{LNG_Login} IP ::1', NULL),
(44, 2, 'index', 'User', '2024-05-25 20:21:46', NULL, 2, '{LNG_Login} IP ::1', NULL),
(45, 1, 'borrow', 'Save', '2024-05-25 20:22:14', NULL, 2, '{LNG_Borrow} &amp; {LNG_Add Borrow}', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0001\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\",\"id\":1}'),
(46, 2, 'borrow', 'Save', '2024-05-25 20:22:33', NULL, 2, '{LNG_Borrow} &amp; {LNG_Add Borrow}', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0002\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\",\"id\":2}'),
(47, 3, 'borrow', 'Save', '2024-05-25 20:22:48', NULL, 2, '{LNG_Borrow} &amp; {LNG_Add Borrow}', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0003\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\",\"id\":3}'),
(48, 4, 'borrow', 'Save', '2024-05-25 20:23:03', NULL, 2, '{LNG_Borrow} &amp; {LNG_Add Borrow}', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0004\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\",\"id\":4}'),
(49, 0, 'index', 'User', '2024-05-25 20:24:05', NULL, 1, '{LNG_Update permission} ID : 3', NULL),
(50, 3, 'index', 'User', '2024-05-25 20:24:36', NULL, 3, '{LNG_Login} IP ::1', NULL),
(51, 1, 'borrow', 'Status', '2024-05-25 20:24:55', NULL, 3, 'กรดไฮโดรคลอริก(กรดเกลือ) เข้มข้น รอตรวจสอบ', NULL),
(52, 1, 'borrow', 'Save', '2024-05-25 20:24:59', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0001\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(53, 2, 'borrow', 'Save', '2024-05-25 20:25:14', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0002\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(54, 4, 'borrow', 'Status', '2024-05-25 20:26:23', NULL, 3, 'กรดไฮโดรคลอริก(กรดเกลือ) เข้มข้น อนุมัติ', NULL),
(55, 4, 'borrow', 'Save', '2024-05-25 20:26:25', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0004\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(56, 1, 'borrow', 'Save', '2024-05-25 20:26:40', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0001\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(57, 1, 'borrow', 'Save', '2024-05-25 20:26:57', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0001\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(58, 1, 'borrow', 'Save', '2024-05-25 20:27:24', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0001\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(59, 3, 'index', 'User', '2024-05-25 20:27:43', NULL, 3, '{LNG_Login} IP ::1', NULL),
(60, 2, 'borrow', 'Status', '2024-05-25 20:27:53', NULL, 3, 'โพแทสเซียมเปอร์แมงกาแนต (ด่างทับทิม) (Potassium Permanganate) ไม่อนุมัติ', NULL),
(61, 2, 'borrow', 'Save', '2024-05-25 20:27:55', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0002\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(62, 3, 'borrow', 'Status', '2024-05-25 20:28:32', NULL, 3, 'โซเดียมไฮดรอกไซด์ เม็ด (โซดาไฟ) (Sodium Hydroxide Pellet) อนุมัติ', NULL),
(63, 3, 'borrow', 'Save', '2024-05-25 20:28:33', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0003\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(64, 1, 'borrow', 'Status', '2024-05-25 20:29:01', NULL, 3, 'กรดไฮโดรคลอริก(กรดเกลือ) เข้มข้น ไม่อนุมัติ', NULL),
(65, 1, 'borrow', 'Save', '2024-05-25 20:29:03', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6705-0001\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(66, 2, 'index', 'User', '2024-05-25 20:29:33', NULL, 2, '{LNG_Login} IP ::1', NULL),
(67, 1, 'index', 'User', '2024-05-25 20:30:16', NULL, 1, '{LNG_Login} IP ::1', NULL),
(68, 3, 'index', 'User', '2024-05-25 20:30:54', NULL, 3, '{LNG_Login} IP ::1', NULL),
(69, 0, 'index', 'Save', '2024-05-25 20:34:54', NULL, 1, '{LNG_General site settings}', NULL),
(70, 0, 'index', 'Save', '2024-05-25 20:35:12', NULL, 1, '{LNG_General site settings}', NULL),
(71, 0, 'index', 'Save', '2024-05-25 20:35:45', NULL, 1, '{LNG_General site settings}', NULL),
(72, 0, 'index', 'Save', '2024-05-25 20:35:59', NULL, 1, '{LNG_General site settings}', NULL),
(73, 0, 'index', 'Save', '2024-05-25 20:36:12', NULL, 1, '{LNG_General site settings}', NULL),
(74, 0, 'index', 'Save', '2024-05-25 20:36:35', NULL, 1, '{LNG_General site settings}', NULL),
(75, 0, 'index', 'Save', '2024-05-25 20:37:01', NULL, 1, '{LNG_Settings} {LNG_Login page}', NULL),
(76, 0, 'index', 'Save', '2024-05-25 20:37:26', NULL, 1, '{LNG_Settings} {LNG_Login page}', NULL),
(77, 8, 'inventory', 'Save', '2024-05-25 20:46:51', NULL, 1, '{LNG_Equipment} ID : 8', NULL),
(78, 4, 'index', 'User', '2024-05-25 20:47:57', NULL, 4, '{LNG_Create new account} ID : 4', NULL),
(79, 4, 'index', 'User', '2024-05-25 20:48:21', NULL, 4, '{LNG_Login} IP ::1', NULL),
(80, 5, 'borrow', 'Save', '2024-05-25 20:51:09', NULL, 4, '{LNG_Borrow} &amp; {LNG_Add Borrow}', '{\"borrower_id\":4,\"borrow_no\":\"B6705-0005\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\",\"id\":5}'),
(81, 3, 'index', 'User', '2024-05-25 20:51:28', NULL, 3, '{LNG_Login} IP ::1', NULL),
(82, 5, 'borrow', 'Status', '2024-05-25 20:52:49', NULL, 3, 'โซเดียมไฮดรอกไซด์ เม็ด (โซดาไฟ) (Sodium Hydroxide Pellet) อนุมัติ', NULL),
(83, 5, 'borrow', 'Save', '2024-05-25 20:52:51', NULL, 3, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":4,\"borrow_no\":\"B6705-0005\",\"transaction_date\":\"2024-05-25\",\"borrow_date\":\"2024-05-25\"}'),
(84, 8, 'inventory', 'Save', '2024-05-25 20:57:58', NULL, 3, '{LNG_Equipment} ID : 8', NULL),
(85, 1, 'index', 'User', '2024-06-04 11:46:07', NULL, 1, '{LNG_Login} IP ::1', NULL),
(86, 2, 'index', 'User', '2024-06-26 22:50:28', NULL, 2, '{LNG_Login} IP ::1', NULL),
(87, 0, 'borrow', 'Delete', '2024-06-26 23:27:39', NULL, 2, '{LNG_Delete} {LNG_Borrow} &amp;  ID : 1', NULL),
(88, 0, 'borrow', 'Delete', '2024-06-26 23:27:40', NULL, 2, '{LNG_Delete} {LNG_Borrow} &amp;  ID : 2', NULL),
(89, 1, 'index', 'User', '2024-06-26 23:28:32', NULL, 1, '{LNG_Login} IP ::1', NULL),
(90, 6, 'borrow', 'Save', '2024-06-26 23:32:04', NULL, 2, '{LNG_Borrow} &amp; {LNG_Add Borrow}', '{\"borrower_id\":2,\"borrow_no\":\"B6706-0001\",\"transaction_date\":\"2024-06-26\",\"borrow_date\":\"2024-06-26\",\"id\":6}'),
(91, 6, 'borrow', 'Status', '2024-06-26 23:32:39', NULL, 1, 'โซเดียมไฮดรอกไซด์ เม็ด (โซดาไฟ) (Sodium Hydroxide Pellet) ไม่อนุมัติ', NULL),
(92, 6, 'borrow', 'Save', '2024-06-26 23:32:41', NULL, 1, '{LNG_Transaction details} {LNG_Borrow} &amp; ', '{\"borrower_id\":2,\"borrow_no\":\"B6706-0001\",\"transaction_date\":\"2024-06-26\",\"borrow_date\":\"2024-06-26\"}'),
(93, 0, 'inventory', 'Save', '2024-06-26 23:36:43', NULL, 1, 'unit', NULL),
(94, 0, 'inventory', 'Save', '2024-06-26 23:44:25', NULL, 1, 'สถานที่เก็บ', NULL),
(95, 0, 'inventory', 'Save', '2024-06-26 23:45:26', NULL, 1, 'ผู้ผลิต', NULL),
(96, 1, 'index', 'User', '2024-06-27 00:45:47', NULL, 1, '{LNG_Login} IP ::1', NULL),
(97, 2, 'index', 'User', '2024-06-30 09:59:57', NULL, 2, '{LNG_Login} IP ::1', NULL),
(98, 2, 'index', 'User', '2024-06-30 16:05:58', NULL, 2, '{LNG_Login} IP ::1', NULL),
(99, 2, 'index', 'User', '2024-06-30 18:18:18', NULL, 2, '{LNG_Login} IP ::1', NULL),
(100, 1, 'index', 'User', '2024-06-30 18:18:49', NULL, 1, '{LNG_Login} IP ::1', NULL),
(101, 1, 'index', 'User', '2024-06-30 18:48:01', NULL, 1, '{LNG_Login} IP ::1', NULL),
(102, 9, 'inventory', 'Save', '2024-06-30 19:09:17', NULL, 1, '{LNG_Equipment} ID : 9', NULL),
(103, 10, 'inventory', 'Save', '2024-06-30 19:25:04', NULL, 1, '{LNG_Equipment} ID : 10', NULL),
(104, 2, 'index', 'User', '2024-06-30 19:26:54', NULL, 2, '{LNG_Login} IP ::1', NULL),
(105, 1, 'index', 'User', '2024-06-30 19:51:25', NULL, 1, '{LNG_Login} IP ::1', NULL),
(106, 1, 'index', 'User', '2024-07-01 19:14:31', NULL, 1, '{LNG_Login} IP ::1', NULL),
(107, 1, 'index', 'User', '2024-07-01 19:18:22', NULL, 1, '{LNG_Login} IP ::1', NULL),
(108, 1, 'index', 'User', '2024-07-01 19:19:17', NULL, 1, '{LNG_Editing your account} ID : 3', NULL),
(109, 1, 'index', 'User', '2024-07-02 11:28:55', NULL, 1, '{LNG_Login} IP ::1', NULL),
(110, 2, 'index', 'User', '2024-07-02 11:33:44', NULL, 2, '{LNG_Login} IP ::1', NULL),
(111, 1, 'index', 'User', '2024-07-02 11:34:14', NULL, 1, '{LNG_Login} IP ::1', NULL),
(112, 2, 'index', 'User', '2024-07-02 12:05:09', NULL, 2, '{LNG_Login} IP ::1', NULL),
(113, 8, 'inventory', 'Save', '2024-07-02 12:15:38', NULL, 1, '{LNG_Equipment} ID : 8', NULL),
(114, 11, 'inventory', 'Save', '2024-07-02 12:20:51', NULL, 1, '{LNG_Equipment} ID : 11', NULL),
(115, 0, 'inventory', 'Save', '2024-07-02 12:27:33', NULL, 1, 'unit', NULL),
(116, 0, 'inventory', 'Save', '2024-07-02 12:30:13', NULL, 1, 'unit', NULL),
(117, 1, 'index', 'User', '2024-07-02 12:36:00', NULL, 1, '{LNG_Login} IP ::1', NULL),
(118, 12, 'inventory', 'Save', '2024-07-02 12:49:11', NULL, 1, '{LNG_Equipment} ID : 12', NULL),
(119, 11, 'inventory', 'Save', '2024-07-02 12:49:56', NULL, 1, '{LNG_Equipment} ID : 11', NULL),
(120, 0, 'inventory', 'Delete', '2024-07-02 12:50:12', NULL, 1, '{LNG_Delete} {LNG_Inventory} ID : 11, 10, 9', NULL),
(121, 1, 'index', 'User', '2024-07-02 13:02:17', NULL, 1, '{LNG_Login} IP ::1', NULL),
(122, 0, 'index', 'Save', '2024-07-02 13:03:51', NULL, 1, '{LNG_The members status of the site}', NULL),
(123, 0, 'index', 'Save', '2024-07-02 13:03:56', NULL, 1, '{LNG_The members status of the site}', NULL),
(124, 5, 'index', 'User', '2024-07-02 13:06:40', NULL, 5, '{LNG_Create new account} ID : 5', NULL),
(125, 5, 'index', 'User', '2024-07-02 13:06:46', NULL, 5, '{LNG_Login} IP ::1', NULL),
(126, 6, 'index', 'User', '2024-07-02 13:10:41', NULL, 6, '{LNG_Create new account} ID : 6', NULL),
(127, 6, 'index', 'User', '2024-07-02 13:10:46', NULL, 6, '{LNG_Login} IP ::1', NULL),
(128, 7, 'index', 'User', '2024-07-02 13:17:08', NULL, 7, '{LNG_Create new account} ID : 7', NULL),
(129, 7, 'index', 'User', '2024-07-02 13:17:12', NULL, 7, '{LNG_Login} IP ::1', NULL),
(130, 8, 'index', 'User', '2024-07-02 13:18:20', NULL, 8, '{LNG_Create new account} ID : 8', NULL),
(131, 8, 'index', 'User', '2024-07-02 13:18:24', NULL, 8, '{LNG_Login} IP ::1', NULL),
(132, 0, 'index', 'User', '2024-07-02 13:19:06', NULL, 1, '{LNG_Update permission} ID : 7', NULL),
(133, 0, 'index', 'User', '2024-07-02 13:19:07', NULL, 1, '{LNG_Update permission} ID : 7', NULL),
(134, 0, 'index', 'User', '2024-07-02 13:19:09', NULL, 1, '{LNG_Update permission} ID : 7', NULL),
(135, 0, 'index', 'User', '2024-07-02 13:49:51', NULL, 1, '{LNG_Update permission} ID : 3', NULL),
(136, 0, 'index', 'User', '2024-07-02 13:49:53', NULL, 1, '{LNG_Update permission} ID : 7', NULL),
(137, 9, 'index', 'User', '2024-07-12 23:09:24', NULL, 9, '{LNG_Create new account} ID : 9', NULL),
(138, 9, 'index', 'User', '2024-07-12 23:09:50', NULL, 9, '{LNG_Login} IP ::1', NULL);

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

--
-- Dumping data for table `app_number`
--

INSERT INTO `app_number` (`type`, `prefix`, `auto_increment`, `last_update`) VALUES
('borrow_no', 'B6705-', 5, '2024-05-25'),
('borrow_no', 'B6706-', 1, '2024-06-26');

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
(1, 'admin@localhost', '6651abc43c119', '17753ba5db74f11201d795de62d81731af278e29', '6804783e133488a4a99616680241afb0b8fadf8b', 1, '', 'แอดมิน', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-05-25 11:13:40', 1, 0, NULL, ''),
(2, 'demo', '6651abc43c119', 'c120a2fbb5398a738f2394e25d7bca7b49d4ae81', 'd1a877b4000775159ce7b8e527a2739df99369d7', 0, '', 'ตัวอย่าง', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-05-25 11:13:40', 1, 0, NULL, ''),
(3, 'pidang@gmail', '6d845796c9386', '6ae6e792308807e3ce4afdd644913bbfb1e81bee', '59602e510b81564ba11adcc4f30403f6b98933b7', 2, ',can_approve_borrow,can_manage_inventory,', 'พี่แดง', 'u', NULL, '', NULL, '', '', '', 'TH', '2024-05-25 19:23:34', 1, 0, NULL, ''),
(4, 'teste@email', '7424e279f1e87', '934f5e1371b5060d0b4fb46ee1ff5e84f3da0214', '5930bddb20740c9bb2a4114264437f8007bf610f', 0, '', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-05-25 20:47:57', 1, 0, NULL, ''),
(5, 'testuser@test', 'db07c07dcee75', 'c36f9e6fb80850a945b3820fd2e590b899fc012a', 'de7b83a787f35961ce2290b0ad78933c2715e8a4', 0, '', 'testuser', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-07-02 13:06:40', 1, 0, NULL, ''),
(6, 'test@test', 'af95fec44c99d', 'a606d8d86e62fedae7b8768d15da96e1f149b2e8', '6edaad850a71cdb5fe4f5d66a3791fc138aa96e5', 0, '', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-07-02 13:10:41', 1, 0, NULL, ''),
(7, 'test2@2', '1c91c59780a5b', '9445715f92e222f46b940ffa4645c9b4db3226be', '7cf267c2a11c9d882340792cd0a12f92706ad67e', 2, ',can_approve_borrow,can_manage_inventory,', 'test2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-07-02 13:17:08', 1, 0, NULL, ''),
(8, 'ajarn@jarn', '8c6ee7f6030c9', 'f36fb045d00ff955cbd1ae4bb6ae9e8cca7ee4b6', '0103f0cca8afcdb49b94016be9bba77077e181f1', 3, '', 'ajarn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-07-02 13:18:20', 1, 0, NULL, ''),
(9, 'methawi@gmail.com', 'b3519a63f464d', 'da3f861f476ea5c3804a07136df69bce0b34e063', 'aa4e1fe83608ea6ea6717dd3e967c6675198ee13', 0, '', 'METHAWI PHRAMKAEO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TH', '2024-07-12 23:09:24', 1, 0, NULL, '');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `app_inventory`
--
ALTER TABLE `app_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `app_language`
--
ALTER TABLE `app_language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=338;

--
-- AUTO_INCREMENT for table `app_logs`
--
ALTER TABLE `app_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT for table `app_user`
--
ALTER TABLE `app_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
