\set ECHO None
BEGIN;
\i sql/pg_complex.sql
\set ECHO all

\set c1 (1,2)::complex
\set c2 (1,1)::complex
\set c3 (3,4)::complex
\set c4 (3,8)::complex

select 1::complex as a, (1::int8)::complex as b, 1.0::complex as c;

select (1,2)::complex as a, -(1,2)::complex as b, ~(1,2)::complex as c;

select :c1 + (3,4)::complex as a, 3 + :c1 as b, :c1 + 3 as c;

select :c1 - (3,6)::complex as a, 3 - :c1 as b, :c1 - 3 as c;

select :c1 * (3,5)::complex as a, 3 * :c1 as b, :c1 * 3 as c;
select :c1 * (3,5)::complex as a, 3.0::double precision * :c1 as b, :c1 * 3.0 as c;

select :c4 / :c1  as a, (3.8, 0.4)::complex * :c1 = :c4 as b;
select :c4 / (2,0)::complex as c;
select :c4 / (0,2)::complex as c;

--
-- check magnitude
--
select magnitude(:c1) as magnitude;
select magnitude(:c2) as magnitude;
select magnitude(:c3) as magnitude;

ROLLBACK;
