unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UMyClass, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    /// <link>aggregation</link>
    MyClass: TMyClass;
  public
    constructor create(AOwner: TComponent); override;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  // if Assigned(MyClass) then
  Form1.Edit1.Text := MyClass.GetADOQuery.FieldByName('price').AsString;
  Form1.DBGrid1.DataSource := MyClass.GetDataSource;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  MyClass.GetADOQuery.Refresh;
end;

constructor TForm1.create(AOwner: TComponent);
begin
  inherited;
  MyClass := TMyClass.create;
  Form1.Edit1.Text := MyClass.GetADOQuery.FieldByName('description').AsString;
end;

end.
