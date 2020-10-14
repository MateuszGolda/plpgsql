CREATE or replace FUNCTION nth_prime(n int) RETURNS int AS
$$
DECLARE
    primeCount int := 2;
    count      int := 3;
BEGIN
    IF n < 1 THEN
        RAISE EXCEPTION 'Provided number is below 1.';
    END IF;
    IF n = 1 THEN
        RETURN 2;
    END IF;
    IF n = 2 THEN
        RETURN 3;
    END IF;
    WHILE primeCount < n
        LOOP
            count := count + 2;
            CONTINUE WHEN count % 3 = 0;
            primeCount := primeCount + 1;
            FOR j IN 5..round(|/count) BY 6
                LOOP
                    IF count % j = 0 OR count % (j + 2) = 0 THEN
                        primeCount := primeCount - 1;
                        EXIT;
                    END IF;
                END LOOP;
        END LOOP;
    RETURN count;
END;
$$ LANGUAGE plpgsql;
