DELIMITER $$

-- ============================================================================
-- USER_PROFILES PROCEDURES
-- ============================================================================

DROP PROCEDURE IF EXISTS sp_user_profile_create;
$$
CREATE PROCEDURE sp_user_profile_create(IN p_email VARCHAR(255), IN p_first_name VARCHAR(100), IN p_last_name VARCHAR(100), IN p_user_id CHAR(36))
BEGIN
    IF p_email IS NULL OR p_first_name IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID_PARAMETERS';
    END IF;
    INSERT INTO user_profiles (email, first_name, last_name, created_by) VALUES (p_email, p_first_name, p_last_name, p_user_id);
    SELECT * FROM user_profiles WHERE id = LAST_INSERT_ID();
END;
$$

DROP PROCEDURE IF EXISTS sp_user_profile_get;
$$
CREATE PROCEDURE sp_user_profile_get(IN p_id CHAR(36))
BEGIN
    SELECT * FROM user_profiles WHERE id = p_id AND deleted_at IS NULL;
END;
$$

-- ============================================================================
-- ACTIVITY_LOGS PROCEDURES
-- ============================================================================

DROP PROCEDURE IF EXISTS sp_activity_log_create;
$$
CREATE PROCEDURE sp_activity_log_create(IN p_user_id CHAR(36), IN p_activity_type VARCHAR(50), IN p_duration INT, IN p_calories DECIMAL(18,2))
BEGIN
    IF p_user_id IS NULL OR p_duration <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'INVALID_ACTIVITY_DATA';
    END IF;
    
    START TRANSACTION;
    INSERT INTO activity_logs (user_id, activity_type, duration_minutes, calories_burned) 
    VALUES (p_user_id, p_activity_type, p_duration, p_calories);
    SELECT * FROM activity_logs WHERE id = LAST_INSERT_ID();
    COMMIT;
END;
$$

DROP PROCEDURE IF EXISTS sp_activity_log_list;
$$
CREATE PROCEDURE sp_activity_log_list(IN p_user_id CHAR(36), IN p_limit INT, IN p_offset INT)
BEGIN
    SELECT * FROM activity_logs 
    WHERE user_id = p_user_id AND deleted_at IS NULL 
    ORDER BY logged_at DESC LIMIT p_limit OFFSET p_offset;
END;
$$

-- ============================================================================
-- WELLNESS_PLANS PROCEDURES
-- ============================================================================

DROP PROCEDURE IF EXISTS sp_wellness_plan_list;
$$
CREATE PROCEDURE sp_wellness_plan_list()
BEGIN
    SELECT * FROM wellness_plans WHERE deleted_at IS NULL;
END;
$$

-- ============================================================================
-- METRIC_RECORDS PROCEDURES
-- ============================================================================

DROP PROCEDURE IF EXISTS sp_metric_record_create;
$$
CREATE PROCEDURE sp_metric_record_create(IN p_user_id CHAR(36), IN p_name VARCHAR(50), IN p_value DECIMAL(18,4))
BEGIN
    INSERT INTO metric_records (user_id, metric_name, metric_value) VALUES (p_user_id, p_name, p_value);
    SELECT * FROM metric_records WHERE id = LAST_INSERT_ID();
END;
$$

DELIMITER ;
