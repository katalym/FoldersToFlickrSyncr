(**
  Purpose: Support XML functions
*)

unit XMLSupportUnit;

{$ASSERTIONS ON}
{$WARN UNIT_PLATFORM OFF}

interface

uses
  Classes, SysUtils, RegExpr, XMLIntf;

type

  IbvXMLAccessInternal = interface;

  IbvXMLAccess = interface(IInterface)
  ['{60FA3B5F-E93B-438E-A32A-C542A6285FC5}']
    function ElementExists(Path: string): Boolean;
    function GetAttribute(Path: string): string;
    function GetElement(Path: string): string;
    function GetEncoding: string;
    function GetInternalInterface: IbvXMLAccessInternal;
    function GetNode(Path: string): IXMLNode;
    function GetXML: string;
    procedure LoadFromFile(const aFileName: string);
    procedure LoadFromStream(const aStream: TStream);
    procedure SaveToFile(const aFileName: string);
    procedure SaveToStream(const aStream: TStream);
    procedure SetAttribute(Path: string; const Value: string);
    procedure SetElement(Path: string; const Value: string);
    procedure SetEncoding(const Value: string);
    property Attribute[Path: string]: string read GetAttribute write SetAttribute;
    property Element[Path: string]: string read GetElement write SetElement;
    property Encoding: string read GetEncoding write SetEncoding;
    property InternalInterface: IbvXMLAccessInternal read GetInternalInterface;
    property Node[Path: string]: IXMLNode read GetNode;
    property XML: string read GetXML;
  end;

  IbvXMLAccessInternal = interface(IInterface)
  ['{F385CE65-524B-4384-A32F-B17A905266F5}']
    function GetAccessInterface: IbvXMLAccess; stdcall;
    function GetXMLDocument: IXMLDocument; stdcall;
    property AccessInterface: IbvXMLAccess read GetAccessInterface;
    property XMLDocument: IXMLDocument read GetXMLDocument;
  end;

  TbvXMLAccess = class(TInterfacedObject, IbvXMLAccess, IbvXMLAccessInternal)
  private
    FRE1: TRegExpr;
    FXMLDoc: IXMLDocument;
    function DoGetAttribute(aNode: IXMLNode; const aPath: string): string;
    function DoGetElement(aNode: IXMLNode; const aPath: string): string;
    function DoGetNode(aNode: IXMLNode; const aPath: string): IXMLNode;
    procedure DoSetAttribute(aNode: IXMLNode; const aPath, aValue: string);
    procedure DoSetElement(aNode: IXMLNode; const aPath, aValue: string);
    function GetChildNodeByIndex(const aNode: IXMLNode; const aNodeName: string; const aIndex: Integer): IXMLNode;
    function GetChildNodeCount(const aNode: IXMLNode; const aNodeName: string): Integer;
    procedure ParsePath(const aPath: string; out aFirstElementName: string; out aFirstElementIndex: Integer; out aRestOfPath: string);
  protected
    function GetAccessInterface: IbvXMLAccess; stdcall;
    function GetAttribute(Path: string): string;
    function GetElement(Path: string): string;
    function GetEncoding: string;
    function GetInternalInterface: IbvXMLAccessInternal;
    function GetNode(Path: string): IXMLNode;
    function GetXML: string;
    function GetXMLDocument: IXMLDocument; stdcall;
    procedure LoadFromFile(const aFileName: string);
    procedure LoadFromStream(const aStream: TStream);
    procedure SaveToFile(const aFileName: string);
    procedure SaveToStream(const aStream: TStream);
    procedure SetAttribute(Path: string; const Value: string);
    procedure SetElement(Path: string; const Value: string);
    procedure SetEncoding(const Value: string);
  public
    constructor Create(const aXMLBody: string); overload;
    constructor Create(aXML: IXMLDocument); overload;
    destructor Destroy; override;
    function ElementExists(Path: string): Boolean;
  end;

implementation

uses
  XMLDoc, System.Variants;

const
  INDEXVALUE_STAR  = -1;
  INDEXVALUE_QMARK = -2;
  XMLACCESS_DEFAULT_ENCODING = 'utf-8';

constructor TbvXMLAccess.Create(const aXMLBody: string);
begin
  if Trim(aXMLBody) = '' then begin
    Create(NewXMLDocument);
  end
  else begin
    Create(LoadXMLData(aXMLBody));
  end;
end;

constructor TbvXMLAccess.Create(aXML: IXMLDocument);
begin
  inherited Create;
  if Assigned(aXML) then begin
    FXMLDoc := aXML;
  end
  else begin
    FXMLDoc := NewXMLDocument;
  end;
  FXMLDoc.Encoding := XMLACCESS_DEFAULT_ENCODING;
  FRE1 := TRegExpr.Create;
end;

destructor TbvXMLAccess.Destroy;
begin
  FreeAndNil(FRE1);
  FXMLDoc := nil;
  inherited Destroy;
end;

function TbvXMLAccess.DoGetAttribute(aNode: IXMLNode; const aPath: string): string;
var
  vFEI: Integer;
  vFEN: string;
  vNode: IXMLNode;
  vPath: string;
  vROP: string;
  vValue: Variant;
begin
  Result := '';
  if Trim(aPath) <> '' then begin
    ParsePath(aPath, vFEN, vFEI, vROP);
    if vROP = '' then begin
      case vFEI of
        INDEXVALUE_STAR, INDEXVALUE_QMARK: begin
          raise Exception.Create('Unsupported operation');
        end;
        else begin
          vValue := aNode.Attributes[vFEN];
          if VarIsNull(vValue) then begin
            Result := '';
          end
          else begin
            Result := vValue;
          end;
        end;
      end;
    end
    else begin
      vPath := vROP;
      ParsePath(vPath, vFEN, vFEI, vROP);
      if vROP='' then begin
        Result := DoGetAttribute(aNode, vPath);
      end
      else begin
        case vFEI of
          INDEXVALUE_STAR, INDEXVALUE_QMARK: begin
            raise Exception.Create('Unsupported operation');
          end;
          else begin
            vNode := GetChildNodeByIndex(aNode, vFEN, vFEI);
            if Assigned(vNode) then begin
              Result := DoGetAttribute(vNode, vPath);
            end;
          end;
        end;
      end;
    end;
  end;
end;

function TbvXMLAccess.DoGetElement(aNode: IXMLNode; const aPath: string): string;
var
  vFEI:  Integer;
  vFEN:  string;
  vNode: IXMLNode;
  vNodeValue: Variant;
  vPath: string;
  vROP:  string;
begin
  Result := '';
  ParsePath(aPath, vFEN, vFEI, vROP);
  if vROP = '' then begin
    vNodeValue := aNode.NodeValue;
    if VarIsNull(vNodeValue) then begin
      Result := '';
    end
    else begin
      Result := vNodeValue;
    end;
  end
  else begin
    vPath := vROP;
    ParsePath(vPath, vFEN, vFEI, vROP);
    case vFEI of
      INDEXVALUE_STAR: begin
        raise Exception.Create('Unsupported operation');
      end;
      INDEXVALUE_QMARK: begin
        Result := IntToStr(GetChildNodeCount(aNode, vFEN));
      end;
      else begin
        vNode := GetChildNodeByIndex(aNode, vFEN, vFEI);
        if Assigned(vNode) then begin
          Result := DoGetElement(vNode, vPath);
        end;
      end;
    end;
  end;
end;

function TbvXMLAccess.DoGetNode(aNode: IXMLNode; const aPath: string): IXMLNode;
var
  vFEI:  Integer;
  vFEN:  string;
  vNode: IXMLNode;
  vPath: string;
  vROP:  string;
begin
  Result := nil;
  ParsePath(aPath, vFEN, vFEI, vROP);
  if vROP = '' then begin
    Result := aNode;
  end
  else begin
    vPath := vROP;
    ParsePath(vPath, vFEN, vFEI, vROP);
    case vFEI of
      INDEXVALUE_STAR: begin
        raise Exception.Create('Unsupported operation');
      end;
      INDEXVALUE_QMARK: begin
        raise Exception.Create('Unsupported operation');
      end;
      else begin
        vNode := GetChildNodeByIndex(aNode, vFEN, vFEI);
        if Assigned(vNode) then begin
          Result := DoGetNode(vNode, vPath);
        end;
      end;
    end;
  end;
end;

procedure TbvXMLAccess.DoSetAttribute(aNode: IXMLNode; const aPath, aValue: string);
var
  i: Integer;
  n: Integer;
  vFEI: Integer;
  vFEN: string;
  vNode: IXMLNode;
  vPath: string;
  vROP: string;
begin
  if Trim(aPath) <> '' then begin
    ParsePath(aPath, vFEN, vFEI, vROP);
    if vROP = '' then begin
      case vFEI of
        INDEXVALUE_STAR, INDEXVALUE_QMARK: begin
          raise Exception.Create('Unsupported operation');
        end;
        else begin
          aNode.Attributes[vFEN] := aValue;
        end;
      end;
    end
    else begin
      vPath := vROP;
      ParsePath(vPath, vFEN, vFEI, vROP);
      if vROP='' then begin
        DoSetAttribute(aNode, vPath, aValue);
      end
      else begin
        case vFEI of
          INDEXVALUE_STAR: begin
            n := GetChildNodeCount(aNode, vFEN);
            for i := 0 to n - 1 do begin
              vNode := GetChildNodeByIndex(aNode, vFEN, i);
              DoSetAttribute(vNode, vPath, aValue);
            end;
          end;
          INDEXVALUE_QMARK: begin
            raise Exception.Create('Unsupported operation');
          end;
          else begin
            vNode := GetChildNodeByIndex(aNode, vFEN, vFEI);
            if not Assigned(vNode) then begin
              vNode := aNode.AddChild(vFEN);
            end;
            DoSetAttribute(vNode, vPath, aValue);
          end;
        end;
      end;
    end;
  end;
end;

procedure TbvXMLAccess.DoSetElement(aNode: IXMLNode; const aPath, aValue: string);
var
  i: Integer;
  n: Integer;
  vFEI: Integer;
  vFEN: string;
  vNode: IXMLNode;
  vPath: string;
  vROP: string;
begin
  ParsePath(aPath, vFEN, vFEI, vROP);
  if vROP = '' then begin
    aNode.NodeValue := aValue;
  end
  else begin
    vPath := vROP;
    ParsePath(vPath, vFEN, vFEI, vROP);
    case vFEI of
      INDEXVALUE_STAR: begin
        n := GetChildNodeCount(aNode, vFEN);
        for i := 0 to n - 1 do begin
          vNode := GetChildNodeByIndex(aNode, vFEN, i);
          DoSetElement(vNode, vPath, aValue);
        end;
      end;
      INDEXVALUE_QMARK: begin
        raise Exception.Create('Unsupported operation');
      end;
      else begin
        vNode := GetChildNodeByIndex(aNode, vFEN, vFEI);
        if not Assigned(vNode) then begin
          vNode := aNode.AddChild(vFEN);
        end;
        DoSetElement(vNode, vPath, aValue);
      end;
    end;
  end;
end;

function TbvXMLAccess.ElementExists(Path: string): Boolean;

  function _DoGetElement(aNode: IXMLNode; const aPath: string): Boolean;
  var
    vFEI:  Integer;
    vFEN:  string;
    vNode: IXMLNode;
    vPath: string;
    vROP:  string;
  begin
    ParsePath(aPath, vFEN, vFEI, vROP);
    if vROP = '' then begin
      Result := True;
    end else begin
      vPath := vROP;
      ParsePath(vPath, vFEN, vFEI, vROP);
      case vFEI of
        INDEXVALUE_STAR: begin
          raise Exception.Create('Unsupported operation');
        end;
        INDEXVALUE_QMARK: begin
          Result := True;
        end;
        else begin
          vNode := GetChildNodeByIndex(aNode, vFEN, vFEI);
          Result := Assigned(vNode) and _DoGetElement(vNode, vPath);
        end;
      end;
    end;
  end;

var
  vFEI: Integer;
  vFEN: string;
  vRootNode: IXMLNode;
  vROP: string;
begin
  ParsePath(Path, vFEN, vFEI, vROP);
  vRootNode := FXMLDoc.ChildNodes.FindNode(vFEN);
  Result := Assigned(vRootNode) and _DoGetElement(vRootNode, Path);
end;

function TbvXMLAccess.GetAccessInterface: IbvXMLAccess;
begin
  Result := Self as IbvXMLAccess;
end;

function TbvXMLAccess.GetAttribute(Path: string): string;
var
  vFEI: Integer;
  vFEN: string;
  vRootNode: IXMLNode;
  vROP: string;
begin
  Result := '';
  ParsePath(Path, vFEN, vFEI, vROP);
  vRootNode := FXMLDoc.ChildNodes.FindNode(vFEN);
  if Assigned(vRootNode) then begin
    Result := DoGetAttribute(vRootNode, Path);
  end;
end;

function TbvXMLAccess.GetChildNodeByIndex(const aNode: IXMLNode; const aNodeName: string; const aIndex: Integer): IXMLNode;
var
  i: Integer;
  n: Integer;
  vNode: IXMLNode;
  vResult: IXMLNode;
begin
  vResult := nil;
  n := -1;
  for i := 0 to aNode.ChildNodes.Count - 1 do begin
    vNode := aNode.ChildNodes.Get(i);
    if vNode.NodeName = aNodeName then begin
      Inc(n);
      if n = aIndex then begin
        vResult := vNode;
        Break;
      end;
    end;
  end;
  Result := vResult;
end;

function TbvXMLAccess.GetChildNodeCount(const aNode: IXMLNode; const aNodeName: string): Integer;
var
  i: Integer;
  n: Integer;
  vNode: IXMLNode;
begin
  n := 0;
  for i := 0 to aNode.ChildNodes.Count - 1 do begin
    vNode := aNode.ChildNodes.Get(i);
    if vNode.NodeName = aNodeName then begin
      Inc(n);
    end;
  end;
  Result := n;
end;

function TbvXMLAccess.GetElement(Path: string): string;
var
  vFEI: Integer;
  vFEN: string;
  vRootNode: IXMLNode;
  vROP: string;
begin
  Result := '';
  ParsePath(Path, vFEN, vFEI, vROP);
  vRootNode := FXMLDoc.ChildNodes.FindNode(vFEN);
  if Assigned(vRootNode) then begin
    Result := DoGetElement(vRootNode, Path);
  end;
end;

function TbvXMLAccess.GetEncoding: string;
begin
  Result := FXMLDoc.Encoding;
end;

function TbvXMLAccess.GetInternalInterface: IbvXMLAccessInternal;
begin
  Result := Self as IbvXMLAccessInternal;
end;

function TbvXMLAccess.GetNode(Path: string): IXMLNode;
var
  vFEI: Integer;
  vFEN: string;
  vRootNode: IXMLNode;
  vROP: string;
begin
  Result := nil;
  ParsePath(Path, vFEN, vFEI, vROP);
  vRootNode := FXMLDoc.ChildNodes.FindNode(vFEN);
  if Assigned(vRootNode) then begin
    Result := DoGetNode(vRootNode, Path);
  end;
end;

function TbvXMLAccess.GetXML: string;
begin
  FXMLDoc.SaveToXML(Result);
end;

function TbvXMLAccess.GetXMLDocument: IXMLDocument;
begin
  Result := FXMLDoc;
end;

procedure TbvXMLAccess.LoadFromFile(const aFileName: string);
begin
  FXMLDoc.LoadFromFile(aFileName);
end;

procedure TbvXMLAccess.LoadFromStream(const aStream: TStream);
begin
  FXMLDoc.LoadFromStream(aStream);
end;

procedure TbvXMLAccess.ParsePath(
  const aPath: string;
  out aFirstElementName: string;
  out aFirstElementIndex: Integer;
  out aRestOfPath: string);
var
  vFirst: string;
begin
  FRE1.Expression := '\A([^\.]+)\.(.*)\Z';
  if FRE1.Exec(aPath) then begin
    vFirst := FRE1.Match[1];
    aRestOfPath := Trim(FRE1.Match[2]);
  end
  else begin
    vFirst := aPath;
    aRestOfPath := '';
  end;
  FRE1.Expression := '\A(.*)\[(\d+|\?|\*)\]\Z';
  if FRE1.Exec(vFirst) then begin
    aFirstElementName := FRE1.Match[1];
    if FRE1.Match[2] = '*' then begin
      aFirstElementIndex := INDEXVALUE_STAR;
    end
    else if FRE1.Match[2] = '?' then begin
      aFirstElementIndex := INDEXVALUE_QMARK;
    end
    else begin
      aFirstElementIndex := StrToIntDef(FRE1.Match[2], 0);
    end;
  end
  else begin
    aFirstElementName  := vFirst;
    aFirstElementIndex := 0;
  end;
end;

procedure TbvXMLAccess.SaveToFile(const aFileName: string);
begin
  FXMLDoc.SaveToFile(aFileName);
end;

procedure TbvXMLAccess.SaveToStream(const aStream: TStream);
begin
  FXMLDoc.SaveToStream(aStream);
end;

procedure TbvXMLAccess.SetAttribute(Path: string; const Value: string);
var
  vFEI: Integer;
  vFEN: string;
  vRootNode: IXMLNode;
  vROP: string;
begin
  ParsePath(Path, vFEN, vFEI, vROP);
  vRootNode := FXMLDoc.ChildNodes.FindNode(vFEN);
  if not Assigned(vRootNode) then begin
    vRootNode := FXMLDoc.AddChild(vFEN);
  end;
  if (vFEI <> 0) or (vFEN <> vRootNode.NodeName) then begin
    raise Exception.Create('Only one root element is allowed');
  end;
  DoSetAttribute(vRootNode, Path, Value);
end;

procedure TbvXMLAccess.SetElement(Path: string; const Value: string);
var
  vFEI: Integer;
  vFEN: string;
  vRootNode: IXMLNode;
  vROP: string;
begin
  ParsePath(Path, vFEN, vFEI, vROP);
  vRootNode := FXMLDoc.ChildNodes.FindNode(vFEN);
  if not Assigned(vRootNode) then begin
    vRootNode := FXMLDoc.AddChild(vFEN);
  end;
  if vROP = '' then begin
    if vFEI <> 0 then begin
      raise Exception.Create('Only one root element is allowed');
    end;
  end;
  DoSetElement(vRootNode, Path, Value);
end;

procedure TbvXMLAccess.SetEncoding(const Value: string);
begin
  FXMLDoc.Encoding := Value;
end;

end.
