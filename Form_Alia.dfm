object fmAlia: TfmAlia
  Left = 609
  Top = 400
  Width = 630
  Height = 540
  Caption = 'Alia'
  Color = clBtnFace
  Constraints.MinHeight = 540
  Constraints.MinWidth = 630
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object SplitTabsPages: TSplitter
    Left = 0
    Top = 262
    Width = 622
    Height = 3
    Cursor = crVSplit
    Align = alTop
    MinSize = 220
    ResizeStyle = rsUpdate
  end
  object tbTop: TToolBar
    Left = 0
    Top = 0
    Width = 622
    Height = 22
    AutoSize = True
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = imgIcons
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    object tbtNew: TToolButton
      Left = 0
      Top = 0
      Action = actNew
    end
    object tbtOpen: TToolButton
      Left = 23
      Top = 0
      Action = actOpen
    end
    object tbtClose: TToolButton
      Left = 46
      Top = 0
      Action = actClose
    end
    object tbtSaveAs: TToolButton
      Left = 69
      Top = 0
      Action = actSaveAs
    end
    object tbtSaveAll: TToolButton
      Left = 92
      Top = 0
      Action = actSaveAll
    end
    object tbtSep1: TToolButton
      Left = 115
      Top = 0
      Width = 8
      Caption = 'tbtSep1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object tbtOptions: TToolButton
      Left = 123
      Top = 0
      Action = actOptions
    end
  end
  object pnTrees: TPanel
    Left = 0
    Top = 22
    Width = 622
    Height = 240
    Align = alTop
    BevelOuter = bvNone
    Constraints.MinHeight = 240
    Constraints.MinWidth = 400
    TabOrder = 1
    object SplitTrees: TSplitter
      Left = 200
      Top = 0
      Height = 240
      MinSize = 200
      ResizeStyle = rsUpdate
    end
    object vtFiles: TVirtualStringTree
      Left = 0
      Top = 0
      Width = 200
      Height = 240
      Align = alLeft
      Color = clWhite
      Constraints.MinWidth = 175
      Header.AutoSizeIndex = 1
      Header.Font.Charset = DEFAULT_CHARSET
      Header.Font.Color = clWindowText
      Header.Font.Height = -11
      Header.Font.Name = 'MS Sans Serif'
      Header.Font.Style = []
      Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoVisible]
      Header.Style = hsXPStyle
      Images = imgFiles
      Indent = 10
      LineMode = lmBands
      ParentBackground = False
      TabOrder = 0
      TreeOptions.AutoOptions = [toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes]
      TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowRoot, toShowTreeLines, toThemeAware, toGhostedIfUnfocused]
      TreeOptions.SelectionOptions = [toRightClickSelect]
      OnChange = vtFilesChange
      OnFreeNode = vtFilesFreeNode
      OnGetText = vtFilesGetText
      OnPaintText = vtFilesPaintText
      OnGetImageIndex = vtFilesGetImageIndex
      OnKeyPress = vtFilesKeyPress
      Columns = <
        item
          Position = 0
          Width = 120
          WideText = 'Resource'
        end
        item
          Position = 1
          Width = 76
          WideText = 'Handle'
        end>
    end
    object pnRes: TPanel
      Left = 203
      Top = 0
      Width = 419
      Height = 240
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ResTabs: TTabControl
        Left = 0
        Top = 0
        Width = 419
        Height = 240
        Align = alClient
        Constraints.MinWidth = 200
        MultiLine = True
        TabOrder = 0
        TabStop = False
        OnChange = ResTabsChange
        object vtGff: TVirtualStringTree
          Left = 4
          Top = 6
          Width = 411
          Height = 230
          Align = alClient
          Header.AutoSizeIndex = 2
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoVisible]
          Header.Style = hsXPStyle
          LineMode = lmBands
          ParentBackground = True
          PopupMenu = popTree
          TabOrder = 0
          TabStop = False
          TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toThemeAware]
          TreeOptions.SelectionOptions = [toRightClickSelect]
          OnBeforeItemErase = vtGffBeforeItemErase
          OnChange = vtGffChange
          OnExpanded = vtGffExpanded
          OnGetText = vtGffGetText
          OnInitChildren = vtGffInitChildren
          OnInitNode = vtGffInitNode
          OnKeyDown = vtGffKeyDown
          OnKeyPress = vtGffKeyPress
          Columns = <
            item
              Position = 0
              Width = 150
              WideText = 'Name'
            end
            item
              Position = 1
              Width = 75
              WideText = 'Type'
            end
            item
              Position = 2
              Width = 182
              WideText = 'Value'
            end>
        end
        object vtErf: TVirtualStringTree
          Left = 4
          Top = 6
          Width = 411
          Height = 230
          Align = alClient
          Header.AutoSizeIndex = 0
          Header.Font.Charset = DEFAULT_CHARSET
          Header.Font.Color = clWindowText
          Header.Font.Height = -11
          Header.Font.Name = 'MS Sans Serif'
          Header.Font.Style = []
          Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoVisible]
          Header.Style = hsXPStyle
          LineMode = lmBands
          ParentBackground = True
          TabOrder = 1
          TabStop = False
          TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
          TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowTreeLines, toThemeAware]
          TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
          OnBeforeItemErase = vtErfBeforeItemErase
          OnChange = vtErfChange
          OnDblClick = vtErfDblClick
          OnGetText = vtErfGetText
          OnInitNode = vtErfInitNode
          OnKeyDown = vtErfKeyDown
          OnKeyPress = vtErfKeyPress
          Columns = <
            item
              Position = 0
              Width = 232
              WideText = 'Name'
            end
            item
              Position = 1
              Width = 100
              WideText = 'Type'
            end
            item
              Position = 2
              Width = 75
              WideText = 'Size'
            end>
        end
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 494
    Width = 622
    Height = 19
    Panels = <>
    SimplePanel = True
    OnClick = StatusBarClick
  end
  object pnPages: TPanel
    Left = 0
    Top = 265
    Width = 622
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    Constraints.MinHeight = 200
    TabOrder = 3
    object pcPages: TPageControl
      Left = 0
      Top = 0
      Width = 622
      Height = 229
      ActivePage = tsScript
      Align = alClient
      TabOrder = 0
      TabPosition = tpBottom
      object tsData: TTabSheet
        Caption = 'Data'
        OnShow = tsDataShow
        object SplitValueOptions: TSplitter
          Left = 300
          Top = 0
          Height = 203
          Beveled = True
          MinSize = 300
          ResizeStyle = rsUpdate
        end
        object pnOptions: TPanel
          Left = 303
          Top = 0
          Width = 311
          Height = 203
          Align = alClient
          BevelOuter = bvNone
          Constraints.MinHeight = 200
          Constraints.MinWidth = 300
          TabOrder = 0
          object pcOptions: TPageControl
            Left = 0
            Top = 0
            Width = 311
            Height = 203
            ActivePage = tsLocStringOptions
            Align = alClient
            Style = tsButtons
            TabOrder = 0
            object tsBlankOptions: TTabSheet
              Caption = 'tsBlankOptions'
              TabVisible = False
            end
            object tsIntegralOptions: TTabSheet
              Caption = 'tsIntegralOptions'
              ImageIndex = 2
              TabVisible = False
              DesignSize = (
                303
                193)
              object lb2DAassoc: TLabel
                Left = 8
                Top = 16
                Width = 62
                Height = 13
                Caption = 'Associations:'
              end
              object bt2DAfind: TButton
                Left = 216
                Top = 8
                Width = 81
                Height = 25
                Caption = '2DA Lookup'
                Enabled = False
                TabOrder = 0
              end
              object cb2DAtype: TComboBox
                Left = 8
                Top = 40
                Width = 289
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 0
                TabOrder = 1
              end
              object cb2DAval: TComboBox
                Left = 8
                Top = 72
                Width = 289
                Height = 21
                Style = csDropDownList
                Anchors = [akLeft, akTop, akRight]
                ItemHeight = 0
                TabOrder = 2
              end
              object pnDWstrref: TPanel
                Left = 0
                Top = 96
                Width = 303
                Height = 97
                Anchors = [akLeft, akTop, akRight, akBottom]
                BevelOuter = bvNone
                TabOrder = 3
                DesignSize = (
                  303
                  97)
                object lbDWstrref: TLabel
                  Left = 8
                  Top = 8
                  Width = 101
                  Height = 13
                  Caption = 'StrRef of this DWord:'
                end
                object meDWstrref: TMemo
                  Left = 8
                  Top = 24
                  Width = 289
                  Height = 65
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Color = clInfoBk
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
            object tsRealOptions: TTabSheet
              Caption = 'tsRealOptions'
              ImageIndex = 3
              TabVisible = False
              DesignSize = (
                303
                193)
              object lbRealAs: TLabel
                Left = 8
                Top = 8
                Width = 62
                Height = 13
                Caption = 'Actual value:'
              end
              object lbMantissa: TLabel
                Left = 144
                Top = 88
                Width = 45
                Height = 13
                Caption = 'Mantissa:'
              end
              object lbExponent: TLabel
                Left = 56
                Top = 88
                Width = 48
                Height = 13
                Caption = 'Exponent:'
              end
              object lbSign: TLabel
                Left = 8
                Top = 88
                Width = 24
                Height = 13
                Caption = 'Sign:'
              end
              object lbRealForm: TLabel
                Left = 8
                Top = 152
                Width = 40
                Height = 13
                Caption = 'Formula:'
              end
              object edRealAs: TEdit
                Left = 8
                Top = 32
                Width = 289
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 0
              end
              object edMantissa: TEdit
                Left = 144
                Top = 112
                Width = 121
                Height = 21
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 1
              end
              object edExponent: TEdit
                Left = 56
                Top = 112
                Width = 73
                Height = 21
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 2
              end
              object rbRealHex: TRadioButton
                Left = 8
                Top = 56
                Width = 73
                Height = 17
                Caption = 'As hex'
                Checked = True
                TabOrder = 3
                TabStop = True
                OnClick = rbRealAsClick
              end
              object rbRealBinary: TRadioButton
                Left = 88
                Top = 56
                Width = 73
                Height = 17
                Caption = 'As binary'
                TabOrder = 4
                OnClick = rbRealAsClick
              end
              object edSign: TEdit
                Left = 8
                Top = 112
                Width = 33
                Height = 21
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 5
              end
            end
            object tsStringOptions: TTabSheet
              Caption = 'tsStringOptions'
              ImageIndex = 4
              TabVisible = False
            end
            object tsResRefOptions: TTabSheet
              Caption = 'tsResRefOptions'
              ImageIndex = 5
              TabVisible = False
            end
            object tsLocStringOptions: TTabSheet
              Caption = 'tsLocStringOptions'
              ImageIndex = 1
              TabVisible = False
              object lbLang: TLabel
                Left = 8
                Top = 8
                Width = 51
                Height = 13
                Caption = 'Language:'
              end
              object lbStrRef: TLabel
                Left = 8
                Top = 56
                Width = 47
                Height = 13
                Caption = 'StringRef:'
              end
              object rbMale: TRadioButton
                Tag = 8
                Left = 168
                Top = 12
                Width = 113
                Height = 17
                Caption = 'Male'
                Checked = True
                TabOrder = 0
                TabStop = True
                OnClick = ctrlChange
              end
              object rbFemale: TRadioButton
                Tag = 9
                Left = 168
                Top = 28
                Width = 113
                Height = 17
                Caption = 'Female'
                TabOrder = 1
                OnClick = ctrlChange
              end
              object cbLang: TComboBox
                Tag = 7
                Left = 8
                Top = 24
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemHeight = 0
                TabOrder = 2
                OnChange = ctrlChange
              end
              object edStrRef: TEdit
                Tag = 10
                Left = 8
                Top = 72
                Width = 121
                Height = 21
                TabOrder = 3
                OnChange = ctrlChange
              end
              object ckAltTlk: TCheckBox
                Tag = 11
                Left = 144
                Top = 72
                Width = 97
                Height = 17
                Caption = 'In Custom TLK'
                TabOrder = 4
                OnClick = ctrlChange
              end
              object btNewStrRef: TButton
                Left = 8
                Top = 112
                Width = 75
                Height = 25
                Caption = 'New StrRef'
                TabOrder = 5
                OnClick = btNewStrRefClick
              end
              object btEditStrRef: TButton
                Left = 104
                Top = 112
                Width = 75
                Height = 25
                Caption = 'Edit StrRef'
                TabOrder = 6
                OnClick = btEditStrRefClick
              end
            end
            object tsVoidOptions: TTabSheet
              Caption = 'tsVoidOptions'
              ImageIndex = 6
              TabVisible = False
              object lbVoidLen: TLabel
                Left = 4
                Top = 0
                Width = 36
                Height = 13
                Caption = 'Length:'
              end
              object lbVoidPos: TLabel
                Left = 112
                Top = 0
                Width = 21
                Height = 13
                Caption = 'Pos:'
              end
              object lbVoid8bit: TLabel
                Left = 160
                Top = 0
                Width = 24
                Height = 13
                Caption = '8-Bit:'
              end
              object lbVoid32bit: TLabel
                Left = 200
                Top = 0
                Width = 30
                Height = 13
                Caption = '32-Bit:'
              end
              object edVoidLen: TEdit
                Tag = 1
                Left = 4
                Top = 16
                Width = 41
                Height = 21
                TabOrder = 0
              end
              object btVoidLen: TButton
                Tag = 3
                Left = 56
                Top = 16
                Width = 41
                Height = 20
                Caption = 'Set'
                TabOrder = 1
              end
              object edVoidPos: TEdit
                Tag = 1
                Left = 112
                Top = 16
                Width = 41
                Height = 21
                Color = clBtnFace
                ReadOnly = True
                TabOrder = 2
              end
              object edVoid8bit: TEdit
                Left = 160
                Top = 16
                Width = 33
                Height = 21
                TabOrder = 3
              end
              object edVoid32bit: TEdit
                Left = 200
                Top = 16
                Width = 73
                Height = 21
                TabOrder = 4
              end
            end
            object tsStructOptions: TTabSheet
              Caption = 'tsStructOptions'
              ImageIndex = 7
              TabVisible = False
            end
            object tsListOptions: TTabSheet
              Caption = 'tsListOptions'
              ImageIndex = 8
              TabVisible = False
            end
          end
        end
        object pnValue: TPanel
          Left = 0
          Top = 0
          Width = 300
          Height = 203
          Align = alLeft
          BevelOuter = bvNone
          Constraints.MinHeight = 200
          Constraints.MinWidth = 300
          TabOrder = 1
          OnResize = pnValueResize
          object lbName: TLabel
            Left = 8
            Top = 8
            Width = 51
            Height = 13
            Caption = 'Name / Id:'
          end
          object lbLabelIndex: TLabel
            Left = 240
            Top = 8
            Width = 46
            Height = 13
            Caption = 'Lbl Index:'
          end
          object lbType: TLabel
            Left = 144
            Top = 8
            Width = 27
            Height = 13
            Caption = 'Type:'
          end
          object pcValue: TPageControl
            Left = 0
            Top = 64
            Width = 300
            Height = 139
            ActivePage = tsStructValue
            Align = alBottom
            Anchors = [akLeft, akTop, akRight, akBottom]
            Style = tsButtons
            TabOrder = 3
            object tsBlankValue: TTabSheet
              Caption = 'tsBlankValue'
              ImageIndex = 4
              TabVisible = False
            end
            object tsNumericValue: TTabSheet
              Caption = 'tsNumericValue'
              TabVisible = False
              object lbIntValue: TLabel
                Left = 4
                Top = 0
                Width = 30
                Height = 13
                Caption = 'Value:'
              end
              object lbIntBounds: TLabel
                Left = 4
                Top = 64
                Width = 241
                Height = 33
                AutoSize = False
                Caption = 'lbIntBounds'
                WordWrap = True
              end
              object edIntValue: TEdit
                Tag = 2
                Left = 4
                Top = 24
                Width = 128
                Height = 21
                TabOrder = 0
                OnChange = ctrlChange
              end
            end
            object tsStringValue: TTabSheet
              Caption = 'tsStringValue'
              ImageIndex = 1
              TabVisible = False
              DesignSize = (
                292
                129)
              object lbStrValue: TLabel
                Left = 4
                Top = 0
                Width = 24
                Height = 13
                Caption = 'Text:'
              end
              object meText: TMemo
                Tag = 3
                Left = 4
                Top = 24
                Width = 281
                Height = 97
                Anchors = [akLeft, akTop, akRight, akBottom]
                ScrollBars = ssVertical
                TabOrder = 0
                OnChange = ctrlChange
              end
            end
            object tsResRefValue: TTabSheet
              Caption = 'tsResRefValue'
              ImageIndex = 2
              TabVisible = False
              object lbResRefValue: TLabel
                Left = 4
                Top = 0
                Width = 39
                Height = 13
                Caption = 'ResRef:'
              end
              object lbResRefBounds: TLabel
                Left = 208
                Top = 28
                Width = 70
                Height = 13
                Caption = '(Max 16 chars)'
              end
              object edResRefValue: TEdit
                Tag = 4
                Left = 4
                Top = 24
                Width = 184
                Height = 21
                MaxLength = 16
                TabOrder = 0
                OnChange = ctrlChange
              end
            end
            object tsVoidValue: TTabSheet
              Caption = 'tsVoidValue'
              ImageIndex = 3
              TabVisible = False
              DesignSize = (
                292
                129)
              object sgVoid: TStringGrid
                Tag = 5
                Left = 4
                Top = 8
                Width = 275
                Height = 112
                Anchors = [akLeft, akTop, akRight, akBottom]
                ColCount = 14
                DefaultColWidth = 17
                DefaultRowHeight = 17
                FixedCols = 0
                RowCount = 12
                FixedRows = 0
                Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected]
                ScrollBars = ssVertical
                TabOrder = 0
                OnKeyPress = sgVoidKeyPress
                OnSelectCell = sgVoidSelectCell
              end
            end
            object tsStructValue: TTabSheet
              Caption = 'tsStructValue'
              ImageIndex = 5
              TabVisible = False
              object lbStructId: TLabel
                Left = 4
                Top = 0
                Width = 43
                Height = 13
                Caption = 'Struct Id:'
              end
              object edStructId: TEdit
                Tag = 6
                Left = 4
                Top = 24
                Width = 128
                Height = 21
                TabOrder = 0
                OnChange = ctrlChange
              end
            end
          end
          object edName: TEdit
            Tag = 1
            Left = 8
            Top = 32
            Width = 128
            Height = 21
            MaxLength = 16
            TabOrder = 0
            OnChange = ctrlChange
            OnKeyDown = edNameKeyDown
          end
          object edLabelIndex: TEdit
            Left = 240
            Top = 32
            Width = 48
            Height = 21
            TabStop = False
            Color = clBtnFace
            ReadOnly = True
            TabOrder = 2
          end
          object cbType: TComboBox
            Tag = 12
            Left = 144
            Top = 32
            Width = 88
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            OnChange = ctrlChange
            Items.Strings = (
              'Byte'
              'Char'
              'Word'
              'Short'
              'DWord'
              'Int'
              'DWord64'
              'Int64'
              'Float'
              'Double'
              'String'
              'ResRef'
              'LocString'
              'Void'
              'Struct'
              'List')
          end
        end
      end
      object tsRes: TTabSheet
        Caption = 'Resource'
        ImageIndex = 4
        OnShow = tsResShow
        DesignSize = (
          614
          203)
        object lbSig: TLabel
          Left = 8
          Top = 16
          Width = 48
          Height = 13
          Caption = 'Signature:'
        end
        object lbHeader: TLabel
          Left = 8
          Top = 72
          Width = 38
          Height = 13
          Caption = 'Header:'
        end
        object lbRaw: TLabel
          Left = 400
          Top = 16
          Width = 51
          Height = 13
          Caption = 'Raw View:'
        end
        object edSig: TEdit
          Left = 8
          Top = 40
          Width = 49
          Height = 21
          MaxLength = 4
          TabOrder = 0
        end
        object edVer: TEdit
          Left = 64
          Top = 40
          Width = 49
          Height = 21
          MaxLength = 4
          TabOrder = 1
        end
        object pcRes: TPageControl
          Left = 200
          Top = 0
          Width = 193
          Height = 203
          ActivePage = tsErf
          Anchors = [akLeft, akTop, akBottom]
          Style = tsButtons
          TabOrder = 2
          object tsGff: TTabSheet
            Caption = 'tsGff'
            TabVisible = False
            DesignSize = (
              185
              193)
            object lbLabelArray: TLabel
              Left = 8
              Top = 8
              Width = 56
              Height = 13
              Caption = 'Label Array:'
            end
            object btEditLabels: TButton
              Left = 88
              Top = 4
              Width = 75
              Height = 25
              Caption = 'Edit'
              Enabled = False
              TabOrder = 0
            end
            object pnLabels: TPanel
              Left = 8
              Top = 40
              Width = 169
              Height = 137
              Anchors = [akLeft, akTop, akBottom]
              BevelOuter = bvNone
              TabOrder = 1
              object sgLabels: TStringGrid
                Left = 0
                Top = 0
                Width = 169
                Height = 137
                Align = alClient
                Color = clBtnFace
                ColCount = 1
                DefaultColWidth = 168
                Enabled = False
                FixedCols = 0
                RowCount = 1
                FixedRows = 0
                ScrollBars = ssVertical
                TabOrder = 0
                RowHeights = (
                  24)
              end
            end
          end
          object tsErf: TTabSheet
            Caption = 'tsErf'
            ImageIndex = 1
            TabVisible = False
            DesignSize = (
              185
              193)
            object lbErfDesc: TLabel
              Left = 8
              Top = 8
              Width = 56
              Height = 13
              Caption = 'Description:'
            end
            object cbErfDesc: TComboBox
              Left = 8
              Top = 32
              Width = 169
              Height = 21
              Style = csDropDownList
              ItemHeight = 0
              TabOrder = 0
            end
            object meErfDesc: TMemo
              Left = 8
              Top = 64
              Width = 169
              Height = 113
              Anchors = [akLeft, akTop, akBottom]
              TabOrder = 1
            end
          end
          object tsBif: TTabSheet
            Caption = 'tsBif'
            ImageIndex = 2
            TabVisible = False
          end
        end
        object pnHeader: TPanel
          Left = 8
          Top = 96
          Width = 185
          Height = 89
          Anchors = [akLeft, akTop, akBottom]
          BevelOuter = bvNone
          TabOrder = 3
          object meHeader: TMemo
            Left = 0
            Top = 0
            Width = 185
            Height = 89
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object pnRaw: TPanel
          Left = 400
          Top = 48
          Width = 200
          Height = 137
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          TabOrder = 4
          object vtRaw: TVirtualStringTree
            Left = 0
            Top = 0
            Width = 200
            Height = 137
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            Header.AutoSizeIndex = 1
            Header.Font.Charset = DEFAULT_CHARSET
            Header.Font.Color = clWindowText
            Header.Font.Height = -11
            Header.Font.Name = 'MS Sans Serif'
            Header.Font.Style = []
            Header.Options = [hoAutoResize, hoColumnResize, hoDrag, hoVisible]
            Header.Style = hsXPStyle
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            TreeOptions.MiscOptions = [toFullRepaintOnResize, toInitOnSave, toToggleOnDblClick, toWheelPanning]
            OnGetText = vtRawGetText
            OnInitChildren = vtRawInitChildren
            OnInitNode = vtRawInitNode
            Columns = <
              item
                Position = 0
                Width = 125
                WideText = 'Field'
              end
              item
                Position = 1
                Width = 75
                WideText = 'Value'
              end>
          end
        end
      end
      object tsScript: TTabSheet
        Caption = 'Script'
        ImageIndex = 3
        OnShow = tsScriptShow
        object meScript: TMemo
          Left = 0
          Top = 0
          Width = 614
          Height = 203
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
          OnKeyDown = meScriptKeyDown
          OnKeyPress = meScriptKeyPress
        end
      end
      object tsSearch: TTabSheet
        Caption = 'Search'
        ImageIndex = 2
      end
    end
  end
  object imgIcons: TImageList
    Left = 582
    Top = 6
    Bitmap = {
      494C01011A001D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000008000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300636363007321
      0000BD39000073210000BD39000073210000BD39000073210000BD3900007321
      0000BD3900006363630063636300000000000000000063636300636363007321
      0000BD39000073210000BD39000073210000BD39000073210000BD3900007321
      0000BD3900006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF520000DE4A
      0000DE4A0000DE4A0000DE4A0000DE4A0000FF520000DE4A0000FF520000DE4A
      0000FF5200007321000063636300000000000000000063636300FF520000DE4A
      0000DE4A0000DE4A000052180000DE4A0000FF520000DE4A0000FF520000DE4A
      0000FF5200007321000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF520000DE4A
      0000DE4A0000DE4A00007321000073210000DE4A0000DE4A0000DE4A0000DE4A
      0000DE4A0000BD39000063636300000000000000000063636300FF520000DE4A
      0000DE4A0000DE4A00005218000052180000DE4A0000DE4A0000DE4A0000DE4A
      0000DE4A0000BD39000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF734A00DE4A
      0000732100007321000000FF000000FF000073210000DE4A0000DE4A0000DE4A
      0000DE4A00007321000063636300000000000000000063636300FF734A00DE4A
      0000DE4A0000DE4A00005218000000FF000052180000DE4A0000DE4A0000DE4A
      0000DE4A00007321000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF5200007321
      000000FF000000FF000000FF000000FF000000FF000073210000DE4A0000DE4A
      0000DE4A0000BD39000063636300000000000000000063636300FF520000DE4A
      0000DE4A0000DE4A00005218000000FF000000FF000052180000DE4A0000DE4A
      0000DE4A0000BD39000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF734A00FF52
      00007321000000FF000000FF000000FF000000FF000000FF000073210000DE4A
      0000DE4A00007321000063636300000000000000000063636300FF734A00DE4A
      0000FF520000DE4A00005218000000FF000000FF000000FF000052180000DE4A
      0000DE4A00007321000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF520000FF52
      0000FF52000073210000732100007321000000FF000000FF000000FF00007321
      0000DE4A0000BD39000063636300000000000000000063636300FF520000FF52
      0000FF520000DE4A00005218000000FF000000FF000052180000DE4A0000DE4A
      0000DE4A0000BD39000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF734A00FF52
      0000FF520000FF520000DE4A0000DE4A00007321000000FF000000FF000000FF
      0000732100007321000063636300000000000000000063636300FF734A00FF52
      0000FF520000FF5200005218000000FF000052180000FF520000FF520000FF52
      0000DE4A00007321000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF734A00FF73
      4A00FF734A00FF520000FF520000FF520000FF5200007321000000FF00007321
      0000FF520000BD39000063636300000000000000000063636300FF734A00FF73
      4A00FF734A00FF5200005218000052180000FF520000FF520000FF520000FF52
      0000FF520000BD39000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF734A00FF73
      4A00FF734A00FF520000FF520000FF520000FF520000FF52000073210000FF52
      0000DE4A00007321000063636300000000000000000063636300FF734A00FF73
      4A00FF734A00FF52000052180000FF520000FF520000FF520000FF520000FF52
      0000DE4A00007321000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300FF734A00FFAD
      8C00FF734A00FF734A00FF734A00FF734A00FF734A00FF520000FF734A00FF52
      0000FF734A00BD39000063636300000000000000000063636300FF734A00FFAD
      8C00FF734A00FF734A00FF734A00FF734A00FF734A00FF520000FF734A00FF52
      0000FF734A00BD39000063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006363630063636300FF73
      4A00FF734A00FF734A00FF734A00FF734A00FF734A00FF734A00FF734A00FF73
      4A00FF734A00636363006363630000000000000000006363630063636300FF73
      4A00FF734A00FF734A00FF734A00FF734A00FF734A00FF734A00FF734A00FF73
      4A00FF734A006363630063636300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096000000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D4009600000000000000000000000000000062626200C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D4006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000096000000FFB1C700960000000000
      000096000000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4009600
      00000000000096000000FFB1C7009600000000000000FF8EAB00000000006262
      6200C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D4006262620000000000FF8EAB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      630063636300636363000000000000000000C8D0D40096000000FFB1C700FF8E
      AB00FF8EAB0096000000C8D0D400C8D0D400C8D0D400C8D0D40096000000FF8E
      AB00FF8EAB00FFB1C70096000000C8D0D4006262620000000000FF8EAB000000
      000062626200C8D0D40062626200C8D0D400C8D0D40062626200C8D0D4006262
      620000000000FF8EAB0000000000626262000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300636363007321
      0000BD39000073210000BD39000073210000BD39000073210000BD3900007321
      0000BD390000636363006363630000000000C8D0D40000000000FF8EAB00FFB1
      C70096000000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4009600
      0000FFB1C700FF8EAB0000000000C8D0D400C8D0D4006262620000000000FF8E
      AB00000000006262620096000000626262006262620096000000626262000000
      0000FF8EAB000000000062626200C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      0000000000000000000000000000000000000000000063636300FF520000DE4A
      0000DE4A0000DE4A0000DE4A0000DE4A0000FF520000DE4A0000FF520000DE4A
      0000FF520000732100006363630000000000C8D0D40096000000FF8EAB009600
      0000FF8EAB0096000000C8D0D400C8D0D400C8D0D400C8D0D40096000000FF8E
      AB0096000000FF8EAB0096000000C8D0D400C8D0D400C8D0D400626262000000
      0000FF8EAB0096000000FF8EAB009600000096000000FF8EAB0096000000FF8E
      AB000000000062626200C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000084000000
      8400000000000000000000000000000000000000000063636300FF520000DE4A
      0000DE4A0000DE4A0000DE4A0000DE4A0000DE4A0000DE4A0000DE4A0000DE4A
      0000DE4A0000BD3900006363630000000000C8D0D400C8D0D40096000000C8D0
      D40096000000FF8EAB0096000000C8D0D400C8D0D40096000000FF8EAB009600
      0000C8D0D40096000000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4006262
      620096000000FFB1C700FF8EAB000000000000000000FF8EAB00FFB1C7009600
      000062626200C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      8400000084000000000000000000000000000000000063636300732100007321
      0000DE4A0000DE4A0000DE4A000073210000732100007321000073210000DE4A
      0000DE4A0000732100006363630000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400960000009600000096000000960000009600000096000000C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400626262009600
      0000FF8EAB00FF8EAB00FFB1C7009600000096000000FFB1C700FF8EAB00FF8E
      AB009600000062626200C8D0D400C8D0D400000000000000FF00000084000000
      84000000840000008400000084000000840000008400000084000000FF000000
      FF000000840000008400000000000000000000000000636363007321000000FF
      000073210000DE4A00007321000000FF000000FF000000FF000000FF00007321
      0000DE4A0000BD3900006363630000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D40096000000FF8EAB00FF8EAB0096000000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4006262
      6200960000000000000096000000FFB1C700FFB1C70096000000000000009600
      000062626200C8D0D400C8D0D400C8D0D400000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00000084000000000000000000636363007321000000FF
      000000FF00007321000000FF000000FF0000732100007321000000FF000000FF
      000073210000732100006363630000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D40096000000FF8EAB00FF8EAB0096000000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4006262
      6200960000000000000096000000FFB1C700FFB1C70096000000000000009600
      000062626200C8D0D400C8D0D400C8D0D400000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000063636300FF5200007321
      000000FF000000FF000000FF000073210000DE4A0000DE4A00007321000000FF
      000073210000BD3900006363630000000000C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400960000009600000096000000960000009600000096000000C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400626262009600
      0000FF8EAB00FF8EAB00FFB1C7009600000096000000FFB1C700FF8EAB00FF8E
      AB009600000062626200C8D0D400C8D0D400000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF0000000000000000000000000063636300FF734A00FF52
      0000732100007321000073210000FF520000FF520000FF520000FF5200007321
      000073210000732100006363630000000000C8D0D400C8D0D40096000000C8D0
      D40096000000FF8EAB0096000000C8D0D400C8D0D40096000000FF8EAB009600
      0000C8D0D40096000000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4006262
      620096000000FFB1C700FF8EAB000000000000000000FF8EAB00FFB1C7009600
      000062626200C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000063636300FF734A00FF73
      4A00FF734A00FF520000FF520000FF520000FF520000FF520000FF520000FF52
      0000FF520000BD3900006363630000000000C8D0D40096000000FF8EAB009600
      0000FF8EAB0096000000C8D0D400C8D0D400C8D0D400C8D0D40096000000FF8E
      AB0096000000FF8EAB0096000000C8D0D400C8D0D400C8D0D400626262009600
      0000FF8EAB0096000000FF8EAB009600000096000000FF8EAB0096000000FF8E
      AB009600000062626200C8D0D400C8D0D4000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF00000000000000000000000000000000000000000063636300FF734A00FF73
      4A00FF734A00FF520000FF520000FF520000FF520000FF520000FF520000FF52
      0000DE4A0000732100006363630000000000C8D0D40000000000FF8EAB00FFB1
      C70096000000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4009600
      0000FFB1C700FF8EAB0000000000C8D0D400C8D0D4006262620096000000FF8E
      AB00960000006262620096000000626262006262620096000000626262009600
      0000FF8EAB009600000062626200626262000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      0000000000000000000000000000000000000000000063636300FF734A00FFAD
      8C00FF734A00FF734A00FF734A00FF734A00FF734A00FF520000FF734A00FF52
      0000FF734A00BD3900006363630000000000C8D0D40096000000FFB1C700FF8E
      AB00FF8EAB0096000000C8D0D400C8D0D400C8D0D400C8D0D40096000000FF8E
      AB00FF8EAB00FFB1C70096000000C8D0D4006262620000000000FF8EAB009600
      000062626200C8D0D40062626200C8D0D400C8D0D40062626200C8D0D4006262
      620096000000FF8EAB0000000000C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006363630063636300FF73
      4A00FF734A00FF734A00FF734A00FF734A00FF734A00FF734A00FF734A00FF73
      4A00FF734A0063636300636363000000000096000000FFB1C700960000000000
      000096000000C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D4009600
      00000000000096000000FFB1C7009600000000000000FF8EAB00000000006262
      6200C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D4006262620000000000FF8EAB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000636363006363
      6300636363006363630063636300636363006363630063636300636363006363
      6300636363006363630000000000000000000000000096000000C8D0D400C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D400C8D0D4009600000000000000000000000000000062626200C8D0
      D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0D400C8D0
      D400C8D0D4006262620000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A000000000000000000000000004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A00000000000000000000000000000000000E0E0E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A009E9E9E007A7A7A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A009E9E9E007A7A7A004A4A4A0000000000000000004A4A4A008ED4FF00D4F0
      FF00D4F0FF008ED4FF00D4F0FF008ED4FF008ED4FF00D4F0FF00007AB9004A4A
      4A007A7A7A007A7A7A004A4A4A0000000000000000000E0E0E000000FF000E0E
      0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E0000000000000000004A4A
      4A009E9E9E007A7A7A004A4A4A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A007A7A7A00F2F2F2007A7A7A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A007A7A7A00F2F2F2007A7A7A004A4A4A00000000004A4A4A00D4F0FF008ED4
      FF008ED4FF008ED4FF00007AB900007AB900007AB900007AB900007AB9004A4A
      4A007A7A7A00F2F2F2007A7A7A004A4A4A000E0E0E000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF004A4A4A0000000000000000004A4A
      4A007A7A7A00F2F2F2007A7A7A004A4A4A000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A00000000004A4A4A007A7A
      7A00F2F2F2009E9E9E00F2F2F2004A4A4A000000000000000000000000000000
      00000000000000000000000000004A4A4A004A4A4A00000000007A7A7A007A7A
      7A00F2F2F2009E9E9E00F2F2F2004A4A4A00000000004A4A4A00D4F0FF00D4F0
      FF008ED4FF00D4F0FF00007AB9004A4A4A004A4A4A00007AB9007A7A7A007A7A
      7A00F2F2F2009E9E9E00F2F2F2004A4A4A000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF004A4A4A00000000007A7A7A007A7A
      7A00F2F2F2009E9E9E00F2F2F2004A4A4A000000000000000000000000000000
      000000000000000000004A4A4A00AAAAAA007A7A7A004A4A4A007A7A7A00C2C2
      C2007A7A7A004A4A4A004A4A4A00000000000000000000000000000000000000
      000000000000000000004A4A4A00AAAAAA007A7A7A004A4A4A007A7A7A00C2C2
      C2007A7A7A004A4A4A004A4A4A0000000000000000004A4A4A00007AB900007A
      B900007AB900007AB9004A4A4A00AAAAAA007A7A7A004A4A4A007A7A7A00C2C2
      C2007A7A7A004A4A4A004A4A4A00000000000E0E0E000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF004A4A4A004A4A4A007A7A7A00C2C2
      C2007A7A7A004A4A4A004A4A4A00000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A004A4A4A00F2F2F200AAAAAA007A7A7A007A7A7A007A7A
      7A004A4A4A000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A004A4A4A00F2F2F200AAAAAA007A7A7A007A7A7A007A7A
      7A004A4A4A00000000000000000000000000000000004A4A4A00007AB9004A4A
      4A004A4A4A004A4A4A004A4A4A00F2F2F200AAAAAA007A7A7A007A7A7A007A7A
      7A004A4A4A008ED4FF004A4A4A0000000000000000000E0E0E000000FF004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A007A7A7A007A7A7A007A7A
      7A004A4A4A0000000000000000000000000000000000000000004A4A4A009E9E
      9E009E9E9E009E9E9E009E9E9E009E9E9E009E9E9E009E9E9E007A7A7A004A4A
      4A000000000000000000000000000000000000000000000000004A4A4A009E9E
      9E009E9E9E009E9E9E00AAAAAA009E9E9E009E9E9E009E9E9E007A7A7A004A4A
      4A0000000000000000000000000000000000000000004A4A4A004A4A4A009E9E
      9E009E9E9E009E9E9E00AAAAAA009E9E9E009E9E9E009E9E9E007A7A7A004A4A
      4A008ED4FF008ED4FF004A4A4A000000000000000000000000004A4A4A009E9E
      9E009E9E9E009E9E9E00AAAAAA009E9E9E009E9E9E009E9E9E007A7A7A004A4A
      4A0000000000000000000000000000000000000000004A4A4A00AAAAAA00C2C2
      C200C2C2C200AAAAAA00AAAAAA009E9E9E007A7A7A00F2F2F2009E9E9E009E9E
      9E004A4A4A00000000000000000000000000000000004A4A4A00AAAAAA00C2C2
      C200C2C2C200AAAAAA00AAAAAA007A7A7A007A7A7A00F2F2F2009E9E9E009E9E
      9E004A4A4A00000000000000000000000000000000004A4A4A00AAAAAA00C2C2
      C200C2C2C200AAAAAA00AAAAAA007A7A7A009E9E9E00F2F2F2009E9E9E009E9E
      9E004A4A4A008ED4FF004A4A4A0000000000000000004A4A4A00AAAAAA00C2C2
      C200C2C2C200AAAAAA00AAAAAA007A7A7A007A7A7A00F2F2F2009E9E9E009E9E
      9E004A4A4A000000000000000000000000004A4A4A00C2C2C200C2C2C2000E0E
      0E000E0E0E000E0E0E000E0E0E00AAAAAA007A7A7A00F2F2F200F2F2F200F2F2
      F2004A4A4A000000000000000000000000004A4A4A00C2C2C200C2C2C2000E0E
      0E000E0E0E000E0E0E000E0E0E007A7A7A007A7A7A007A7A7A00F2F2F2004A4A
      4A004A4A4A000000000000000000000000004A4A4A00C2C2C200C2C2C2000E0E
      0E000E0E0E000E0E0E000E0E0E007A7A7A007A7A7A00F2F2F200F2F2F200F2F2
      F2004A4A4A00D4F0FF004A4A4A00000000004A4A4A00C2C2C200C2C2C2000E0E
      0E000E0E0E000E0E0E000E0E0E007A7A7A007A7A7A007A7A7A00F2F2F2004A4A
      4A004A4A4A000000000000000000000000004A4A4A00C2C2C200E6E6E6000E0E
      0E000E0E0E000E0E0E000E0E0E000E0E0E007A7A7A00E6E6E6004A4A4A004A4A
      4A00000000000000000000000000000000004A4A4A00C2C2C200E6E6E6000E0E
      0E000E0E0E000E0E0E000E0E0E000E0E0E007A7A7A004A4A4A004A4A4A000000
      00000E0E0E000E0E0E0000000000000000004A4A4A00C2C2C200E6E6E6000E0E
      0E000E0E0E000E0E0E000E0E0E000E0E0E007A7A7A00E6E6E6004A4A4A004A4A
      4A00D4F0FF008ED4FF004A4A4A00000000004A4A4A00C2C2C200E6E6E6000E0E
      0E000E0E0E000E0E0E000E0E0E000E0E0E007A7A7A004A4A4A004A4A4A000000
      00000E0E0E000E0E0E0000000000000000004A4A4A00C2C2C200E6E6E6000E0E
      0E000E0E0E00FFFFFF000E0E0E000E0E0E007A7A7A00E6E6E6004A4A4A000000
      0000000000000000000000000000000000004A4A4A00C2C2C200E6E6E6000E0E
      0E000E0E0E00FFFFFF000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E
      0E000E0E0E000000FF000E0E0E00000000004A4A4A00C2C2C200E6E6E6000E0E
      0E000E0E0E00FFFFFF000E0E0E000E0E0E007A7A7A00E6E6E6004A4A4A008ED4
      FF008ED4FF00D4F0FF004A4A4A00000000004A4A4A00C2C2C200E6E6E6000E0E
      0E000E0E0E00FFFFFF000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000E0E
      0E000E0E0E000000FF000E0E0E00000000004A4A4A00C2C2C200E6E6E6000E0E
      0E00FFFFFF00FFFFFF000E0E0E000E0E0E00AAAAAA00F2F2F2004A4A4A000000
      0000000000000000000000000000000000004A4A4A00C2C2C200E6E6E6000E0E
      0E00FFFFFF00FFFFFF000E0E0E000E0E0E000E0E0E000000FF000000FF000000
      FF000000FF000000FF000000FF000E0E0E004A4A4A00C2C2C200E6E6E6000E0E
      0E00FFFFFF00FFFFFF000E0E0E000E0E0E00AAAAAA00F2F2F2004A4A4A00D4F0
      FF008ED4FF00D4F0FF004A4A4A00000000004A4A4A00C2C2C200E6E6E6000E0E
      0E00FFFFFF00FFFFFF000E0E0E000E0E0E000E0E0E000000FF000000FF000000
      FF000000FF000000FF000000FF000E0E0E004A4A4A00C2C2C200E6E6E600E6E6
      E6000E0E0E000E0E0E000E0E0E000E0E0E00C2C2C200F2F2F2004A4A4A000000
      0000000000000000000000000000000000004A4A4A00C2C2C200E6E6E600AAAA
      AA000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF004A4A4A00C2C2C200E6E6E600AAAA
      AA000E0E0E000E0E0E000E0E0E000E0E0E00C2C2C200F2F2F2004A4A4A00D4F0
      FF008ED4FF008ED4FF004A4A4A00000000004A4A4A00C2C2C200E6E6E600AAAA
      AA000E0E0E000E0E0E000E0E0E000E0E0E000E0E0E000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF00000000004A4A4A00C2C2C200AAAA
      AA00AAAAAA00AAAAAA00C2C2C200C2C2C200E6E6E6004A4A4A00000000000000
      000000000000000000000000000000000000000000004A4A4A00C2C2C200AAAA
      AA00AAAAAA00AAAAAA00C2C2C200C2C2C2000E0E0E000000FF000000FF000000
      FF000000FF000000FF000000FF004A4A4A00000000004A4A4A00C2C2C200AAAA
      AA00AAAAAA00AAAAAA00C2C2C200C2C2C200E6E6E6004A4A4A008ED4FF008ED4
      FF00D4F0FF008ED4FF004A4A4A0000000000000000004A4A4A00C2C2C200AAAA
      AA00AAAAAA00AAAAAA00C2C2C200C2C2C2000E0E0E000000FF000000FF000000
      FF000000FF000000FF000000FF004A4A4A0000000000000000004A4A4A00E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E6004A4A4A0000000000000000000000
      00000000000000000000000000000000000000000000000000004A4A4A00E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E6004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A000000FF004A4A4A000000000000000000000000004A4A4A00E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E6004A4A4A00D4F0FF00D4F0FF008ED4
      FF00D4F0FF004A4A4A00000000000000000000000000000000004A4A4A00E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E6004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A000000FF004A4A4A00000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A000000000000000000000000000000000000000000000000004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A000000000000000000000000000000
      00004A4A4A004A4A4A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000062626200626262006262620062626200626262006262
      6200626262006262620062626200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000626262006262620062626200626262006262620062626200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007300000073000000730000007300
      0000730000007300000073000000000000000000000000000000000000000000
      000000000000626262000092DC000092DC0000AAFF0000AAFF0000AAFF000092
      DC0000AAFF0000AAFF000092DC00626262000000000000000000000000000000
      0000000000000000000000000000000000009600000096000000000000000000
      0000000000009600000096000000960000000000000000000000000000000000
      0000626262000092DC000092DC000092DC000092DC000092DC00626262006262
      6200626262000000000000000000000000000000000000000000000000000000
      000000000000730000007300000073000000310096000000DC00310096000000
      DC00310096000000DC0031009600730000000000000062626200626262006262
      620062626200626262006BC6FF0000AAFF0000AAFF006BC6FF0000AAFF0000AA
      FF0000AAFF0000AAFF000092DC00626262000000000000000000000000000000
      0000000000000000000000000000960000000000FF000000FF00960000009600
      0000960000000000FF000000FF00960000000000000000000000626262006262
      6200006296000092DC000092DC000092DC000092DC000092DC000092DC000092
      DC000092DC006262620062626200000000000000000000000000000000000000
      000073000000FFE3D400FFE3D400FFE3D4000000DC000000FF000000FF000000
      FF000000FF000000FF000000FF0073000000626262000092DC000092DC00007A
      B900007AB900006296008ED4FF006BC6FF006BC6FF006BC6FF0000AAFF006BC6
      FF0000AAFF0000AAFF000092DC00626262000000000000000000000000000000
      0000000000000000000000000000960000000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00960000000000000062626200D4F0FF00D4F0
      FF00004A73000062960000629600006296000092DC000092DC000092DC000092
      DC000092DC000092DC008ED4FF00626262000000000000000000000000000000
      000073000000FFE3D4007300000073000000310096000000FF000000FF000000
      FF000000FF000000FF000000FF0073000000626262006BC6FF0000AAFF00007A
      B900007AB900007AB9008ED4FF006BC6FF0000AAFF006BC6FF006BC6FF006BC6
      FF006BC6FF0000AAFF0000AAFF00626262000000000000000000000000000000
      000000000000960000009600000096000000960000000000FF000000FF000000
      FF000000FF000000FF0096000000000000000000000062626200B1E2FF00D4F0
      FF00D4F0FF00D4F0FF0000629600006296000062960000629600006296000062
      96000092DC008ED4FF008ED4FF00626262000000000000000000000000000000
      000073000000FFE3D40073000000730000007300000073000000730000007300
      000073000000730000007300000000000000626262006BC6FF006BC6FF000092
      DC000092DC00006296008ED4FF008ED4FF008ED4FF006BC6FF006BC6FF006BC6
      FF008ED4FF0000AAFF000092DC00626262000000000000000000000000000000
      000096000000FFE3D400FFE3D400FFE3D400FFE3D4000000FF000000FF000000
      FF000000FF000000FF00960000000000000062626200D4F0FF00B1E2FF00B1E2
      FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF0000629600004A7300006296000062
      9600006296008ED4FF008ED4FF00626262000000000000000000000000000000
      000073000000FFE3D4007300000073000000FF487300FF487300FF487300FF48
      7300FF487300FF487300FF48730073000000626262006BC6FF006BC6FF000092
      DC00007AB900007AB9008ED4FF006BC6FF008ED4FF008ED4FF006BC6FF006BC6
      FF006BC6FF0000AAFF0000AAFF00626262000000000000000000000000000000
      000096000000FFE3D4009600000096000000960000000000FF000000FF000000
      FF000000FF000000FF00960000000000000062626200D4F0FF00D4F0FF00D4F0
      FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00004A7300004A
      7300004A73008ED4FF008ED4FF00626262000000000000000000000000000000
      000073000000FFE3D400FFE3D400FFE3D400FF487300FF8EAB00FF8EAB00FF8E
      AB00FF8EAB00FF8EAB00FF8EAB0073000000626262006BC6FF006BC6FF006BC6
      FF000092DC00006296008ED4FF008ED4FF006BC6FF006BC6FF006BC6FF006BC6
      FF0000AAFF006BC6FF0000AAFF00626262000000000000000000000000000000
      000096000000FFE3D40096000000960000000000FF000000FF000000FF009600
      00000000FF000000FF000000FF009600000062626200D4F0FF00D4F0FF00D4F0
      FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0
      FF00004A73008ED4FF0062626200000000000000000000000000000000000000
      000073000000FFE3D4007300000073000000FF487300FF8EAB00FF8EAB00FF8E
      AB00FF8EAB00FF8EAB00FF8EAB0073000000626262006BC6FF006BC6FF008ED4
      FF00007AB900006296008ED4FF008ED4FF006BC6FF006BC6FF008ED4FF000062
      9600006296000062960000629600626262000000000000000000000000000000
      000096000000FFE3D40096000000960000000000FF000000FF00960000000000
      0000960000000000FF000000FF009600000000000000626262000092DC00D4F0
      FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00B1E2
      FF006BC6FF008ED4FF0062626200000000000000000000000000000000000000
      000073000000FFE3D40073000000730000007300000073000000730000007300
      000073000000730000007300000000000000626262006BC6FF006BC6FF006BC6
      FF00007AB900007AB9008ED4FF008ED4FF008ED4FF008ED4FF006BC6FF000062
      96008ED4FF008ED4FF0000629600626262000000000000000000000000000000
      000096000000FFE3D40096000000960000009600000096000000000000000000
      00000000000096000000960000009600000000000000626262000092DC000092
      DC000092DC00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF00D4F0FF006BC6
      FF008ED4FF0048B8FF0062626200000000000000000073000000730000007300
      0000FF487300FF487300FF487300FF487300FF487300FF487300FF4873007300
      000000000000000000000000000000000000626262008ED4FF006BC6FF006BC6
      FF000092DC00006296008ED4FF008ED4FF006BC6FF008ED4FF008ED4FF000062
      96008ED4FF008ED4FF0062626200000000000000000096000000960000009600
      0000FF487300FF487300FF487300FF487300FF487300FF487300FF4873009600
      000000000000000000000000000000000000626262000092DC000092DC000092
      DC0048B8FF000092DC000092DC00D4F0FF00D4F0FF00D4F0FF00D4F0FF006BC6
      FF008ED4FF0062626200000000000000000073000000FFE3D400FFE3D400FFE3
      D400FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB007300
      000000000000000000000000000000000000626262006BC6FF006BC6FF006BC6
      FF006BC6FF000092DC008ED4FF008ED4FF008ED4FF008ED4FF008ED4FF000062
      96008ED4FF0062626200000000000000000096000000FFE3D400FFE3D400FFE3
      D400FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      000000000000000000000000000000000000626262000092DC000092DC0048B8
      FF0048B8FF006BC6FF000092DC000092DC000092DC00D4F0FF006BC6FF008ED4
      FF008ED4FF0062626200000000000000000073000000FFE3D400730000007300
      0000FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB007300
      000000000000000000000000000000000000626262008ED4FF006BC6FF006BC6
      FF006BC6FF00006296008ED4FF008ED4FF008ED4FF008ED4FF008ED4FF000092
      DC006262620000000000000000000000000096000000FFE3D400960000009600
      0000FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      0000000000000000000000000000000000006262620048B8FF0048B8FF0048B8
      FF0048B8FF0048B8FF0048B8FF006BC6FF000092DC006BC6FF006BC6FF008ED4
      FF000092DC0062626200000000000000000073000000FFE3D400730000000000
      0000730000007300000073000000730000007300000073000000730000000000
      000000000000000000000000000000000000626262008ED4FF008ED4FF008ED4
      FF006BC6FF000092DC000092DC000092DC000092DC000092DC00626262006262
      62000000000000000000000000000000000096000000FFE3D400960000000000
      0000960000009600000096000000960000009600000096000000960000000000
      0000000000000000000000000000000000006262620048B8FF0048B8FF0048B8
      FF0048B8FF0048B8FF006BC6FF006BC6FF006BC6FF006BC6FF006BC6FF00B1E2
      FF00626262000000000000000000000000000000000073000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000626262008ED4FF008ED4FF008ED4
      FF008ED4FF008ED4FF000092DC000092DC000092DC000092DC00626262000000
      0000000000000000000000000000000000000000000096000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062626200626262006262
      620048B8FF006BC6FF0048B8FF006BC6FF006BC6FF006BC6FF008ED4FF006BC6
      FF00626262000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000062626200626262006262
      6200626262006262620062626200626262006262620062626200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000626262006262620062626200626262006262620062626200626262006262
      6200000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009600000096000000000000000000
      0000960000009600000000000000000000000000000000000000000000000000
      0000000000000000000000000000960000009600000096000000960000009600
      0000960000009600000000000000000000000000000000000000960000009600
      0000960000000000000000000000000000000000000000000000960000009600
      0000960000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000960000000000FF000000FF00960000009600
      00000000FF000000FF0096000000000000000000000000000000000000000000
      0000000000000000000096000000000050000032500000325000003DB900003D
      B900003DB900003DB9009600000000000000000000000000000096000000FF6B
      8F00FF6B8F009600000000000000000000000000000096000000FF6B8F00FF6B
      8F00960000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000960000000000000000000000000000000000
      0000000000009600000000000000000000000000000000000000000000000000
      0000000000000000000000000000960000000000FF000000FF00960000009600
      00000000FF000000FF0096000000000000000000000000000000000000000000
      00000000000000000000960000000E0E0E000092DC000092DC00003DB900003D
      B900003DB900003DB9009600000000000000000000000000000096000000FFB1
      C700FF6B8F00FF6B8F00960000000000000096000000FF8EAB00FF8EAB009600
      0000960000000000000000000000000000000000000000000000000000000000
      0000000000000000000096000000FFE3D4009600000096000000960000009600
      000096000000FFE3D40096000000000000000000000000000000000000000000
      0000000000000000000000000000960000000000FF000000FF00960000009600
      00000000FF000000FF0096000000000000000000000000000000000000000000
      000000000000000000009600000000005000003DB900003DB900003DB9000032
      5000003250000032500096000000000000000000000000000000000000009600
      0000FFB1C700FF6B8F00FF6B8F009600000096000000FFB1C700FFB1C7009600
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000096000000FFE3D400FF550000FF6B6B00FFE3D400FF6B6B00FFE3
      D400FF6B6B00FF550000FFE3D400960000000000000000000000000000000000
      0000000000009600000096000000960000000000FF000000FF000000FF000000
      FF000000FF000000FF0096000000000000000000000000000000960000009600
      000096000000960000009600000000005000003DB900003DB900003DB9000092
      DC000092DC000092DC000092DC00960000000000000000000000000000000000
      000096000000FF6B8F00FF6B8F0096000000FF8EAB00FFD4E300FFD4E3009600
      0000000000000000000000000000000000000000000000000000960000009600
      00009600000096000000FFE3D400FF6B6B00FFE3D400FF55000096000000FF55
      0000FFE3D400FF6B6B00FFE3D400960000000000000000000000000000000000
      000096000000FFE3D400FFE3D400FFE3D4000000FF000000FF00960000009600
      00000000FF000000FF0096000000000000000000000096000000FFE3D400FFE3
      D400FFE3D400FFE3D400FFE3D4000E0E0E00003DB900007AB900003DB9000092
      DC000092DC000092DC000092DC00960000000000000000000000000000000000
      000096000000FF6B8F00FF6B8F00FF6B8F00FFB1C700FFD4E300960000000000
      0000000000000000000000000000000000000000000096000000FFE3D400FFE3
      D400FFE3D40096000000FFE3D400FF550000FFE3D40096000000FFE3D4009600
      0000FFE3D400FF550000FFE3D400960000000000000000000000000000000000
      000096000000FFE3D40096000000960000000000FF000000FF00960000009600
      00000000FF000000FF0096000000000000000000000096000000FFE3D4009600
      0000960000009600000096000000000050000032500000325000007AB900003D
      B900007AB900003DB90096000000000000000000000000000000960000009600
      000096000000FF8EAB00FF6B8F00FF6B8F00FFB1C70096000000000000000000
      0000000000000000000000000000000000000000000096000000FFE3D4009600
      00009600000096000000FFE3D400FF6B6B00FFE3D400FF55000096000000FF55
      0000FFE3D400FF6B6B00FFE3D400960000000000000000000000000000000000
      000096000000FFE3D4009600000000000000960000000000FF00960000009600
      00000000FF009600000096000000000000000000000096000000FFE3D4009600
      0000000000000000000096000000002573000092DC000092DC00003DB900007A
      B900003DB900007AB90096000000000000000000000096000000FF8EAB00FF6B
      8F0096000000FF8EAB00FF6B8F00FF6B8F009600000000000000000000009600
      0000960000009600000096000000000000000000000096000000FFE3D4009600
      00000000000096000000FFE3D400FF550000FF6B6B00FFE3D400FF6B6B00FFE3
      D400FF6B6B00FF550000FFE3D400960000000000000000000000000000000000
      000096000000FFE3D4009600000000000000960000000000FF000000FF000000
      FF000000FF009600000000000000000000000000000096000000FFE3D4009600
      000000000000000000009600000000257300007AB900003DB900007AB900003D
      B900007AB900007AB90096000000000000000000000096000000FF8EAB00FF6B
      8F0096000000FF8EAB00FF8EAB00FF6B8F00FF6B8F009600000096000000FF8E
      AB00FF8EAB00FF8EAB0096000000000000000000000096000000FFE3D4009600
      0000000000000000000096000000FFE3D4009600000096000000960000009600
      000096000000FFE3D40096000000000000000000000000000000000000000000
      000096000000FFE3D400960000009600000096000000960000000000FF000000
      FF00960000000000000000000000000000000000000096000000FFE3D4009600
      000000000000000000009600000000257300007AB900007AB900007AB900007A
      B900007AB900007AB90096000000000000000000000096000000FFB1C700FFB1
      C700FF8EAB00FFB1C700FF8EAB00FF6B8F00FF6B8F00FF6B8F00FF6B8F00FFB1
      C700960000009600000096000000000000000000000096000000FFE3D4009600
      0000960000009600000096000000960000009600000096000000960000000000
      0000000000009600000000000000000000000000000096000000960000009600
      0000FF487300FF487300FF487300FF487300FF487300FF487300FF4873009600
      0000000000000000000000000000000000000000000096000000FFE3D4009600
      0000960000009600000096000000960000009600000096000000960000009600
      0000960000009600000096000000000000000000000096000000FFB1C700FFD4
      E300FFD4E300FFB1C700FFB1C700FF8EAB00FF6B8F00FF6B8F00FFB1C7009600
      0000000000000000000000000000000000000000000096000000FFE3D4009600
      0000FF487300FF487300FF487300FF487300FF487300FF487300FF4873009600
      00000000000000000000000000000000000096000000FFE3D400FFE3D400FFE3
      D400FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      0000000000000000000000000000000000000000000096000000FFE3D4009600
      0000FF487300FF487300FF487300FF487300FF487300FF487300FF4873009600
      0000000000000000000000000000000000000000000000000000960000009600
      000096000000FFD4E300FFB1C700FFB1C700FF8EAB00FFB1C700960000000000
      00000000000000000000000000000000000096000000FFE3D400FFE3D400FFE3
      D400FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      00000000000000000000000000000000000096000000FFE3D400960000009600
      0000FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      00000000000000000000000000000000000096000000FFE3D400FFE3D400FFE3
      D400FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009600000096000000FFB1C7009600000096000000000000000000
      00000000000000000000000000000000000096000000FFE3D400960000009600
      0000FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      00000000000000000000000000000000000096000000FFE3D400960000000000
      0000960000009600000096000000960000009600000096000000960000000000
      00000000000000000000000000000000000096000000FFE3D400960000009600
      0000FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000096000000FFB1C700FF8EAB0096000000000000000000
      00000000000000000000000000000000000096000000FFE3D400960000000000
      0000960000009600000096000000960000009600000096000000960000000000
      0000000000000000000000000000000000000000000096000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000096000000FFE3D400960000000000
      0000960000009600000096000000960000009600000096000000960000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000096000000FFB1C700FF8EAB0096000000000000000000
      0000000000000000000000000000000000000000000096000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000960000009600000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005B577300676A8F0076739F007E7B
      AC00857DB4008A80B8008E86B7009B9AC000A5A2C7008E8FB6007F83A8008086
      AD0071789D00454666001B152C00231F37000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      0000BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006A6A890075759C00857FB0008B83
      BB009A8BCA009788C6008E85B7009391BA007A7CA5006E749F0070759D00686B
      9200888AB2006F709600131430001F1B33000000000000000000000000000000
      0000000000000000000000000000000000009600000096000000960000009600
      0000960000009600000096000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00BFBF
      BF00BFBFBF00BFBFBF0000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000000000000000000000000000007A7A9800847FB200A092C900AFA1
      DC00B7A7E900B4A3E400A797CE00968FB90072789C00767EAB00535883005259
      8100737799007D7BA2003B3D5E0012162B000000000000000000000000000000
      000000000000960000009600000096000000FF487300FF487300FF487300FF48
      7300FF487300FF487300FF487300960000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000000000000000000000000000008687A9009792C700B0A2E000CCB8
      F600D1BCF800D2BDF700CAB2E900B5A4D7008B83B300948FC900B4ABE500C1B4
      EC009B93C600817AAC006A6995000E1028000000000000000000000000000000
      000096000000FFE3D400FFE3D400FFE3D400FF487300FF8EAB00FF8EAB00FF8E
      AB00FF8EAB00FF8EAB00FF8EAB00960000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FA6464000000000000000000FA64640000000000000000007F7F7F00FA64
      6400000000000000000000000000000000009796BA00A99ED600BEAFEA00BAA8
      DF00B4A0D500C7B0E800D6BCF200D0B8E800B5A1CE00B09FD000DEC7FB00DFCD
      FF00B2A3D5009B92BF008C89B900161831000000000000000000000000009600
      0000960000000000FF009600000096000000FF487300FF8EAB00FF8EAB00FF8E
      AB00FF8EAB00FF8EAB00FF8EAB009600000000000000FA646400FA646400FA64
      6400FA646400FA646400FA646400FA64640000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FA646400FA6464000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      640000000000000000000000000000000000A499BF00B8A7D800A899CB009384
      B0008B7BA6008876A000AD9AC500CAAFE100C0A4D500CCADE700E4CCFE00D7BF
      F5009A8AB400AFA1D200A79ED80021223C000000000000000000000000000000
      FF00960000000000FF00960000000000FF009600000096000000960000009600
      00009600000096000000960000000000000000000000FA646400FA646400FA64
      6400FA646400FA646400FA646400FA64640000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FA646400FA6464000000
      0000FA64640000000000000000000000000000000000FA64640000000000FA64
      6400000000000000000000000000000000009C8FB3009E90BA00A08DBA00AD8D
      B200A47E9E009B7493008A7190009C88AE00A491BF00C1A4DD00D9BEF500B4A0
      CE0085769A00877DA000918DBE002A2847000000000000000000960000009600
      00000000FF000000FF000000FF0096000000FF487300FF487300FF487300FF48
      7300FF487300FF487300FF4873009600000000000000FA646400000000000000
      0000FA64640000000000000000007F7F7F0000000000FF000000FF000000FF00
      00000000FF00FF000000FF0000000000000000000000FA646400000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      64000000FF00000000000000000000000000706A840064628000574C69009245
      5200931B2000E0555A00B3667800A584A30088779A00A48CBC00B6A0CF008176
      9700756D8D006C648B006F6A9700201E3A0000000000960000000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF00FF8EAB00FF8EAB00FF8E
      AB00FF8EAB00FF8EAB00FF8EAB009600000000000000FA646400FA646400FA64
      6400FA646400FA646400FA646400FA646400FA64640000000000000000000000
      FF000000FF000000FF00000000000000000000000000FA646400FA6464000000
      0000FA6464000000000000000000FA6464000000000000000000000101000000
      FF000000FF000000FF00000000000000000069617B00595C77005C556F006633
      4700991D2100AB2A2F0091414B007B607700706689008677A1009889AF008269
      860097677F009E6680006660810014132D000000000000000000960000009600
      00000000FF000000FF000000FF0096000000FF487300FF8EAB00FF8EAB00FF8E
      AB00FF8EAB00FF8EAB00FF8EAB009600000000000000FA646400000000000000
      00000000000000000000FA64640000000000FA646400000000000000FF000000
      FF000000FF000000FF000000FF000000000000000000FA646400000000000000
      0000FA646400FA646400FA646400FA64640000000000C86464000000FF000000
      FF000000FF000000FF000000FF000000000070667F006D6B8900706E9000766C
      8B0082698700795C7500645F7F00605B78006261850079739D008B7BA600855E
      760085131A00D84A50007F425400150F27000000000000000000960000000000
      FF00960000000000FF00960000000000FF009600000096000000960000009600
      00009600000096000000960000000000000000000000FA646400FA646400FA64
      6400FA646400FA646400FA646400FA646400FA6464000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0000000000FA646400FA6464000000
      0000FA646400000000007F7F7F00FA646400000000000000FF000000FF000000
      FF000000FF000000FF000000FF000000FF0073728E007B799D008B87AF008E8D
      B3007C78A1006060880050537D005B5C830064638D00736F9D00827AAA007F73
      97007F495C0093323B0051253900231D34000000000096000000960000009600
      0000FF4873000000FF00FF487300FF487300FF487300FF487300FF4873009600
      00000000000000000000000000000000000000000000FA646400000000000000
      0000FA6464000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FA646400000000000000
      0000FA646400FA646400FA646400FA6464000000000000000000000000000000
      FF000000FF000000FF0000000000000000006768890078759C008F88AF00A498
      C500B1A6D700A69CCD00958CBE008E87B6008880B0008781B0008B87AF00837B
      A4006971920058557400535A78002327450096000000FFE3D400FFE3D400FFE3
      D400FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      00000000000000000000000000000000000000000000FA646400FA646400FA64
      6400FA64640000000000C8646400C86464000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FA646400FA6464000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000068698B0077739A008B83A900988C
      B9009A8CBD009B8DC2009B8CC2009B8CBF009B8EBF009A90C0009692B900948E
      B0009086AB00847FA5005C658800323D590096000000FFE3D400960000009600
      0000FF487300FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB00FF8EAB009600
      00000000000000000000000000000000000000000000FA646400000000007F7F
      7F00FA64640000000000C86464000000000000000000000000007F7F7F000000
      FF000000FF000000FF00000000000000000000000000FA646400000000007F7F
      7F00FA64640000000000C8646400000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000006F6F8E007B7AA0008B86AE00968E
      B5009B90BA009C8FBD00A091C500A094C3009E92C200A498C800A096C1009892
      BB00948BB0008182A600868CB2002B2F4B0096000000FFE3D400960000000000
      0000960000009600000096000000960000009600000096000000960000000000
      00000000000000000000000000000000000000000000FA646400FA646400FA64
      6400FA6464000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF0000000000000000000000000000000000FA646400FA646400FA64
      6400FA6464000000000000000000000000000000FF000000FF000000FF000000
      FF000000FF0000000000000000000000000066668400837FA7008B83B200988C
      B5009F92BC00A394C200AE9BCC00B09ECB00AC9CC700AC9EC900AD9FCC00A296
      C1009D90B9008982A40075789C00191D38000000000096000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002E2A42006D698B00887EA9009288
      B200A598C200B5A3CF00BEAAD500BEAAD500C0ADD800B9AAD600B6A8D600AEA0
      CD00A99BC200918BAC00757696001D223E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8646400BFBFBF00C864
      6400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00C8646400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00C8646400BFBF
      BF00C8646400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8646400BFBFBF00C864
      6400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00C8646400000000000680
      8000068080001680800012808000058080000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00C8646400BFBF
      BF00C8646400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000007F7F7F000000000000000000000000000000000000000000C864
      6400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00C864
      64000000000000000000000000000000000000000000C8646400BFBFBF00C864
      6400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00C864640000000000FA64
      6400FA646400FA646400FA646400000000000000000000000000000000000000
      0000FA6464000000000000000000FA64640000000000000000007F7F7F00FA64
      6400000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000007F7F7F0000000000000000000000000000000000FFFFFF000000
      0000C8646400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00C8646400BFBF
      BF00C864640000000000000000000000000000000000BFBFBF00C8646400BFBF
      BF00C8646400BFBFBF00C8646400BFBFBF00C8646400BFBFBF0000000000FA64
      64000000000000000000FA646400000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000000000000000000000000000000000000000000000FA646400FFFF
      FF0000000000C8646400BFBFBF00C8646400BFBFBF00C8646400BFBFBF00C864
      6400BFBFBF00C864640000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FA646400FA64
      6400FA646400FA646400FA646400000000000000000000000000000000000000
      0000FA64640000000000000000000000000000000000FA64640000000000FA64
      6400000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000000000000000000000000000000000000000000000FFFFFF00FA64
      6400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF00C864
      6400BFBFBF00C864640000000000FA64640000000000FA646400000000000000
      000000000000FA646400FA646400000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA646400FA646400FA646400FA646400FA64
      6400000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA6464000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FA646400FFFF
      FF00FA646400FFFFFF00FA646400FFFFFF00FA646400FFFFFF00FA6464000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000008080800FA646400FA646400FA646400FA646400FA64
      6400FA646400FA646400FA646400000000000000000000000000000000000000
      0000FA6464000000000000000000FA6464000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA64640000000000C8646400C86464000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FA64
      6400FFFFFF00FA646400FFFFFF00FA646400FFFFFF00FA646400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FA6464000000000000000000FA646400FA64
      6400FA646400FA646400FA646400000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA64640000000000C8646400C86464000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA64640000000000C8646400000000000000
      0000000000000000000000000000000000000000000000000000FA646400FFFF
      FF00FA646400FFFFFF00FA646400FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FA646400FA646400FA646400FA6464000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FA646400000000007F7F7F00FA64640000000000C8646400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA6464000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FA64
      6400FFFFFF00FA646400FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FA646400FA646400FA646400FA6464000000
      0000C8646400C864640000000000000000000000000000000000000000000000
      0000FA646400FA646400FA646400FA6464000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FA646400FA646400FA646400FA6464000000
      0000C86464000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FA646400FA646400FA646400FA6464000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000800000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000C003C00300000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      8001800100000000800180010000000080018001000000008001800100000000
      C003C00300000000FFFFFFFF000000008001C003FFFFFFFF1008A005FFFFC003
      0000500AFFFF800140022814FFDF800100001008FFCF800100000180FFC78001
      0000000080038001000004208001800100000420800180010000000080038001
      00000180FFC7800100000000FFCF800140020000FFDF800100004002FFFF8001
      1008A005FFFFC0038001C003FFFFFFFFFFF3FFF38003DFF3FFE1FFE180018061
      FFE0FFE080000060FE40FE4080000040FC01FC0180010001E007E00780018007
      C00FC00F8001C00F80078007800180070007000700010007000F001300010013
      001F000100010001001F000000010000001F000000010000803F800080018000
      C07FC001C003C001E0FFE0F3E007E0F3FFFFFC01FFFFF03FFF01F800FF38F007
      F8008000FE00C001F0000000FE008000F0000000F8018000F0010000F0010000
      F0000000F0010000F0000000F0000001F0000000F0108001F0010000F0388001
      800F0001800F0003000F0003000F0003000F0007000F0003101F000F101F0007
      BFFF001FBFFF8007FFFF803FFFFFF00FFF33FE03C7C7FFFFFE01FC01C387FEFB
      FE01FC01C107FC01FE01FC01E00FF800F801C000F00FC000F0018000F01F8000
      F0018001C03F8000F1018C0180618800F1038C0180018C01F0078C018001801B
      800F8001800F800F000F800FC01F000F000F000FF83F000F101F000FFC3F101F
      BFFF101FFC3FBFFFFFFFBFFFFE7FFFFFFF00FFFF0000FFFFFF00E0070000FF01
      FF00E0070000F800FF00E0070000F000000000070000E000000000070000E001
      000000070000C0000000000700008000002300030000C000000100010000C001
      000000000000800F002300230000000F006300630000000F00C300E30000101F
      010701070000BFFF03FF03FF0000FFFFFFFFFFFF801FFFFFF003FFFF001FFFFF
      E003FFFF001FE007E003FFFF0000E007E003C00F0000E007E00380070000E007
      E00380030000E007E00780010000E007E00780018000E007E007800FC000E007
      E00F800FFC00E00FE01F801FFC00E01FE03FC0FFFC01E03FE07FC0FFFC03E07F
      FFFFFFFFFC07FFFFFFFFFFFFFC0FFFFF00000000000000000000000000000000
      000000000000}
  end
  object Actions: TActionList
    Left = 552
    Top = 8
    object actNew: TAction
      Category = 'File'
      Caption = 'New'
      Hint = 'New|Create a new dialog'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = actNewExecute
    end
    object actAbout: TAction
      Caption = 'About'
      Hint = 'About|About Alia'
      ShortCut = 112
      OnExecute = actAboutExecute
    end
    object actOpen: TAction
      Category = 'File'
      Caption = 'Open...'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 1
      ShortCut = 16463
      OnExecute = actOpenExecute
    end
    object actClose: TAction
      Category = 'File'
      Caption = 'Close'
      Hint = 'Close|Close the current dialog'
      ImageIndex = 2
      SecondaryShortCuts.Strings = (
        'Ctrl+F4')
      OnExecute = actCloseExecute
    end
    object actSave: TAction
      Category = 'File'
      Caption = 'Save...'
      Hint = 'Save|Save the current file'
      ImageIndex = 3
      OnExecute = actSaveExecute
    end
    object actSaveAs: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Dialog.Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
      Hint = 'Save As|Saves the file with a new name'
      ImageIndex = 4
      ShortCut = 16467
      BeforeExecute = actSaveAsBeforeExecute
      OnAccept = actSaveAsAccept
    end
    object actSaveAll: TAction
      Category = 'File'
      Caption = 'Save All...'
      Hint = 'Save All|Save all open dialogs'
      ImageIndex = 5
      OnExecute = actSaveAllExecute
    end
    object actOptions: TAction
      Caption = 'Options'
      Hint = 'Options'
      ImageIndex = 6
      ShortCut = 119
      OnExecute = actOptionsExecute
    end
    object actAdd: TAction
      Caption = 'Add'
      Hint = 'Add'
      ImageIndex = 12
    end
    object actCopy: TAction
      Caption = 'Copy'
      Hint = 'Copy'
      ImageIndex = 13
    end
    object actCut: TAction
      Caption = 'Cut'
      Hint = 'Cut'
      ImageIndex = 14
    end
    object actPaste: TAction
      Caption = 'Paste'
      Hint = 'Paste'
      ImageIndex = 15
    end
    object actFind: TAction
      Caption = 'Find'
      Hint = 'Find (Ctrl+F)'
      ImageIndex = 16
      ShortCut = 16454
    end
    object actFindNext: TAction
      Caption = 'Find Next'
      Hint = 'Find Next (F3)'
      ImageIndex = 17
      ShortCut = 114
    end
    object actFindFiles: TAction
      Caption = 'Find In Files'
      Hint = 'Find In Files'
      ImageIndex = 18
    end
    object actReplace: TAction
      Caption = 'Replace'
      Hint = 'Replace (Ctrl+R)'
      ImageIndex = 19
      ShortCut = 16466
    end
    object actPasteLink: TAction
      Caption = 'Paste As Link'
      Hint = 'Paste As Link'
    end
    object actBookmark: TAction
      Caption = 'Bookmark'
      Hint = 'Bookmark'
    end
    object actTest: TAction
      Caption = 'Test'
      Hint = 'Test'
    end
    object actDelete: TAction
      Caption = 'Delete'
      Hint = 'Delete'
    end
    object actFocus: TAction
      Caption = 'Focus'
      Hint = 'Focus'
      ShortCut = 115
      OnExecute = actFocusExecute
    end
    object actScript: TAction
      Caption = 'actScript'
      ShortCut = 117
      OnExecute = actScriptExecute
    end
    object actDebug: TAction
      Caption = 'actDebug'
      OnExecute = actDebugExecute
    end
  end
  object popTree: TPopupMenu
    Left = 584
    Top = 56
  end
  object OpenDlg: TOpenDialog
    Options = [ofEnableSizing]
    Left = 520
    Top = 8
  end
  object imgFiles: TImageList
    Height = 20
    Width = 32
    Left = 8
    Top = 46
    Bitmap = {
      494C010103000400040020001400FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000001400000001002000000000000028
      0000000000000000000000000000000000000000000000000000FEFEFE00FDFD
      FD00FBFBFB00F7F7F700F2F2F200EEEEEE00EAEAEA00E9E9E900E9E9E900EBEB
      EB00EDEDED00EFEFEF00F1F1F100F2F2F200F3F3F300F5F5F500F8F8F800F9F9
      F900FAFAFA00F9F9F900F8F8F800F5F5F500F4F4F400F5F5F500F8F8F800FBFB
      FB00FDFDFD00FEFEFE0000000000000000000000000000000000FEFEFE00FCFC
      FC00FAFAFA00F6F6F600F2F2F200EEEEEE00EBEBEB00EAEAEA00EAEAEA00ECEC
      EC00EEEEEE00EFEFEF00F1F1F100F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F0F0F000EFEFEF00EFEFEF00EFEFEF00F1F1F100F4F4F400F8F8
      F800FBFBFB00FDFDFD00FEFEFE0000000000000000000000000000000000FEFE
      FE00FCFCFC00FAFAFA00F6F6F600F2F2F200EEEEEE00ECECEC00EAEAEA00ECEC
      EC00EDEDED00EFEFEF00F1F1F100F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200F4F4F400F5F5F500F8F8F800FBFBFB00FDFDFD00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FDFDFD00FAFA
      FA00F5F5F500EEEEEE00E6E6E600DFDFDF00DADADA00D7D7D700D7D7D700DADA
      DA00DDDDDD00DFDFDF00E2E2E200E3E3E300E6E6E600EBEBEB00F1F1F100F4F4
      F400F5F5F500F3F3F300EFEFEF00EBEBEB00E9E9E900ECECEC00F1F1F100F5F5
      F500FBFBFB00FEFEFE0000000000000000000000000000000000FEFEFE00FAFA
      FA00F4F4F400EDEDED00E5E5E500DEDEDE00DADADA00D9D9D900DBDBDB00DEDE
      DE00E1E1E100E3E3E300E5E5E500E4E4E400E5E5E500E5E5E500E5E5E500E5E5
      E500E3E3E300E1E1E100E0E0E000E0E0E000E0E0E000E4E4E400E9E9E900F0F0
      F000F5F5F500FBFBFB00FEFEFE0000000000000000000000000000000000FEFE
      FE00FAFAFA00F4F4F400EDEDED00E5E5E500DEDEDE00DADADA00D8D8D800DADA
      DA00DDDDDD00E0E0E000E2E2E200E4E4E400E4E4E400E5E5E500E6E6E600E6E6
      E600E6E6E600E6E6E600E8E8E800ECECEC00F1F1F100F5F5F500FBFBFB00FEFE
      FE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FBFBFB00F5F5
      F500ECECEC00E1E1E100D5D5D500CBCBCB00C3C3C300BFBFBF00BFBFBF00C2C2
      C200C5C5C500C8C8C800CDCDCD00CECECE00D3D3D300DBDBDB00E5E5E500EAEA
      EA00ECECEC00EAEAEA00E4E4E400DCDCDC00DADADA00DDDDDD00E5E5E500EDED
      ED00F6F6F600FBFBFB00FEFEFE00FEFEFE000000000000000000FCFCFC00F6F6
      F600EDEDED00E2E2E200D4D4D400CBCBCB00C5C5C500C4C4C400C8C8C800CDCD
      CD00D1D1D100D4D4D400D5D5D500D3D3D300D1D1D100D1D1D100D1D1D100D1D1
      D100D0D0D000CECECE00CCCCCC00CCCCCC00CCCCCC00D1D1D100DADADA00E5E5
      E500EDEDED00F6F6F600FBFBFB00FEFEFE00000000000000000000000000FCFC
      FC00F6F6F600EDEDED00E2E2E200D4D4D400CACACA00C3C3C300C0C0C000C2C2
      C200C7C7C700CBCBCB00CECECE00D1D1D100D1D1D100D3D3D300D4D4D400D5D5
      D500D5D5D500D5D5D500D7D7D700DDDDDD00E5E5E500EDEDED00F6F6F600FBFB
      FB00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00F8F8F800EFEF
      EF00E2E2E200D1D1D100C2C2C200B4B4B400AAAAAA00A5A5A500A6A6A600A8A8
      A800AAAAAA00ADADAD00B3B3B300B4B4B400BABABA00C5C5C500D3D3D300DADA
      DA00DFDFDF00DCDCDC00D4D4D400C8C8C800C4C4C400C8C8C800D3D3D300DFDF
      DF00ECECEC00F6F6F600FBFBFB00FEFEFE000000000000000000FBFBFB00F2F2
      F200E4E4E400D3D3D300BFBFBF00B0B0B000A8A8A800A8A8A800AEAEAE00B6B6
      B600BCBCBC00C0C0C000C0C0C000BCBCBC00B9B9B900B6B6B600B6B6B600B6B6
      B600B6B6B600B4B4B400B3B3B300B3B3B300B3B3B300B9B9B900C5C5C500D3D3
      D300DFDFDF00ECECEC00F6F6F600FBFBFB00000000000000000000000000FBFB
      FB00F2F2F200E4E4E400D3D3D300BFBFBF00B0B0B000A5A5A500A2A2A200A5A5
      A500ABABAB00B0B0B000B6B6B600BABABA00BBBBBB00BDBDBD00BFBFBF00C0C0
      C000BFBFBF00BEBEBE00C1C1C100C8C8C800D3D3D300DFDFDF00ECECEC00F6F6
      F600FBFBFB00FEFEFE00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCFCFC00F4F4F400E7E7
      E700D7D7D700C2C2C200B0B0B000A3A3A3009B9B9B0095959500979797009898
      980098989800999999009E9E9E009E9E9E00A4A4A400B1B1B100C2C2C200CBCB
      CB00D1D1D100CECECE00C5C5C500B6B6B600B0B0B000B5B5B500C2C2C200D1D1
      D100E2E2E200F0F0F000F8F8F800FBFBFB000000000000000000F9F9F900EEEE
      EE00DDDDDD00C8C8C800AFAFAF009E9E9E0095959500959595009E9E9E00A9A9
      A900B0B0B000B3B3B300B2B2B200AAAAAA00A3A3A3009F9F9F009E9E9E009E9E
      9E009F9F9F00A0A0A000A0A0A000A1A1A1009F9F9F00A5A5A500B1B1B100C2C2
      C200D1D1D100E2E2E200F0F0F000F8F8F800000000000000000000000000F9F9
      F900EEEEEE00DDDDDD00C8C8C800AFAFAF009B9B9B008F8F8F008B8B8B008F8F
      8F00959595009C9C9C00A2A2A200A7A7A700A8A8A800ABABAB00ADADAD00B0B0
      B000AEAEAE00ABABAB00ADADAD00B5B5B500C2C2C200D1D1D100E2E2E200F0F0
      F000F8F8F800FBFBFB00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F1F1F100E0E0
      E000CECECE00B7B7B700A4A4A40099999900939393008F8F8F00909090009090
      90008E8E8E008C8C8C008F8F8F008D8D8D00929292009E9E9E00B0B0B000BBBB
      BB00C2C2C200C1C1C100B7B7B700A7A7A7009F9F9F00A4A4A400B0B0B000C2C2
      C200D7D7D700E8E8E800F3F3F300F9F9F9000000000000000000F8F8F800EBEB
      EB00D7D7D700C0C0C000A4A4A40092929200898989008D8D8D0098989800A4A4
      A400ACACAC00AEAEAE00AAAAAA009C9C9C00929292008C8C8C00898989008A8A
      8A008D8D8D008F8F8F0092929200929292008F8F8F0095959500A0A0A000B0B0
      B000C2C2C200D7D7D700E8E8E800F3F3F300000000000000000000000000F8F8
      F800EBEBEB00D7D7D700C0C0C000A4A4A4008F8F8F00818181007D7D7D008181
      8100888888008E8E8E0095959500999999009B9B9B009E9E9E00A1A1A100A3A3
      A300A1A1A1009C9C9C009C9C9C00A4A4A400B0B0B000C2C2C200D7D7D700E8E8
      E800F3F3F300F9F9F900FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00EFEFEF00DCDC
      DC00C8C8C800B0B0B0007F7F7F006B6B6B0067676700898989008B8B8B008A8A
      8A0088888800848484008686860080808000838383008D8D8D009E9E9E00A8A8
      A800B1B1B100B2B2B200AAAAAA00989898008F8F8F00929292009E9E9E00B0B0
      B000C7C7C700DDDDDD00ECECEC00F5F5F5000000000000000000F8F8F800E9E9
      E900D4D4D400BABABA009C9C9C00888888007E7E7E00828282008F8F8F009D9D
      9D00A5A5A500A7A7A700A1A1A10091919100848484007B7B7B00777777007A7A
      7A007F7F7F0083838300878787008989890083838300868686008F8F8F009E9E
      9E00B0B0B000C7C7C700DDDDDD00ECECEC00000000000000000000000000F8F8
      F800E9E9E900D4D4D400BABABA009B9B9B008383830074747400707070007575
      75007D7D7D00848484008C8C8C00929292009292920095959500989898009A9A
      9A00969696008F8F8F008D8D8D00929292009E9E9E00B0B0B000C7C7C700DDDD
      DD00ECECEC00F5F5F500FBFBFB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAFAFA00EEEEEE00DBDB
      DB00848484001717170000000000000000000000000000000000383838007B7B
      7B008B8B8B000000000000000000222222007B7B7B0082828200909090009A9A
      9A00A4A4A400000000000000000027272700868686008686860090909000A1A1
      A100BABABA00D3D3D300E6E6E600F2F2F2000000000000000000F8F8F800E9E9
      E900000000000000000000000000000000000000000000000000000000006F6F
      6F00A1A1A1000000000000000000262626007F7F7F00747474001E1E1E000000
      0000000000005C5C5C000000000000000000222222007D7D7D00838383009090
      9000A1A1A100BABABA00D3D3D300E6E6E600000000000000000000000000F8F8
      F800E9E9E9000000000000000000000000000000000000000000070707002D2D
      2D00727272008383830000000000000000002828280095959500979797000000
      00000000000025252500858585008787870090909000A1A1A100BABABA00D3D3
      D300E6E6E600F2F2F200FAFAFA00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00EFEFEF00A3A3
      A300000000000000000000000000292929001313130000000000000000000A0A
      0A00979797000000000000000000242424008181810085858500909090009898
      9800A1A1A1000000000000000000282828008989890088888800909090009F9F
      9F00B6B6B600CFCFCF00E3E3E300F0F0F0000000000000000000F8F8F800EAEA
      EA00000000000000000000000000000000000000000000000000000000007575
      7500A8A8A8000000000000000000282828008585850059595900000000000000
      0000222222008585850000000000000000002424240082828200868686009090
      90009F9F9F00B6B6B600CFCFCF00E3E3E300000000000000000000000000F8F8
      F800EAEAEA000000000000000000000000000000000000000000000000000000
      0000474747008C8C8C0000000000000000002A2A2A009B9B9B009E9E9E000000
      000000000000272727008989890089898900909090009F9F9F00B6B6B600CFCF
      CF00E3E3E300F0F0F000F9F9F900FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBFBFB00F2F2F2004C4C
      4C0000000000000000008C8C8C008D8D8D00727272001E1E1E00000000000000
      0000A0A0A0000000000000000000282828008C8C8C008E8E8E00959595009C9C
      9C00A4A4A40000000000000000002A2A2A00919191008F8F8F0095959500A2A2
      A200B7B7B700CECECE00E2E2E200EFEFEF000000000000000000F9F9F900ECEC
      EC0000000000000000002E2E2E00989898008E8E8E00909090009B9B9B00A7A7
      A700AFAFAF0000000000000000002B2B2B00919191001A1A1A00000000000000
      000065656500919191000000000000000000272727008C8C8C008E8E8E009595
      9500A2A2A200B7B7B700CECECE00E2E2E200000000000000000000000000F9F9
      F900ECECEC0000000000000000002E2E2E00939393007E7E7E00000000000000
      0000272727009898980000000000000000002D2D2D00A7A7A700A9A9A9000000
      0000000000002A2A2A00939393009191910095959500A2A2A200B7B7B700CECE
      CE00E2E2E200EFEFEF00F8F8F800FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FDFDFD00F6F6F6000000
      00000000000037373700BABABA005E5E5E000000000000000000000000000000
      0000ADADAD00000000000000000015151500565656005555550057575700A6A6
      A600ADADAD00000000000000000016161600575757005656560057575700ABAB
      AB00BDBDBD00D1D1D100E3E3E300EFEFEF000000000000000000FAFAFA00EFEF
      EF000000000000000000181818005A5A5A00555555005555550063636300AFAF
      AF00B6B6B60000000000000000000B0B0B0015151500000000000A0A0A005252
      52009D9D9D00A3A3A30000000000000000001515150056565600555555005757
      5700ABABAB00BDBDBD00D1D1D100E3E3E300000000000000000000000000FAFA
      FA00EFEFEF000000000000000000181818005959590046464600000000000000
      000057575700AAAAAA00000000000000000031313100B7B7B700B8B8B8000000
      00000000000016161600585858005656560057575700ABABAB00BDBDBD00D1D1
      D100E3E3E300EFEFEF00F8F8F800FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FAFAFA000000
      0000000000003B3B3B00CDCDCD00757575003232320032323200323232003333
      3300C2C2C200000000000000000000000000000000000000000000000000BCBC
      BC00C1C1C100000000000000000000000000000000000000000000000000BFBF
      BF00CCCCCC00DBDBDB00E9E9E900F2F2F2000000000000000000FBFBFB00F4F4
      F40000000000000000000000000000000000000000000000000033333300C2C2
      C200C8C8C8000000000000000000000000000000000000000000000000000000
      000086868600BCBCBC0000000000000000000000000000000000000000000000
      0000BFBFBF00CCCCCC00DBDBDB00E9E9E900000000000000000000000000FBFB
      FB00F4F4F4000000000000000000000000000000000000000000000000006161
      6100BBBBBB00C2C2C200000000000000000037373700CBCBCB00CBCBCB000000
      00000000000000000000000000000000000000000000BFBFBF00CCCCCC00DBDB
      DB00E9E9E900F2F2F200FAFAFA00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FEFEFE00FCFCFC002020
      20000000000010101000DFDFDF00D7D7D700D1D1D100A7A7A700D0D0D000D3D3
      D300D6D6D60000000000000000001B1B1B00717171007171710071717100D4D4
      D400D7D7D70000000000000000001B1B1B00717171007171710071717100D6D6
      D600DDDDDD00E7E7E700F0F0F000F7F7F7000000000000000000FDFDFD00F8F8
      F80000000000000000001D1D1D007373730071717100707070007F7F7F00D7D7
      D700DBDBDB000000000000000000292929009B9B9B007D7D7D00000000000000
      000046464600D4D4D40000000000000000001B1B1B0071717100717171007171
      7100D6D6D600DDDDDD00E7E7E700F0F0F000000000000000000000000000FDFD
      FD00F8F8F80000000000000000001D1D1D007373730028282800000000002828
      2800C7C7C700D7D7D70000000000000000003C3C3C00DDDDDD00DEDEDE000000
      0000000000001C1C1C00727272007171710071717100D6D6D600DDDDDD00E7E7
      E700F0F0F000F7F7F700FBFBFB00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FEFEFE008888
      880000000000000000004F4F4F00A9A9A9007B7B7B0000000000000000003D3D
      3D00E6E6E60000000000000000001E1E1E007C7C7C007B7B7B007B7B7B00A8A8
      A800E6E6E60000000000000000001E1E1E007B7B7B007B7B7B007B7B7B00A9A9
      A900EBEBEB00F0F0F000F5F5F500FAFAFA000000000000000000FEFEFE00FBFB
      FB0000000000000000001F1F1F007D7D7D007B7B7B007B7B7B007B7B7B00E7E7
      E700E9E9E90000000000000000001E1E1E007C7C7C0069696900000000000000
      00003E3E3E00E7E7E70000000000000000001E1E1E007C7C7C007B7B7B007B7B
      7B00A9A9A900EBEBEB00F0F0F000F5F5F500000000000000000000000000FEFE
      FE00FBFBFB0000000000000000001F1F1F007C7C7C002C2C2C00000000000000
      0000A9A9A900E9E9E900000000000000000040404000ECECEC00ECECEC000000
      0000000000001E1E1E007C7C7C007B7B7B007B7B7B00A9A9A900EBEBEB00F0F0
      F000F5F5F500FAFAFA00FDFDFD00FEFEFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EEEE
      EE0044444400000000000000000000000000000000000000000000000000A1A1
      A100F3F3F3000000000000000000000000000000000000000000000000008383
      8300F3F3F3000000000000000000000000000000000000000000000000008484
      8400F5F5F500F8F8F800FBFBFB00FCFCFC000000000000000000FEFEFE00FEFE
      FE0000000000000000000000000000000000000000000000000000000000F3F3
      F300F5F5F5000000000000000000000000000000000000000000000000000000
      0000A3A3A300F5F5F50000000000000000000000000000000000000000000000
      000084848400F5F5F500F8F8F800FBFBFB00000000000000000000000000FEFE
      FE00FEFEFE000000000000000000000000000000000000000000000000001010
      1000E6E6E600F6F6F600000000000000000043434300F7F7F700F7F7F7000000
      0000000000000000000000000000000000000000000084848400F5F5F500F8F8
      F800FBFBFB00FCFCFC00FEFEFE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FEFEFE009999990055555500444444004444440064646400B8B8B800FBFB
      FB00FCFCFC00898989008989890089898900888888008888880088888800B9B9
      B900FCFCFC00888888008989890088888800888888008888880088888800B9B9
      B900FDFDFD00FEFEFE00FEFEFE00FEFEFE00000000000000000000000000FEFE
      FE0089898900898989008989890088888800888888008888880088888800FCFC
      FC00FDFDFD00898989008989890089898900888888008888880088888800CDCD
      CD00FDFDFD00FDFDFD0089898900898989008989890088888800888888008888
      8800B9B9B900FDFDFD00FEFEFE00FEFEFE000000000000000000000000000000
      0000FEFEFE00898989008989890089898900888888008888880088888800ECEC
      EC00FDFDFD00FDFDFD00898989008989890099999900FDFDFD00FDFDFD008989
      89008989890089898900888888008888880088888800B9B9B900FDFDFD00FEFE
      FE00FEFEFE00FEFEFE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000140000000100010000000000400100000000000000000000
      000000000000000000000000FFFFFF00C0000003C0000001E000000F00000000
      C0000003C0000001E000000F0000000080000000C0000000E000000300000000
      80000000C0000000E00000010000000080000000C0000000E000000100000000
      80000000C0000000E00000010000000080000000C0000000E000000100000000
      80000000C0000000E00000000000000080000000C0000000E000000000000000
      80000000C0000000E00000000000000080000000C0000000E000000000000000
      80000000C0000000E00000000000000080000000C0000000E000000000000000
      C0000000C0000000E000000000000000E0000000C0000000E000000100000000
      F0000000E0000000F000000300000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF00000000
      FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object popFiles: TPopupMenu
    Left = 40
    Top = 46
  end
end
