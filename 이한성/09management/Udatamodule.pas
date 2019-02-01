unit Udatamodule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.IB,
  FireDAC.Phys.IBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tudata = class(TDataModule)
    FDConnection1: TFDConnection;
    CUSQUERY: TFDQuery;
    itemquery: TFDQuery;
    itemqueryITEM_NUMBER: TIntegerField;
    itemqueryITEM_NAME: TWideStringField;
    itemqueryITEM_MAKER: TWideStringField;
    itemqueryITEM_OWNERT: TWideStringField;
    itemqueryITEM_LASTRENT: TWideStringField;
    itemqueryITEM_LASTCUS: TWideStringField;
    itemqueryITEM_BIGO: TWideStringField;
    itemqueryITEM_PHOTO: TBlobField;
    itemqueryItem_category: TStringField;
    rentquery: TFDQuery;
    CUSQUERYCUS_NUMBER: TIntegerField;
    CUSQUERYCUS_NAME: TWideStringField;
    CUSQUERYCUS_CUSNUM: TWideStringField;
    CUSQUERYCUS_EMAIL: TWideStringField;
    CUSQUERYCUS_ADRS: TWideStringField;
    CUSQUERYCUS_PHONE: TWideStringField;
    CUSQUERYCUS_NAME1: TWideStringField;
    CUSQUERYCUS_CARNUM: TWideStringField;
    CUSQUERYCUS_BIGO: TWideStringField;
    CUSQUERYCUS_COPY: TBlobField;
    rent_detquery: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  udata: Tudata;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
