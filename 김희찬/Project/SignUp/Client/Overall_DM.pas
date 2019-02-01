unit Overall_DM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Datasnap.DBClient, Data.SqlExpr,
  Datasnap.DSConnect, Data.FMTBcd;

type
  TOverallDM = class(TDataModule)
    DSProviderConnection1: TDSProviderConnection;
    SQLConnection1: TSQLConnection;
    Subject_Log: TClientDataSet;
    SignedUp: TClientDataSet;
    User_Log: TClientDataSet;
    SignedUpCheck_ServerMethod: TSqlServerMethod;
    SignedUpSUBJECT_CODE: TIntegerField;
    SignedUpSTUDENT_CODE: TIntegerField;
    SignedUpSIGNEDUP_TYPE: TIntegerField;
    Subject_LogTYPE: TIntegerField;
    Subject_LogSUBJECT_CODE: TIntegerField;
    Subject_LogTITLE: TStringField;
    Subject_LogLECTURER: TStringField;
    Subject_LogTIME: TStringField;
    Subject_LogCLASSROOM: TStringField;
    Subject_LogCREDIT: TIntegerField;
    Subject_LogGRADE: TIntegerField;
    Subject_LogCAPACITY: TIntegerField;
    Subject_LogSTUDENTNUM: TIntegerField;
    Subject_LogDETAIL: TStringField;
    SignUpDrop: TClientDataSet;
    procedure SQLExcuteMethod(SignedUpType: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OverallDM: TOverallDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

uses Client_Form;

{$R *.dfm}

{ TOverallDM }

procedure TOverallDM.SQLExcuteMethod(SignedUpType: Integer);
begin
  SignedUpCheck_ServerMethod.Close;
  SignedUpCheck_ServerMethod.Params[0].AsInteger :=
  OverallDM.Subject_Log.FieldByName('SUBJECT_CODE').AsInteger;
  SignedUpCheck_ServerMethod.Params[1].AsInteger :=
  StrToInt(OverallDM.User_Log.FieldByName('STUDENT_CODE').AsString);
  SignedUpCheck_ServerMethod.Params[2].AsInteger := SignedUpType;
  SignedUpCheck_ServerMethod.ExecuteMethod;
end;

end.
