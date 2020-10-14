CREATE or replace FUNCTION nth_fib(n int) RETURNS int AS
$$
DECLARE
    i    int := 1;
    j    int := 1;
    temp int := 0;
BEGIN
    IF n < 1 THEN
        RAISE EXCEPTION 'Provided number is below 1.';
    END IF;
    IF n BETWEEN 1 AND 2 THEN
        RETURN 1;
    END IF;
    for x in 3..n
        loop
            temp := i;
            i := j;
            j := temp + i;
        end loop;
    return j;
END;
$$ LANGUAGE plpgsql;
