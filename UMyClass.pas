unit UMyClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ToolWin, ActnMan, ActnCtrls,
  ActnMenus, Menus, Data.DB, Data.Win.ADODB, Contnrs,
  Generics.Collections, UConnection;

type

  TMyClass = class
  private
    /// <link>aggregation</link>
    Connection: TConnection;
    ADOQuery: TADOQuery;
    DataSource: TDataSource;
  public
    function GetADOQuery: TADOQuery;
    function GetDataSource: TDataSource;
    constructor create;
  end;

implementation

{ TMyClass }

constructor TMyClass.create;
begin
  Connection := TConnection.create;
  if not Assigned(ADOQuery) then
    ADOQuery := TADOQuery.create(nil);
  ADOQuery.Connection := Connection.GetADOConnection;
  ADOQuery.Close;
  ADOQuery.SQL.Clear;
  ADOQuery.SQL.add('SELECT * FROM store.element;');
  ADOQuery.Open;
  ADOQuery.Active := true;
  if not Assigned(DataSource) then
    DataSource := TDataSource.create(nil);
  DataSource.DataSet := ADOQuery;
end;

function TMyClass.GetADOQuery: TADOQuery;
begin
  result := ADOQuery;
end;

function TMyClass.GetDataSource: TDataSource;
begin
  result := DataSource;
end;

end.
