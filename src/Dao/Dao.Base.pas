unit Dao.Base;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client;

type
  TDAOBase<T: class, constructor> = class
  protected
    FQuery: TFDQuery;
  public
    constructor Create;
    destructor Destroy;override;

    function GetAll: TObjectList<T>; virtual; abstract;
    function GetById(AId: Integer): T; virtual; abstract;
    procedure Insert(AModel: T); virtual; abstract;
    procedure Update(AModel: T); virtual; abstract;
    procedure Delete(AId: Integer); virtual; abstract;
  end;

implementation

{ TDAOBase<T> }

uses
  Model.Connection;

constructor TDAOBase<T>.Create;
begin
  FQuery := TModelConnection.GetInstance.GetQuery;
end;

destructor TDAOBase<T>.Destroy;
begin
  FQuery.Free;
  inherited;
end;

end.
