unit SubjectDetail_Frame;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.TreeView,
  FMX.Edit, Data.DB, Datasnap.DBClient, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, Data.Bind.DBScope,
  FMX.ListView;

type
  TSubjectDetailFrame = class(TFrame)
    Rectangle1: TRectangle;
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    RequestBtn: TButton;
    BasketCheck: TCheckBox;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    Edit3: TEdit;
    Edit4: TEdit;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    procedure Rectangle1Click(Sender: TObject);
    procedure SignUpBtnClick(Sender: TObject);
    procedure DropBtnClick(Sender: TObject);
    procedure BasketCheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses Overall_DM, ConfirmCheck_Frame, CommonDefine, SignedUp_DM;

procedure TSubjectDetailFrame.Rectangle1Click(Sender: TObject);
begin
  Destroy;
end;

procedure TSubjectDetailFrame.SignUpBtnClick(Sender: TObject);  //������û ��ư
var
  Msg: string;
  ShowCCFrame: TConfirmCheckFrame;
begin
  ShowCCFrame := TConfirmCheckFrame.Create(Self);
  ShowCCFrame.Parent := Self;

  ShowCCFrame.ConfirmBtn.OnClick := ShowCCFrame.SignUpConfirmBtnClick;

  Msg := OverallDM.Subject_Log.FieldByName('TITLE').AsString;
  ShowCCFrame.Label1.Text := Format('"%s"' + #13#10 + '������û �Ͻðڽ��ϱ�?', [Msg]);
end;

procedure TSubjectDetailFrame.DropBtnClick(Sender: TObject);  //��û��� ��ư
var
  Msg: string;
  ShowCCFrame: TConfirmCheckFrame;
begin
  ShowCCFrame := TConfirmCheckFrame.Create(Self);
  ShowCCFrame.Parent := Self;

  ShowCCFrame.ConfirmBtn.OnClick := ShowCCFrame.DropConfirmClick;

  Msg := OverallDM.Subject_Log.FieldByName('TITLE').AsString;
  ShowCCFrame.Label1.Text := Format('"%s"' + #13#10 + '������� �Ͻðڽ��ϱ�?', [Msg]);
end;

procedure TSubjectDetailFrame.BasketCheckClick(Sender: TObject);
var
  NowSubject, NowStudent: string;
begin
  NowSubject := OverallDM.Subject_Log.FieldByName('SUBJECT_CODE').AsString;
  NowStudent := OverallDM.User_Log.FieldByName('STUDENT_CODE').AsString;
  if not BasketCheck.IsChecked then //���ɰ��� ���
    OverallDM.SignUpSubject(NowSubject, NowStudent, BASKET_CHECK)
  else  //���ɰ��� ��� ���
    OverallDM.DropSubject(NowSubject, NowStudent, BASKET_CHECK);
end;

end.
