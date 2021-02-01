unit FoldersToFlickrSyncrHeadersUnit;

interface

type

  TflArgument = record
    Name: string;
    Optional: boolean;
    Value: string;
  end;

  TflArguments = array of TflArgument;

  IflMethod = interface(IInterface)
    ['{B76184AD-1FAA-4901-894C-A22FD3A8A4A0}']
    function GetArguments(Index: Integer): TflArgument;
    function GetArgumentsCount: integer;
    function GetMethod_Name: string;
    function GetNeedsLogin: boolean;
    function GetRequiredPermissions: integer;
    property Arguments[Index: Integer]: TflArgument read GetArguments;
    property ArgumentsCount: integer read GetArgumentsCount;
    property Method_Name: string read GetMethod_Name;
    property NeedsLogin: boolean read GetNeedsLogin;
    property RequiredPermissions: integer read GetRequiredPermissions;
  end;

  TflMethod = class(TInterfacedObject, IflMethod)
  private
    FArguments: TflArguments;
    FArgumentsCount: integer;
    FMethod_Name: string;
    FNeedsLogin: boolean;
    FRequiredPermissions: integer;
    function GetArguments(Index: Integer): TflArgument;
    function GetArgumentsCount: integer;
    function GetMethod_Name: string;
    function GetNeedsLogin: boolean;
    function GetRequiredPermissions: integer;
  public
    constructor Create(
      const aMethod_Name: string;
      const aNeedsLogin: boolean;
      const aRequiredPermissions: integer;
      const aArgumentsCount: integer;
      const aArguments: TflArguments);
    destructor Destroy; override;
    property Arguments[Index: Integer]: TflArgument read GetArguments;
    property ArgumentsCount: integer read GetArgumentsCount;
    property Method_Name: string read GetMethod_Name;
    property NeedsLogin: boolean read GetNeedsLogin;
    property RequiredPermissions: integer read GetRequiredPermissions;
  end;

//method_name = flickr.photos.geo.getLocation
//rsp.method.needslogin = 0
//rsp.method.requiredperms = 0
//rsp.method.description = Get the geo data (latitude and longitude and the accuracy level) for a photo.
//rsp.arguments.arguments.count = 3
//rsp.arguments.argument[0].name = api_key
//rsp.arguments.argument[0].optional = 0
//rsp.arguments.argument[0] = Your API application key. <a href="/services/api/misc.api_keys.html">See here</a> for more details.
//rsp.arguments.argument[1].name = photo_id
//rsp.arguments.argument[1].optional = 0
//rsp.arguments.argument[1] = The id of the photo you want to retrieve location data for.
//rsp.arguments.argument[2].name = extras
//rsp.arguments.argument[2].optional = 1
//rsp.arguments.argument[2] = Extra flags.

implementation

constructor TflMethod.Create(
  const aMethod_Name: string;
  const aNeedsLogin: boolean;
  const aRequiredPermissions: integer;
  const aArgumentsCount: integer;
  const aArguments: TflArguments);
var
  i: integer;
begin
  inherited Create;
  FMethod_Name := aMethod_Name;
  FNeedsLogin := aNeedsLogin;
  FRequiredPermissions := aRequiredPermissions;
  FArgumentsCount := aArgumentsCount;
  SetLength(FArguments, FArgumentsCount);
  for i:= Low(aArguments) to High(aArguments) do
    FArguments[i] := aArguments[i];
end;

destructor TflMethod.Destroy;
begin
  SetLength(FArguments, 0);
  inherited Destroy;
end;

function TflMethod.GetArguments(Index: Integer): TflArgument;
begin
  Result := FArguments[Index];
end;

function TflMethod.GetArgumentsCount: integer;
begin
  Result := FArgumentsCount;
end;

function TflMethod.GetMethod_Name: string;
begin
  Result := FMethod_Name;
end;

function TflMethod.GetNeedsLogin: boolean;
begin
  Result := FNeedsLogin;
end;

function TflMethod.GetRequiredPermissions: integer;
begin
  Result := FRequiredPermissions;
end;

end.
