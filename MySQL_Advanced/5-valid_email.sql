-- Trigger to reset email validation
DELIMITER |

CREATE TRIGGER reset_email_validation
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF NEW.email <> OLD.email THEN
        SET NEW.valid_email = 0;
    END IF;
END
|

DELIMITER ;
