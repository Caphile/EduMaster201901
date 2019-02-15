unit LogIn_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, Data.DB,
  Datasnap.DBClient, System.Actions, FMX.ActnList, FMX.StdActns, Overall_DM,
  Data.FMTBcd, Data.SqlExpr, FMX.ScrollBox, FMX.Memo;

type
  TLogInFrm = class(TForm)
    IDEdit: TEdit;
    PWEdit: TEdit;
    LogInBtn: TButton;
    LogInCheck_ServerMethod: TSqlServerMethod;
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

uses CommonDefine, Client_Form;

procedure TLogInFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TLogInFrm.LogInBtnClick(Sender: TObject);
var
  ShowClientFrm: TClientFrm;
begin
  LogInCheck_ServerMethod.Params[0].AsString := IDEdit.Text;
  LogInCheck_ServerMethod.Params[1].AsString := PWEdit.Text;
  LogInCheck_ServerMethod.ExecuteMethod;

  case LogInCheck_ServerMethod.Params[2].AsInteger of
    LOGIN_CHECK_NOTFOUND_ID: ShowMessage('��ϵ��� ���� �й�(ID)�Դϴ�.');
    LOGIN_CHECK_INCORRECT_PW: ShowMessage('��й�ȣ�� �ùٸ��� �ʽ��ϴ�.');
    LOGIN_CHECK_OK:
    begin
      OverallDM.User_Log.Params[0].AsString := IDEdit.Text;
      OverallDM.User_Log.Open;
      Close;
    end;
  end;
end;

end.
