unit ConfirmCheck_Frame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, Data.DB, Datasnap.DBClient,
  Data.FMTBcd, Data.SqlExpr;

type
  TConfirmCheckFrame = class(TFrame)
    Rectangle1: TRectangle;
    Panel1: TPanel;
    ConfirmBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    procedure Rectangle1Click(Sender: TObject);
    procedure SignUpConfirmBtnClick(Sender: TObject);
    procedure DropConfirmClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure BasketConfirmBtnClick(Sender: TObject);
    procedure BasketDropConfirmBtnClick(Sender: TObject);
    procedure DropConfirmBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses Overall_DM, CommonDefine, Basket_Form, MySubjects_Form;

procedure TConfirmCheckFrame.CancelBtnClick(Sender: TObject); //���
begin
  Destroy;
end;

procedure TConfirmCheckFrame.SignUpConfirmBtnClick(Sender: TObject);  //������û Ȯ�� �ڵ鷯
var
  NowSubject, NowStudent: string;
begin
  NowSubject := OverallDM.Subject_Log.FieldByName('SUBJECT_CODE').AsString;
  NowStudent := OverallDM.User_Log.FieldByName('STUDENT_CODE').AsString;
  OverallDM.SignUpSubject(NowSubject, NowStudent, SIGNEDUP_CHECK);

  case OverallDM.SignUp_ServerMethod.Params[3].AsInteger of
    1: showmessage('�ʰ��ο�');
    2: showmessage('�ʰ�����');
  end;

  Parent.Destroy;
end;

procedure TConfirmCheckFrame.DropConfirmClick(Sender: TObject); //��û��� Ȯ�� �ڵ鷯
var
  NowSubject, NowStudent: string;
begin
  NowSubject := OverallDM.Subject_Log.FieldByName('SUBJECT_CODE').AsString;
  NowStudent := OverallDM.User_Log.FieldByName('STUDENT_CODE').AsString;
  OverallDM.DropSubject(NowSubject, NowStudent, SIGNEDUP_CHECK);

  Parent.Destroy;
end;

procedure TConfirmCheckFrame.BasketConfirmBtnClick(Sender: TObject);  //��ٱ��Ͽ��� ��û
var
  NowSubject, NowStudent: string;
begin
  NowSubject := ShowSignedUpDM.SignedUpSearch.FieldByName('SUBJECT_CODE').AsString;
  NowStudent := ShowSignedUpDM.SignedUpSearch.FieldByName('STUDENT_CODE').AsString;
  OverallDM.SignUpSubject(NowSubject, NowStudent, SIGNEDUP_CHECK);

  case OverallDM.SignUp_ServerMethod.Params[3].AsInteger of
    1: showmessage('�ʰ��ο�');
    2: showmessage('�ʰ�����');
  end;

  NowSubject := ShowSignedUpDM.SignedUpSearch.FieldByName('SUBJECT_CODE').AsString;
  NowStudent := OverallDM.User_Log.FieldByName('STUDENT_CODE').AsString;
  OverallDM.DropSubject(NowSubject, NowStudent, BASKET_CHECK);

  ShowSignedUpDM.SignedUpSearch.Refresh;

  Parent.Destroy;
end;

procedure TConfirmCheckFrame.BasketDropConfirmBtnClick(Sender: TObject); //��ٱ��Ͽ��� ���
var
  NowSubject, NowStudent: string;
begin
  NowSubject := ShowSignedUpDM.SignedUpSearch.FieldByName('SUBJECT_CODE').AsString;
  NowStudent := OverallDM.User_Log.FieldByName('STUDENT_CODE').AsString;
  OverallDM.DropSubject(NowSubject, NowStudent, BASKET_CHECK);

  ShowSignedUpDM.SignedUpSearch.Refresh;

  Parent.Destroy;
end;

procedure TConfirmCheckFrame.DropConfirmBtnClick(Sender: TObject);  //������������ ���
var
  NowSubject, NowStudent: string;
begin
  NowSubject := ShowSignedUpDM2.SignedUpSearch.FieldByName('SUBJECT_CODE').AsString;
  NowStudent := ShowSignedUpDM2.SignedUpSearch.FieldByName('STUDENT_CODE').AsString;
  OverallDM.DropSubject(NowSubject, NowStudent, SIGNEDUP_CHECK);

  ShowSignedUpDM2.SignedUpSearch.Refresh;

  Destroy;
end;

procedure TConfirmCheckFrame.Rectangle1Click(Sender: TObject);
begin
  Destroy;
end;

end.
