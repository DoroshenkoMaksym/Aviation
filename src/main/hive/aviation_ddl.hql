CREATE EXTERNAL TABLE IF NOT EXISTS mdoroshenko.aviation (
   Year_col          INT
  ,Month             INT
  ,DayofMonth        INT
  ,DayOfWeek         INT
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
) PARTITIONED BY (Year INT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ","
)
STORED AS TEXTFILE
LOCATION '/data/mdoroshenko/aviation'
TBLPROPERTIES ("skip.header.line.count"="1");

ALTER TABLE mdoroshenko.aviation ADD IF NOT EXISTS
PARTITION (year=2000) LOCATION '/data/mdoroshenko/aviation/2000.csv'
PARTITION (year=2001) LOCATION '/data/mdoroshenko/aviation/2001.csv'
PARTITION (year=2002) LOCATION '/data/mdoroshenko/aviation/2002.csv'
PARTITION (year=2003) LOCATION '/data/mdoroshenko/aviation/2003.csv'
PARTITION (year=2004) LOCATION '/data/mdoroshenko/aviation/2004.csv'
PARTITION (year=2005) LOCATION '/data/mdoroshenko/aviation/2005.csv'
PARTITION (year=2006) LOCATION '/data/mdoroshenko/aviation/2006.csv'
PARTITION (year=2007) LOCATION '/data/mdoroshenko/aviation/2007.csv'
PARTITION (year=2008) LOCATION '/data/mdoroshenko/aviation/2008.csv';