﻿object frm_rent_det_item: Tfrm_rent_det_item
  Left = 0
  Top = 0
  Width = 1092
  Height = 641
  Anchors = [akLeft, akTop, akRight, akBottom]
  AutoScroll = True
  Caption = #51204#54364#51089#49457' - '#44277#44396#49440#53469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnDblClick = DBGrid1DblClick
  DesignSize = (
    1076
    602)
  PixelsPerInch = 96
  TextHeight = 13
  object 공구명: TLabel
    Left = 56
    Top = 75
    Width = 33
    Height = 13
    Caption = #44277#44396#47749
  end
  object 공구번호: TLabel
    Left = 56
    Top = 131
    Width = 44
    Height = 13
    Caption = #44277#44396#48264#54840
  end
  object Button1: TButton
    Left = 384
    Top = 70
    Width = 75
    Height = 25
    Caption = #44160#49353
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 168
    Width = 986
    Height = 389
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Edit1: TEdit
    Left = 136
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 136
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Button2: TButton
    Left = 744
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 4
  end
  object DataSource1: TDataSource
    DataSet = udata.itemquery
    Left = 424
    Top = 112
  end
end
