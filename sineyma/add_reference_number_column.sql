-- SQL command to add the missing reference_number column to the reservations table
-- Run this in your MySQL database (phpMyAdmin or command line)

ALTER TABLE `reservations` ADD COLUMN `reference_number` VARCHAR(50) NULL AFTER `transaction_id`;