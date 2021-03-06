SELECT is_sudoku_valid(ARRAY [
    ['.', '.', '3',   '8', '.', '5',   '.', '.', '2'],
    ['1', '5', '.',   '.', '.', '2',   '.', '3', '.'],
    ['9', '.', '.',   '.', '4', '7',   '.', '.', '5'],

    ['.', '.', '2',   '.', '3', '4',   '.', '.', '.'],
    ['.', '9', '4',   '.', '.', '.',   '8', '.', '6'],
    ['.', '.', '.',   '2', '.', '.',   '.', '4', '9'],

    ['5', '.', '.',   '4', '.', '.',   '6', '.', '.'],
    ['.', '6', '.',   '7', '5', '.',   '2', '.', '.'],
    ['2', '.', '.',   '.', '.', '6',   '.', '5', '.']
    ]); -- true

SELECT is_sudoku_valid(ARRAY [
    ['5', '3', '.',   '.', '7', '.',   '.', '.', '.'],
    ['6', '.', '.',   '1', '9', '5',   '.', '.', '.'],
    ['.', '9', '8',   '.', '.', '.',   '.', '6', '.'],

    ['8', '.', '.',   '.', '6', '.',   '.', '.', '3'],
    ['4', '.', '.',   '8', '.', '3',   '.', '.', '1'],
    ['7', '.', '.',   '.', '2', '.',   '.', '.', '6'],

    ['.', '6', '.',   '.', '.', '.',   '2', '8', '.'],
    ['.', '.', '.',   '4', '1', '9',   '.', '.', '5'],
    ['.', '.', '.',   '.', '8', '.',   '.', '7', '9']
    ]); -- true

SELECT is_sudoku_valid(ARRAY [
    ['6', '.', '3',   '8', '.', '5',   '.', '.', '2'],
    ['1', '5', '.',   '.', '.', '2',   '.', '3', '.'],
    ['9', '.', '.',   '.', '4', '7',   '.', '.', '5'],

    ['.', '.', '2',   '.', '3', '4',   '.', '.', '.'],
    ['.', '9', '4',   '.', '.', '.',   '8', '.', '6'],
    ['.', '.', '.',   '2', '.', '.',   '.', '4', '9'],

    ['5', '.', '.',   '4', '.', '.',   '6', '.', '.'],
    ['.', '6', '.',   '7', '5', '.',   '2', '.', '.'],
    ['2', '.', '.',   '.', '.', '6',   '.', '5', '.']
    ]); -- false

SELECT find_candidates(ARRAY [
                           ['.', '.', '3', '8', '.', '5', '.', '.', '2'],
                           ['1', '5', '.', '.', '.', '2', '.', '3', '.'],
                           ['9', '.', '.', '.', '4', '7', '.', '.', '5'],

                           ['.', '.', '2', '.', '3', '4', '.', '.', '.'],
                           ['.', '9', '4', '.', '.', '.', '8', '.', '6'],
                           ['.', '.', '.', '2', '.', '.', '.', '4', '9'],

                           ['5', '.', '.', '4', '.', '.', '6', '.', '.'],
                           ['.', '6', '.', '7', '5', '.', '2', '.', '.'],
                           ['2', '.', '.', '.', '.', '6', '.', '5', '.']
                           ], 1, 1); -- {4,6,7}

SELECT find_candidates(ARRAY [
                           ['.', '.', '3', '8', '.', '5', '.', '.', '2'],
                           ['1', '5', '.', '.', '.', '2', '.', '3', '.'],
                           ['9', '.', '.', '.', '4', '7', '.', '.', '5'],

                           ['.', '.', '2', '.', '3', '4', '.', '.', '.'],
                           ['.', '9', '4', '.', '.', '.', '8', '.', '6'],
                           ['.', '.', '.', '2', '.', '.', '.', '4', '9'],

                           ['5', '.', '.', '4', '.', '.', '6', '.', '.'],
                           ['.', '6', '.', '7', '5', '.', '2', '.', '.'],
                           ['2', '.', '.', '.', '.', '6', '.', '5', '.']
                           ], 5, 5); -- {1,7}

SELECT find_candidates(ARRAY [
                           ['.', '.', '3', '8', '.', '5', '.', '.', '2'],
                           ['1', '5', '.', '.', '.', '2', '.', '3', '.'],
                           ['9', '.', '.', '.', '4', '7', '.', '.', '5'],

                           ['.', '.', '2', '.', '3', '4', '.', '.', '.'],
                           ['.', '9', '4', '.', '.', '.', '8', '.', '6'],
                           ['.', '.', '.', '2', '.', '.', '.', '4', '9'],

                           ['5', '.', '.', '4', '.', '.', '6', '.', '.'],
                           ['.', '6', '.', '7', '5', '.', '2', '.', '.'],
                           ['2', '.', '.', '.', '.', '6', '.', '5', '.']
                           ], 9, 9); -- {1,3,4,7,8}

SELECT find_candidates(ARRAY [
                           ['.', '.', '3', '8', '1', '5', '.', '.', '2'],
                           ['1', '5', '.', '6', '9', '2', '.', '3', '.'],
                           ['9', '.', '.', '3', '4', '7', '1', '.', '5'],
                           ['.', '.', '2', '.', '3', '4', '.', '.', '.'],
                           ['3', '9', '4', '5', '7', '1', '8', '2', '6'],
                           ['.', '.', '.', '2', '6', '8', '.', '4', '9'],
                           ['5', '.', '.', '4', '.', '.', '6', '.', '.'],
                           ['.', '6', '.', '7', '5', '.', '2', '.', '.'],
                           ['2', '.', '.', '.', '.', '6', '.', '5', '.']
                           ], 4, 4); -- {9}

SELECT find_candidates(ARRAY [
                           ['.', '.', '3', '8', '1', '5', '.', '.', '2'],
                           ['1', '5', '.', '6', '9', '2', '.', '3', '.'],
                           ['9', '.', '.', '3', '4', '7', '1', '.', '5'],
                           ['.', '.', '2', '.', '3', '4', '.', '.', '.'],
                           ['3', '9', '4', '5', '7', '1', '8', '2', '6'],
                           ['.', '.', '.', '2', '6', '8', '.', '4', '9'],
                           ['5', '.', '.', '4', '.', '.', '6', '.', '.'],
                           ['.', '6', '.', '7', '5', '.', '2', '.', '.'],
                           ['2', '.', '.', '.', '.', '6', '.', '5', '.']
                           ], 3, 2); -- {2, 8}

SELECT find_candidates(ARRAY [
                           ['.', '.', '3', '8', '.', '5', '.', '.', '2'],
                           ['1', '5', '.', '.', '.', '2', '.', '3', '.'],
                           ['9', '.', '.', '.', '4', '7', '.', '.', '5'],

                           ['.', '.', '2', '.', '3', '4', '.', '.', '.'],
                           ['.', '9', '4', '.', '.', '.', '8', '.', '6'],
                           ['.', '.', '.', '2', '.', '.', '.', '4', '9'],

                           ['5', '.', '.', '4', '.', '.', '6', '4', '7'],
                           ['.', '6', '.', '7', '5', '.', '2', '3', '8'],
                           ['2', '.', '.', '.', '.', '6', '1', '5', '.']
                           ], 9, 9); -- {}


create or replace function print_sudoku(sudoku text[][]) returns void AS
$$
begin
    raise notice '%',sudoku[1:1];
    raise notice '%',sudoku[2:2];
    raise notice '%',sudoku[3:3];
    raise notice '%',sudoku[4:4];
    raise notice '%',sudoku[5:5];
    raise notice '%',sudoku[6:6];
    raise notice '%',sudoku[7:7];
    raise notice '%',sudoku[8:8];
    raise notice '%',sudoku[9:9];
end;
$$ language plpgsql;
