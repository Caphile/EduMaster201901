﻿object frm_cus_list: Tfrm_cus_list
  Left = 0
  Top = 0
  Caption = #44144#47000#52376' '#47532#49828#53944
  ClientHeight = 653
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  DesignSize = (
    965
    653)
  PixelsPerInch = 96
  TextHeight = 13
  object 거래처명: TLabel
    Left = 17
    Top = 64
    Width = 44
    Height = 13
    Caption = #44144#47000#52376#47749
  end
  object lable2: TLabel
    Left = 216
    Top = 64
    Width = 44
    Height = 13
    Caption = #51204#54868#48264#54840
  end
  object Image1: TImage
    Left = 766
    Top = 28
    Width = 132
    Height = 133
  end
  object Edit1: TEdit
    Left = 67
    Top = 61
    Width = 121
    Height = 21
    TabOrder = 0
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 272
    Top = 61
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btn_sp: TButton
    Left = 408
    Top = 58
    Width = 113
    Height = 28
    Caption = #44144#47000#52376' '#46321#47197
    TabOrder = 2
    OnClick = btn_spClick
  end
  object Button1: TButton
    Left = 527
    Top = 58
    Width = 113
    Height = 27
    Caption = #44144#47000#52376' '#49688#51221
    TabOrder = 3
  end
  object Button2: TButton
    Left = 646
    Top = 58
    Width = 114
    Height = 27
    Caption = #44144#47000#52376#49325#51228
    TabOrder = 4
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 184
    Width = 853
    Height = 417
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = customersource
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object customersource: TDataSource
    DataSet = udata.CUSQUERY
    Left = 224
    Top = 136
  end
end
