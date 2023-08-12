SELECT
    r.date,
    s.first_name,
    s.last_name,
    s.hourly_rate,
    sh.start_time,
    sh.end_time,
    DATEDIFF(ss,sh.start_time, sh.end_time) / 3600.00 AS hours_in_shift,
    (DATEDIFF(ss,sh.start_time, sh.end_time) /  3600.00)  * s.hourly_rate AS staff_cost
FROM
    pizza_rota r 
LEFT JOIN pizza_staff s ON r.staff_id = s.staff_id
LEFT JOIN pizza_shift sh ON r.shift_id = sh.shift_id

