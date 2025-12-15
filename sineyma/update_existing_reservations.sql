-- SQL commands to update existing reservations with reference numbers
-- Run these in your MySQL database (phpMyAdmin or command line)

-- Update existing reservations that have NULL reference_number
UPDATE `reservations`
SET `reference_number` = CONCAT('REF', DATE_FORMAT(created_at, '%Y%m%d'), LPAD(FLOOR(RAND() * 10000), 4, '0'), UPPER(SUBSTRING(MD5(RAND()), 1, 4)))
WHERE `reference_number` IS NULL OR `reference_number` = '';

-- Verify the update worked
SELECT id, customer_name, reference_number, created_at
FROM `reservations`
WHERE reference_number IS NOT NULL
ORDER BY created_at DESC
LIMIT 10;

-- Note: To support the new status values (ongoing, complete), you may need to run an ALTER TABLE command:ALTER TABLE `reservations` MODIFY COLUMN `status` ENUM('pending', 'confirmed', 'cancelled', 'ongoing', 'complete') DEFAULT 'pending';
-- 