unit SignUp_Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ListBox, FMX.TabControl,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TSIgnUpFrm = class(TForm)
    Panel1: TPanel;
    TabControl1: TTabControl;
    MajorTab: TTabItem;
    LiberalTab: TTabItem;
    ToolBar1: TToolBar;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ListView1: TListView;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    ComboBox3: TComboBox;
    ListBoxItem7: TListBoxItem;
    ListBoxItem8: TListBoxItem;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SIgnUpFrm: TSIgnUpFrm;

implementation

{$R *.fmx}

uses Overall_DM, SubjectDetail_Frame, CommonDefine;

procedure TSIgnUpFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TSIgnUpFrm.ListView1ItemClick(const Sender: TObject;
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
    SIGNEDUP_CHECK_YES: //�̹� ����� ����
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

end.
