(*------------------------------------------------------------------------------
Form_Alia

The Version 4 incarnation of the Leto Advanced Editor. A sophisticated NWN
resource editor. Complete GUI redesign loosely based on SpeakEasy.

This program is free software, under the terms of the BSD license. See the
included License.txt for details, or contact dragon@weathersong.net if you
need more information.

------------------------------------------------------------------------------*)

unit Form_Alia;

interface

uses
  SysUtils, Classes, Math, TypInfo,
  {$IFDEF MSWINDOWS}
  Windows, Messages, Variants, Graphics, Controls, Forms, Dialogs, ExtCtrls,
  ComCtrls, ToolWin, ActnList, ImgList, Menus, StdCtrls, Grids, StdActns,
  ShellAPI,
  {$ELSE}
  QTypes, QGraphics, QControls, QForms, QDialogs, QExtCtrls, QComCtrls,
  QActnList, QImgList, QMenus, QStdCtrls, QGrids, DmFrame,
  {$ENDIF}
  VirtualTrees,
  Header_Leto,
  Class_LetoXml, Class_TlkFile,
  Class_LetoFile, Class_ErfFile, Class_ErfStruct, Class_GffFile, Class_GffField,
  Class_LetoScriptEnv, Class_LetoScript;


const
  WM_AFTERSHOW		= WM_USER + 101;


type

  TResRec		= record
    LetoFile		: TLetoFile;
    Struct		: TErfStruct;
    ResName		: String;
    Node		: PVirtualNode;
    Handle		: String;
    Modified		: Boolean;
    Internal		: Boolean;
    {$IFDEF LINUX}
    Tab                 : TTab;
    {$ENDIF}
    Tree		: TVirtualStringTree;
    Header		: TMemo;
    Labels		: TStringGrid;
    Raw			: TVirtualStringTree;
    Stream		: TStream;
    DataIndices		: array of Cardinal;
    ListIndices		: array of Cardinal;
  end;
  PResRec		= ^TResRec;

  TGffNode		= record
    ResRec		: PResRec;
    Gff			: TGffFile;
    Field		: TGffField;
  end;
  PGffNode		= ^TGffNode;

  TErfNode		= record
    ResRec		: PResRec;
    Erf			: TErfFile;
    Struct		: TErfStruct;
  end;
  PErfNode		= ^TErfNode;

  TRawRec		= record
    Field		: String;
    Value		: String;
  end;
  PRawRec		= ^TRawRec;

  TAliaOption		= (
    aoLockNames, aoHandlePrompt, aoResDetails,
    aoResize, aoStructColor, aoExpandOrphans
  );
  TAliaOptions		= set of TAliaOption;

  TfmAlia		= class(TForm)
    vtGff: TVirtualStringTree;
    tbTop: TToolBar;
    pnTrees: TPanel;
    StatusBar: TStatusBar;
    pcPages: TPageControl;
    tsData: TTabSheet;
    tsSearch: TTabSheet;
    SplitTabsPages: TSplitter;
    imgIcons: TImageList;
    tbtNew: TToolButton;
    tbtOpen: TToolButton;
    tbtClose: TToolButton;
    tbtSaveAll: TToolButton;
    tbtSep1: TToolButton;
    tbtOptions: TToolButton;
    Actions: TActionList;
    actNew: TAction;
    actAbout: TAction;
    actOpen: TAction;
    actSave: TAction;
    actClose: TAction;
    actSaveAll: TAction;
    actOptions: TAction;
    actAdd: TAction;
    actCopy: TAction;
    actCut: TAction;
    actPaste: TAction;
    actFind: TAction;
    actFindNext: TAction;
    actFindFiles: TAction;
    actReplace: TAction;
    actPasteLink: TAction;
    actBookmark: TAction;
    actTest: TAction;
    actDelete: TAction;
    actFocus: TAction;
    popTree: TPopupMenu;
    tsScript: TTabSheet;
    meScript: TMemo;
    OpenDlg: TOpenDialog;
    ResTabs: TTabControl;
    vtFiles: TVirtualStringTree;
    SplitTrees: TSplitter;
    tsRes: TTabSheet;
    actScript: TAction;
    pcValue: TPageControl;
    SplitValueOptions: TSplitter;
    pnOptions: TPanel;
    tsNumericValue: TTabSheet;
    pnValue: TPanel;
    lbName: TLabel;
    edName: TEdit;
    lbIntValue: TLabel;
    lbIntBounds: TLabel;
    tsStringValue: TTabSheet;
    lbStrValue: TLabel;
    meText: TMemo;
    tsResRefValue: TTabSheet;
    lbResRefValue: TLabel;
    edResRefValue: TEdit;
    lbResRefBounds: TLabel;
    tsVoidValue: TTabSheet;
    sgVoid: TStringGrid;
    tsBlankValue: TTabSheet;
    tsStructValue: TTabSheet;
    lbStructId: TLabel;
    pnPages: TPanel;
    edIntValue: TEdit;
    imgFiles: TImageList;
    lbSig: TLabel;
    edSig: TEdit;
    edVer: TEdit;
    lbHeader: TLabel;
    meHeader: TMemo;
    pcRes: TPageControl;
    tsGff: TTabSheet;
    tsErf: TTabSheet;
    tsBif: TTabSheet;
    lbLabelArray: TLabel;
    sgLabels: TStringGrid;
    btEditLabels: TButton;
    lbRaw: TLabel;
    vtRaw: TVirtualStringTree;
    pnHeader: TPanel;
    pnLabels: TPanel;
    pnRaw: TPanel;
    edStructId: TEdit;
    actDebug: TAction;
    pnRes: TPanel;
    pcOptions: TPageControl;
    tsBlankOptions: TTabSheet;
    tsLocStringOptions: TTabSheet;
    tsIntegralOptions: TTabSheet;
    rbMale: TRadioButton;
    rbFemale: TRadioButton;
    cbLang: TComboBox;
    tsRealOptions: TTabSheet;
    tsStringOptions: TTabSheet;
    tsResRefOptions: TTabSheet;
    tsVoidOptions: TTabSheet;
    tsStructOptions: TTabSheet;
    tsListOptions: TTabSheet;
    lbVoidLen: TLabel;
    edVoidLen: TEdit;
    btVoidLen: TButton;
    lbVoidPos: TLabel;
    edVoidPos: TEdit;
    lbVoid8bit: TLabel;
    edVoid8bit: TEdit;
    lbVoid32bit: TLabel;
    edVoid32bit: TEdit;
    lbLabelIndex: TLabel;
    edLabelIndex: TEdit;
    lbLang: TLabel;
    lbStrRef: TLabel;
    edStrRef: TEdit;
    ckAltTlk: TCheckBox;
    bt2DAfind: TButton;
    cb2DAtype: TComboBox;
    lb2DAassoc: TLabel;
    cb2DAval: TComboBox;
    lbRealAs: TLabel;
    edRealAs: TEdit;
    lbMantissa: TLabel;
    edMantissa: TEdit;
    edExponent: TEdit;
    lbExponent: TLabel;
    lbSign: TLabel;
    rbRealHex: TRadioButton;
    rbRealBinary: TRadioButton;
    edSign: TEdit;
    lbRealForm: TLabel;
    btNewStrRef: TButton;
    btEditStrRef: TButton;
    actSaveAs: TFileSaveAs;
    tbtSaveAs: TToolButton;
    popFiles: TPopupMenu;
    lbErfDesc: TLabel;
    cbErfDesc: TComboBox;
    meErfDesc: TMemo;
    vtErf: TVirtualStringTree;
    pnDWstrref: TPanel;
    lbDWstrref: TLabel;
    meDWstrref: TMemo;
    cbType: TComboBox;
    lbType: TLabel;

    { Actions }
    procedure actNewExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveAsBeforeExecute(Sender: TObject);
    procedure actSaveAsAccept(Sender: TObject);
    procedure actSaveAllExecute(Sender: TObject);

    procedure actOptionsExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);

    procedure actScriptExecute(Sender: TObject);

    procedure actFocusExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);

    { Messages }
    {$IFDEF MSWINDOWS}
    procedure WM_DropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    {$ENDIF}

    { Events }

    procedure FormCreate(Sender: TObject);
    procedure FormAfterShow(var Message: TMessage); message WM_AFTERSHOW;
    procedure FormResize(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure StatusBarClick(Sender: TObject);

    procedure ResTabsChange(Sender: TObject);

    { vtFiles }
    procedure vtFilesGetImageIndex(
      Sender		: TBaseVirtualTree;
      Node		: PVirtualNode;
      Kind		: TVTImageKind;
      Column		: TColumnIndex;
      var Ghosted	: Boolean;
      var ImageIndex	: Integer
    );
    procedure vtFilesGetText(
      Sender		: TBaseVirtualTree;
      Node		: PVirtualNode;
      Column		: TColumnIndex;
      TextType		: TVSTTextType;
      var CellText	: WideString
    );
    procedure vtFilesPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure vtFilesChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vtFilesKeyPress(Sender: TObject; var Key: Char);
    procedure vtFilesFreeNode(Sender: TBaseVirtualTree;
      Node: PVirtualNode);

    { vtGff }
    procedure vtGffInitNode(
      Sender		: TBaseVirtualTree;
      ParentNode, Node	: PVirtualNode;
      var InitialStates	: TVirtualNodeInitStates
    );
    procedure vtGffInitChildren(
      Sender		: TBaseVirtualTree;
      Node		: PVirtualNode;
      var ChildCount	: Cardinal
    );
    procedure vtGffBeforeItemErase(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
      var ItemColor: TColor; var EraseAction: TItemEraseAction);
    procedure vtGffGetText(
      Sender		: TBaseVirtualTree;
      Node		: PVirtualNode;
      Column		: TColumnIndex;
      TextType		: TVSTTextType;
      var CellText	: WideString
    );
    procedure vtGffChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vtGffExpanded(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vtGffKeyDown(
      Sender		: TObject;
      var Key		: Word;
      Shift		: TShiftState
    );
    procedure vtGffKeyPress(Sender: TObject; var Key: Char);

    { vtErf }
    procedure vtErfBeforeItemErase(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; ItemRect: TRect;
      var ItemColor: TColor; var EraseAction: TItemEraseAction);
    procedure vtErfChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vtErfDblClick(Sender: TObject);
    procedure vtErfGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vtErfInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vtErfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure vtErfKeyPress(Sender: TObject; var Key: Char);

    procedure edNameKeyDown(
      Sender		: TObject;
      var Key		: Word;
      Shift		: TShiftState
    );
    procedure tsDataShow(Sender: TObject);
    procedure pnValueResize(Sender: TObject);
    procedure sgVoidKeyPress(Sender: TObject; var Key: Char);
    procedure sgVoidSelectCell(
      Sender		: TObject;
      ACol, ARow	: Integer;
      var CanSelect	: Boolean
    );
    procedure rbRealAsClick(Sender: TObject);
    procedure btNewStrRefClick(Sender: TObject);
    procedure btEditStrRefClick(Sender: TObject);

    procedure tsResShow(Sender: TObject);
    procedure vtRawGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vtRawInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);
    procedure vtRawInitChildren(Sender: TBaseVirtualTree;
      Node: PVirtualNode; var ChildCount: Cardinal);

    procedure tsScriptShow(Sender: TObject);
    procedure meScriptKeyPress(Sender: TObject; var Key: Char);
    procedure meScriptKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

    procedure ctrlChange(Sender: TObject);

  private

    Changing		: Boolean;
    CancelClose		: Boolean;

    StructColor		: TColor;

    Tip			: Byte;

    HexBuff		: Char;

    ScriptPos		: Integer;

    procedure NYI;

    procedure Status(const S: String);

    procedure ToggleRes(const Enabled: Boolean; const ResRec: PResRec = nil);

    procedure DoSettings;

    function Open(const Filename: String): PResRec;

    function LoadRes(
      const LetoFile	: TLetoFile;
      const Struct	: TErfStruct = nil;
      const ResName	: String = '';
      const Stream	: TStream = nil
    ): PResRec;

    procedure HandlePrompt(H: String; const ResRec: PResRec);

    procedure NewGff(ResRec: PResRec);
    procedure NewErf(ResRec: PResRec);
    procedure NewBif(ResRec: PResRec);
    procedure NewHeader(ResRec: PResRec);
    procedure NewRaw(ResRec: PResRec);

    procedure RawGffInitNode(Sender: TBaseVirtualTree; ParentNode,
      Node: PVirtualNode; var InitialStates: TVirtualNodeInitStates);

    function GetCurrTree: TVirtualStringTree;
    function GetResRec(const Tree: TBaseVirtualTree): PResRec;
    function GetRawResRec(const Tree: TBaseVirtualTree): PResRec;

    function GetLang: Cardinal;
    function GetText(const Field: TGffField): String;
    function GetFileType(const ResRec: PResRec): TLetoFileType;

    procedure ShowHex(const Field: TGffField);
    procedure ShowHexStats(const P: Integer; const Field: TGffField);
    procedure ShowReal(const Field: TGffField);
    procedure EditField(
      const VarType	: TGffVarType
    );

    procedure ScriptOutput(S: String);

    procedure Modified(const ResRec: PResRec);

  public

    CopyNode		: PVirtualNode;
    CutNode		: PVirtualNode;

    ScriptEnv		: TLetoScriptEnv;
    LetoScript		: TLetoScript;

    Settings		: TLetoXml;
    Options		: TAliaOptions;
    Tlk, TlkF		: TTlkFile;
    AltTlk, AltTlkF	: TTlkFile;

  end;

var
  fmAlia: TfmAlia;


implementation

{$R *.dfm}

uses
  Form_Options;

type
  TDebugCmd		= (
    dcBob, dcUber, dcAribeth, dcCoolGuy
  );

const
  TAG_NAME		= 1;
  TAG_INTEGRAL		= 2;
  TAG_TEXT		= 3;
  TAG_RESREF		= 4;
  TAG_VOID		= 5;
  TAG_STRUCTID		= 6;
  TAG_LANG		= 7;
  TAG_MALE		= 8;
  TAG_FEMALE		= 9;
  TAG_STRREF		= 10;
  TAG_CUSTOM_TLK	= 11;
  TAG_TYPE		= 12;

  Tips			: array[0..10] of String = (
    'Have you found the easter egg yet?',
    'Use F4 to quickly change focus between the files and tree panels.',
    'Ask questions and get help on the forums: http://weathersong.infopop.cc',
    'Hit F6 to jump straight into LetoScript.',
    'Bad StrRef',
    'Most actions can be accomplished with a right-click, or a keyboard shortcut.',
    'Be careful about overwriting the original. Use Ctrl+S to Save As.',
    'For easy character editing, use Leto. Alia is for advanced editing.',
    'Read the file format docs: http://nwn.bioware.com/developers',
    'Alia should work for NWN and KotOR, and possibly for DA and NWN2.',
    ''
  );


(*------------------------------------------------------------------------------

	Private

------------------------------------------------------------------------------*)


(*------------------------------------------------------------------------------
NYI

------------------------------------------------------------------------------*)
procedure TfmAlia.NYI;
begin
  ShowMessage('Not yet implemented.');
end;

(*------------------------------------------------------------------------------
Status

------------------------------------------------------------------------------*)
procedure TfmAlia.Status(const S: String);
begin
  StatusBar.SimpleText	:= S;
end;

(*------------------------------------------------------------------------------
ToggleRes

------------------------------------------------------------------------------*)
procedure TfmAlia.ToggleRes(const Enabled: Boolean; const ResRec: PResRec);
begin

  ResTabs.Enabled	:= Enabled;
  tsData.TabVisible	:= Enabled;
  tsRes.TabVisible	:= Enabled;

  if not Enabled then begin
    vtGff.BringToFront;
    Exit;
  end;

end;

(*------------------------------------------------------------------------------
DoSettings

------------------------------------------------------------------------------*)
procedure TfmAlia.DoSettings;
var
  TlkFilename		: String;
  AltTlkFilename	: String;
  Err			: TLetoError;
  Tree			: TVirtualStringTree;
  procedure _Set_(const Name: String; const Option: TAliaOption);
  begin
    if Settings.Root.Items.ItemNamed[Name].Value = '1' then
      Include(Options, Option);
  end;
  procedure _TryTlk_(const FN: String; const TlkFile: TTlkFile; const Chk: Boolean);
  begin
    if not Chk and not FileExists(FN) then Exit;
    Err			:= TlkFile.LoadFromFile(FN);
    if Err <> Success then
      MessageDlg(
        'Error loading ' + FN + ': ' +
        GetLetoError(Err),
        mtError, [mbOk], 0
      );
    Repaint;
  end;
begin
  Screen.Cursor		:= crHourglass;
  Repaint;

  _Set_('LockNames', aoLockNames);
  _Set_('HandlePrompt', aoHandlePrompt);
  _Set_('ExpandOrphans', aoExpandOrphans);
  _Set_('AutoResize', aoResize);
  _Set_('ResDetails', aoResDetails);
  _Set_('UseStructColor', aoStructColor);

  with Settings.Root.Items do begin
    cbLang.ItemIndex :=
      LangItoA( StrToIntDef(ItemNamed['DefaultLang'].Value, 0) );
    if ItemNamed['DefaultGender'].Value = '0' then
      rbMale.Checked	:= True
    else
      rbFemale.Checked	:= True;
    StructColor		:= StringToColor(ItemNamed['StructColor'].Value);
    { Tlk files }
    TlkFilename		:= Lowercase(ItemNamed['TlkFile'].Value);
    AltTlkFilename	:= Lowercase(ItemNamed['AltTlkFile'].Value);
    if TlkFilename = Tlk.FileName then
    else if TlkFilename = '' then
      Tlk.Close
    else if TlkFilename <> Tlk.FileName then begin
      _TryTlk_(TlkFileName, Tlk, True);
      _TryTlk_(StringReplace(TlkFilename, '.tlk', 'f.tlk', []), TlkF, False);
    end;
    if AltTlkFilename = AltTlk.FileName then
    else if AltTlkFilename = '' then
      AltTlk.Close
    else if AltTlkFilename <> AltTlk.FileName then begin
      _TryTlk_(AltTlkFileName, AltTlk, True);
      _TryTlk_(StringReplace(AltTlkFilename, '.tlk', 'f.tlk', []), AltTlkF, False);
    end;
  end;

  Tree			:= GetCurrTree;
  if Tree.Name = '' then begin
    Tree.InvalidateChildren(Tree.GetFirst, True);
    Tree.OnChange(Tree, Tree.GetFirstSelected);
  end;

  Screen.Cursor		:= crDefault;

end;

(*------------------------------------------------------------------------------
Open

------------------------------------------------------------------------------*)
function TfmAlia.Open(const Filename: String): PResRec;
var
  NewFile		: TLetoFile;
begin
  Status('Opening ' + Filename + '...');

  Repaint;
  Screen.Cursor		:= crHourglass;

  NewFile		:= TLetoFile.Create(Filename);
  if NewFile.Error <> Success then begin
    Status(
      'Error code ' +
      GetEnumName( TypeInfo(TLetoError), Integer(NewFile.Error) )
    );
    Screen.Cursor	:= crDefault;
    Repaint;
    MessageDlg(GetLetoError(NewFile.Error), mtError, [mbOk], 0);
    Repaint;
    Screen.Cursor	:= crHourglass;
    FreeAndNil(NewFile);
    Screen.Cursor	:= crDefault;
    Status('Ready');
    Exit;
  end;

  Result		:= LoadRes(NewFile);

  Screen.Cursor		:= crDefault;

end;

(*------------------------------------------------------------------------------
LoadRes

------------------------------------------------------------------------------*)
function TfmAlia.LoadRes(
  const LetoFile	: TLetoFile;
  const Struct		: TErfStruct;
  const ResName		: String;
  const Stream		: TStream
): PResRec;
var
  Node			: PVirtualNode;
  N			: String;
  FileType		: TLetoFileType;
  {$IFDEF LINUX}
  Tab                   : TTab;
  {$ENDIF}
begin

  Status('Building resource view...');

  Screen.Cursor		:= crHourglass;

  if Assigned(Struct) then
    Node		:= vtFiles.AddChild(vtFiles.GetFirstSelected)
  else
    Node		:= vtFiles.AddChild(nil);
  Result		:= vtFiles.GetNodeData(Node);
  Result.Node		:= Node;

  Result.LetoFile	:= LetoFile;
  Result.Struct		:= Struct;

  if Assigned(Stream) then
    Result.Stream	:= Stream;

  if Assigned(Struct) then begin
    Result.ResName	:= Struct.Name + '.' + GetResTypeName(Struct.ResTypeId);
    N			:= ExtractFileName(LetoFile.FileName);
    N			:= N + ': ' + Result.ResName;
  end else begin
    if ResName = '' then
      Result.ResName	:= ExtractFileName(LetoFile.FileName)
    else
      Result.ResName	:= ResName;
    N			:= Result.ResName;
  end;

  {$IFDEF MSWINDOWS}
  ResTabs.Tabs.AddObject(N, Pointer(Result));
  {$ELSE}
  ND.Tab		:= ResTabs.Tabs.Add(N);
  {$ENDIF}

  FileType		:= GetFileType(Result);

  case FileType of
    ftGFF..ft_GFF:
    begin
      NewGff(Result);
      Result.Tree.RootNodeCount := 1;
    end;
    ftERF..ft_ERF:
    begin
      NewErf(Result);
      Result.Tree.RootNodeCount := LetoFile.Erf.Count;
    end;
  end;

  with Result.Tree do begin
    Selected[GetFirst]	:= True;
    FocusedNode		:= GetFirst;
  end;

  { Fire off all the vtFilesOnChange stuff }
  vtFiles.FocusedNode := Node;
  vtFiles.Selected[Node] := True;
  if Assigned(Node.Parent) then
    vtFiles.Expanded[Node.Parent] := True;

  ActiveControl		:= vtFiles;

  Screen.Cursor		:= crDefault;

  { Give it a handle for scripting }
  if aoHandlePrompt in Options then begin
    Repaint;
    if Pos('.', N) > 0 then
      N			:= Copy(N, 1, Pos('.', N)-1);
    N			:= Uppercase(N);
    HandlePrompt(N, Result);
  end;

  Result.Modified	:= False;

  Status('Ready');

end;

(*------------------------------------------------------------------------------
HandlePrompt

------------------------------------------------------------------------------*)
procedure TfmAlia.HandlePrompt(H: String; const ResRec: PResRec);
var
  I			: Integer;
begin
  while InputQuery(
    'New Handle',
    'Enter the handle to use for this resource:',
    H
  ) do begin

    Repaint;

    if H = '' then Break;
    if H[1] = '%' then
      System.Delete(H, 1, 1);
    H			:= Uppercase(H);

    { Valid handle? }
    for I := 1 to Length(H) do
      if
        (
          ((I = 1) and not(H[I] in ['_', 'A'..'Z'])) or
          ((I > 1) and not(H[I] in ['_', 'A'..'Z', '0'..'9']))
        )
      then begin
        MessageDlg(
          'Invalid file handle. Use only a-Z and underscore.',
          mtError, [mbOk], 0
        );
        Repaint;
        Continue;
      end;

    { Unused? }
    if ScriptEnv.Handles.IndexOf(H) > -1 then begin
      MessageDlg('That handle is already in use.', mtError, [mbOk], 0);
      Repaint;
      Continue;
    end;

    { Okay, let's go to work! }
    ScriptEnv.Handle[H]	:= ResRec.LetoFile;
    ResRec.Handle	:= H;
    vtFiles.InvalidateNode(ResRec.Node);

    Break;

  end;

end;

(*------------------------------------------------------------------------------
NewGff

This prepares all of the new (visual) components associated with a new
GFF resource, sets them up, and gives the record all its pointers to them.

------------------------------------------------------------------------------*)
procedure TfmAlia.NewGff(ResRec: PResRec);
const
  NL			= sLineBreak + '  ';
var
  H			: TGffHeader;
  I			: Integer;
begin
  { Main tree }
  ResRec.Tree		:= TVirtualStringTree.Create(ResTabs);
  ResRec.Tree.Assign(vtGff);
  with ResRec.Tree do begin
    Parent		:= ResTabs;
    NodeDataSize	:= SizeOf(TGffNode);
    { Assign doesn't copy Events? }
    OnChange		:= vtGffChange;
    OnExpanded		:= vtGffExpanded;
    OnGetText		:= vtGffGetText;
    OnInitNode		:= vtGffInitNode;
    OnInitChildren	:= vtGffInitChildren;
    onKeyDown		:= vtGffKeyDown;
    OnKeyPress		:= vtGffKeyPress;
    OnBeforeItemErase	:= vtGffBeforeItemErase;
    BringToFront;
  end;

  { Fill out header }
  NewHeader(ResRec);
  if Assigned(ResRec.Struct) then
    H			:= ResRec.Struct.Gff.Header
  else
    H			:= ResRec.LetoFile.Gff.Header;
  with ResRec.Header do begin
    Lines.Add(H.Sig + H.Ver);
    Lines.Add('Struct Offset' + NL + IntToStr(H.StructOffset));
    Lines.Add('Struct Count' + NL + IntToStr(H.StructCount));
    Lines.Add('Field Offset' + NL + IntToStr(H.FieldOffset));
    Lines.Add('Field Count' + NL + IntToStr(H.FieldCount));
    Lines.Add('Label Offset' + NL + IntToStr(H.LabelOffset));
    Lines.Add('Label Count' + NL + IntToStr(H.LabelCount));
    Lines.Add('Data Offset' + NL + IntToStr(H.FieldDataOffset));
    Lines.Add('Data Size' + NL + IntToStr(H.FieldDataCount));
    Lines.Add('Field Indices Offset' + NL + IntToStr(H.FieldIndicesOffset));
    Lines.Add('Field Indices Count' + NL + IntToStr(H.FieldIndicesCount));
    Lines.Add('List Indices Offset' + NL + IntToStr(H.ListIndicesOffset));
    Lines.Add('List Indices Count' + NL + IntToStr(H.ListIndicesCount));
  end;

  if not(aoResDetails in Options) then Exit;

  if not Assigned(ResRec.Stream) then begin
    ResRec.Stream	:= TMemoryStream.Create;
    TMemoryStream(ResRec.Stream).LoadFromFile(ResRec.LetoFile.FileName);
  end;

  { Labels }
  ResRec.Stream.Seek(H.LabelOffset, 0);
  ResRec.Labels		:= TStringGrid.Create(pnLabels);
  with ResRec.Labels do begin
    Parent		:= pnLabels;
    Align		:= alClient;
    ScrollBars		:= ssVertical;
    Options		:= Options + [goDrawFocusSelected, goThumbTracking];
    FixedCols		:= 0;
    FixedRows		:= 0;
    ColCount		:= 2;
    RowCount		:= H.LabelCount;
    ColWidths[0]	:= 110;
    ColWidths[1]	:= 36;
    for I := 0 to H.LabelCount-1 do begin
      Cells[0, I]	:= ReadString(ResRec.Stream, 16);
      Cells[1, I]	:= IntToStr(I);
    end;
    BringToFront;
  end;

  { Raw }
  NewRaw(ResRec);
  ResRec.Raw.RootNodeCount := 5; { Init }

end;

(*------------------------------------------------------------------------------
NewErf

------------------------------------------------------------------------------*)
procedure TfmAlia.NewErf(ResRec: PResRec);
const
  NL			= sLineBreak + '  ';
var
  H			: TErfHeader;
begin

  { Main tree }
  ResRec.Tree		:= TVirtualStringTree.Create(ResTabs);
  ResRec.Tree.Assign(vtErf);
  with ResRec.Tree do begin
    Parent		:= ResTabs;
    NodeDataSize	:= SizeOf(TErfNode);
    OnBeforeItemErase	:= vtErfBeforeItemErase;
    OnChange		:= vtErfChange;
    OnDblClick		:= vtErfDblClick;
    OnGetText		:= vtErfGetText;
    OnInitNode		:= vtErfInitNode;
    onKeyDown		:= vtErfKeyDown;
    OnKeyPress		:= vtErfKeyPress;
    BringToFront;
  end;

  { Fill out header }
  NewHeader(ResRec);
  H			:= ResRec.LetoFile.Erf.Header;
  with ResRec.Header do begin
    Lines.Add(H.Sig + H.Ver);
    Lines.Add('Lang Count' + NL + IntToStr(H.LanguageCount));
    Lines.Add('LocString Size' + NL + IntToStr(H.LocalizedStringSize));
    Lines.Add('Entry Count' + NL + IntToStr(H.EntryCount));
    Lines.Add('LocString Offset' + NL + IntToStr(H.OffsetToLocalizedString));
    Lines.Add('KeyList Offset' + NL + IntToStr(H.OffsetToKeyList));
    Lines.Add('ResList Offset' + NL + IntToStr(H.OffsetToResourceList));
    Lines.Add('Build Year' + NL + IntToStr(H.BuildYear));
    Lines.Add('Build Day' + NL + IntToStr(H.BuildDay));
    Lines.Add('Desc StrRef' + NL + IntToStr(H.DescriptionStrRef));
  end;

  if not(aoResDetails in Options) then Exit;

  { Raw }

end;

(*------------------------------------------------------------------------------
NewBif

------------------------------------------------------------------------------*)
procedure TfmAlia.NewBif(ResRec: PResRec);
begin

end;

(*------------------------------------------------------------------------------
NewHeader

Creates and sets up the TMemo component used for header information.

------------------------------------------------------------------------------*)
procedure TfmAlia.NewHeader(ResRec: PResRec);
begin
  ResRec.Header		:= TMemo.Create(pnHeader);
  with ResRec.Header do begin
    Parent		:= pnHeader;
    Align		:= alClient;
    Font		:= meHeader.Font;
    ReadOnly		:= True;
    ScrollBars		:= ssVertical;
    BringToFront;
  end;

end;

(*------------------------------------------------------------------------------
NewRaw

Creates and sets up the (optional) TVirtualStringTree used to show raw
information about resources.

------------------------------------------------------------------------------*)
procedure TfmAlia.NewRaw(ResRec: PResRec);
begin
  ResRec.Raw		:= TVirtualStringTree.Create(pnRaw);
  ResRec.Raw.Assign(vtRaw);
  with ResRec.Raw do begin
    Parent		:= pnRaw;
    NodeDataSize	:= SizeOf(TRawRec);
    OnGetText		:= vtRawGetText;
    OnInitNode		:= vtRawInitNode;
    OnInitChildren	:= vtRawInitChildren;
    BringToFront;
  end;

end;

(*------------------------------------------------------------------------------
RawGffInitNode

------------------------------------------------------------------------------*)
procedure TfmAlia.RawGffInitNode(
  Sender		: TBaseVirtualTree;
  ParentNode, Node	: PVirtualNode;
  var InitialStates	: TVirtualNodeInitStates
);
var
  ResRec		: PResRec;
  ND			: PRawRec;
  H			: TGffHeader;
  Stream		: TStream;
  I			: Cardinal;
  S			: String;

  _Type, _Label,
    _StrRef, _Count,
    _Lang		: Cardinal;
  _Data			: array[1..8] of Byte;

  procedure _SpacedHexValue_(const Len: Byte);
  var
    I			: Cardinal;
  begin
    for I := Len downto 1 do
      _Data[I] := ReadInt(Stream, 1);
    for I := 1 to Len do
      ND.Value		:= ND.Value + IntToHex(_Data[I], 2) + ' ';
  end;

begin
  ResRec		:= GetResRec(Sender);
  ND			:= Sender.GetNodeData(Node);
  if not Assigned(ResRec) or not Assigned(ND) then Exit;

  { Root struct }
  if not Assigned(ParentNode) then begin
    Node.Dummy		:= 20 + Node.Index;
    case Node.Index of
      0: ND.Field	:= 'Struct Array (Id, Offset, Count)';
      1: ND.Field	:= 'Field Array (Type, Label, Data)';
      2: ND.Field	:= 'Field Data (Type, Label ... Offset, Data)';
      3: ND.Field	:= 'Field Index Array (Offset)';
      4: ND.Field	:= 'List Index Array (Index, Count ... Struct Array Index)';
    end;
    ND.Value		:= '';
    Include(InitialStates, ivsHasChildren);
    Exit;
  end;

  H			:= ResRec.LetoFile.Gff.Header;
  Stream		:= ResRec.Stream;

  ND.Field		:= IntToStr(Node.Index);
  if Length(ND.Field) < 4 then
    ND.Field		:= StringOfChar('0', 4-Length(ND.Field)) + ND.Field;

  if ParentNode.Dummy >= 20 then
    Node.Dummy		:= ParentNode.Dummy - 10;

  case ParentNode.Dummy of

    { Second-generation children }

    { Data }
    12:
    begin
      Stream.Seek(
        ResRec.DataIndices[ParentNode.Index], 0
      );
      _Type		:= ReadLong(Stream);
      ReadLong(Stream);
      I			:= ReadLong(Stream);
      ND.Field		:= IntToHex(I, 4);
      Stream.Seek(H.FieldDataOffset + I, 0);
      case TGffVarType(_Type) of
        gffDWord64, gffInt64, gffDouble:
          _SpacedHexValue_(8);
        gffString:
        begin
          I		:= ReadLong(Stream);
          ND.Value	:='Len ' + IntToStr(I);
          if I > 0 then
            ND.Value	:= ND.Value + ', ' + ReadString(Stream, I);
        end;
        gffResRef:
        begin
          I		:= Byte( ReadLong(Stream, 1) );
          ND.Value	:='Len ' + IntToStr(I);
          if I > 0 then
            ND.Value	:= ND.Value + ', ' + ReadString(Stream, I);
        end;
        gffLocString:
        begin
          I		:= ReadLong(Stream);
          _StrRef	:= ReadLong(Stream);
          _Count	:= ReadLong(Stream);
          if _StrRef = NO_STRREF then
            S		:= '-'
          else if _StrRef and TLK_FLAG_CUSTOM = TLK_FLAG_CUSTOM then
            S		:= IntToStr(_StrRef - TLK_FLAG_CUSTOM) + ' (custom)'
          else
            S		:= IntToStr(_StrRef);
          ND.Value :=
            'Size ' + IntToStr(I) + ', ' +
            'StrRef ' + S + ', ' +
            'Count ' + IntToStr(_Count) + '; ';
          // TODO 4: CHANGE: Third-gen children for LocStrings
          for I := 1 to _Count do begin
            _Lang	:= ReadLong(Stream);
            _Count	:= ReadLong(Stream);
            ND.Value := ND.Value +
              'Lang ' + IntToStr(_Lang) + ', ' +
              'Len ' + IntToStr(_Count) + ', ' +
              ReadString(Stream, _Count);
            if I < _Count then
              ND.Value	:= ND.Value + '; ';
          end;
        end; { LocString }
      end; { case _Type }
    end;

    { List Array }
    14:
    begin
      Stream.Seek(
        ResRec.ListIndices[ParentNode.Index] + 4 + (Node.Index * 4), 0
      );
      ND.Value		:= IntToHex( ReadInt(Stream), 4 );
    end;

    { First-generation children }

    20:
    begin
      Stream.Seek(
        H.StructOffset + (Node.Index * 12), 0
      );
      ND.Value :=
        IntToHex( ReadLong(Stream), 4 ) + ' ' +
        IntToHex( ReadLong(Stream), 4 ) + ' ' +
        IntToHex( ReadLong(Stream), 4 );
    end;

    21:
    begin
      Stream.Seek(
        H.FieldOffset + (Node.Index * 12), 0
      );
      _Type		:= ReadLong(Stream);
      _Label		:= ReadLong(Stream);
      ND.Value :=
        IntToHex( _Type, 4 ) + ' ' +
        IntToHex( _Label, 4 ) + ' ';
      _SpacedHexValue_(4);
      Stream.Seek(H.LabelOffset + (_Label * 16), 0);
      ND.Value := ND.Value +
        '(' + FieldTypeToStr(TGffVarType(_Type)) + ', ' +
        ReadString(Stream, 16) + ')';
    end;

    22:
    begin
      Stream.Seek(ResRec.DataIndices[Node.Index], 0);
      _Type		:= ReadLong(Stream);
      _Label		:= ReadLong(Stream);
      Stream.Seek(H.LabelOffset + (_Label * 16), 0);
      ND.Field		:= ReadString(Stream, 16);
      ND.Value		:= FieldTypeToStr(TGffVarType(_Type));
      Include(InitialStates, ivsHasChildren);
    end;

    23:
    begin
      Stream.Seek(
        H.FieldIndicesOffset + (Node.Index * 4), 0
      );
      ND.Value		:= IntToHex( ReadLong(Stream), 4 );
    end;

    24:
    begin
      Stream.Seek(ResRec.ListIndices[Node.Index], 0);
      I			:= ReadLong(Stream);
      ND.Value		:= IntToStr(I);
      if I > 0 then
        Include(InitialStates, ivsHasChildren);
    end;

  end;

end;

(*------------------------------------------------------------------------------
GetCurrTree

In doing away with CurrTree, a mechanism is needed to determine what VT is
currently in view. This method uses the simple trick of whatever is actually
the top control to determine that.

Use with caution. VTs can call events for trees that aren't actually in view.

Here's a neat trick: the .Controls[] array is ordered from bottom-most to
topmost, so [-1] is always the visible child! :)

------------------------------------------------------------------------------*)
function TfmAlia.GetCurrTree: TVirtualStringTree;
begin
  {$IFDEF MSWINDOWS}
  Result :=
    TVirtualStringTree(
      ResTabs.Controls[ ResTabs.ControlCount-1 ]
    );
  {$ENDIF}
  {$IFDEF LINUX}
  parentage probably does not work the same
  {$ENDIF}
end;

(*------------------------------------------------------------------------------
GetResRec

------------------------------------------------------------------------------
function TfmAlia.GetResRec(Index: Integer): PResRec;
{$IFDEF LINUX}
var
  Tab			: TTab;
  Node			: PVirtualNode;
{$ENDIF}
begin
  {$IFDEF MSWINDOWS}
  if Index = -1 then
    Index		:= ResTabs.TabIndex;
  if
    (Index < 0) or (Index > ResTabs.Tabs.Count-1) or
    not Assigned(ResTabs.Tabs.Objects[Index])
  then
    Result		:= nil
  else
    Result		:= PResRec(ResTabs.Tabs.Objects[Index]);
  {$ENDIF}
  {$IFDEF LINUX}
  not working yet!
  //Tab			:= ResTabs.Tabs[Index];
  {$ENDIF}
end;
*)

function TfmAlia.GetResRec(const Tree: TBaseVirtualTree): PResRec;
var
  Node			: PVirtualNode;
begin
  Node			:= vtFiles.GetFirst;
  while Assigned(Node) do begin
    Result		:= vtFiles.GetNodeData(Node);
    if Result.Tree = Tree then
      Exit;
    Node		:= vtFiles.GetNext(Node);
  end;
end;

(*------------------------------------------------------------------------------
GetRawResRec

Get the ResRec associated with this Raw Tree.

------------------------------------------------------------------------------*)
function TfmAlia.GetRawResRec(const Tree: TBaseVirtualTree): PResRec;
var
  Node			: PVirtualNode;
begin
  Node			:= vtFiles.GetFirst;
  while Assigned(Node) do begin
    Result		:= vtFiles.GetNodeData(Node);
    if Result.Raw = Tree then
      Exit;
    Node		:= vtFiles.GetNext(Node);
  end;

end;

(*------------------------------------------------------------------------------
GetLang

------------------------------------------------------------------------------*)
function TfmAlia.GetLang: Cardinal;
begin
  Result		:= LangNtoI(cbLang.Text) * 2;
  if rbFemale.Checked then
    Inc(Result);
end;

(*------------------------------------------------------------------------------
GetText

Retrieve the text for the given Field. This uses the current language setting
to look up text, and will also look up StrRefs, if enabled.

------------------------------------------------------------------------------*)
function TfmAlia.GetText(const Field: TGffField): String;
begin
  if Field.VarType <> gffLocString then
    Result		:= Field.AsString
  else if Tlk.Loaded and (Field.AsLocString.StringRef <> NO_STRREF) then
    Result		:= Tlk.GetString(Field.AsLocString.StringRef, rbFemale.Checked)
  else
    Result		:= Field.AsLocString[GetLang];
end;

(*------------------------------------------------------------------------------
GetFileType

------------------------------------------------------------------------------*)
function TfmAlia.GetFileType(const ResRec: PResRec): TLetoFileType;
begin
  if Assigned(ResRec.Struct) then
    Result		:= ResRec.Struct.Gff.FileType
  else
    Result		:= ResRec.LetoFile.FileType;
end;

(*------------------------------------------------------------------------------
ShowHex

For Void data types, when sgVoid comes into view, make sure it has enough
rows and columns, resize it if the panel has been resized, and populate each
field with a number.

------------------------------------------------------------------------------*)
procedure TfmAlia.ShowHex(const Field: TGffField);
var
  I, Col, Row		: Integer;
begin
  { Size }
  sgVoid.ColCount	:= (sgVoid.Width div sgVoid.DefaultColWidth) - 1;
  sgVoid.RowCount	:= (sgVoid.Height div sgVoid.DefaultRowHeight) + 5;
  if sgVoid.ColCount > sgVoid.VisibleColCount then
    sgVoid.ColCount	:= sgVoid.VisibleColCount;

  { Clear }
  HexBuff		:= #0;
  for Col := 0 to sgVoid.ColCount-1 do
    for Row := 0 to sgVoid.RowCount-1 do
      sgVoid.Cells[Col, Row] := '';

  { Populate }
  Col			:= 0;
  Row			:= 0;
  for I := 0 to Length(Field.Data.AsVoid)-1 do begin
    sgVoid.Cells[Col, Row] :=
      IntToHex( Integer(Field.Data.AsVoid[I]), 2 );
    Inc(Col);
    if Col > sgVoid.ColCount-1 then begin
      Col		:= 0;
      Inc(Row);
      if Row > sgVoid.RowCount-1 then
        sgVoid.RowCount	:= Row+1;
    end;
  end;

  { GUI }
  sgVoid.Col		:= 0;
  sgVoid.Row		:= 0;
  ShowHexStats(0, Field);

end;

(*------------------------------------------------------------------------------
ShowHexStats

Statistical information on the current byte when editing a Void.

------------------------------------------------------------------------------*)
procedure TfmAlia.ShowHexStats(const P: Integer; const Field: TGffField);
var
  Len			: Integer;
  IntBuff		: array[0..3] of Byte;
  I			: Integer;
begin
  Len			:= Length(Field.Data.AsVoid);

  edVoidLen.Text	:= IntToStr(Len);
  edVoidPos.Text	:= IntToStr(P);
  if Len > 0 then
    edVoid8Bit.Text	:= IntToStr( Integer(Field.Data.AsVoid[P]) );

  if P+3 < Len then begin
    for I := 0 to 3 do
      IntBuff[I]	:= Field.Data.AsVoid[P+I];
    edVoid32bit.Text	:= IntToStr( Integer(IntBuff) );
  end else
    edVoid32Bit.Text	:= '';

end;

(*------------------------------------------------------------------------------
ShowReal

Some trivial aspects about the Real currently being displayed. Maybe useful
to some comp sci student. ;p

Using the absolute directive is a neat trick, though.

------------------------------------------------------------------------------*)
procedure TfmAlia.ShowReal(const Field: TGffField);
var
  F			: Single;
  D			: Double;
  I			: Integer absolute F;
  I64			: Int64 absolute D;
  Sign			: ShortInt;
  Exp			: Integer;
  Man			: Extended;
  sMan			: String;
begin
  Sign			:= 0;

  case Field.VarType of

    gffFloat:
    begin
      F			:= Field.AsFloat;
      if rbRealHex.Checked then
        edRealAs.Text	:= IntToHex(I, 8)
      else
        edRealAs.Text	:= IntToBin(I, 32);
      Sign		:= (I and $80000000) shr 31;
      if I = 0 then begin
        Exp		:= 0;
        Man		:= 0;
      end else begin
        Frexp(F, Man, Exp);
        Dec(Exp);
        Man		:= Man * 2; { Normalize, IEEE 754 }
        {
        Exp		:= ( (I and $7F800000) shr 23 ) - 127;
        Man		:= 1 + (1 / Swap32((I and $007FFFFF) shl ?));
        }
      end;
      sMan		:= FloatToStrF(Man, ffGeneral, 7, 7);
    end;

    gffDouble:
    begin
      D			:= Field.AsDouble;
      if rbRealHex.Checked then
        edRealAs.Text	:= IntToHex(I64, 16)
      else
        edRealAs.Text	:= IntToBin(I64, 64);
      Sign		:= (I64 and $8000000000000000) shr 63;
      if I64 = 0 then begin
        Exp		:= 0;
        Man		:= 0;
      end else begin
        // TODO 5: VERIFY: Frexp on Doubles
        Frexp(D, Man, Exp);
        Dec(Exp);
        Man		:= Man * 2; { Normalize, IEEE 754 }
        {
        Exp		:= ( (I and $7FF0000000000000) shr 52 ) - 127;
        }
      end;
      sMan		:= FloatToStrF(Man, ffGeneral, 15, 15);
    end;

  end;

  edSign.Text		:= IntToStr(Sign);
  edExponent.Text	:= IntToStr(Exp);
  edMantissa.Text	:= sMan;
  if I = 0 then
    lbRealForm.Caption := 'Formula: (zero)'
  else
    lbRealForm.Caption :=
      'Formula: ' +
      sMan +
      ' * 2**' +
      IntToStr(Exp);

end;

(*------------------------------------------------------------------------------
EditField

------------------------------------------------------------------------------*)
procedure TfmAlia.EditField(
  const VarType		: TGffVarType
);
  procedure _Focus_(const Edit: TEdit);
  begin
    ActiveControl	:= Edit;
    Edit.SelStart	:= 0;
    Edit.SelLength	:= Length(Edit.Text);
  end;
begin

  pcPages.ActivePage	:= tsData;

  case VarType of
    gffByte..gffDouble:
      _Focus_(edIntValue);
    gffString, gffLocString:
      ActiveControl := meText;
    gffResRef:
      _Focus_(edResRefValue);
    gffVoid:
      ActiveControl := sgVoid;
    gffStruct:
      _Focus_(edStructId);
  end;

end;

(*------------------------------------------------------------------------------
ScriptOutput

------------------------------------------------------------------------------*)
procedure TfmAlia.ScriptOutput(S: String);
begin
  meScript.SelText	:= S;
end;

(*------------------------------------------------------------------------------
Modified

Flag the current resource as modified.

------------------------------------------------------------------------------*)
procedure TfmAlia.Modified(const ResRec: PResRec);
var
  P			: PResRec;
begin
  if not Assigned(ResRec) or ResRec.Internal then Exit;

  if Assigned(ResRec.Struct) then begin
    P			:= vtFiles.GetNodeData(ResRec.Node.Parent);
    P.Modified		:= True;
    vtFiles.InvalidateNode(ResRec.Node.Parent);
  end else begin
    ResRec.Modified	:= True;
    vtFiles.InvalidateNode(ResRec.Node);
  end;

end;


(*------------------------------------------------------------------------------

	Actions

------------------------------------------------------------------------------*)


(*------------------------------------------------------------------------------
New

------------------------------------------------------------------------------*)
procedure TfmAlia.actNewExecute(Sender: TObject);
begin
  NYI;
end;

(*------------------------------------------------------------------------------
Open

------------------------------------------------------------------------------*)
procedure TfmAlia.actOpenExecute(Sender: TObject);
begin
  Repaint;

  OpenDlg.FileName	:= '';
  if not OpenDlg.Execute then Exit;

  Open(OpenDlg.FileName);

end;

(*------------------------------------------------------------------------------
Close

------------------------------------------------------------------------------*)
procedure TfmAlia.actCloseExecute(Sender: TObject);
var
  Node, DelNode		: PVirtualNode;
  ResRec		: PResRec;
  Confirm		: Integer;
begin
  Node			:= vtFiles.GetFirstSelected;
  ResRec		:= vtFiles.GetNodeData(Node);
  if not Assigned(ResRec) then Exit;

  { Close all children (may be modified structs) }
  vtFiles.DeleteChildren(Node);

  { Save changes? }
  if not Assigned(ResRec.Struct) and ResRec.Modified then begin
    Confirm := MessageDlg(
      'Save changes to ' + ResRec.ResName + '?',
      mtConfirmation, [mbYes, mbNo, mbCancel], 0
    );
    Repaint;
    case Confirm of
      mrYes:
      begin
        Status('Saving ' + ResRec.ResName + '...');
        Screen.Cursor := crHourglass;
        ResRec.LetoFile.Save;
        Screen.Cursor := crDefault;
      end;
      mrCancel:
      begin
        CancelClose	:= True;
        Exit;
      end;
    end;
  end;

  Screen.Cursor		:= crHourglass;

  Status('Closing ' + ResRec.ResName + '...');

  { Change and delete node - calls OnFreeNode }
  DelNode		:= Node;
  if Assigned(ResRec.Struct) then
    Node		:= Node.Parent
  else if Assigned(Node.PrevSibling) then
    Node		:= Node.PrevSibling
  else
    Node		:= Node.NextSibling;
  if Assigned(Node) then begin
    vtFiles.FocusedNode := Node;
    vtFiles.Selected[Node] := True;
    vtFiles.DeleteNode(DelNode);
  end else begin
    vtFiles.DeleteNode(DelNode);
    ToggleRes(False);
  end;

  Repaint;

  Status('Ready');

  Screen.Cursor		:= crDefault;

end;

(*------------------------------------------------------------------------------
Save

------------------------------------------------------------------------------*)
procedure TfmAlia.actSaveExecute(Sender: TObject);
begin
  NYI;
end;

(*------------------------------------------------------------------------------
SaveAs BeforeExecute

------------------------------------------------------------------------------*)
procedure TfmAlia.actSaveAsBeforeExecute(Sender: TObject);
var
  Node			: PVirtualNode;
  ResRec		: PResRec;
begin
  Node			:= vtFiles.GetFirstSelected;
  if not Assigned(Node) then Exit;
  ResRec		:= vtFiles.GetNodeData(Node);
  if not Assigned(ResRec) then Exit;

  actSaveAs.Dialog.FileName := ResRec.ResName;

end;

(*------------------------------------------------------------------------------
SaveAs Accept

------------------------------------------------------------------------------*)
procedure TfmAlia.actSaveAsAccept(Sender: TObject);
var
  F			: String;
  ResRec			: PResRec;
  Struct		: TErfStruct;
  Err			: TLetoError;
begin
  Repaint;

  F			:= actSaveAs.Dialog.FileName;
  ResRec		:= vtFiles.GetNodeData(vtFiles.GetFirstSelected);

  Screen.Cursor		:= crHourglass;

  Struct		:= ResRec.Struct;

  if Assigned(Struct) then begin
    Status('Exporting ' + F + '...');
    Err			:= ResRec.LetoFile.Erf.ExportToFile(Struct, F);
    Status('');
    if Err <> Success then
      MessageDlg(
        'Error exporting ' + F + ': ' +
        GetLetoError(Err),
        mtError, [mbOk], 0
      )
    else if
      IsGffType(Struct.ResTypeId) and
      (MessageDlg(
        'Open exported file in new tab?',
        mtConfirmation, [mbYes, mbNo], 0
      ) = mrYes)
    then
      Open(F);
  end else begin
    Status('Saving ' + F + '...');
    ResRec.LetoFile.Save(F);
    ResRec.Modified	:= False;
    vtFiles.Invalidate;
  end;

  vtFiles.Invalidate;

  Screen.Cursor		:= crDefault;
  Status('Ready');

end;

(*------------------------------------------------------------------------------
SaveAll

------------------------------------------------------------------------------*)
procedure TfmAlia.actSaveAllExecute(Sender: TObject);
begin
  NYI;
end;

(*------------------------------------------------------------------------------
Options

------------------------------------------------------------------------------*)
procedure TfmAlia.actOptionsExecute(Sender: TObject);
var
  fmOptions		: TfmOptions;
begin
  fmOptions		:= TfmOptions.Create(self);
  fmOptions.tvPages.Selected :=
    fmOptions.tvPages.Items[OPTIONS_PAGE_GEN];
  fmOptions.ShowModal;
  DoSettings;
end;

(*------------------------------------------------------------------------------
About

------------------------------------------------------------------------------*)
procedure TfmAlia.actAboutExecute(Sender: TObject);
var
  fmOptions		: TfmOptions;
begin
  fmOptions		:= TfmOptions.Create(self);
  fmOptions.tvPages.Selected :=
    fmOptions.tvPages.Items[OPTIONS_PAGE_GEN];
  fmOptions.ShowModal;
  DoSettings;
end;

(*------------------------------------------------------------------------------
Script

------------------------------------------------------------------------------*)
procedure TfmAlia.actScriptExecute(Sender: TObject);
begin
  pcPages.ActivePage	:= tsScript;
end;

(*------------------------------------------------------------------------------
Focus

------------------------------------------------------------------------------*)
procedure TfmAlia.actFocusExecute(Sender: TObject);
var
  Tree			: TVirtualStringTree;
begin
  Tree			:= GetCurrTree;
  if (ActiveControl = vtFiles) and (Tree.Name = '') then
    ActiveControl	:= Tree
  else
    ActiveControl	:= vtFiles;
end;

(*------------------------------------------------------------------------------
Debug

------------------------------------------------------------------------------*)
procedure TfmAlia.actDebugExecute(Sender: TObject);
var
  S			: String;
  I			: Integer;
  Cmd			: TDebugCmd;
  Stream		: TResourceStream;
  DebugFile		: TLetoFile;
  ResRec		: PResRec;
begin
  if
    (ActiveControl <> vtFiles) or
    not InputQuery('Debug', 'Enter debug command', S)
  then
    Exit;

  Repaint;

  I			:= GetEnumValue(TypeInfo(TDebugCmd), 'dc' + S);
  if I < 0 then Exit;

  Cmd			:= TDebugCmd(I);

  case Cmd of

    dcBob:
    begin
      Stream := TResourceStream.Create(
        HInstance, 'ALIA_FILE_BOB', RT_RCDATA
      );
      DebugFile		:= TLetoFile.Create(ftGFF, '');
      DebugFile.Gff.LoadFromStream(Stream);
      Screen.Cursor		:= crHourglass;
      ResRec			:= LoadRes(DebugFile, nil, 'Bob', Stream);
      ResRec.Internal		:= True;
      Screen.Cursor		:= crDefault;
    end;

    dcUber: ;

    dcAribeth: ;

    dcCoolGuy: ;

  end;

end;


(*------------------------------------------------------------------------------

	Messages

------------------------------------------------------------------------------*)


(*------------------------------------------------------------------------------
WM_DropFiles

Drag and drop of files onto Alia.

------------------------------------------------------------------------------*)
{$IFDEF MSWINDOWS}
procedure TfmAlia.WM_DropFiles(var Msg: TWMDropFiles);
var
  Filename		: array [0..MAX_PATH] of Char;
  DropFile		: TLetoFile;
begin
  DragQueryFile(Msg.Drop, 0, Filename, SizeOf(Filename));

  try

  Repaint;
  Screen.Cursor		:= crHourglass;

  DropFile		:= TLetoFile.Create(FileName);
  if DropFile.Error <> Success then begin
    Screen.Cursor	:= crDefault;
    Repaint;
    MessageDlg(GetLetoError(DropFile.Error), mtError, [mbOk], 0);
    Repaint;
    Screen.Cursor	:= crHourglass;
    FreeAndNil(DropFile);
    Screen.Cursor	:= crDefault;
    Exit;
  end;

  LoadRes(DropFile);

  Screen.Cursor		:= crDefault;

  finally
    DragFinish(Msg.Drop);
  end;

end;
{$ENDIF}


(*------------------------------------------------------------------------------

	Events

------------------------------------------------------------------------------*)


(*------------------------------------------------------------------------------
Form Create

------------------------------------------------------------------------------*)
procedure TfmAlia.FormCreate(Sender: TObject);
begin
  PostMessage(Handle, WM_AFTERSHOW, 0, 0);
end;

(*------------------------------------------------------------------------------
Form AfterShow

------------------------------------------------------------------------------*)
procedure TfmAlia.FormAfterShow(var Message: TMessage);
var
  Filter		: String;
begin
  Screen.Cursor		:= crHourglass;

  Status('Initializing...');

  Randomize;

  MakeLangList(cbLang.Items);
  MakeLangList(cbErfDesc.Items);
  cbErfDesc.Items.Add('StringRef: not set');

  Tlk			:= TTlkFile.Create;
  AltTlk		:= TTlkFile.Create;
  TlkF			:= TTlkFile.Create;
  AltTlkF		:= TTlkFile.Create;
  Tlk.Female		:= TlkF;
  Tlk.Alternate		:= AltTlk;
  AltTlk.Female		:= AltTlkF;

  { Accept basic drag and drop. }
  {$IFDEF MSWINDOWS}
  DragAcceptFiles(Handle, True);
  {$ENDIF}

  Filter :=
    'Supported types|' +
      GffFileExtensions + ';' +
      ErfFileExtensions + '|' +
    'GFF files|' + GffFileExtensions + '|' +
    'ERF files|' + ErfFileExtensions + '|' +
    'All files|*.*';
  OpenDlg.Filter	:= Filter;
  actSaveAs.Dialog.Filter := Filter;

  vtFiles.NodeDataSize	:= SizeOf(TResRec);

  ToggleRes(False);

  { Scripting }
  ScriptEnv		:= TLetoScriptEnv.Create;
  with ScriptEnv do begin
    Params.Warnings	:= True;
    Params.Embedded	:= True;
    OnOutput		:= ScriptOutput;
    Name		:= 'Alia';
  end;
  LetoScript		:= TLetoScript.Create(ScriptEnv);
  meScript.Text		:= 'LetoScript> ';
  ScriptPos		:= 12;
  meScript.SelStart	:= 12;

  { Load settings }
  Status('Loading settings and TLK files...');
  Settings := TLetoXml.Create(
    ExtractFileDir(Application.ExeName) + '/Settings.xml'
  );
  { Defaults }
  with Settings.Root do begin
    Name		:= 'Alia_Settings';
    Props.Establish('version', LetoVersion);
    Establish('LockNames', '1');
    Establish('HandlePrompt', '0');
    Establish('ExpandOrphans', '0');
    Establish('AutoResize', '0');
    Establish('ResDetails', '1');
    Establish('UseStructColor', '0');
    Establish('StructColor', '0');
    Establish('DefaultLang', '0');
    Establish('DefaultGender', '0');
    Establish('TlkFile', '');
    Establish('AltTlkFile', '');
  end;
  { Implement settings }
  DoSettings;

  Screen.Cursor		:= crDefault;

  Status('Welcome to the Alia beta test. Click here for tips.');
  Tip			:= 0;

end;

(*------------------------------------------------------------------------------
Form Resize

fmAlia default Width x Height: 630 x 540

------------------------------------------------------------------------------*)
procedure TfmAlia.FormResize(Sender: TObject);
var
  W, H			: Integer;
begin
  if not(aoResize in Options) then Exit;

  W			:= fmAlia.Width;
  H			:= fmAlia.Height;

  pnTrees.Height	:= (H div 2) - 50;
  vtFiles.Width		:= (W - 30) div 3;
  vtFiles.Header.Columns[0].Width := (vtFiles.Width div 2) + 20;
  pnValue.Width		:= (W - 30) div 2;

end;

(*------------------------------------------------------------------------------
Form CloseQuery

------------------------------------------------------------------------------*)
procedure TfmAlia.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  Node			: PVirtualNode;
begin
  CancelClose		:= False;
  Node			:= vtFiles.GetFirst;
  while Assigned(Node) do begin
    actClose.Execute;
    if CancelClose then begin
      CanClose		:= False;
      Exit;
    end;
    Node		:= vtFiles.GetFirst;
  end;

  Screen.Cursor		:= crHourglass;

  Status('Saving settings...');

  Settings.SaveToFile(ExtractFileDir(Application.ExeName) + '/Settings.xml');
  FreeAndNil(Settings);

  Status('Saving TLK changes...');

  { It's probably just not a good idea to be able to edit these.
  if Tlk.Modified then Tlk.SaveToFile;
  if TlkF.Modified then TlkF.SaveToFile;
  }
  if AltTlk.Modified then
    AltTlk.SaveToFile;
  if AltTlkF.Modified then
    AltTlkF.SaveToFile;

  Status('Teardown...');

  FreeAndNil(LetoScript);
  FreeAndNil(ScriptEnv);

  FreeAndNil(Tlk);
  FreeAndNil(TlkF);
  FreeAndNil(AltTlk);
  FreeAndNil(AltTlkF);

  Screen.Cursor		:= crDefault;
end;

(*------------------------------------------------------------------------------
StatusBar Click

------------------------------------------------------------------------------*)
procedure TfmAlia.StatusBarClick(Sender: TObject);
var
  NewTip		: Byte;
begin
  repeat
    NewTip		:= Random(Length(Tips))
  until NewTip <> Tip;

  Status(Tips[NewTip]);
  Tip			:= NewTip;

end;

(*------------------------------------------------------------------------------
ResTabs Change

------------------------------------------------------------------------------*)
procedure TfmAlia.ResTabsChange(Sender: TObject);
var
  ResRec		: PResRec;
begin
  {$IFDEF MSWINDOWS}
  ResRec		:= PResRec(ResTabs.Tabs.Objects[ResTabs.TabIndex]);
  vtFiles.Selected[ResRec.Node] := True;
  {$ENDIF}
  {$IFDEF LINUX}
  not yet implemented!
  // Use TTab control as a parent and just bring it to front?
  {$ENDIF}
end;

(*------------------------------------------------------------------------------
vtFiles GetImageIndex

------------------------------------------------------------------------------*)
procedure TfmAlia.vtFilesGetImageIndex(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode;
  Kind			: TVTImageKind;
  Column		: TColumnIndex;
  var Ghosted		: Boolean;
  var ImageIndex	: Integer
);
var
  ND			: PResRec;
  FileType		: TLetoFileType;
begin
  if Column <> 0 then Exit;
  ND			:= Sender.GetNodeData(Node);
  if not Assigned(ND) or (vsDeleting in Node.States) then Exit;
  FileType		:= GetFileType(ND);
  case FileType of
    ftGFF..ft_GFF:
      ImageIndex	:= 0;
    ftERF..ft_ERF:
      ImageIndex	:= 1;
  end;
end;

(*------------------------------------------------------------------------------
vtFiles GetText

------------------------------------------------------------------------------*)
procedure TfmAlia.vtFilesGetText(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode;
  Column		: TColumnIndex;
  TextType		: TVSTTextType;
  var CellText		: WideString
);
var
  ResRec		: PResRec;
begin
  ResRec		:= vtFiles.GetNodeData(Node);
  case Column of
    0: CellText		:= ResRec.ResName;
    1:
      if ResRec.Handle = '' then
        CellText	:= '[unassigned]'
      else
        CellText	:= '%' + ResRec.Handle;
  end;
end;

(*------------------------------------------------------------------------------
vtFiles PaintText

------------------------------------------------------------------------------*)
procedure TfmAlia.vtFilesPaintText(
  Sender		: TBaseVirtualTree;
  const TargetCanvas	: TCanvas;
  Node			: PVirtualNode;
  Column		: TColumnIndex;
  TextType		: TVSTTextType
);
var
  ND			: PResRec;
begin
  ND			:= Sender.GetNodeData(Node);
  if not Assigned(ND) then Exit;

  case Column of
    0:
    if ND.Internal then
      TargetCanvas.Font.Color := clGray
    else if ND.Modified then
      TargetCanvas.Font.Style := [fsBold];

  end;

end;

(*------------------------------------------------------------------------------
vtFiles Change

------------------------------------------------------------------------------*)
procedure TfmAlia.vtFilesChange(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode
);
var
  ResRec		: PResRec;
  FileType		: TLetoFileType;
  I			: Integer;
  S			: String;
begin
  ResRec		:= Sender.GetNodeData(Node);
  if not Assigned(ResRec) or (vsDeleting in Node.States) then Exit;

  ToggleRes(True, ResRec);

  ResRec.Tree.BringToFront;

  { Select this node's tab, if it isn't already. }
  for I := 0 to ResTabs.Tabs.Count-1 do
    if
      Assigned(ResTabs.Tabs.Objects[I]) and
      ( PResRec(ResTabs.Tabs.Objects[I]) = ResRec )
    then begin
      ResTabs.TabIndex := I;
      Break;
    end;

  ResRec.Header.BringToFront;

  if Assigned(ResRec.Raw) then
    ResRec.Raw.BringToFront
  else
    vtRaw.BringToFront;

  {
  if aoLockNames in Options then begin
    edName.ReadOnly	:= True;
    edName.Color	:= clBtnFace;
  end else begin
    edName.ReadOnly	:= False;
    edName.Color	:= clWindow;
  end;
  }

  FileType		:= GetFileType(ResRec);
  if Assigned(ResRec.Struct) then begin
    edSig.Text		:= ResRec.Struct.Gff.Signature;
    edVer.Text		:= ResRec.Struct.Gff.Version;
  end else begin
    edSig.Text		:= ResRec.LetoFile.Signature;
    edVer.Text		:= ResRec.LetoFile.Version;
  end;

  Changing		:= True;

  lbLabelIndex.Visible	:= FileType in [ftGFF..ft_GFF];
  edLabelIndex.Visible	:= lbLabelIndex.Visible;

  case FileType of

    ftGFF..ft_GFF:
    begin
      pcRes.ActivePage	:= tsGff;
      if Assigned(ResRec.Labels) then
        ResRec.Labels.BringToFront
      else
        sgLabels.BringToFront;
    end;

    ftERF..ft_ERF:
    begin
      pcRes.ActivePage	:= tsErf;
      tsData.TabVisible	:= False;
      cbErfDesc.ItemIndex := -1;
      if ResRec.LetoFile.Erf.DescStrRef = NO_STRREF then
        S		:= '(not set)'
      else
        S		:= IntToStr(ResRec.LetoFile.Erf.DescStrRef);
      cbErfDesc.Items[cbErfDesc.Items.Count-1] :=
        'StringRef: ' + S;
      meErfDesc.Clear;
    end;

  end;

  Changing		:= False;

  ResRec.Tree.OnChange(ResRec.Tree, ResRec.Tree.GetFirstSelected);

end;

(*------------------------------------------------------------------------------
vtFiles KeyPress

------------------------------------------------------------------------------*)
procedure TfmAlia.vtFilesKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = '`' then
    actDebug.Execute;
end;

(*------------------------------------------------------------------------------
vtFiles FreeNode

------------------------------------------------------------------------------*)
procedure TfmAlia.vtFilesFreeNode(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode
);
var
  ND			: PResRec;
  I			: Integer;
  FileType		: TLetoFileType;
begin

  ND			:= Sender.GetNodeData(Node);
  if not Assigned(ND) then Exit;
  
  FileType		:= GetFileType(ND);

  { Find its tab and delete it }
  for I := 0 to ResTabs.Tabs.Count-1 do
    if PResRec(ResTabs.Tabs.Objects[I]) = ND then begin
      ResTabs.Tabs.Delete(I);
      Break;
    end;

  { Remove handle }
  if ND.Handle <> '' then
    ScriptEnv.Handle[ND.Handle] := nil;

  { Destroy associated components }
  ND.Tree.OnChange := nil;
  FreeAndNil(ND.Tree);
  FreeAndNil(ND.Header);
  if Assigned(ND.Raw) then
    FreeAndNil(ND.Raw);
  if Assigned(ND.Stream) then
    FreeAndNil(ND.Stream);
  SetLength(ND.DataIndices, 0);
  SetLength(ND.ListIndices, 0);
  case FileType of
    ftGFF..ft_GFF:
      if Assigned(ND.Labels) then
        FreeAndNil(ND.Labels);
  end;

  { Close / Free file }
  if Assigned(ND.Struct) then
    ND.LetoFile.Erf.Close(ND.Struct)
  else
    FreeAndNil(ND.LetoFile);

end;

(*------------------------------------------------------------------------------
vtGff InitNode

------------------------------------------------------------------------------*)
procedure TfmAlia.vtGffInitNode(
  Sender		: TBaseVirtualTree;
  ParentNode, Node	: PVirtualNode;
  var InitialStates	: TVirtualNodeInitStates
);
var
  ND			: PGffNode;
  PD			: PGffNode;
begin
  ND			:= Sender.GetNodeData(Node);
  if not Assigned(ND) then Exit;

  ND.ResRec		:= GetResRec(Sender);
  if Assigned(ND.ResRec.Struct) then
    ND.Gff		:= ND.ResRec.Struct.Gff
  else
    ND.Gff		:= ND.ResRec.LetoFile.Gff;

  { Root struct }
  if not Assigned(ParentNode) then begin
    ND.Field		:= ND.Gff.Root;
    InitialStates := InitialStates +
      [ ivsHasChildren, ivsExpanded ];
    Exit;
  end;

  PD			:= Sender.GetNodeData(ParentNode);

  case PD.Field.VarType of

    gffStruct, gffList:
    begin
      { ChildOfIndex is not particularly efficient, but it's necessary
        in order to use the recommended "virtual paradigm" of the
        VirtualTree component.
      }
      ND.Field		:= PD.Field.ChildOfIndex(Node.Index);
      if
        (ND.Field.VarType in [gffStruct, gffList]) and
        (ND.Field.Count > 0)
      then
        Include(InitialStates, ivsHasChildren);
    end;

  end;

end;

(*------------------------------------------------------------------------------
vtGff InitChildren

------------------------------------------------------------------------------*)
procedure TfmAlia.vtGffInitChildren(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode;
  var ChildCount	: Cardinal
);
var
  ND			: PGffNode;
begin
  ND			:= Sender.GetNodeData(Node);
  ChildCount		:= ND.Field.Count;
end;

(*------------------------------------------------------------------------------
vtGff BeforeItemErase

------------------------------------------------------------------------------*)
procedure TfmAlia.vtGffBeforeItemErase(
  Sender		: TBaseVirtualTree;
  TargetCanvas		: TCanvas;
  Node			: PVirtualNode;
  ItemRect		: TRect;
  var ItemColor		: TColor;
  var EraseAction	: TItemEraseAction
);
var
  ND			: PGffNode;
begin
  if not(aoStructColor in Options) or (StructColor = clNone) then Exit;

  ND			:= Sender.GetNodeData(Node);

  if
    Assigned(ND) and Assigned(ND.Field) and
    (ND.Field.VarType = gffStruct)
  then begin
    ItemColor		:= StructColor;
    EraseAction		:= eaColor;
  end;

end;

(*------------------------------------------------------------------------------
vtGff GetText

------------------------------------------------------------------------------*)
procedure TfmAlia.vtGffGetText(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode;
  Column		: TColumnIndex;
  TextType		: TVSTTextType;
  var CellText		: WideString
);
var
  ND			: PGffNode;
begin
  ND			:= Sender.GetNodeData(Node);

  case Column of

    0:
      if ND.Field.Name <> '' then
        CellText	:= ND.Field.Name
      else if ND.Field.VarType = gffStruct then
        CellText	:= 'Struct'
      else
        CellText	:= '[ unnamed ]';

    1:
      CellText	:= FieldTypeToStr(ND.Field.VarType);

    2:
    case ND.Field.VarType of
      gffLocString:
        CellText	:= GetText(ND.Field);
      gffVoid:
        CellText	:= '[ ... ]';
      gffStruct:
        CellText :=
          IntToStr(ND.Field.Id) + ', [ ' +
          IntToStr(ND.Field.Count) + ' ]';
      gffList:
        CellText	:= '[ ' + IntToStr(ND.Field.Count) + ' ]';
    else
      CellText		:= ND.Field.AsString;
    end;

  end;

end;

(*------------------------------------------------------------------------------
vtGff Change

------------------------------------------------------------------------------*)
procedure TfmAlia.vtGffChange(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode
);
var
  GffNode		: PGffNode;
  Field			: TGffField;
  StrRef		: Cardinal;
  procedure _Bounds_(const S: String);
  begin
    lbIntBounds.Caption :=
      FieldTypeToStr(Field.VarType) + ' ' +
      'bounds: ' + S;
    edIntValue.Text	:= Field.AsString;
  end;
  procedure _Pages_(const ValPage, OptPage: TTabSheet);
  begin
    pcValue.ActivePage := ValPage;
    pcOptions.ActivePage := OptPage;
  end;
begin
  GffNode		:= Sender.GetNodeData(Node);
  if not Assigned(GffNode) then Exit;

  Field			:= GffNode.Field;

  Changing		:= True;

  pcPages.ActivePage	:= tsData;

  edName.Text		:= Field.Name;
  if aoLockNames in Options then begin
    edName.ReadOnly	:= True;
    edName.Color	:= clBtnFace;
  end;
  if Field.Name = '' then
    edLabelIndex.Text	:= ''
  else
    edLabelIndex.Text	:= IntToStr(Field.LabelIndex);

  cbType.ItemIndex	:= Integer( Field.VarType );

  if Field.VarType in [gffByte..gffInt64] then
    _Pages_(tsNumericValue, tsIntegralOptions);

  pnDWstrref.Visible	:= Field.VarType = gffDWord;

  case Field.VarType of

    gffByte: _Bounds_('0 to 255');
    gffChar: _Bounds_('-128 to 127');
    gffWord: _Bounds_('0 to 65,535');
    gffShort: _Bounds_('-32,768 to 32,767');
    gffInt: _Bounds_('~ -2 billion to ~ 2 billion');
    gffDWord64, gffInt64: _Bounds_('-2^63 to 2^63-1');

    gffDWord:
    begin
      _Bounds_('0 to ~ 4 billion');
      meDWstrref.Clear;
      if (Field.AsDWord <> NO_STRREF) then
        meDWstrref.Text := Tlk.GetString(Field.AsDWord);
    end;

    gffFloat:
    begin
      _Pages_(tsNumericValue, tsRealOptions);
      _Bounds_('7 digit precision');
      ShowReal(Field);
    end;

    gffDouble:
    begin
      _Pages_(tsNumericValue, tsRealOptions);
      _Bounds_('15 digit precision');
      ShowReal(Field);
    end;

    gffString:
    begin
      _Pages_(tsStringValue, tsStringOptions);
      meText.ReadOnly	:= False;
      meText.Color	:= clWindow;
      meText.Text :=
        StringReplace(Field.AsString, #10, sLineBreak, [rfReplaceAll]);
    end;

    gffResRef:
    begin
      _Pages_(tsResRefValue, tsResRefOptions);
      edResRefValue.Text := Field.AsString;
    end;

    gffLocString:
    begin
      _Pages_(tsStringValue, tsLocStringOptions);
      meText.Text :=
        StringReplace(GetText(Field), #10, sLineBreak, [rfReplaceAll]);
      StrRef		:= Field.AsLocString.StringRef;
      if StrRef = NO_STRREF then begin
        edStrRef.Text	:= '';
        ckAltTlk.Checked := False;
        meText.ReadOnly	:= False;
        meText.Color	:= clWindow;
      end else begin
        ckAltTlk.Checked := StrRef and TLK_FLAG_CUSTOM = TLK_FLAG_CUSTOM;
        if ckAltTlk.Checked then
          edStrRef.Text	:= IntToStr(StrRef - TLK_FLAG_CUSTOM)
        else
          edStrRef.Text	:= IntToStr(StrRef);
        meText.ReadOnly	:= True;
        meText.Color	:= clInfoBk;
      end;
    end;

    gffVoid:
    begin
      _Pages_(tsVoidValue, tsVoidOptions);
      ShowHex(Field);
    end;

    gffStruct:
    begin
      _Pages_(tsStructValue, tsStructOptions);
      edStructId.Text := IntToStr(Field.Id);
    end;

    gffList:
      _Pages_(tsBlankValue, tsListOptions);

  end;

  if not Assigned(Sender.FocusedNode) then
    Sender.FocusedNode	:= Sender.GetFirst;

  Changing		:= False;

end;

(*------------------------------------------------------------------------------
vtGff Expanded

------------------------------------------------------------------------------*)
procedure TfmAlia.vtGffExpanded(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode
);
var
  Child			: PVirtualNode;
  ND			: PGffNode;
  Field			: TGffField;
begin
  if not(aoExpandOrphans in Options) then Exit;

  ND			:= Sender.GetNodeData(Node);
  if not Assigned(ND) or not Assigned(ND.Field) then Exit;

  Child			:= Node.FirstChild;
  while Assigned(Child) do begin
    Field		:= ND.Field.ChildOfIndex(Child.Index);
    if Assigned(Field) and (Field.VarType = gffStruct) and (Field.Count = 1) then
      Sender.Expanded[Child] := True;
    Child		:= Child.NextSibling;
  end;

end;

(*------------------------------------------------------------------------------
vtGff KeyDown

Ins, Enter, F2, Del

------------------------------------------------------------------------------*)
procedure TfmAlia.vtGffKeyDown(
  Sender		: TObject;
  var Key		: Word;
  Shift			: TShiftState
);
var
  Tree			: TVirtualStringTree;
  Node, SelNode		: PVirtualNode;
  GffNode		: PGffNode;
  Field			: TGffField;
begin
  if not(Key in [
    VK_RETURN, VK_INSERT, VK_DELETE,
    VK_F2
  ]) then Exit;

  Tree			:= TVirtualStringTree(Sender);
  Node			:= Tree.GetFirstSelected;
  GffNode		:= Tree.GetNodeData(Node);
  if not Assigned(GffNode) or not Assigned(GffNode.Field) then Exit;

  Field			:= GffNode.Field;

  case Key of

    VK_RETURN:
      EditField(Field.VarType);

    VK_INSERT:
    begin
      { Make sure child initialization is complete }
      Tree.Expanded[Node] := True;
      case Field.VarType of
        gffStruct:
          Field.AddChild('New Field', gffByte);
        gffList:
          Field.AddChild('', gffStruct);
      else
        Field.AddPrevSibling('New Field', gffByte);
      end;
      if Field.VarType in [gffStruct, gffList] then
        Node		:= Tree.AddChild(Node)
      else
        Node		:= Tree.InsertNode(Node, amInsertBefore);
      Tree.FocusedNode	:= Node; { fires InitNode }
      Tree.Selected[Node] := True;
      pcPages.ActivePage := tsData;
      ActiveControl := cbType;
    end;

    VK_DELETE:
    begin
      if not Assigned(Field.Parent) then begin
        MessageDlg('Cannot delete the Root Struct.', mtError, [mbOk], 0);
        Exit;
      end;
      SelNode		:= Node.PrevSibling;
      if not Assigned(SelNode) then
        SelNode		:= Node.Parent;
      Tree.FocusedNode	:= SelNode;
      Tree.Selected[SelNode] := True;
      Field.Free;
      Tree.DeleteNode(Node);
    end;

    VK_F2:
    begin
      edName.ReadOnly	:= False;
      edName.Color	:= clWindow;
      ActiveControl	:= edName;
      edName.SelStart	:= 0;
      edName.SelLength	:= Length(edName.Text);
    end;

  end;

end;

(*------------------------------------------------------------------------------
vtGff KeyPress

------------------------------------------------------------------------------*)
procedure TfmAlia.vtGffKeyPress(Sender: TObject; var Key: Char);
begin
  //
end;

(*------------------------------------------------------------------------------
vtErf BeforeItemErase

------------------------------------------------------------------------------*)
procedure TfmAlia.vtErfBeforeItemErase(
  Sender		: TBaseVirtualTree;
  TargetCanvas		: TCanvas;
  Node			: PVirtualNode;
  ItemRect		: TRect;
  var ItemColor		: TColor;
  var EraseAction	: TItemEraseAction
);
var
  ND			: PErfNode;
begin
  if not(aoStructColor in Options) or (StructColor = clNone) then Exit;

  ND			:= Sender.GetNodeData(Node);

  if
    Assigned(ND) and Assigned(ND.Struct) and
    IsGffType(ND.Struct.ResTypeId)
  then begin
    ItemColor		:= StructColor;
    EraseAction		:= eaColor;
  end;

end;

(*------------------------------------------------------------------------------
vtErf Change

------------------------------------------------------------------------------*)
procedure TfmAlia.vtErfChange(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode
);
begin
  //
end;

(*------------------------------------------------------------------------------
vtErf DblClick

------------------------------------------------------------------------------*)
procedure TfmAlia.vtErfDblClick(Sender: TObject);
var
  Tree			: TVirtualStringTree;
  ErfNode		: PErfNode;
  Err			: TLetoError;
begin
  Tree			:= TVirtualStringTree(Sender);
  ErfNode		:= Tree.GetNodeData(Tree.GetFirstSelected);
  if not Assigned(ErfNode) or not Assigned(ErfNode.Struct) then Exit;

  if not IsGffType(ErfNode.Struct.ResTypeId) then begin
    MessageDlg(
      'This resource is not a supported type. Alia cannot open it.',
      mtError, [mbOk], 0
    );
    Exit;
  end;

  Screen.Cursor		:= crHourglass;
  Status('Parsing ' + ErfNode.Struct.Name + '...');
  Err			:= ErfNode.Struct.Parse;
  Screen.Cursor		:= crDefault;

  if Err <> Success then begin
    MessageDlg(
      'Error parsing ' + ErfNode.Struct.Name + ': ' +
      GetLetoError(Err),
      mtError, [mbOk], 0
    );
    Repaint;
    Exit;
  end;

  LoadRes(GetResRec(Tree).LetoFile, ErfNode.Struct);

end;

(*------------------------------------------------------------------------------
vtErf GetText

------------------------------------------------------------------------------*)
procedure TfmAlia.vtErfGetText(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode;
  Column		: TColumnIndex;
  TextType		: TVSTTextType;
  var CellText		: WideString
);
var
  ND			: PErfNode;
begin
  ND			:= Sender.GetNodeData(Node);

  case Column of

    0:
      CellText		:= ND.Struct.Name;

    1:
      CellText		:= ND.Struct.ResType;

    2:
      CellText		:= IntToStr(ND.Struct.Data.Size);

  end;
end;

(*------------------------------------------------------------------------------
vtErf InitNode

------------------------------------------------------------------------------*)
procedure TfmAlia.vtErfInitNode(
  Sender		: TBaseVirtualTree;
  ParentNode, Node	: PVirtualNode;
  var InitialStates	: TVirtualNodeInitStates
);
var
  ND			: PErfNode;
begin
  ND			:= Sender.GetNodeData(Node);
  if not Assigned(ND) then Exit;

  ND.ResRec		:= GetResRec(Sender);
  ND.Erf		:= ND.ResRec.LetoFile.Erf;
  ND.Struct		:= ND.Erf.Structs[Node.Index];

end;

(*------------------------------------------------------------------------------
vtErf KeyDown

------------------------------------------------------------------------------*)
procedure TfmAlia.vtErfKeyDown(
  Sender		: TObject;
  var Key		: Word;
  Shift			: TShiftState
);
var
  Tree			: TVirtualStringTree;
  ErfNode		: PErfNode;
  procedure _Focus_(const Edit: TEdit);
  begin
    ActiveControl	:= Edit;
    Edit.SelStart	:= 0;
    Edit.SelLength	:= Length(Edit.Text);
  end;
begin
  if not Key in [
    VK_RETURN, VK_INSERT, VK_DELETE,
    VK_F2
  ] then Exit;

  Tree			:= TVirtualStringTree(Sender);
  ErfNode		:= Tree.GetNodeData(Tree.GetFirstSelected);
  if not Assigned(ErfNode.Struct) then Exit;

  case Key of

    VK_RETURN:
      Tree.OnDblClick(Tree);

    VK_INSERT:
    begin
      // add new res
    end;

    VK_DELETE:
    begin
      // delete this res
    end;

    VK_F2:
    begin
      // rename it?
    end;

  end;

end;

(*------------------------------------------------------------------------------
vtErf KeyPress

------------------------------------------------------------------------------*)
procedure TfmAlia.vtErfKeyPress(Sender: TObject; var Key: Char);
begin

end;

(*------------------------------------------------------------------------------
edName KeyDown

------------------------------------------------------------------------------*)
procedure TfmAlia.edNameKeyDown(
  Sender		: TObject;
  var Key		: Word;
  Shift			: TShiftState
);
begin
  if Key = VK_RETURN then begin
    ActiveControl	:= GetCurrTree;
    if aoLockNames in Options then begin
      edName.ReadOnly	:= True;
      edName.Color	:= clBtnFace;
    end;
  end;
end;

(*------------------------------------------------------------------------------
tsData Show

------------------------------------------------------------------------------*)
procedure TfmAlia.tsDataShow(Sender: TObject);
begin

end;

(*------------------------------------------------------------------------------
pnValue Resize

------------------------------------------------------------------------------*)
procedure TfmAlia.pnValueResize(Sender: TObject);
var
  Tree			: TVirtualStringTree;
  GffNode		: PGffNode;
begin
  if pcValue.ActivePage <> tsVoidValue then Exit;

  Tree			:= GetCurrTree;
  GffNode		:= Tree.GetNodeData(Tree.GetFirstSelected);
  if Assigned(GffNode.Field) and (GffNode.Field.VarType = gffVoid) then
    ShowHex(GffNode.Field);

end;

(*------------------------------------------------------------------------------
sgVoid KeyPress

------------------------------------------------------------------------------*)
procedure TfmAlia.sgVoidKeyPress(Sender: TObject; var Key: Char);
var
  Tree			: TVirtualStringTree;
  GffNode		: PGffNode;
  P			: Integer;
begin
  Tree			:= GetCurrTree;
  GffNode		:= Tree.GetNodeData(Tree.GetFirstSelected);

  Key			:= UpCase(Key);
  P			:= sgVoid.Col + (sgVoid.Row * sgVoid.ColCount);

  if
    (P > Length(GffNode.Field.Data.AsVoid)-1) or
    not( Key in ['0'..'9', 'A'..'F'] )
  then begin
    Key			:= #0;
    Exit;
  end;

  if HexBuff = #0 then begin
    HexBuff		:= Key;
    sgVoid.Cells[sgVoid.Col, sgVoid.Row] := HexBuff;
  end

  else begin
    { Set value }
    GffNode.Field.Data.AsVoid[P] := StrToInt( '$' + HexBuff + Key );
    { Display value }
    sgVoid.Cells[sgVoid.Col, sgVoid.Row] := HexBuff + Key;
    { Reset buffer }
    HexBuff		:= #0;
    { Move to next cell }
    if P < Length(GffNode.Field.Data.AsVoid)-1 then begin
      if sgVoid.Col = sgVoid.ColCount-1 then begin
        sgVoid.Row	:= sgVoid.Row + 1;
        sgVoid.Col	:= 0;
      end else
        sgVoid.Col	:= sgVoid.Col + 1;
    end;
  end;

  Key			:= #0;

end;

(*------------------------------------------------------------------------------
sgVoid SelectCell

------------------------------------------------------------------------------*)
procedure TfmAlia.sgVoidSelectCell(
  Sender		: TObject;
  ACol, ARow		: Integer;
  var CanSelect		: Boolean
);
var
  Tree			: TVirtualStringTree;
  GffNode		: PGffNode;
  P			: Integer;
begin
  CanSelect		:= False;

  Tree			:= GetCurrTree;
  GffNode		:= Tree.GetNodeData(Tree.GetFirstSelected);

  P			:= ACol + (ARow * sgVoid.ColCount);
  if P > Length(GffNode.Field.Data.AsVoid)-1 then Exit;

  CanSelect		:= True;

  ShowHexStats(P, GffNode.Field);

  if HexBuff <> #0 then
    ShowHex(GffNode.Field);

end;

(*------------------------------------------------------------------------------
rb RealAs Click

------------------------------------------------------------------------------*)
procedure TfmAlia.rbRealAsClick(Sender: TObject);
var
  Tree			: TVirtualStringTree;
  GffNode		: PGffNode;
begin
  Tree			:= GetCurrTree;
  GffNode		:= Tree.GetNodeData(Tree.GetFirstSelected);
  ShowReal(GffNode.Field);
end;

(*------------------------------------------------------------------------------
btNewStrRef Click

------------------------------------------------------------------------------*)
procedure TfmAlia.btNewStrRefClick(Sender: TObject);
var
  Tree			: TVirtualStringTree;
  GffNode		: PGffNode;
  LocString		: TGffLocString;
begin
  Tree			:= GetCurrTree;
  GffNode		:= Tree.GetNodeData(Tree.GetFirstSelected);
  if not Assigned(GffNode) then Exit;

  if not AltTlk.Loaded then begin
    MessageDlg(
      'No custom TLK is assigned. Use Options (F8) to select or create one. ' +
      '(Editing dialog.tlk indirectly is not supported.)',
      mtError, [mbOk], 0
    );
    Exit;
  end;

  Screen.Cursor		:= crHourglass;

  LocString		:= GffNode.Field.AsLocString;

  if rbFemale.Checked and
    (MessageDlg(
      'Although you have Female checked, the StringRef will be created in ' +
      AltTlk.FileName + '.' + #13#13 +
      'Indirect Female TLK editing is not yet supported.' + #13#13 +
      'Continue?',
      mtConfirmation, [mbYes, mbNo], 0
    ) = mrNo)
  then
    Exit;

  LocString.StringRef	:= AltTlk.Add('') + TLK_FLAG_CUSTOM;

  Changing		:= True;
  meText.Text		:= '';
  edStrRef.Text		:= IntToStr(LocString.StringRef - TLK_FLAG_CUSTOM);
  ckAltTlk.Checked	:= True;
  meText.ReadOnly	:= False;
  meText.Color		:= clWindow;
  Changing		:= False;

  Screen.Cursor		:= crDefault;

  ActiveControl		:= meText;

end;

(*------------------------------------------------------------------------------
btEditStrRef Click

------------------------------------------------------------------------------*)
procedure TfmAlia.btEditStrRefClick(Sender: TObject);
var
  Tree			: TVirtualStringTree;
  GffNode		: PGffNode;
  LocString		: TGffLocString;
begin
  Tree			:= GetCurrTree;
  GffNode		:= Tree.GetNodeData(Tree.GetFirstSelected);
  if not Assigned(GffNode) then Exit;

  LocString		:= GffNode.Field.AsLocString;

  if not ckAltTlk.Checked then
    MessageDlg(
      'Only custom StrRefs can be edited. To edit dialog.tlk, ' +
      'open it as a regular file. To create a new, custom StrRef, ' +
      'click New StrRef instead.',
      mtError, [mbOk], 0
    )

  else if not AltTlk.Loaded then
    MessageDlg(
      'No custom TLK is assigned. Use Options (F8) to select or create one.',
      mtError, [mbOk], 0
    )

  else if LocString.StringRef = NO_STRREF then begin
    if MessageDlg(
      'This LocString has no StringRef. Create one?',
      mtConfirmation, [mbYes, mbNo], 0
    ) = mrYes then
      btNewStrRef.Click;
  end

  else begin
    meText.ReadOnly	:= False;
    meText.Color	:= clWindow;
    ActiveControl	:= meText;
  end;

end;

(*------------------------------------------------------------------------------
tsRes Show

------------------------------------------------------------------------------*)
procedure TfmAlia.tsResShow(Sender: TObject);
begin

end;

(*------------------------------------------------------------------------------
vtRaw GetText

------------------------------------------------------------------------------*)
procedure TfmAlia.vtRawGetText(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode;
  Column		: TColumnIndex;
  TextType		: TVSTTextType;
  var CellText		: WideString
);
var
  ND			: PRawRec;
begin
  ND			:= Sender.GetNodeData(Node);
  case Column of
    0: CellText		:= ND.Field;
    1: CellText		:= ND.Value;
  end;
end;

(*------------------------------------------------------------------------------
vtRaw InitNode

------------------------------------------------------------------------------*)
procedure TfmAlia.vtRawInitNode(
  Sender		: TBaseVirtualTree;
  ParentNode, Node	: PVirtualNode;
  var InitialStates	: TVirtualNodeInitStates
);
var
  ResRec		: PResRec;
begin
  if vsDeleting in Node.States then Exit;

  ResRec		:= GetRawResRec(Sender);
  if not Assigned(ResRec) then Exit;

  case GetFileType(ResRec) of
    ftGFF..ft_GFF:
      RawGffInitNode(Sender, ParentNode, Node, InitialStates);
  end;
  
end;

(*------------------------------------------------------------------------------
vtRaw InitChildren

------------------------------------------------------------------------------*)
procedure TfmAlia.vtRawInitChildren(
  Sender		: TBaseVirtualTree;
  Node			: PVirtualNode;
  var ChildCount	: Cardinal
);
var
  ResRec		: PResRec;
  Stream		: TStream;
  FileType		: TLetoFileType;
  GH			: TGffHeader;
  EH			: TErfHeader;
  I			: Cardinal;
  _Type			: Cardinal;
begin
  ResRec		:= vtFiles.GetNodeData(vtFiles.GetFirstSelected);
  Stream		:= ResRec.Stream;

  { Setup }
  FileType		:= GetFileType(ResRec);
  case FileType of
    ftGFF..ft_GFF:
      GH		:= ResRec.LetoFile.Gff.Header;
    ftERF..ft_ERF:
      EH		:= ResRec.LetoFile.Erf.Header;
  end;

  case FileType of

    ftGFF..ft_GFF:
    case Node.Dummy of
      { First gen }
      20: ChildCount	:= GH.StructCount;
      21: ChildCount	:= GH.FieldCount;
      22:
      begin
        ChildCount	:= 0;
        Stream.Seek(GH.FieldOffset, 0);
        for I := 1 to GH.FieldCount do begin
          _Type	:= ReadLong(Stream);
          if TGffVarType(_Type) in ComplexGffVars then begin
            Inc(ChildCount);
            SetLength(ResRec.DataIndices, ChildCount);
            ResRec.DataIndices[ChildCount-1] := Stream.Position-4;
          end;
          ReadLong(Stream); ReadLong(Stream);
        end;
      end;
      23: ChildCount	:= GH.FieldIndicesCount div 4;
      24:
      begin
        ChildCount	:= 0;
        Stream.Seek(GH.ListIndicesOffset, 0);
        while Stream.Position < Stream.Size do begin
          Inc(ChildCount);
          SetLength(ResRec.ListIndices, ChildCount);
          ResRec.ListIndices[ChildCount-1] := Stream.Position;
          I		:= ReadLong(Stream);
          Stream.Seek(I*4, soFromCurrent)
        end;
      end;
      { Second gen }
      12: ChildCount	:= 1;
      14:
      begin
        Stream.Seek(ResRec.ListIndices[Node.Index], 0);
        ChildCount	:= ReadLong(Stream);
      end;
    end; { case Node.Dummy }

    ftERF..ft_ERF: ;

  end; { case FileType }

end;

(*------------------------------------------------------------------------------
tsScript Show

------------------------------------------------------------------------------*)
procedure TfmAlia.tsScriptShow(Sender: TObject);
begin
  ActiveControl		:= meScript;
end;

(*------------------------------------------------------------------------------
meScript KeyPress

------------------------------------------------------------------------------*)
procedure TfmAlia.meScriptKeyPress(Sender: TObject; var Key: Char);
var
  P			: Integer;
  S			: String;
  Node			: PVirtualNode;
  ResRec		: PResRec;
begin

  P			:= meScript.SelStart;
  if P < ScriptPos then
    meScript.SelStart	:= Length(meScript.Text);

  case Key of
    #8:
      if P <= ScriptPos then
        Key		:= #0;
    #13:
    begin
      Screen.Cursor	:= crHourglass;
      { Compile }
      S			:= Copy(meScript.Text, ScriptPos+1, Length(meScript.Text));
      meScript.SelText	:= sLineBreak;
      if S <> '' then
        LetoScript.Compile(S);
      if not ScriptEnv.OutputNL then
        meScript.SelText := sLineBreak;
      ScriptEnv.OutputNL := True;
      meScript.SelText	:= 'LetoScript> ';
      ScriptPos		:= meScript.SelStart;
      { Invalidate changed files }
      Node		:= vtFiles.GetFirst;
      while Assigned(Node) do begin
        ResRec		:= vtFiles.GetNodeData(Node);
        // TODO 4: CHANGE: Generalize .Changed
        if
          ( Assigned(ResRec.Struct) and ResRec.Struct.Gff.Changed ) or
          ( ResRec.LetoFile.IsGff and ResRec.LetoFile.Gff.Changed )
        then begin
          { Completely re-initialize }
          ResRec.Tree.RootNodeCount := 0;
          ResRec.Tree.RootNodeCount := 1;
        end;
        Node		:= vtFiles.GetNext(Node);
      end;
      Screen.Cursor	:= crDefault;
      Key		:= #0;
    end;
  end;

end;

(*------------------------------------------------------------------------------
meScript KeyDown

------------------------------------------------------------------------------*)
procedure TfmAlia.meScriptKeyDown(
  Sender		: TObject;
  var Key		: Word;
  Shift			: TShiftState
);
begin
  if
    (Key = VK_DELETE) and
    (meScript.SelStart < ScriptPos)
  then
    Key			:= 0;
end;

(*------------------------------------------------------------------------------
ctrl Change

Centralized handling for live changes to components which correspond to data.

------------------------------------------------------------------------------*)
procedure TfmAlia.ctrlChange(Sender: TObject);
var
  Tree			: TVirtualStringTree;
  Node			: PVirtualNode;
  GffNode		: PGffNode;
  Field			: TGffField;

  Tag			: Integer;
  Edit			: TEdit;
  Memo			: TMemo;
  Check			: TCheckBox;
  Combo			: TComboBox;

  S			: String;
  I			: Integer;
begin
  if Changing then Exit;

  Tag			:= TControl(Sender).Tag;

  if Tag = 0 then Exit;

  Edit			:= nil;
  Memo			:= nil;
  Check			:= nil;
  Combo			:= nil;

  if Tag in [
    TAG_NAME, TAG_INTEGRAL, TAG_RESREF, TAG_STRUCTID, TAG_STRREF
  ] then
    Edit		:= TEdit(Sender)

  else if Tag in [
    TAG_TEXT
  ] then
    Memo		:= TMemo(Sender)

  else if Tag in [
    TAG_CUSTOM_TLK
  ] then
    Check		:= TCheckBox(Sender)

  else if Tag in [
    TAG_TYPE
  ] then
    Combo		:= TComboBox(Sender);

  Tree			:= GetCurrTree;
  Node			:= Tree.GetFirstSelected;
  GffNode		:= Tree.GetNodeData(Node);
  Field			:= GffNode.Field;

  Changing		:= True;

  case Tag of

    TAG_NAME:
    begin
      Field.Name	:= Edit.Text;
      Field.LabelIndex	:= -1;
      edLabelIndex.Text := '-1';
    end;

    TAG_TYPE:
    begin
      Field.VarType	:= TGffVarType( Combo.ItemIndex );
      Tree.OnChange(Tree, Node);
    end;

    TAG_INTEGRAL:
    begin
      Field.SetValue(Edit.Text);
      if Field.VarType in [gffFloat, gffDouble] then
        ShowReal(Field)
      else if Edit.Text <> '' then
        Edit.Text	:= Field.AsString;
      if Field.VarType = gffDWord then begin
        meDWstrref.Clear;
        if (Edit.Text <> '') and (Field.AsDWord <> NO_STRREF) then
          meDWstrref.Text := Tlk.GetString(Field.AsDWord);
      end;
    end;

    TAG_TEXT:
    begin
      S := StringReplace(Memo.Text, sLineBreak, #10, [rfReplaceAll]);
      if Field.VarType = gffString then
        Field.SetValue(S)
      else if Field.AsLocString.StringRef = NO_STRREF then
        Field.AsLocString[GetLang] := S
      else
        AltTlk.SetString(Field.AsLocString.StringRef, S, rbFemale.Checked);
    end;

    TAG_RESREF:
      Field.AsResRef	:= Edit.Text;

    TAG_VOID: ;

    TAG_STRUCTID:
      if TryStrToInt(Edit.Text, I) then
        Field.Id	:= Cardinal(I)
      else begin
        Edit.Text	:= '0';
        Field.Id	:= 0;
      end;

    TAG_LANG, TAG_MALE, TAG_FEMALE, TAG_STRREF, TAG_CUSTOM_TLK:
    begin
      I			:= Field.AsLocString.StringRef;
      if Tag in [TAG_LANG, TAG_MALE, TAG_FEMALE] then
      else if (edStrRef.Text = '') or not TryStrToInt(edStrRef.Text, I) then
        Field.AsLocString.StringRef := NO_STRREF
      else if Cardinal(I) >= TLK_FLAG_CUSTOM then begin
        MessageDlg(
          'Invalid StrRef. Enter a number in the range of 0 to ' +
          IntToStr(TLK_FLAG_CUSTOM-1),
          mtError, [mbOk], 0
        );
        Field.AsLocString.StringRef := NO_STRREF;
      end else if ckAltTlk.Checked then
        Field.AsLocString.StringRef := Cardinal(I) + TLK_FLAG_CUSTOM
      else
        Field.AsLocString.StringRef := Cardinal(I);
      meText.Text :=
        StringReplace(GetText(Field), #10, sLineBreak, [rfReplaceAll]);
      if Field.AsLocString.StringRef = NO_STRREF then begin
        meText.ReadOnly	:= False;
        meText.Color	:= clWindow;
      end else begin
        meText.ReadOnly	:= True;
        meText.Color	:= clInfoBk;
      end;
    end;

  end;

  Changing		:= False;

  Modified(GetResRec(Tree));

  Tree.InvalidateNode(Node);

end;

(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
end.
