SELECT * FROM pirates;

CREATE OR REPLACE FUNCTION fn_rcorr() RETURNS NUMERIC AS
$$
BEGIN
    --- ....
    RETURN(SELECT ROUND((AVG(global_avg_temp * number_of_pirates) - (AVG(global_avg_temp) * AVG(number_of_pirates)))
		    / (STDDEV_POP(global_avg_temp) * STDDEV_POP(number_of_pirates)) :: NUMERIC, 2)
                FROM pirates);
END
$$ LANGUAGE plpgsql;

SELECT fn_rcorr() as correlation_coefficient;


