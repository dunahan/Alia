(*------------------------------------------------------------------------------
Form_Options

Options dialog for Alia.

This program is free software, under the terms of the BSD license. See the
included License.txt for details, or contact dragon@weathersong.net if you
need more information.

------------------------------------------------------------------------------*)

unit Form_Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  Header_Leto;

type
  TfmOptions = class(TForm)
    tvPages: TTreeView;
    pcOptions: TPageControl;
    tsGeneral: TTabSheet;
    tsLang: TTabSheet;
    tsAbout: TTabSheet;
    imgSEZ: TImage;
    imgNWN: TImage;
    meAbout: TMemo;
    lbVer: TLabel;
    lbTitle: TLabel;
    lbAuthor: TLabel;
    lbCopyright: TLabel;
    imgLeto: TImage;
    cbDefLang: TComboBox;
    lbDefLang: TLabel;
    lbDefGender: TLabel;
    rbDefMale: TRadioButton;
    rbDefFemale: TRadioButton;
    gbDefaults: TGroupBox;
    lbTlk: TLabel;
    lbCustomTlk: TLabel;
    ColorDialog: TColorDialog;
    edTlk: TEdit;
    btTlk: TButton;
    OpenDialog: TOpenDialog;
    edAltTlk: TEdit;
    btAltTlk: TButton;
    ckLockNames: TCheckBox;
    ckHandle: TCheckBox;
    ckExpand: TCheckBox;
    ckResize: TCheckBox;
    ckResDetails: TCheckBox;
    lbURL: TLabel;
    SaveDialog: TSaveDialog;
    btNewTlk: TButton;
    ckStructColor: TCheckBox;
    ColorBox: TColorBox;

    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(
      Sender		: TObject;
      var Key		: Word;
      Shift		: TShiftState
    );
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);

    procedure tvPagesChange(Sender: TObject; Node: TTreeNode);

    procedure btTlkClick(Sender: TObject);
    procedure btAltTlkClick(Sender: TObject);
    procedure btNewTlkClick(Sender: TObject);

    procedure tsAboutShow(Sender: TObject);

  private

    function GetIsChecked(const Name: String): Boolean;
    procedure SetIsChecked(const Name: String; const Value: Boolean);

    property IsChecked[const Name: String]: Boolean
      read GetIsChecked write SetIsChecked;

  public

  end;

var
  fmOptions: TfmOptions;

const
  OPTIONS_PAGE_GEN	= 0;
  OPTIONS_PAGE_LANG	= 1;
  OPTIONS_PAGE_ABOUT	= 2;


implementation

{$R *.dfm}

uses
  Form_Alia;


(*------------------------------------------------------------------------------
Form Create

------------------------------------------------------------------------------*)
procedure TfmOptions.FormCreate(Sender: TObject);
begin

  Screen.Cursor		:= crHourglass;

  MakeLangList(cbDefLang.Items);

  ckLockNames.Checked	:= IsChecked['LockNames'];
  ckHandle.Checked	:= IsChecked['HandlePrompt'];
  ckExpand.Checked	:= IsChecked['ExpandOrphans'];
  ckResize.Checked	:= IsChecked['AutoResize'];
  ckResDetails.Checked	:= IsChecked['ResDetails'];
  ckStructColor.Checked := IsChecked['UseStructColor'];

  with fmAlia.Settings.Root.Items do begin
    ColorBox.Selected	:= StringToColor(ItemNamed['StructColor'].Value);
    cbDefLang.ItemIndex :=
      LangItoA( StrToIntDef(ItemNamed['DefaultLang'].Value, 0) );
    if ItemNamed['DefaultGender'].Value = '0' then
      rbDefMale.Checked := True
    else
      rbDefFemale.Checked := True;
    edTlk.Text		:= ItemNamed['TlkFile'].Value;
    edAltTlk.Text	:= ItemNamed['AltTlkFile'].Value;
  end;

  Screen.Cursor		:= crDefault;

end;

(*------------------------------------------------------------------------------
Form KeyUp

------------------------------------------------------------------------------*)
procedure TfmOptions.FormKeyUp(
  Sender		: TObject;
  var Key		: Word;
  Shift			: TShiftState
);
begin
  if Key = VK_ESCAPE then
    Close;
end;

(*------------------------------------------------------------------------------
Form CloseQuery

------------------------------------------------------------------------------*)
procedure TfmOptions.FormCloseQuery(
  Sender		: TObject;
  var CanClose		: Boolean
);
begin

  Screen.Cursor		:= crHourglass;

  IsChecked['LockNames']	:= ckLockNames.Checked;
  IsChecked['HandlePrompt']	:= ckHandle.Checked;
  IsChecked['ExpandOrphans']	:= ckExpand.Checked;
  IsChecked['AutoResize']	:= ckResize.Checked;
  IsChecked['ResDetails']	:= ckResDetails.Checked;
  IsChecked['UseStructColor']	:= ckStructColor.Checked;

  with fmAlia.Settings.Root.Items do begin
    ItemNamed['StructColor'].Value := ColorToString(ColorBox.Selected);
    ItemNamed['DefaultLang'].Value := IntToStr(LangNtoI(cbDefLang.Text));
    if rbDefMale.Checked then
      ItemNamed['DefaultGender'].Value := '0'
    else
      ItemNamed['DefaultGender'].Value := '1';
    ItemNamed['TlkFile'].Value := edTlk.Text;
    ItemNamed['AltTlkFile'].Value := edAltTlk.Text;
  end;

  Screen.Cursor		:= crDefault;

end;

(*------------------------------------------------------------------------------
tvPages Change

------------------------------------------------------------------------------*)
procedure TfmOptions.tvPagesChange(Sender: TObject; Node: TTreeNode);
begin
  pcOptions.ActivePageIndex := Node.AbsoluteIndex;
end;

(*------------------------------------------------------------------------------
btTlk Click

------------------------------------------------------------------------------*)
procedure TfmOptions.btTlkClick(Sender: TObject);
begin
  OpenDialog.FileName	:= edTlk.Text;
  if OpenDialog.Execute then
    edTlk.Text		:= OpenDialog.FileName;
end;

(*------------------------------------------------------------------------------
btAltTlk Click

------------------------------------------------------------------------------*)
procedure TfmOptions.btAltTlkClick(Sender: TObject);
begin
  OpenDialog.FileName	:= edAltTlk.Text;
  if OpenDialog.Execute then
    edAltTlk.Text	:= OpenDialog.FileName;
end;

(*------------------------------------------------------------------------------
btNewTlk Click

------------------------------------------------------------------------------*)
procedure TfmOptions.btNewTlkClick(Sender: TObject);
var
  Err			: TLetoError;
  FemName		: String;
begin
  SaveDialog.FileName	:= '';
  if not SaveDialog.Execute then Exit;

  Repaint;

  edAltTlk.Text		:= SaveDialog.FileName;
  fmAlia.AltTlk.Clear;
  fmAlia.AltTlk.FileName := SaveDialog.FileName;
  Err			:= fmAlia.AltTlk.SaveToFile;
  if Err <> Success then
    MessageDlg(GetLetoError(Err), mtError, [mbOk], 0);

  Repaint;

  FemName := StringReplace(SaveDialog.Filename, '.tlk', 'f.tlk', []);

  if MessageDlg(
    'Create a female TLK (' +
    ExtractFileName(FemName) +
    ') now too?',
    mtConfirmation, [mbYes, mbNo], 0
  ) = mrYes then begin
    Repaint;
    fmAlia.AltTlkF.Clear;
    fmAlia.AltTlkF.FileName := FemName;
    Err			:= fmAlia.AltTlkF.SaveToFile;
    if Err <> Success then
      MessageDlg(GetLetoError(Err), mtError, [mbOk], 0);
   end;

end;

(*------------------------------------------------------------------------------
tsAbout Show

------------------------------------------------------------------------------*)
procedure TfmOptions.tsAboutShow(Sender: TObject);
begin
  lbVer.Caption		:= 'Version ' + LetoVersion;
end;

(*------------------------------------------------------------------------------
property IsChecked

------------------------------------------------------------------------------*)
function TfmOptions.GetIsChecked(const Name: String): Boolean;
begin
  Result :=
    fmAlia.Settings.Root.Items.ItemNamed[Name].Value <> '0';
end;

procedure TfmOptions.SetIsChecked(
  const Name		: String;
  const Value		: Boolean
);
begin
  if Value then
    fmAlia.Settings.Root.Items.ItemNamed[Name].Value := '1'
  else
    fmAlia.Settings.Root.Items.ItemNamed[Name].Value := '0';
end;

(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
(*------------------------------------------------------------------------------
------------------------------------------------------------------------------*)
end.
