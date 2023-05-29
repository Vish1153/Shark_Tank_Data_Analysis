select * from Project..Sheet1

--total Episodes

select max(EpNo) from Project..Sheet1
select count(distinct EpNo) from Project..Sheet1

--Pitches

select count(distinct brand) from project..Sheet1

--Pitches Converted

select sum(a.converted_not_converted)funding_recieved ,count(*) total_pitches from(
select amountinvestedlakhs, case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from project..Sheet1) a

--Finding the percentage of succesfull pitches

select cast(sum(a.converted_not_converted) as float)/cast(count(*) as float) from(
select amountinvestedlakhs, case when amountinvestedlakhs>0 then 1 else 0 end as converted_not_converted from project..Sheet1) a

--Total Male

select sum(male) from project..Sheet1

--Total Female

select sum(female) from project..Sheet1

--Gender Ratio

select sum(female)/sum(male) from project..Sheet1

--Total Invested Amount

select sum(amountinvestedlakhs) from project..Sheet1

--Average Equity Taken

select avg(a.EquityTakenP) from (
select * from project..Sheet1 where EquityTakenP>0) a

--Highest Amount Invested IN show

select max(amountinvestedlakhs) from project..Sheet1

--Highest Equity Taken by the sharks

select max(EquityTakenP) from project..Sheet1

--Startup having atleast women

select sum(female_count)  from (
select female,case when female>0 then 1 else 0 end as female_count from project..Sheet1) a

--Startup having at least one women

select * from project..Sheet1


select sum(b.female_count) from(
select case when a.female>0 then 1 else 0 end as female_count ,a.*from (
(select * from project..Sheet1 where deal!='No Deal')) a)b

-- avg team members

select avg(teammembers) from project..Sheet1

-- amount invested per deal

select avg(a.amountinvestedlakhs) amount_invested_per_deal from
(select * from project..Sheet1 where deal!='No Deal') a

-- avg age group of contestants

select avgage,count(avgage) cnt from project..Sheet1 group by avgage order by cnt desc

-- location group of contestants

select location,count(location) cnt from project..Sheet1 group by location order by cnt desc

-- sector group of contestants

select sector,count(sector) cnt from project..Sheet1 group by sector order by cnt desc

--partner deals

select partners,count(partners) cnt from project..Sheet1  where partners!='-' group by partners order by cnt desc

--Partner Deals

(select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals_present from project..Sheet1 where ashneeramountinvested is not null) a

inner join (
select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals from project..Sheet1 
where ashneeramountinvested is not null AND ashneeramountinvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Ashneer' as keyy,SUM(C.ASHNEERAMOUNTINVESTED) total_amount_invested,
AVG(C.ASHNEEREQUITYTAKENP) avg_equity_taken
FROM (SELECT * FROM PROJECT..Sheet1  WHERE ASHNEEREQUITYTAKENP!=0 AND ASHNEEREQUITYTAKENP IS NOT NULL) C) n

on m.keyy=n.keyy)

union

(select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Namita' as keyy,count(NamitaAmountInvested) total_deals_present from project..Sheet1 where NamitaAmountInvested is not null) a

inner join (
select 'Namita' as keyy,count(NamitaAmountInvested) total_deals from project..Sheet1 
where NamitaAmountInvested is not null AND NamitaAmountInvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Namita' as keyy,SUM(C.NamitaAmountInvested) total_amount_invested,
AVG(C.NamitaEquityTakenP) avg_equity_taken
FROM (SELECT * FROM PROJECT..Sheet1  WHERE NamitaEquityTakenP!=0 AND NamitaEquityTakenP IS NOT NULL) C) n

on m.keyy=n.keyy)

union

(select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Anupam' as keyy,count(AnupamAmountInvested) total_deals_present from project..Sheet1 where AnupamAmountInvested is not null) a

inner join (
select 'Anupam' as keyy,count(AnupamAmountInvested) total_deals from project..Sheet1 
where AnupamAmountInvested is not null AND AnupamAmountInvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Anupam' as keyy,SUM(C.AnupamAmountInvested) total_amount_invested,
AVG(C.AnupamEquityTakenP) avg_equity_taken
FROM (SELECT * FROM PROJECT..Sheet1  WHERE AnupamEquityTakenP!=0 AND AnupamEquityTakenP IS NOT NULL) C) n

on m.keyy=n.keyy)

union

(select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Vineeta' as keyy,count(VineetaAmountInvested) total_deals_present from project..Sheet1 where VineetaAmountInvested is not null) a

inner join (
select 'Vineeta' as keyy,count(VineetaAmountInvested) total_deals from project..Sheet1 
where VineetaAmountInvested is not null AND VineetaAmountInvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Vineeta' as keyy,SUM(C.VineetaAmountInvested) total_amount_invested,
AVG(C.VineetaEquityTakenP) avg_equity_taken
FROM (SELECT * FROM PROJECT..Sheet1  WHERE VineetaEquityTakenP!=0 AND VineetaEquityTakenP IS NOT NULL) C) n

on m.keyy=n.keyy)

union

(select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from

(select a.keyy,a.total_deals_present,b.total_deals from(

select 'Aman' as keyy,count(AmanAmountInvested) total_deals_present from project..Sheet1 where AmanAmountInvested is not null) a

inner join (
select 'Aman' as keyy,count(AmanAmountInvested) total_deals from project..Sheet1 
where AmanAmountInvested is not null AND AmanAmountInvested!=0) b 

on a.keyy=b.keyy) m

inner join 

(SELECT 'Aman' as keyy,SUM(C.AmanAmountInvested) total_amount_invested,
AVG(C.AmanEquityTakenP) avg_equity_taken
FROM (SELECT * FROM PROJECT..Sheet1  WHERE AmanEquityTakenP!=0 AND AmanEquityTakenP IS NOT NULL) C) n

on m.keyy=n.keyy)