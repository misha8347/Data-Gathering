-- Write your PostgreSQL query statement below

With TripsWithNotBannedUsers AS (
    SELECT Trips.id, Trips.client_id, Trips.driver_id, Trips.status, Trips.request_at FROM Trips
    JOIN Users A
    ON Trips.client_id = A.users_id
    JOIN Users B
    ON Trips.driver_id = B.users_id
    WHERE A.banned = 'No' AND B.banned = 'No' 
    AND Trips.request_at BETWEEN '2013-10-01' AND '2013-10-03'
)
SELECT
    request_at as "Day",
    ROUND(
        CAST(CAST(COUNT(CASE WHEN status = 'cancelled_by_driver' OR status = 'cancelled_by_client' THEN 1 END) AS FLOAT) 
        / CAST(COUNT(status) AS FLOAT) AS numeric),
        2
    ) AS "Cancellation Rate"    
FROM TripsWithNotBannedUsers
GROUP BY request_at 
