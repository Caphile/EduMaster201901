unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  FireDAC.Comp.UI;


type
  TServerMethods1 = class(TDSServerModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysIBDriverLink1: TFDPhysIBDriverLink;
    Tb_Biz: TFDTable;
    Tb_BizProvider: TDataSetProvider;
    SignUpQuery: TFDQuery;
    Tb_Biz_Info: TFDTable;
    Tb_Biz_InfoProvider: TDataSetProvider;
    DupChkQuery: TFDQuery;
    SignUpQuery2: TFDQuery;
    SignInQuery: TFDQuery;
    BizInfoQuery: TFDQuery;
    SignInQueryProvider: TDataSetProvider;
    BizInfoQueryProvider: TDataSetProvider;
  private
    { Private declarations }
  public
    var
      BizCode: Integer;
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function DupChk(ABizNum: string): Integer; // �ߺ�üũ: Return > 0 then �ߺ�
    function SignUp(ABizNum, APw, AName, AAddr: string): Boolean; // ȸ�� ����
    function SignIn(ABizNum, APw: string): Boolean; // �α���

  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.SignIn(ABizNum, APw: string): Boolean;
begin
  SignInQuery.Close;
  SignInQuery.Params[0].AsString := ABizNum;
  SignInQuery.Params[1].AsString := APw;
  SignInQuery.Open;
  BizInfoQuery.Close;

  if SignInQuery.RecordCount = 0 then
    Result := False
  else if SignInQuery.RecordCount = 1 then
  begin
//  // �ڵ� �޾ƿͼ�
    BizCode := SignInQuery.FieldByName('biz_code').AsInteger;
  // ������ ����
    BizInfoQuery.Params[0].AsInteger := BizCode;
    BizInfoQuery.Open;
    Result := True;
  end
  else
//    raise Exception.Create('�α��ε����� �ߺ��� �ִ��� Ȯ��');

end;

function TServerMethods1.SignUp(ABizNum, APw, AName, AAddr: string): Boolean;
begin
  Result := False;
  SignUpQuery.Close;
  SignUpQuery2.Close;

  SignUpQuery.Params[0].AsString := ABizNum;
  SignUpQuery.Params[1].AsString := APw;
  SignUpQuery.Params[2].AsString := AName;
  SignUpQuery.Params[3].AsString := AAddr;

  FDConnection1.StartTransaction;
  try
    SignUpQuery.ExecSQL;
    SignUpQuery2.ExecSQL;
    FDConnection1.Commit;
    Result := True;
  except
    FDConnection1.Rollback;
    raise;
  end;


end;

function TServerMethods1.DupChk(ABizNum: string): Integer;
begin
  DupChkQuery.Close;
  DupChkQuery.Params[0].AsString := ABizNum;
  DupChkQuery.Open;

  Result := DupChkQuery.FieldByName('DUPCNT').AsInteger;
end;

end.

