# Example of table DDL to stage Kafka messages as a JSON payload. 
# We add a timestamp to capture the time when the events were loaded in database
CREATE MULTISET TABLE STG_KAFKA_MESSAGES ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     MAP = TD_MAP1
     (
      PAYLOAD JSON(16776192) INLINE LENGTH 4096 CHARACTER SET LATIN NOT NULL,
      ACQ_DTTM TIMESTAMP(0))
NO PRIMARY INDEX ;
