unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB, FireDAC.Phys.IBDef,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.UI, Datasnap.Provider, FMX.Dialogs;

type
  TServerMethods1 = class(TDSServerModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Subject_Log: TFDQuery;
    SignedUp: TFDQuery;
    Subject_logProvider: TDataSetProvider;
    SignedUpProvider: TDataSetProvider;
    qryLogInProvider: TDataSetProvider;
    qryLogIn: TFDQuery;
    qrySignedUp: TFDQuery;
    SignedUpDropProvider: TDataSetProvider;
    qrySignedUpSearch: TFDQuery;
    SignedUpSearchProvider: TDataSetProvider;
    qryBasketDetail: TFDQuery;
    BasketDetailProvider: TDataSetProvider;
    Subject_Type: TFDTable;
    Subject_TypeProvider: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    function LogInCheck(ID, PW: string): Integer;
    function SignedUpCheck(Subject, Student: string; SignedUpType: Integer): Integer;
  end;

implementation

{$R *.dfm}

uses System.StrUtils, CommonDefine;

function TServerMethods1.LogInCheck(ID, PW: string): Integer;
var
  Msg: string;
begin
  qryLogIn.Close;
  qryLogIn.ParamByName('STUDENT_CODE').AsString := ID;
  qryLogIn.Open;

  if qryLogIn.Fields[1].AsString <> ID then //��ϵ��� ���� ID
    Result := LOGIN_CHECK_NOTFOUND_ID
  else if qryLogIn.Fields[2].AsString <> PW then  //��й�ȣ Ʋ��
    Result := LOGIN_CHECK_INCORRECT_PW
  else
    Result := LOGIN_CHECK_OK;
end;

function TServerMethods1.SignedUpCheck(Subject, Student: string; SignedUpType: Integer): Integer;
var
  Msg: string;
begin
  qrySignedUp.Close;
  qrySignedUp.ParamByName('SUBJECT_CODE').AsString := Subject;
  qrySignedUp.ParamByName('STUDENT_CODE').AsString := Student;
  qrySignedUp.ParamByName('SIGNEDUP_TYPE').AsInteger := SignedUpType;
  qrySignedUp.Open;

  if qrySignedUp.Fields[0].AsString <> Subject then
    Result := SIGNEDUP_CHECK_NO  //������� ���� ����
  else
    Result := SIGNEDUP_CHECK_YES;  //�̹� ����� ����
end;

end.


