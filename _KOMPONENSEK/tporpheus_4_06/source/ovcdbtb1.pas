{*********************************************************}
{*                  OVCDBTB1.PAS 4.06                    *}
{*********************************************************}

{* ***** BEGIN LICENSE BLOCK *****                                            *}
{* Version: MPL 1.1                                                           *}
{*                                                                            *}
{* The contents of this file are subject to the Mozilla Public License        *}
{* Version 1.1 (the "License"); you may not use this file except in           *}
{* compliance with the License. You may obtain a copy of the License at       *}
{* http://www.mozilla.org/MPL/                                                *}
{*                                                                            *}
{* Software distributed under the License is distributed on an "AS IS" basis, *}
{* WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License   *}
{* for the specific language governing rights and limitations under the       *}
{* License.                                                                   *}
{*                                                                            *}
{* The Original Code is TurboPower Orpheus                                    *}
{*                                                                            *}
{* The Initial Developer of the Original Code is TurboPower Software          *}
{*                                                                            *}
{* Portions created by TurboPower Software Inc. are Copyright (C)1995-2002    *}
{* TurboPower Software Inc. All Rights Reserved.                              *}
{*                                                                            *}
{* Contributor(s):                                                            *}
{*                                                                            *}
{* ***** END LICENSE BLOCK *****                                              *}

{$I OVC.INC}

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{.W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

unit ovcdbtb1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, OvcBase, OvcEF, OvcSF, ExtCtrls, OvcIntl;

type
  TOvcfrmProperties = class(TForm)
    edPictureMask: TOvcSimpleField;
    OvcController1: TOvcController;
    Label1: TLabel;
    Label2: TLabel;
    edDecimalPlaces: TOvcSimpleField;
    rgDateOrTime: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    procedure rgDateOrTimeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TOvcfrmProperties.rgDateOrTimeClick(Sender: TObject);
var
  ForceCentury : Boolean;
begin
   ForceCentury := Pos('yyyy', ShortDateFormat) > 0;
   if rgDateOrTime.ItemIndex = 0 then
     edPictureMask.AsString := OvcIntlSup.InternationalDate(ForceCentury)
   else
     edPictureMask.AsString := OvcIntlSup.InternationalTime(False);
end;

end.
