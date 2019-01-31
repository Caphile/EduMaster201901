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
    BindingsList1: TBindingsList;
    BindSourceDB2: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    procedure Rectangle1Click(Sender: TObject);
    procedure SignUpBtnClick(Sender: TObject);
    procedure DropBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

uses Overall_DM, ConfirmCheck_Frame;

procedure TSubjectDetailFrame.SignUpBtnClick(Sender: TObject);  //������û ��ư
var
  ShowCCFrame: TConfirmCheckFrame;
begin
  ShowCCFrame := TConfirmCheckFrame.Create(Self);
  ShowCCFrame.Parent := Self;

  ShowCCFrame.ConfirmBtn.OnClick := ShowCCFrame.SignUpConfirmBtnClick;
end;

procedure TSubjectDetailFrame.DropBtnClick(Sender: TObject);  //��û��� ��ư
var
  ShowCCFrame: TConfirmCheckFrame;
begin
  ShowCCFrame := TConfirmCheckFrame.Create(Self);
  ShowCCFrame.Parent := Self;

  ShowCCFrame.ConfirmBtn.OnClick := ShowCCFrame.DropConfirmClick;
end;

procedure TSubjectDetailFrame.Rectangle1Click(Sender: TObject);
begin
  Destroy;
end;

end.
