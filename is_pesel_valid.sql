CREATE or replace FUNCTION is_pesel_valid(pesel varchar(11)) RETURNS bool AS
$$
DECLARE
    checksum   int   := 0;
    multiplies int[] := '{1,3,7,9}';
BEGIN
    IF length(pesel) < 11 THEN
        RAISE EXCEPTION 'Provided pesel is to short.';
    END IF;
    IF pesel ~ '[^0-9]' THEN
        RAISE EXCEPTION 'Provided string is not a number.';
    END IF;
    IF substr(pesel, 5, 2)::int > 31 THEN
        RAISE EXCEPTION 'Day in provided pesel is greater than 31 (digits 5, 6).';
    END IF;
    for i in 0..9
        loop
            checksum := checksum + substr(pesel, i + 1, 1)::int * multiplies[i % 4 + 1];
        end loop;
    checksum := 10 - checksum % 10;
    return checksum = substr(pesel, 11, 1)::int;
END;
$$ LANGUAGE plpgsql;
