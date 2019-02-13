unit SignUp_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListBox, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.FMTBcd, Data.DB, Data.SqlExpr, Datasnap.DBClient;

type
  TSignUpFrm = class(TForm)
    Panel1: TPanel;
    TabControl1: TTabControl;
    MajorTab: TTabItem;
    LiberalTab: TTabItem;
    ToolBar1: TToolBar;
    MajorComboBox: TComboBox;
    GradeComboBox: TComboBox;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SignUpFrm: TSignUpFrm;

implementation

{$R *.fmx}

uses Overall_DM, SubjectDetail_Frame, CommonDefine;

procedure TSignUpFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TSignUpFrm.FormCreate(Sender: TObject);
begin
  OverallDM.Subject_Type.Open;
  OverallDM.Subject_Type.First; //SEQ_SUBJECT_TYPE = 0, NAME_SUBJECT_TYPE = ����
  OverallDM.Subject_Type.Next;
  while not OverallDM.Subject_Type.Eof do //ù��° Record�� �����ϰ� �߰�
  begin
    MajorComboBox.Items.AddObject(OverallDM.Subject_Type.FieldByName('NAME_SUBJECT_TYPE').AsString, NIL);
    OverallDM.Subject_Type.Next;
  end;
  MajorComboBox.ItemIndex := 1;
  GradeComboBox.ItemIndex := 0;
end;

procedure TSignUpFrm.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  ShowSubjectDetail: TSubjectDetailFrame;
begin
  ShowSubjectDetail := TSubjectDetailFrame.Create(Self);
  ShowSubjectDetail.Parent := Self;

  OverallDM.SQLExcuteMethod(SIGNEDUP_CHECK);  //������û ����
  case OverallDM.SignedUpCheck_ServerMethod.Params[3].AsInteger of
    SIGNEDUP_CHECK_NO:  //������� ���� ����
    begin
      ShowSubjectDetail.RequestBtn.Text := '������û';
      ShowSubjectDetail.RequestBtn.OnClick := ShowSubjectDetail.SignUpBtnClick;
    end;
    SIGNEDUP_CHECK_YES: //�̹� ����� ��1��
    begin
      ShowSubjectDetail.RequestBtn.Text := '�������';
      ShowSubjectDetail.RequestBtn.OnClick := ShowSubjectDetail.DropBtnClick;
    end;
  end;

  OverallDM.SQLExcuteMethod(BASKET_CHECK);
  case OverallDM.SignedUpCheck_ServerMethod.Params[3].AsInteger of
    SIGNEDUP_CHECK_NO: ShowSubjectDetail.BasketCheck.IsChecked := False;  //���ɰ����� �ƴ� ����
    SIGNEDUP_CHECK_YES: ShowSubjectDetail.BasketCheck.IsChecked := True;  //���ɰ����� ����
  end;
end;

procedure TSignUpFrm.ComboBoxChange(Sender: TObject);
begin
  OverallDM.Subject_Log.Close;
  OverallDM.Subject_Log.ParamByName('SEQ_SUBJECT_TYPE').AsInteger :=
  MajorComboBox.Selected.Index;
  OverallDM.Subject_Log.ParamByName('GRADE').AsInteger :=
  GradeComboBox.Selected.Index + 1;
  OverallDM.Subject_Log.Open;
end;

end.
