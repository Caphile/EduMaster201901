unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FireDAC.Stan.Error;

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
    Label2: TLabel;
    EdtID: TDBEdit;
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
    EdtPW: TDBEdit;
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
    Edit1: TEdit;
    Label12: TLabel;
    Edit2: TEdit;
    Label1: TLabel;
    BtnPrSave: TButton;
    BtnUserDelete: TButton;
    BtnCancel: TButton;
    MainUserSource: TDataSource;
    DBGrid1: TDBGrid;
    procedure BtnUserNewClick(Sender: TObject);
    procedure BtnUserSaveClick(Sender: TObject);
    procedure BtnUserRentClick(Sender: TObject);
    procedure BtnUserDeleteClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MainUserSourceStateChange(Sender: TObject);

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
  DM.UserQuery.Cancel;
end;




procedure TMainForm.BtnUserDeleteClick(Sender: TObject);
begin
  if MessageDlg('���� ����?',mtconfirmation,[mbYes,mbNo] ,0) = mrYes then
     try
     DM.UserQuery.Delete;
     except
     on e:eFDDBengineException do
        if e.Kind = ekobjnotExists then
           showmessage('�׷� ������ ����')
        else showmessage(inttostr(e.Errors[1].ErrorCode));


     end;
end;





procedure TMainForm.BtnUserNewClick(Sender: TObject);
begin
  DM.UserQuery.Append;
  EdtUserName.SetFocus;
end;







procedure TMainForm.BtnUserRentClick(Sender: TObject);
begin

  DM.UserQuery.Post;               // DBEdit�� Table ������ ������ ����
  DM.UserQuery.Refresh;            // �����뿩 259Line ����
end;






procedure TMainForm.BtnUserSaveClick(Sender: TObject);
begin
//  if EdtUserCode.Text and EdtID.Text and EdtPassword.Text
//          and EdtPhone.Text and EdtSchool.Text and EdtUserName.Text = '' then
//      begin
//        DM.UserTable.Post;
//        DM.UserTable.Refresh;
//      end;                             //�űԵ�� > �Է¾��� > ���� = ����

  if EdtID.Text = '' then
  begin
    Showmessage('���̵��� �Է¼���.');
    EdtID.SetFocus;
    Exit
  end;

    if EdtPW.Text = '' then
  begin
    Showmessage('��й�ȣ�� �Է¼���.');
    EdtPW.SetFocus;
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

  DM.UserQuery.Post;
  DM.UserQuery.Refresh;

end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
    EdtID.Text := '';
    EdtPW.Text := '';
    EdtPhone.Text := '';
    EdtSchool.Text := '';
    EdtUserName.Text := '';
end;

procedure TMainForm.MainUserSourceStateChange(Sender: TObject);
var
  State : TDataSetState;
begin
  State := dm.UserQuery.State;

  BtnUserNew.Enabled := (State = dsBrowse);             // Ȱ��ȭ
  BtnUserDelete.Enabled := (State = dsBrowse);          //

  BtnUserSave.Enabled := (State <> dsBrowse);           // ��Ȱ��ȭ
  BtnCancel.Enabled := (State <> dsBrowse);             //
end;

end.
