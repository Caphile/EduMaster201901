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
    TabControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    EdtUserSearch: TEdit;
    Label12: TLabel;
    EdtPrSearch: TEdit;
    Label1: TLabel;
    MainUserSource: TDataSource;
    GrdUser: TDBGrid;
    MainPRSource: TDataSource;
    GridPr: TDBGrid;
    Panel5: TPanel;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    EdtUserID: TDBEdit;
    EdtUserPhone: TDBEdit;
    EdtUserSChool: TDBEdit;
    EdtUserPW: TDBEdit;
    EdtUserName: TDBEdit;
    BtnUserCancel: TButton;
    BtnUserDelete: TButton;
    BtnUserSave: TButton;
    BtnUserNew: TButton;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    GroupBox5: TGroupBox;
    ImgPr: TImage;
    EdtPrName: TDBEdit;
    EdtPrBrand: TDBEdit;
    BtnPrImg: TButton;
    BtnPrNew: TButton;
    BtnPrCancel: TButton;
    BtnPrDelete: TButton;
    BtnPrSave: TButton;
    MemoPr: TDBMemo;
    CBPrCT: TDBComboBox;
    BtnSampleReq: TButton;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    OpenDialog1: TOpenDialog;
    procedure BtnUserNewClick(Sender: TObject);
    procedure BtnUserSaveClick(Sender: TObject);
    procedure BtnUserDeleteClick(Sender: TObject);
    procedure BtnUserCancelClick(Sender: TObject);
    procedure MainUserSourceStateChange(Sender: TObject);
    procedure BtnPrSaveClick(Sender: TObject);
    procedure BtnPrNewClick(Sender: TObject);
    procedure BtnPrimgClick(Sender: TObject);
    procedure MainPRSourceDataChange(Sender: TObject; Field: TField);
    procedure BtnPrDeleteClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure MainPRSourceStateChange(Sender: TObject);
    procedure EdtUserSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnSampleReqClick(Sender: TObject);
    procedure EdtPrSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

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
  UDataModule, CommonFunctions, USampleForm;
  var
  frmsample: Tfrmsample;
procedure TMainForm.BtnUserCancelClick(Sender: TObject); // User���
begin
  DM.UserQuery.Cancel;
end;

procedure TMainForm.BtnCloseClick(Sender: TObject);       // ����
begin
  MainForm.Close;
end;

procedure TMainForm.BtnPrDeleteClick(Sender: TObject);    //PR ���� ����
begin
  if MessageDlg('�����Ͻðڽ��ϱ�?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    try                                                   //PR �������� Ȯ��
      DM.PrQuery.Delete;
    except
      on e: eFDDBengineException do
        if e.Kind = ekobjnotExists then
          showmessage('������ ������ �����ϴ�.')
        else
          showmessage(inttostr(e.Errors[1].ErrorCode));
    end;
end;

procedure TMainForm.BtnPrimgClick(Sender: TObject); // Pr �̹���÷��
var
  Field: TField;
begin
  if OpenDialog1.Execute then
  begin
    LoadImageFromFile(ImgPr, OpenDialog1.FileName);

    Field := DM.PrQuery.FieldByName('Image');
    SaveImageToBlobField(ImgPr, Field as TBlobField);
  end;
end;

procedure TMainForm.BtnPrNewClick(Sender: TObject); // Pr���
begin
  DM.PrQuery.Append;
  EdtPrName.SetFocus;
end;

procedure TMainForm.BtnPrSaveClick(Sender: TObject); // Pr����
begin

  if EdtPrName.Text = '' then                        //NOT NULL ���Է½� �޽���
  begin
    showmessage('��ǰ���� �Է��ϼ���.');
    EdtUserID.SetFocus;
    Exit
  end;

  if EdtPrBrand.Text = '' then
  begin
    showmessage('�귣����� �Է��ϼ���.');
    EdtUserPW.SetFocus;
    Exit
  end;


  DM.PrQuery.Post;
  DM.PrQuery.Refresh;
end;

procedure TMainForm.BtnUserDeleteClick(Sender: TObject); // User����
begin
  if MessageDlg('�����Ͻðڽ��ϱ�?', mtconfirmation, [mbYes, mbNo], 0) = mrYes then
    try                                                  // User �������� Ȯ��
      DM.UserQuery.Delete;
    except
      on e: eFDDBengineException do
        if e.Kind = ekobjnotExists then
          showmessage('������ ������ �����ϴ�.')
        else
          showmessage(inttostr(e.Errors[1].ErrorCode));
    end;
end;

procedure TMainForm.BtnUserNewClick(Sender: TObject);  // User�űԵ��
begin
  DM.UserQuery.Append;
  EdtUserName.SetFocus;
end;

procedure TMainForm.BtnUserSaveClick(Sender: TObject);// User����
begin

  if EdtUserID.Text = '' then                             // NOT NULL ���Է½� �޽���
  begin
    showmessage('���̵��� �Է¼���.');
    EdtUserID.SetFocus;
    Exit
  end;

  if EdtUserPW.Text = '' then
  begin
    showmessage('��й�ȣ�� �Է¼���.');
    EdtUserPW.SetFocus;
    Exit
  end;

  if EdtUserPhone.Text = '' then
  begin
    showmessage('����ó�� �Է¼���.');
    EdtUserPhone.SetFocus;
    Exit
  end;

  if EdtUserSchool.Text = '' then
  begin
    showmessage('�б��� �Է¼���.');
    EdtUserSchool.SetFocus;
    Exit
  end;

  if EdtUserName.Text = '' then
  begin
    showmessage('�̸��� �Է¼���.');
    EdtUserName.SetFocus;
    Exit
  end;

  DM.UserQuery.Post;
  DM.UserQuery.Refresh;

end;





procedure TMainForm.BtnSampleReqClick(Sender: TObject);
begin
  frmsample := TfrmSample.Create(Application);    //��ü����
  frmsample.Show;                                 //��ǰ��ûâ���� Free
end;

procedure TMainForm.EdtPrSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
    Filter : String;
begin
    Filter := '';
    if EdtPrSearch.Text <> '' then
    begin
      Filter := Filter + Format ('PRCODE like ''%%%s%%''', [EdtPrSearch.Text]);
      Filter := Filter + '  or  ';
      Filter := Filter + Format ('PRNAME like ''%%%s%%''', [EdtPrSearch.Text]);
      Filter := Filter + '  or  ';
      Filter := Filter + Format ('BRAND like ''%%%s%%''', [EdtPrSearch.Text]);
      Filter := Filter + '  or  ';
      Filter := Filter + Format ('CT like ''%%%s%%''', [EdtPrSearch.Text]);
    end;

  DM.PrQuery.Filter := Filter;
  DM.PrQuery.Filtered := (Filter <> '');
end;

procedure TMainForm.EdtUserSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
    Filter : String;

begin
    Filter := '';
    if EdtUserSearch.Text <> '' then
    begin
      Filter := Filter + Format ('USERCODE like ''%%%s%%''', [EdtUserSearch.Text]);
      Filter := Filter + '  or  ';
      Filter := Filter + Format ('NAME like ''%%%s%%''', [EdtUserSearch.Text]);
      Filter := Filter + '  or  ';
      Filter := Filter + Format ('SCHOOL like ''%%%s%%''', [EdtUserSearch.Text]);
      Filter := Filter + '  or  ';
      Filter := Filter + Format ('PHONE like ''%%%s%%''', [EdtUserSearch.Text]);
      Filter := Filter + '  or  ';
      Filter := Filter + Format ('ID like ''%%%s%%''', [EdtUserSearch.Text]);
    end;

  DM.UserQuery.Filter := Filter;
  DM.UserQuery.Filtered := (Filter <> '');
end;






procedure TMainForm.MainPRSourceDataChange(Sender: TObject; Field: TField);

var
  LField: TField;                            // Pr �̹������
begin
  if DM.PrQuery.State = dsEdit then
    Exit;

  LField := DM.PrQuery.FieldByName('IMAGE');
  if LField is TBlobField then
    LoadImageFromBlobField(ImgPr, LField as TBlobField);
end;

procedure TMainForm.MainPRSourceStateChange(Sender: TObject);
var
  State: TDataSetState;                       // Pr��ư Ȱ��ȭ,��Ȱ��ȭ
begin
  State := DM.PrQuery.State;

  BtnPrNew.Enabled := (State = dsBrowse);     // Ȱ��ȭ
  BtnPrDelete.Enabled := (State = dsBrowse);  //

  BtnPrSave.Enabled := (State <> dsBrowse);   // ��Ȱ��ȭ
  BtnPrCancel.Enabled := (State <> dsBrowse); //
  BtnPrimg.Enabled := (State <> dsBrowse);    //
end;






procedure TMainForm.MainUserSourceStateChange(Sender: TObject);

var
  State: TDataSetState;                         // User��ư Ȱ��ȭ,��Ȱ��ȭ
begin
  State := DM.UserQuery.State;

  BtnUserNew.Enabled := (State = dsBrowse);     // Ȱ��ȭ
  BtnUserDelete.Enabled := (State = dsBrowse);  //

  BtnUserSave.Enabled := (State <> dsBrowse);   // ��Ȱ��ȭ
  BtnUserCancel.Enabled := (State <> dsBrowse); //
end;

end.
