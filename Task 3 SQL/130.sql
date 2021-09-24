WITH 
numbered_cte (no, name, date) 
AS (SELECT row_number() OVER (ORDER BY date ASC, name ASC) as no, name, date 
    FROM Battles),

left_table
AS (SELECT no as rn_1, name as name_1, date as date_1
    FROM numbered_cte
    ORDER BY no ASC
    OFFSET 0 ROWS 
    FETCH NEXT (SELECT COUNT(*) - (SELECT COUNT(*)/2 FROM numbered_cte) 
                FROM numbered_cte) ROWS ONLY),
right_table 
AS (SELECT no as rn_2, name as name_2, date as date_2
    FROM numbered_cte
    ORDER BY no ASC
    OFFSET (SELECT COUNT(*) - (SELECT COUNT(*)/2 FROM numbered_cte) FROM numbered_cte) ROWS),

left_table_with_joiner
AS (SELECT row_number() OVER (ORDER BY rn_1 ASC) as joiner, *
    FROM left_table),

right_table_with_joiner
AS (SELECT row_number() OVER (ORDER BY rn_2 ASC) as joiner, *
    FROM right_table)

SELECT lt.rn_1, lt.name_1, lt.date_1, rt.rn_2, rt.name_2, rt.date_2
FROM left_table_with_joiner as lt
LEFT JOIN right_table_with_joiner rt ON lt.joiner= rt.joiner
