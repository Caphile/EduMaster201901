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
    procedure ConfirmBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses Overall_DM, CommonDefine, Basket_Form;

procedure TConfirmCheckFrame.CancelBtnClick(Sender: TObject); //���
begin
  Destroy;
end;

procedure TConfirmCheckFrame.SignUpConfirmBtnClick(Sender: TObject);  //������û Ȯ�� �ڵ鷯
begin
  try
    OverallDM.SignUpSubject(SIGNEDUP_CHECK);
  except

  end;

  Parent.Destroy;
end;

procedure TConfirmCheckFrame.DropConfirmClick(Sender: TObject); //��û��� Ȯ�� �ڵ鷯
begin
  OverallDM.DropSubject(SIGNEDUP_CHECK);
  Parent.Destroy;
end;

procedure TConfirmCheckFrame.BasketConfirmBtnClick(Sender: TObject);  //��ٱ��Ͽ��� ��û
begin
  OverallDM.SignedUp.Insert;

  OverallDM.SignedUp.FieldByName('SUBJECT_CODE').AsString :=
  ShowSignedUpDM.SignedUpSearch.FieldByName('SUBJECT_CODE').AsString;
  OverallDM.SignedUp.FieldByName('STUDENT_CODE').AsString :=
  ShowSignedUpDM.SignedUpSearch.FieldByName('STUDENT_CODE').AsString;
  OverallDM.SignedUp.FieldByName('SIGNEDUP_TYPE').AsInteger := SIGNEDUP_CHECK;

  //�ߺ�����(���� �ʿ�)

  OverallDM.SignedUp.ApplyUpdates(-1);

  ShowSignedUpDM.BasketDetail.ParamByName('SUBJECT_CODE').AsString :=
  ShowSignedUpDM.SignedUpSearch.FieldByName('SUBJECT_CODE').AsString;
  ShowSignedUpDM.BasketDetail.ParamByName('STUDENT_CODE').AsString :=
  OverallDM.User_Log.FieldByName('STUDENT_CODE').AsString;
  ShowSignedUpDM.BasketDetail.ParamByName('SIGNEDUP_TYPE').AsInteger :=
  BASKET_CHECK;

  ShowSignedUpDM.BasketDetail.Open;
  ShowSignedUpDM.BasketDetail.Delete;
  ShowSignedUpDM.BasketDetail.ApplyUpdates(-1);
  ShowSignedUpDM.BasketDetail.Close;

  ShowSignedUpDM.SignedUpSearch.Refresh;

  Parent.Destroy;
end;

procedure TConfirmCheckFrame.BasketDropConfirmBtnClick(Sender: TObject); //��ٱ��Ͽ��� ���
begin
  ShowSignedUpDM.BasketDetail.ParamByName('SUBJECT_CODE').AsString :=
  ShowSignedUpDM.SignedUpSearch.FieldByName('SUBJECT_CODE').AsString;
  ShowSignedUpDM.BasketDetail.ParamByName('STUDENT_CODE').AsString :=
  OverallDM.User_Log.FieldByName('STUDENT_CODE').AsString;
  ShowSignedUpDM.BasketDetail.ParamByName('SIGNEDUP_TYPE').AsInteger :=
  BASKET_CHECK;

  ShowSignedUpDM.BasketDetail.Open;
  ShowSignedUpDM.BasketDetail.Delete;
  ShowSignedUpDM.BasketDetail.ApplyUpdates(-1);
  ShowSignedUpDM.BasketDetail.Close;

  ShowSignedUpDM.SignedUpSearch.Refresh;

  Parent.Destroy;
end;

procedure TConfirmCheckFrame.ConfirmBtnClick(Sender: TObject);  //������������ ���
begin
  //
end;

procedure TConfirmCheckFrame.Rectangle1Click(Sender: TObject);
begin
  Destroy;
end;

end.
