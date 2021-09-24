SELECT 
(
    SELECT SUM(inc) 
    FROM Income_o 
    WHERE date < '04/15/01'
) - (
    SELECT SUM(out) 
    FROM Outcome_o
    WHERE date < '04/15/01'
)