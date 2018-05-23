ALTER TABLE loadtestrslt.tx 
MODIFY COLUMN start_time timestamp null,
MODIFY COLUMN end_time timestamp null,
ADD PRIMARY KEY (tx_id, test_region_id);

ALTER TABLE loadtestrslt.`object`
MODIFY COLUMN start_time timestamp null,
MODIFY COLUMN end_time timestamp null,
ADD PRIMARY KEY (tx_id, obj_id, test_region_id);


ALTER TABLE loadtestrslt.`object`
MODIFY COLUMN start_time timestamp null,
MODIFY COLUMN end_time timestamp null,
ADD PRIMARY KEY (tx_id, obj_id, test_region_id);

ALTER TABLE loadtestrslt.phases
MODIFY COLUMN start_time timestamp null,
MODIFY COLUMN end_time timestamp null,
ADD PRIMARY KEY (phase_number, test_region_id);