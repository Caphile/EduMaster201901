unit LogIn_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, Data.DB,
  Datasnap.DBClient, System.Actions, FMX.ActnList, FMX.StdActns, Overall_DM,
  Data.FMTBcd, Data.SqlExpr;

type
  TLogInFrm = class(TForm)
    IDEdit: TEdit;
    PWEdit: TEdit;
    LogInBtn: TButton;
    SqlServerMethod1: TSqlServerMethod;
    procedure LogInBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogInFrm: TLogInFrm;

implementation

{$R *.fmx}

procedure TLogInFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TLogInFrm.LogInBtnClick(Sender: TObject);
begin
  SqlServerMethod1.Close;
  SqlServerMethod1.Params[0].AsString := IDEdit.Text;
  SqlServerMethod1.Params[1].AsString := PWEdit.Text;
  SqlServerMethod1.ExecuteMethod;

  case SqlServerMethod1.Params[2].AsInteger of
    0: ShowMessage('��ϵ��� ���� �й�(ID)�Դϴ�.');
    1: ShowMessage('��й�ȣ�� �ùٸ��� �ʽ��ϴ�.');
    2: close;
  end;
end;
end.
