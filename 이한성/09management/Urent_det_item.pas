unit Urent_det_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls;

type
  Tfrm_rent_det_item = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    ������: TLabel;
    ������ȣ: TLabel;
    DataSource1: TDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    var
    rent_det_item :integer;
    iname : string;
  end;

var
  frm_rent_det_item: Tfrm_rent_det_item;

implementation

{$R *.dfm}

uses Udatamodule, urent_det, Urent_det_cus, Urent;

procedure Tfrm_rent_det_item.DBGrid1DblClick(Sender: TObject);
begin
  rent_det_item := DataSource1.DataSet.FieldByName('ITEM_NUMBER').Asinteger;
 close;

end;

procedure Tfrm_rent_det_item.Edit1Change(Sender: TObject);
begin
  Udata.itemquery.IndexFieldNames := 'Item_name';
  Udata.itemquery.findnearest([edit1.Text]);
end;

procedure Tfrm_rent_det_item.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := cafree;
end;

end.
