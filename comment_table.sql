-- =========================================================
-- SQL COMMANDS FOR COMMENT TABLE
-- Oracle Database
-- =========================================================

-- Create COMMENT table
CREATE TABLE COMMENT (
    COMMENTID NUMBER GENERATED ALWAYS AS IDENTITY,
    NAME VARCHAR2(255) NOT NULL,
    EMAIL VARCHAR2(255),
    COMMENTTEXT VARCHAR2(1000) NOT NULL,
    COMMENTDATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT PK_COMMENT PRIMARY KEY (COMMENTID)
);

-- Verify table creation
DESC COMMENT;

-- Sample insert (for testing)
INSERT INTO COMMENT (NAME, EMAIL, COMMENTTEXT) 
VALUES ('Ahmad bin Ali', 'ahmad@example.com', 'Terima kasih atas platform zakat yang mudah ini!');

-- View all comments
SELECT * FROM COMMENT ORDER BY COMMENTDATE DESC;

-- Count total comments
SELECT COUNT(*) AS TOTAL_COMMENTS FROM COMMENT;

-- Delete all comments (if needed for testing)
-- DELETE FROM COMMENT;

-- Drop table (if needed to recreate)
-- DROP TABLE COMMENT;

COMMIT;
