create or replace function get_random_female_last_name(number int) returns text as
$$
declare
    count_sum bigint;
    random_n  bigint;
    x         record;
    i         int := 0;
begin
    number := least(number, (SELECT count(*) FROM public.female_last_names)::int);
    count_sum := (select sum(c.count / last_count.count) as frequency
                  from (select count from female_last_names limit number) c,
                       (select * from female_last_names where id = number) last_count);
    random_n := floor(random() * count_sum + 1);

    for x in
        select c.count / last_count.count as frequency
        from (select count from female_last_names limit number) c,
             (select * from female_last_names where id = number) last_count
        loop
            raise notice 'frequency: %', x.frequency;
            i := i + 1;
            random_n := random_n - x.frequency;
            if random_n <= 0 then
                exit;
            end if;
        end loop;
    return initcap((select name from female_last_names where id = i));
end ;
$$ language plpgsql;
