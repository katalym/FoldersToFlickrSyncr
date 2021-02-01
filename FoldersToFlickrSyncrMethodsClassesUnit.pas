unit FoldersToFlickrSyncrMethodsClassesUnit;

interface

type
  TFlickrAPIArgument = record
    Name: string;
    Value: string;
    Optional: boolean;
  end;

  TFlickrAPIArguments = array of TFlickrAPIArgument;

  IFlickrAPIMethod = interface(IInterface)
    ['{B76184AD-1FAA-4901-894C-A22FD3A8A4A0}']
    function GetArguments(Index: Integer): TFlickrAPIArgument;
    function GetArgumentsCount: integer;
    function GetMethod_Name: string;
    function GetMethod_WithArguments: string;
    function GetNeedsLogin: boolean;
    function GetRequiredPermissions: integer;
    procedure SetArguments(Index: Integer; const Value: TFlickrAPIArgument);
    property Arguments[Index: Integer]: TFlickrAPIArgument read GetArguments write SetArguments;
    property ArgumentsCount: integer read GetArgumentsCount;
    property Method_Name: string read GetMethod_Name;
    property Method_WithArguments: string read GetMethod_WithArguments;
    property NeedsLogin: boolean read GetNeedsLogin;
    property RequiredPermissions: integer read GetRequiredPermissions;
  end;

  TFlickrAPIMethod = class(TInterfacedObject, IFlickrAPIMethod)
  private
    FArguments: TFlickrAPIArguments;
    FArgumentsCount: integer;
    FMethod_Name: string;
    FNeedsLogin: boolean;
    FRequiredPermissions: integer;
    function GetArguments(Index: Integer): TFlickrAPIArgument;
    function GetArgumentsCount: integer;
    function GetMethod_Name: string;
    function GetMethod_WithArguments: string;
    function GetNeedsLogin: boolean;
    function GetRequiredPermissions: integer;
    procedure SetArguments(Index: Integer; const Value: TFlickrAPIArgument);
  public
    constructor Create(
      const aMethod_Name: string;
      const aNeedsLogin: boolean;
      const aRequiredPermissions: integer;
      const aArgumentsCount: integer);
    destructor Destroy; override;
    property Arguments[Index: Integer]: TFlickrAPIArgument read GetArguments write SetArguments;
    property ArgumentsCount: integer read GetArgumentsCount;
    property Method_Name: string read GetMethod_Name;
    property Method_WithArguments: string read GetMethod_WithArguments;
    property NeedsLogin: boolean read GetNeedsLogin;
    property RequiredPermissions: integer read GetRequiredPermissions;
  end;

const
  ARGUMENTNAME_API_KEY = 'api_key';
  ARGUMENTNAME_PHOTO = 'photo';

implementation

uses
  System.SysUtils;

constructor TFlickrAPIMethod.Create(
  const aMethod_Name: string;
  const aNeedsLogin: boolean;
  const aRequiredPermissions: integer;
  const aArgumentsCount: integer);
begin
  inherited Create;
  FMethod_Name := aMethod_Name;
  FNeedsLogin := aNeedsLogin;
  FRequiredPermissions := aRequiredPermissions;
  FArgumentsCount := aArgumentsCount;
  SetLength(FArguments, FArgumentsCount);
end;

destructor TFlickrAPIMethod.Destroy;
begin
  SetLength(FArguments, 0);
  inherited Destroy;
end;

function TFlickrAPIMethod.GetArguments(Index: Integer): TFlickrAPIArgument;
begin
  Result := FArguments[Index];
end;

function TFlickrAPIMethod.GetArgumentsCount: integer;
begin
  Result := FArgumentsCount;
end;

function TFlickrAPIMethod.GetMethod_Name: string;
begin
  Result := FMethod_Name;
end;

function TFlickrAPIMethod.GetMethod_WithArguments: string;
var
  i: integer;
  vArgument: TFlickrAPIArgument;
begin
  Result := FMethod_Name;
  for i := 0 to ArgumentsCount - 1 do begin
    vArgument := Arguments[i];
    if SameText(vArgument.Name, ARGUMENTNAME_API_KEY) then
    begin
      if not vArgument.Optional then
        Result := Result + ' {oauth_consumer_key}';
    end else
//    if vArgument.Value <> '' then
    begin
      Result := Result  + ', ' + vArgument.Name + '=' + vArgument.Value.QuotedString('"');
    end;
  end;

end;

function TFlickrAPIMethod.GetNeedsLogin: boolean;
begin
  Result := FNeedsLogin;
end;

function TFlickrAPIMethod.GetRequiredPermissions: integer;
begin
  Result := FRequiredPermissions;
end;

procedure TFlickrAPIMethod.SetArguments(Index: Integer; const Value: TFlickrAPIArgument);
begin
  FArguments[Index] := Value;
end;

end.
