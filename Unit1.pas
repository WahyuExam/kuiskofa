unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    Button1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    procedure Button1Click(Sender: TObject);
    function konversiATH(angka : Integer) : string;
    procedure edt1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  edt2.Clear;
  edt2.Text := konversiATH(StrToInt(edt1.Text));
end;

function TForm1.konversiATH(angka : Integer): string;
var
  tampung_nil       : array [1..26] of string;
  aaa               : Char;
  xxx,nilai,zzz     : Integer;
  sisaDiv, sisaMod  : Integer;
  hasil             : string;
  pisah             : TStringList;
begin
  xxx := 2;
  zzz := 1;
  tampung_nil[1] := 'A=1';

  for aaa:='B' to 'Z' do
   begin
     nilai             := zzz * 2;
     tampung_nil[xxx]  := aaa+'='+inttostr(nilai);

     zzz := nilai;
     xxx := xxx + 1;
   end;

   pisah := TStringList.Create;
   pisah.Delimiter :='=';
   hasil := '';

   while angka > 0 do
    begin
      for xxx:=26 downto 1 do
       begin
         pisah.DelimitedText := tampung_nil[xxx];
         sisaDiv := angka div StrToInt(pisah[1]);
         if sisaDiv > 0 then
          begin
            hasil := hasil + pisah[0];
            sisaMod := angka mod StrToInt(pisah[1]);
            Break;
          end;
       end;
       angka := sisamod;
    end;
   Result := hasil;
end;

procedure TForm1.edt1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#9]) then key:=#13;
end;

end.
