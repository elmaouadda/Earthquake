
select *
from earthquake


-------------Data Exploration --------------------------------------------------------------------------------

-- What magnitude range covered by the earthquake table?

select max(magnitude) Max_Magnitude, min(magnitude) Min_Magnitude
from earthquake

-- What are the places that have high magnitude?

select place
from earthquake
where magnitude = 9.1

-- How many earthquakes were not natural?

select 
case
	when cause = 'explosion' then 'not natural'
	when cause = 'earthquake' then 'natural'
	when cause = 'nuclear explosion' then 'Nuclear thing'
	Else cause
	end Motive
	, count(*) Outcome
from earthquake
group  by cause

-- Places where nuclear explosions happened 

select place, count(*) as Number
from earthquake
where  cause = 'nuclear explosion' 
group by place
order by Number desc

-- Most recent earthquake caused by Nuclear Explosion

select top 1 place, occurred_on, magnitude
from earthquake
where cause = 'nuclear explosion' 
order by occurred_on desc

-- The 10th largest earthquakes from 1969 - 2018

select top 10 magnitude, occurred_on, place
from earthquake
where occurred_on between '1969-01-01' and '2017-12-31'
order by magnitude desc










