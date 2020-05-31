USE COVID19;

/*1. Finding the number of cases cases*/
SELECT a.active_cases, d.discharged_cases, t.total_cases 
FROM
(
    SELECT 
        count(*) as active_cases 
    FROM 
        PATIENTS 
    WHERE 
        discharged IS NULL
)AS a, 
(
    SELECT 
        count(*) as discharged_cases 
    FROM 
        PATIENTS 
    WHERE 
        discharged IS NOT NULL
) AS d,
(
    SELECT 
        count(*) as total_cases 
    FROM 
        PATIENTS
) AS t;


/*2. selecting patients who have travelled in from China*/
SELECT 
    P.p_id, P.name, A.arrival_date
FROM 
    PATIENTS P, 
    (
        SELECT 
            patient_id, arrival_date 
        FROM
        (
            TRAVEL_HISTORY NATURAL JOIN COUNTRY
        )
    WHERE
        country_name='China'
    ) AS A
WHERE
	P.p_id=A.patient_id;


/*3. select the contacts who have come in contact with more than one patient*/
SELECT *
FROM
    CONTACTS 
WHERE 
    contact_id 
IN
(
    SELECT 
        contact_id
 	FROM 
        PATIENT_CONTACTS
 	GROUP BY 
        contact_id
 	HAVING 
        count(*)>1
);


/* Select the patient details of the patient who has travelled the most*/
SELECT * FROM 
PATIENTS 
NATURAL JOIN 
(
    SELECT 
        r.p_id
    FROM 
    (
        SELECT
            p_id, count(*) as travel_count
        FROM 
        (
            SELECT * 
            FROM 
            (
                PATIENTS as P LEFT OUTER JOIN TRAVEL_HISTORY AS T ON P.p_id=T.patient_id
            )
        ) AS j 
        WHERE 
            j.country_id IS NOT NULL 
        GROUP BY 
            p_id
    ) AS r
    WHERE
    r.travel_count=
    (
        SELECT 
            MAX(x.travel_count)
        FROM 
        (
        SELECT
            count(*) as travel_count
        FROM 
        (
            SELECT * 
            FROM 
            (
                PATIENTS as P LEFT OUTER JOIN TRAVEL_HISTORY AS T ON P.p_id=T.patient_id
            )
        ) AS j 
        WHERE 
            j.country_id IS NOT NULL 
        GROUP BY 
            p_id
        )AS x
    )
) AS Y
WHERE 
    p_id=Y.p_id;
	

/*5. ward details of ward having most number of patients*/
SELECT * FROM 
    WARD NATURAL JOIN
(
    SELECT 
        b.ward_no 
    FROM 
    (
        SELECT 
            ward_no, count(*) as count_ward 
        FROM 
            PATIENTS 
        GROUP BY 
            ward_no
    ) AS b
    WHERE 
        b.count_ward=
        (
            SELECT 
                max(a.count_ward) 
            FROM 
            (
                SELECT 
                    count(*) as count_ward 
                FROM 
                    PATIENTS 
                GROUP BY 
                    ward_no
            ) AS a
        )
) AS j
WHERE
    ward_no=j.ward_no;


/*6. finding hospitals with number of patients greater than average*/
SELECT * FROM 
    HOSPITAL NATURAL JOIN
(
    SELECT 
        b.h_no
    FROM
    (
        SELECT
            h_no, count(*) as count_hosp
        FROM
            PATIENTS
        GROUP BY
            h_no
    )AS b
    WHERE
        b.count_hosp >
        (
            SELECT 
                avg(a.pat_count) 
            FROM 
            (
                SELECT 
                    COUNT(*) as pat_count 
                FROM 
                    PATIENTS 
                GROUP BY 
                    h_no
            ) AS a
        )
)AS j;


/*7. Find ward with most number of people who haven't travelled abroad*/
SELECT * FROM
WARD 
NATURAL JOIN
(
    SELECT 
        b.ward_no
    FROM 
    (    
        SELECT 
            a.ward_no, count(*) as pat_count
        FROM 
        (
            SELECT 
                ward_no 
            FROM 
                PATIENTS 
            WHERE 
                p_id 
            NOT IN
            (
                SELECT DISTINCT 
                    patient_id 
                FROM 
                    TRAVEL_HISTORY
            )
        ) as a 
        GROUP BY 
            a.ward_no
    ) as b
    WHERE
	    b.pat_count=
        (
            SELECT 
        	    max(c.pat_count)
            FROM 
            (
                SELECT 
            	    COUNT(*) as pat_count
                FROM 
            	    PATIENTS
                WHERE
            	    p_id
                NOT IN
                (
                    SELECT DISTINCT
                	    patient_id
                    FROM
                	    TRAVEL_HISTORY
                ) group by ward_no
       	    ) as c
        )
) as j
WHERE ward_no=j.ward_no;
            
        
            
        



