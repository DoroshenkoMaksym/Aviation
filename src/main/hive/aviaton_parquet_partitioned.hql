CREATE TABLE IF NOT EXISTS mdoroshenko.aviation_parquet (
   DayOfWeek         INT
  ,DepTime           INT
  ,CRSDepTime        INT
  ,ArrTime           INT
  ,CRSArrTime        INT
  ,UniqueCarrier     STRING
  ,FlightNum         INT
  ,TailNum           STRING
  ,ActualElapsedTime INT
  ,CRSElapsedTime    INT
  ,AirTime           INT
  ,ArrDelay          INT
  ,DepDelay          INT
  ,Origin            STRING
  ,Dest              STRING
  ,Distance          INT
  ,TaxiIn            INT
  ,TaxiOut           INT
  ,Cancelled         INT
  ,CancellationCode  STRING
  ,Diverted          STRING
  ,CarrierDelay      INT
  ,WeatherDelay      INT
  ,NASDelay          INT
  ,SecurityDelay     INT
  ,LateAircraftDelay INT
) PARTITIONED BY (year INT, month INT, day INT)
STORED AS PARQUET;

SET hive.exec.dynamic.partition.mode=nonstrict;
SET hive.exec.dynamic.partition=true;

INSERT OVERWRITE TABLE mdoroshenko.aviation_parquet PARTITION (year, month, day)
SELECT     DayOfWeek
          ,DepTime
          ,CRSDepTime
          ,ArrTime
          ,CRSArrTime
          ,UniqueCarrier
          ,FlightNum
          ,TailNum
          ,ActualElapsedTime
          ,CRSElapsedTime
          ,AirTime
          ,ArrDelay
          ,DepDelay
          ,Origin
          ,Dest
          ,Distance
          ,TaxiIn
          ,TaxiOut
          ,Cancelled
          ,CancellationCode
          ,Diverted
          ,CarrierDelay
          ,WeatherDelay
          ,NASDelay
          ,SecurityDelay
          ,LateAircraftDelay
          ,year
          ,Month
          ,DayofMonth as day
          FROM mdoroshenko.aviation;