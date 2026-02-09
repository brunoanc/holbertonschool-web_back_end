-- Procedure to compute weighed average of score on all students
DELIMITER |

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    UPDATE users u
    JOIN (
        SELECT c.user_id,
               SUM(c.score * p.weight) / SUM(p.weight) AS avg_weighted
        FROM corrections c
        JOIN projects p ON c.project_id = p.id
        GROUP BY c.user_id
    ) AS t ON u.id = t.user_id
    SET u.average_score = t.avg_weighted;
END
|

DELIMITER ;
