WITH
trips_with_passangers
AS (SELECT DISTINCT Company.name, Pass_in_trip.trip_no, Trip.time_out, Trip.time_in, Pass_in_trip.date
    FROM Pass_in_trip
    LEFT JOIN Trip ON Pass_in_trip.trip_no = Trip.trip_no
    LEFT JOIN Company ON Trip.ID_comp = Company.ID_comp),

diff_days_trip
AS (SELECT 
        name as company,
        time_out,
        time_in,
        /*
        24*60 - ABS(DATEDIFF(MINUTE, time_out, '1900-01-01 00:00:00.000')) +
            ABS(DATEDIFF(MINUTE, '1900-01-01 00:00:00.000', time_in)) as minutes
        */ 
        ABS(DATEDIFF(MINUTE, time_out, time_in+1)) as minutes
    FROM trips_with_passangers
    WHERE time_out >= time_in),

same_day_trip
AS (SELECT 
        name as company,
        time_out,
        time_in, 
        ABS(DATEDIFF(MINUTE, time_out, time_in)) as minutes
    FROM trips_with_passangers
    WHERE time_out < time_in),

total_times
AS (SELECT *
    FROM diff_days_trip
    UNION ALL
    SELECT *
    FROM same_day_trip)

SELECT company, SUM(minutes)
FROM total_times
GROUP BY company
