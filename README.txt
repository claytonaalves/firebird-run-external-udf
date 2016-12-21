What is it?
===========

Firebird UDF that runs a external application.



Register function
=================

DECLARE EXTERNAL FUNCTION RunExternal 
   CSTRING(255), 
   CSTRING(255)
RETURNS 
   INTEGER BY VALUE
ENTRY_POINT 'RunExternal' MODULE_NAME 'RunExternalProcess';



Call function from trigger
==========================

SET TERM ^ ;

CREATE TRIGGER MyTrigger FOR MyTable
ACTIVE AFTER INSERT OR UPDATE POSITION 0
AS 
   declare return_value integer;
BEGIN 
	return_value = RunExternal(
	   'C:\bin\command.exe',  
	   'param1');
END^

SET TERM ; ^ 
