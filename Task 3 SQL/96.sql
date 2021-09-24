SELECT utv2.v_name
FROM utv utv1, utb utb1, utq utq1, utb utb2, utv utv2
WHERE utv1.v_color = 'b' AND
utb1.b_q_id = utq1.q_id AND
utb1.b_v_id = utv1.v_id AND
utb2.b_q_id = utq1.q_id AND 
utv2.v_id = utb2.b_v_id
GROUP BY utv2.v_name


INTERSECT

SELECT utv1.v_name
FROM utv utv1, utb utb1
WHERE utv1.v_id = utb1.b_v_id AND
utv1.v_color = 'r'
GROUP BY utv1.v_name
HAVING COUNT(1) > 1