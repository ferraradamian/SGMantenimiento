RESTORE DATABASE BDSGM
 
FROM DISK = 'C:\Users\ry04549\source\repos\BDSGM.bak'
 
WITH REPLACE,
 
MOVE 'BDSGM' TO 'C:\Users\ry04549\source\repos\BDSGM.mdf',
 
MOVE 'BDSGM_log' TO 'C:\Users\ry04549\source\repos\BDSGM.ldf'
