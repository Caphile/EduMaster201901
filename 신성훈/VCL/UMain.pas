unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope;

type
  TMainForm = class(TForm)
    pnlHeader: TPanel;
    pnlContent: TPanel;
    lblCaption: TLabel;
    BtnClose: TButton;
    pnlGrid: TPanel;
    pnlInput: TPanel;
    Splitter1: TSplitter;
    grpUser: TGroupBox;
    GroupBox2: TGroupBox;
    BtnCodeFind: TButton;
    Label2: TLabel;
    EdtID: TDBEdit;
    EdtUserCode: TDBEdit;
    Label3: TLabel;
    EdtPhone: TDBEdit;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    ImgPr: TImage;
    BtnPrFind: TButton;
    Label5: TLabel;
    EdtPrName: TDBEdit;
    Label7: TLabel;
    BtnPrRent: TButton;
    BtnPrNew: TButton;
    BtnPrCancel: TButton;
    Label8: TLabel;
    EdtSchool: TDBEdit;
    EdtPassword: TDBEdit;
    Label9: TLabel;
    EdtPrCode: TDBEdit;
    Label10: TLabel;
    BtnUserNew: TButton;
    BtnUserSave: TButton;
    Label6: TLabel;
    EdtUserName: TDBEdit;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    TabControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    GridPr: TDBGrid;
    Edit1: TEdit;
    Label12: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    GridUser: TStringGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    MainUserSource: TDataSource;
    BtnPrSave: TButton;
    BtnUserRent: TButton;
    BtnUserDelete: TButton;
    BtnCancel: TButton;
    procedure BtnUserNewClick(Sender: TObject);
    procedure BtnUserSaveClick(Sender: TObject);
    procedure MainUserSourceStateChange(Sender: TObject);
    procedure BtnUserRentClick(Sender: TObject);
    procedure BtnUserDeleteClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  UDataModule;

procedure TMainForm.BtnCancelClick(Sender: TObject);
begin
  DM.UserTable.Cancel;
end;




procedure TMainForm.BtnUserDeleteClick(Sender: TObject);
begin
  DM.UserTable.Delete;         //�ǰ��� ����� ������// Grid���� ��ȭ ��Ű��ȵ�
end;





procedure TMainForm.BtnUserNewClick(Sender: TObject);
begin
  DM.UserTable.Append;
  edtusercode.SetFocus;
end;







procedure TMainForm.MainUserSourceStateChange(Sender: TObject);
var
  State : TDataSetState;
begin
  State := dm.UserTable.State;

  BtnUserNew.Enabled := (State = dsBrowse);             // Ȱ��ȭ
  BtnUserDelete.Enabled := (State = dsBrowse);          //

  BtnUserRent.Enabled := (State <> dsBrowse);           //
  BtnUserSave.Enabled := (State <> dsBrowse);           // ��Ȱ��ȭ
  BtnCancel.Enabled := (State <> dsBrowse);             //
end;





procedure TMainForm.BtnUserRentClick(Sender: TObject);
begin

  DM.UserTable.Post;               // DBEdit�� Table ������ ������ ����
  DM.UserTable.Refresh;            // �����뿩 259Line ����
end;






procedure TMainForm.BtnUserSaveClick(Sender: TObject);
begin
//  if EdtUserCode.Text and EdtID.Text and EdtPassword.Text
//          and EdtPhone.Text and EdtSchool.Text and EdtUserName.Text = '' then
//      begin
//        DM.UserTable.Post;
//        DM.UserTable.Refresh;
//      end;                             //�űԵ�� > �Է¾��� > ���� = ����


  if EdtUserCode.Text = '' then
  begin
    Showmessage('�ڵ���� �Է¼���.');
    EdtUserName.SetFocus;
    Exit
  end;

  if EdtID.Text = '' then
  begin
    Showmessage('���̵��� �Է¼���.');
    EdtID.SetFocus;
    Exit
  end;

    if EdtPassword.Text = '' then
  begin
    Showmessage('��й�ȣ�� �Է¼���.');
    EdtPassword.SetFocus;
    Exit
  end;

  if EdtPhone.Text = '' then
  begin
    Showmessage('����ó�� �Է¼���.');
    EdtPhone.SetFocus;
    Exit
  end;

  if EdtSchool.Text = '' then
  begin
    Showmessage('�б��� �Է¼���.');
    EdtSchool.SetFocus;
    Exit
  end;

    if EdtUserName.Text = '' then
  begin
    Showmessage('�̸��� �Է¼���.');
    EdtUserName.SetFocus;
    Exit
  end;

  DM.UserTable.Post;
  DM.UserTable.Refresh;

end;

end.
