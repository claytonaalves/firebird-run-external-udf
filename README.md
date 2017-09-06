# What is this ?

A Firebird UDF that runs external processes.

## Register function

```sql
DECLARE EXTERNAL FUNCTION RunExternal 
   CSTRING(255), 
   CSTRING(255)
RETURNS 
   INTEGER BY VALUE
ENTRY_POINT 'RunExternal' MODULE_NAME 'RunExternalProcess.dll';
```

*Important*: Restart firebird after registering function.

## Call function from trigger

```sql
SET TERM ^ ;

CREATE TRIGGER MyTrigger FOR MyTable
ACTIVE AFTER INSERT OR UPDATE POSITION 0
AS 
   DECLARE return_value INTEGER;
BEGIN 
	return_value = RunExternal(
	   'C:\bin\command.exe',  
	   'param1');
END^

SET TERM ; ^ 
```

