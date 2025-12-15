-- Manual MySQL script to create the movie_history table
-- This table tracks price changes for movies in the cinema system

-- Create the movie_history table
CREATE TABLE IF NOT EXISTS `movie_history` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `movie_id` INT(11) UNSIGNED NOT NULL,
  `old_price` DECIMAL(10,2) NULL DEFAULT NULL,
  `new_price` DECIMAL(10,2) NOT NULL,
  `change_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_movie_history_movie_id` (`movie_id`),
  CONSTRAINT `fk_movie_history_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Optional: Add some sample data (uncomment if needed)
-- INSERT INTO `movie_history` (`movie_id`, `old_price`, `new_price`, `change_at`) VALUES
-- (1, NULL, 250.00, '2025-11-10 16:45:00'),
-- (1, 250.00, 275.00, '2025-11-10 17:30:00'),
-- (2, NULL, 200.00, '2025-11-10 16:50:00');

-- Description of columns:
-- id: Auto-increment primary key
-- movie_id: Foreign key referencing movies.id (tracks which movie's price changed)
-- old_price: Previous price (NULL if this is the first price set)
-- new_price: New price after the change
-- change_at: Timestamp when the price change occurred

-- To drop the table if needed:
-- DROP TABLE IF EXISTS `movie_history`;