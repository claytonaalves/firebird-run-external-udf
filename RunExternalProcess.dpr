library RunExternalProcess;

uses
  SysUtils,
  Classes,
  ShellApi,
  Windows;

{$R *.res}

function RunExternal(Command, Params: PChar): Integer; cdecl;
begin
   Result := ShellExecute(0, 'open', Command, Params, nil, SW_HIDE);
   if Result>32 then
      Result := 0
   else
      Result := 1;
end;

exports RunExternal;

begin
end.
