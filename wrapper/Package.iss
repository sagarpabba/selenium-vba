; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SeleniumWrapper"
#define MyAppVersion GetFileVersion(".\bin\Release\SeleniumWrapper.dll")
#define MyAppPublisher "Florent BREHERET"
#define MyAppURL "http://code.google.com/p/selenium-vba/"
#define MyVersion() ParseVersion(".\bin\Release\SeleniumWrapper.dll", Local[0], Local[1], Local[2], Local[3]), Str(Local[0]) + "." + Str(Local[1]) + "." + Str(Local[2]);

[Setup]
AppId={{f1a3918e-07dd-40e3-8389-da62b7ab0a4b}}
PrivilegesRequired=poweruser
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
VersionInfoVersion={#MyAppVersion}
VersionInfoTextVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
LicenseFile=.\License.txt
;InfoBeforeFile=.\ClassLibrary1\bin\Release\Info.txt
OutputDir="."
OutputBaseFilename=SeleniumWrapperSetup-{#MyVersion()}
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: ".\bin\Release\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\bin\Release\*.pdb"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\Reference\chromedriver.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\License.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\Readme.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\bin\Release\SeleniumWrapperApi.chm"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\QuickTest.vbs"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\Examples\*.xls"; DestDir: "{app}\Examples"; Flags: ignoreversion skipifsourcedoesntexist
Source: ".\Examples\*.doc"; DestDir: "{app}\Examples"; Flags: ignoreversion skipifsourcedoesntexist
Source: ".\Examples\*.vbs"; DestDir: "{app}\Examples"; Flags: ignoreversion skipifsourcedoesntexist 

[Icons]
;Name: "{group}\Readme"; Filename: "{app}\Readme.txt"; WorkingDir: "{app}";
Name: "{group}\API documentation"; Filename: "{app}\SeleniumWrapperApi.chm"; WorkingDir: "{app}";
Name: "{group}\QuickTest"; Filename: "{app}\QuickTest.vbs"; WorkingDir: "{app}";
Name: "{group}\Examples"; Filename: "{app}\Examples"; WorkingDir: "{app}";
Name: "{group}\Project Home Page"; Filename: "http://code.google.com/p/selenium-vba/"; WorkingDir: "{app}";
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
Root: HKLM; Subkey: "SOFTWARE\Microsoft\.NETFramework\Policy\AppPatch\v2.0.50727.00000\excel.exe\{{2CCAA9FE-6884-4AF2-99DD-5217B94115DF}}"; ValueType: string; ValueName: "Target Version"; ValueData: "v2.0.50727"

[Run]
Filename:"{reg:HKLM\SOFTWARE\Microsoft\.NETFramework,InstallRoot}\{reg:HKCR\CLSID\{{61b3e12b-3586-3a58-a497-7ed7c4c794b9%7D\InprocServer32\2.0.0.0,RuntimeVersion}\RegAsm.exe"; Parameters: SeleniumWrapper.dll /unregister /tlb:SeleniumWrapper.tlb; WorkingDir: {app}; StatusMsg: "Registering SeleniumWrapper dll"; Flags: runhidden;
Filename:"{reg:HKLM\SOFTWARE\Microsoft\.NETFramework,InstallRoot}\{reg:HKCR\CLSID\{{61b3e12b-3586-3a58-a497-7ed7c4c794b9%7D\InprocServer32\2.0.0.0,RuntimeVersion}\RegAsm.exe"; Parameters: SeleniumWrapper.dll /tlb:SeleniumWrapper.tlb  /codebase;WorkingDir: {app}; StatusMsg: "Registering SeleniumWrapper dll"; Flags: runhidden;

[UninstallDelete]
Type: filesandordirs; Name: "{app}"

[UninstallRun]
Filename:"{reg:HKLM\SOFTWARE\Microsoft\.NETFramework,InstallRoot}\{reg:HKCR\CLSID\{{61b3e12b-3586-3a58-a497-7ed7c4c794b9%7D\InprocServer32\2.0.0.0,RuntimeVersion}\RegAsm.exe"; Parameters: SeleniumWrapper.dll /unregister /tlb:SeleniumWrapper.tlb; WorkingDir: {app}; StatusMsg: "Unregistering SeleniumWrapper dll"; Flags: runhidden;

[Code]
Function InitializeSetup() : boolean;
Begin
  If RegKeyExists(HKLM,'SOFTWARE\Microsoft\.NETFramework\policy\v2.0') Then Begin
    Result := True;
  End Else Begin
    MsgBox(ExpandConstant('This setup requires the .NET Framework v2.0.'+ CHR(13) + 'Please download and install the Microsoft .NET Framework v.3.5 or superior'), mbError, MB_OK);
    Result := False;
  End;
End;