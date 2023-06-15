select * from data1
select * from data2

--Lets find out no.of rows into our data 

select count(*) from data1

-- extract data for JHARKHAND and BIHAR

select * from data1 where state in ('Jharkhand', 'Bihar')

-- lets calculate the population of INDIA

select * from data2
select  state,sum(Population) as total_population from data2 group by state 

--- Average Growth of India

select avg(Growth)*100 as avg_growth from data1

-- avg sex ratio

select state,round(avg(sex_ratio),0) avg_sex_ratio from data1 group by state order by avg_sex_ratio desc;

-- avg literacy rate
 
select state,round(avg(literacy),0) avg_literacy_ratio from data1 
group by state having round(avg(literacy),0)>90 order by avg_literacy_ratio desc ;


-- top 3 state showing highest growth ratio


select top 3 state,avg(growth)*100 avg_growth from data1 group by state order by avg_growth desc;

--bottom 3 state showing lowest sex ratio

select top 3 state,round(avg(sex_ratio),0) avg_sex_ratio from data1 group by state order by avg_sex_ratio asc;

-- top and bottom 3 states in literacy state

drop table if exists #topstates;
create table #topstates
( state nvarchar(255),
  topstate float

  )

insert into #topstates
select state,round(avg(literacy),0) avg_literacy_ratio from data1 
group by state order by avg_literacy_ratio desc;

select top 3 * from #topstates order by #topstates.topstate desc;

drop table if exists #bottomstates;
create table #bottomstates
( state nvarchar(255),
  bottomstate float

  )

insert into #bottomstates
select state,round(avg(literacy),0) avg_literacy_ratio from data1 
group by state order by avg_literacy_ratio desc;

select top 3 * from #bottomstates order by #bottomstates.bottomstate asc;

--union opertor

select * from (
select top 3 * from #topstates order by #topstates.topstate desc) a

union

select * from (
select top 3 * from #bottomstates order by #bottomstates.bottomstate asc) b;



-- states starting with letter a

select distinct state from data1 where lower(state) like 'a%' or lower(state) like 'b%'

select distinct state from data1 where lower(state) like 'a%' and lower(state) like '%m'