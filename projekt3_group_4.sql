-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Mrz 2018 um 14:21
-- Server-Version: 10.1.30-MariaDB
-- PHP-Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `projekt3_group_4`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `intervals`
--

CREATE TABLE `intervals` (
  `interval_id` int(11) NOT NULL,
  `interval_name` varchar(100) DEFAULT NULL,
  `interval_description` varchar(255) DEFAULT NULL,
  `interval_color` varchar(50) DEFAULT NULL,
  `fk_media_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `interval_media`
--

CREATE TABLE `interval_media` (
  `fk_interval_id` int(11) NOT NULL,
  `fk_media_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `interval_tags`
--

CREATE TABLE `interval_tags` (
  `fk_tag_id` int(11) NOT NULL,
  `fk_interval_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `media`
--

CREATE TABLE `media` (
  `media_id` int(11) NOT NULL,
  `src` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sets`
--

CREATE TABLE `sets` (
  `set_id` int(11) NOT NULL,
  `set_name` varchar(50) DEFAULT NULL,
  `set_description` varchar(255) DEFAULT NULL,
  `set_color` varchar(60) DEFAULT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sets_intervals`
--

CREATE TABLE `sets_intervals` (
  `fk_set_id` int(11) NOT NULL,
  `fk_user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `set_tags`
--

CREATE TABLE `set_tags` (
  `fk_tag_id` int(11) NOT NULL,
  `fk_set_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`) VALUES
(1, 'mohammed', 'mohammed@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(2, 'martin', 'martin@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `intervals`
--
ALTER TABLE `intervals`
  ADD PRIMARY KEY (`interval_id`),
  ADD KEY `fk_media_id` (`fk_media_id`);

--
-- Indizes für die Tabelle `interval_media`
--
ALTER TABLE `interval_media`
  ADD KEY `fk_interval_id` (`fk_interval_id`),
  ADD KEY `fk_media_id` (`fk_media_id`);

--
-- Indizes für die Tabelle `interval_tags`
--
ALTER TABLE `interval_tags`
  ADD KEY `fk_tag_id` (`fk_tag_id`),
  ADD KEY `fk_interval_id` (`fk_interval_id`);

--
-- Indizes für die Tabelle `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`);

--
-- Indizes für die Tabelle `sets`
--
ALTER TABLE `sets`
  ADD PRIMARY KEY (`set_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `sets_intervals`
--
ALTER TABLE `sets_intervals`
  ADD KEY `fk_set_id` (`fk_set_id`),
  ADD KEY `fk_user_id` (`fk_user_id`);

--
-- Indizes für die Tabelle `set_tags`
--
ALTER TABLE `set_tags`
  ADD KEY `fk_tag_id` (`fk_tag_id`),
  ADD KEY `fk_set_id` (`fk_set_id`);

--
-- Indizes für die Tabelle `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `userEmail` (`user_email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `intervals`
--
ALTER TABLE `intervals`
  MODIFY `interval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `sets`
--
ALTER TABLE `sets`
  MODIFY `set_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `intervals`
--
ALTER TABLE `intervals`
  ADD CONSTRAINT `intervals_ibfk_1` FOREIGN KEY (`fk_media_id`) REFERENCES `media` (`media_id`);

--
-- Constraints der Tabelle `interval_media`
--
ALTER TABLE `interval_media`
  ADD CONSTRAINT `interval_media_ibfk_1` FOREIGN KEY (`fk_interval_id`) REFERENCES `intervals` (`interval_id`),
  ADD CONSTRAINT `interval_media_ibfk_2` FOREIGN KEY (`fk_media_id`) REFERENCES `media` (`media_id`);

--
-- Constraints der Tabelle `interval_tags`
--
ALTER TABLE `interval_tags`
  ADD CONSTRAINT `interval_tags_ibfk_1` FOREIGN KEY (`fk_tag_id`) REFERENCES `tags` (`tag_id`),
  ADD CONSTRAINT `interval_tags_ibfk_2` FOREIGN KEY (`fk_interval_id`) REFERENCES `intervals` (`interval_id`);

--
-- Constraints der Tabelle `sets`
--
ALTER TABLE `sets`
  ADD CONSTRAINT `sets_ibfk_1` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints der Tabelle `sets_intervals`
--
ALTER TABLE `sets_intervals`
  ADD CONSTRAINT `sets_intervals_ibfk_1` FOREIGN KEY (`fk_set_id`) REFERENCES `sets` (`set_id`),
  ADD CONSTRAINT `sets_intervals_ibfk_2` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints der Tabelle `set_tags`
--
ALTER TABLE `set_tags`
  ADD CONSTRAINT `set_tags_ibfk_1` FOREIGN KEY (`fk_tag_id`) REFERENCES `tags` (`tag_id`),
  ADD CONSTRAINT `set_tags_ibfk_2` FOREIGN KEY (`fk_set_id`) REFERENCES `sets` (`set_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
