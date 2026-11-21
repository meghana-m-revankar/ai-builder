-- db/schema.sql
-- Database schema for JioLife
-- MySQL 8, InnoDB, utf8mb4

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS metric_records;
DROP TABLE IF EXISTS wellness_plans;
DROP TABLE IF EXISTS activity_logs;
DROP TABLE IF EXISTS user_profiles;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. user_profiles table
CREATE TABLE user_profiles (
    id CHAR(36) NOT NULL PRIMARY KEY DEFAULT (UUID()),
    email VARCHAR(255) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_at DATETIME(3) NULL,
    CONSTRAINT uq_user_profiles_email UNIQUE (email),
    INDEX idx_user_profiles_deleted_at (deleted_at),
    INDEX idx_user_profiles_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores user profile and account details';

-- 2. activity_logs table
CREATE TABLE activity_logs (
    id CHAR(36) NOT NULL PRIMARY KEY DEFAULT (UUID()),
    user_id CHAR(36) NOT NULL,
    activity_type VARCHAR(50) NOT NULL,
    duration_minutes INT NOT NULL,
    calories_burned DECIMAL(18,2) NOT NULL,
    logged_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_at DATETIME(3) NULL,
    CONSTRAINT fk_activity_logs_user_id FOREIGN KEY (user_id) REFERENCES user_profiles(id) ON DELETE RESTRICT,
    CONSTRAINT chk_activity_duration CHECK (duration_minutes > 0),
    CONSTRAINT chk_activity_calories CHECK (calories_burned >= 0),
    INDEX idx_activity_logs_user_id (user_id),
    INDEX idx_activity_logs_logged_at (logged_at),
    INDEX idx_activity_logs_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores user physical activity logs';

-- 3. wellness_plans table
CREATE TABLE wellness_plans (
    id CHAR(36) NOT NULL PRIMARY KEY DEFAULT (UUID()),
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(18,2) NOT NULL,
    currency CHAR(3) NOT NULL DEFAULT 'USD',
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_at DATETIME(3) NULL,
    CONSTRAINT chk_wellness_plan_price CHECK (price >= 0),
    INDEX idx_wellness_plans_category (category),
    INDEX idx_wellness_plans_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores available wellness plans and subscription items';

-- 4. metric_records table
CREATE TABLE metric_records (
    id CHAR(36) NOT NULL PRIMARY KEY DEFAULT (UUID()),
    user_id CHAR(36) NOT NULL,
    metric_name VARCHAR(50) NOT NULL,
    metric_value DECIMAL(18,4) NOT NULL,
    recorded_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    created_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updated_at DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
    created_by CHAR(36) NULL,
    updated_by CHAR(36) NULL,
    deleted_at DATETIME(3) NULL,
    CONSTRAINT fk_metric_records_user_id FOREIGN KEY (user_id) REFERENCES user_profiles(id) ON DELETE RESTRICT,
    INDEX idx_metric_records_user_id (user_id),
    INDEX idx_metric_records_name (metric_name),
    INDEX idx_metric_records_recorded_at (recorded_at),
    INDEX idx_metric_records_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Stores periodic health and fitness metric measurements';
