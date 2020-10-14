CREATE OR REPLACE FUNCTION is_sudoku_valid(sudoku text[][]) RETURNS bool AS
$$
DECLARE
    row_          int    = -1;
    col           int    = -1;
    candidates    text[] = NULL;
    newCandidates text[] = NULL;
    candidate     int;
    print         text;
BEGIN
    FOR r IN 1..9
        LOOP
            FOR c IN 1..9
                LOOP
                    IF sudoku[r][c] = '.' THEN
                        newCandidates := find_candidates(sudoku, r, c);
                        IF candidates IS NULL OR array_length(newCandidates, 1) < array_length(candidates, 1) THEN
                            candidates := newCandidates;
                            row_ := r;
                            col := c;
                        end if;
                    end if;
                END LOOP;
        END LOOP;
--     RAISE NOTICE 'r=% c=%',row_, col;
--     RAISE NOTICE 'candidates=%',candidates; -- for debugging
    IF candidates IS NULL THEN
        RETURN true;
    end if;
    FOREACH candidate in array candidates
        loop
            sudoku[row_][col] = candidate::text;
--             print := print_sudoku(sudoku);
            IF is_sudoku_valid(sudoku) THEN
                RETURN true;
            else
                sudoku[row_][col] = '.';
--                 print := print_sudoku(sudoku);
                RAISE NOTICE 'cleaning';
            end if;
        end loop;
    RETURN false;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_candidates(sudoku text[][], row_ int, col int) RETURNS text[] AS
$$
DECLARE
    candidates text[] = '{1, 2, 3, 4, 5, 6, 7, 8, 9}';
BEGIN
    FOR ch IN 1..9
        LOOP
            FOR i IN 1..9
                LOOP
                    IF sudoku[row_][i] = ch::text
                        OR sudoku[i][col] = ch::text
                        OR sudoku[row_ - ((row_ - 1) % 3) + round((i - 1) / 3)][col - ((col - 1) % 3) + (i - 1) % 3] =
                           ch::text THEN
                        candidates := array_remove(candidates, ch::text);
                        EXIT;
                    END IF;
                END LOOP;
        END LOOP;
    RETURN candidates;
END;
$$ LANGUAGE plpgsql;
