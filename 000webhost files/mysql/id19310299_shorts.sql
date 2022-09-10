-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 10, 2022 at 11:25 AM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id19310299_shorts`
--

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `image` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `src_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `src_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `src_text` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'കൂടുതൽ വായിച്ചറിയുക',
  `cat_id` int(10) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `image`, `title`, `text`, `type`, `src_name`, `src_url`, `src_text`, `cat_id`, `created`) VALUES
(1, 'https://storage.katha.today/EEVHDbBgSkG2QEvXr6BZwkTa?id=446173', 'ഇൻസ്റ്റഗ്രാം ഉപയോഗിക്കുമ്പോൾ സൂക്ഷിക്കുക! വെളിപ്പെടുത്തലുമായി മുൻ ഗൂഗിൾ എഞ്ചിനീയർ', 'ഇൻസ്റ്റഗ്രാം ഉപയോഗിക്കുമ്പോൾ സൂക്ഷിക്കണമെന്ന മുന്നറിയിപ്പുമായി മുൻ ഗൂഗിൾ എഞ്ചിനീയർ. ഉപയോക്താക്കളുടെ ഓൺലൈൻ പ്രവർത്തനങ്ങൾ ഇൻസ്റ്റഗ്രാം നിരീക്ഷിക്കുന്നുണ്ടെന്നാണ് ഫാസ്റ്റ്‌ലെയ്‌നിന്റെ സ്ഥാപകനായ ഫെലിക്‌സ് ക്രൗസ് വെളിപ്പെടുത്തിയത്. ', '0', 'Nabeel', 'https://www.indiatvnews.com/trending/news/anna-mani-104th-birth-anniversary-google-doodle-special-tribute-weather-woman-of-india-2022-08-23-802310', 'കൂടുതൽ വായിച്ചറിയുക', 0, '2022-08-17 10:48:14'),
(11, 'https://storage.katha.today/7eyZLw9njYUyE9UUcLtY8h1m?id=469562', 'രണ്ട് മക്കളേയും ചേര്‍ത്തുപിടിച്ച് ജോലി ചെയ്യുന്ന ഡെലിവെറി പാര്‍ട്ണര്‍', 'ജീവിതത്തിന്റെ രണ്ടറ്റവും കൂട്ടിമുട്ടിക്കാന്‍ കഷ്ടപ്പെടുന്നവരാണ് മിക്കവരും. കുട്ടികളുടെ വിദ്യാഭ്യാസം, ഭക്ഷണം, വാടക എന്നിവയ്ക്കെല്ലാം എല്ലാ മാസവും നല്ലൊരു തുക ചെലവാകും. ഇതെല്ലാം കണ്ടെത്താന്‍ രണ്ടു ജോലികള്‍ ചെയ്യുന്നവര്‍ വരേയുണ്ട്.\r\n\r\nഫുഡ് വ്‌ളോഗര്‍ സൗരഭ് പഞ്ച്‌വാനി അത്തരമൊരു കഠിനാധ്വാനത്തിന്‍റെ വീഡിയോ', '1', 'Mathrubhumi', 'https://www.mathrubhumi.com/lifestyle/news/zomato-delivery-partner-carries-his-kids-to-work-internet-calls-him-real-hero-1.7810666?utm_source=katha-app', 'കൂടുതൽ വായിച്ചറിയുക', 1, '2022-08-24 09:31:59'),
(34, 'https://storage.katha.today/LZrQuTEp2yb8ehL2SqpmxFsm?id=453625', 'ബുർജ് ഖലീഫക്ക് വളയമായി ഡൗണ്‍ടൗണ്‍ സർക്കിള്‍; പ്ലാൻ ചിത്രങ്ങൾ വൈറൽ', 'ബുർജ് ഖലീഫയെ വലയം ചെയ്ത് വരാനിരിക്കുന്ന ഒരു പദ്ധതിയാണ് ഡൗൺടൗൺ സർക്കിൾ. ദുബായ് സ്കൈലൈനിന്റെ മുഖച്ഛായ മാറ്റാനുള്ള ആശയത്തിന് പിന്നിൽ സ്നെറ സ്പേസ് എന്ന ആർക്കിടെക്ചർ സ്ഥാപനമാണ്. ഇതിന്റെ പ്ലാൻ ചിത്രങ്ങൾ ഇപ്പോൾ സമൂഹമാധ്യമങ്ങളിൽ വൈറലാവുകയാണ്.', '1', 'Media One', 'https://www.youtube.com/watch?v=NdPgvggXFPg', 'വീഡിയോ കാണാം', 1, '2022-08-24 10:18:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
