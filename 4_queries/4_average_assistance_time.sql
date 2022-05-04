--  average_assistance_request_duration 
-- -------------------------------------
--  00:14:21.556903
-- (1 row)

SELECT avg(completed_at-started_at) as average_assistance_request_duration
FROM assistance_requests;