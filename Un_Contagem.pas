unit Un_Contagem;

interface
uses System.SysUtils, System.Variants,Vcl.Controls, System.Classes, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type

  TContagem = class( TComponent )
  private
     FTempos: Array of TDateTime;
     FQuantidade: Integer;
     function getTempoMedio: TDateTime;
     function getFQuantidade: Integer;
    function getPrimeiro: TDateTime;
  public
     property Quantidade: Integer   read getFQuantidade;
     property TempoMedio: TDateTime read getTempoMedio;
     property Primeiro: TDateTime   read getPrimeiro;

     procedure Reiniciar;
     procedure Adicionar;
     constructor Create(AOwner: TComponent); override;
  end;

implementation

{ TContagem }

procedure TContagem.Adicionar;
var nAux: Integer;
    xTimer: TDateTime;
begin
   FQuantidade := FQuantidade + 1;
   SetLength(FTempos, FQuantidade);
   FTempos[ Length(FTempos)-1 ] := Now;
   // ShowMessage( FormatDateTime ( 'hh:nn:ss', FTempos[ Length(FTempos)-1 ] ) );
end;
// *****************************************************************************
constructor TContagem.Create(AOwner: TComponent);
begin
   inherited;
   Reiniciar;
end;
// *****************************************************************************
function TContagem.getFQuantidade: Integer;
begin
   if FQuantidade > 0 then begin
      Result := FQuantidade -1;
   end else begin
      Result := 0;
   end;
end;
function TContagem.getPrimeiro: TDateTime;
begin
   Result := FTempos[ Low( FTempos ) ];
end;
// *****************************************************************************
function TContagem.getTempoMedio: TDateTime;
var i: Integer;
    SomaTempo: TDateTime;
begin
   SomaTempo := 0;
   for i := Low( FTempos )+1 to High( FTempos ) do begin
      SomaTempo := SomaTempo + ( FTempos[ i ] - FTempos[ i-1 ] );
   end;
   if FQuantidade > 1 then begin
      Result := SomaTempo / ( FQuantidade-1 );
   end else begin
      Result := 0;
   end;
end;
// *****************************************************************************
procedure TContagem.Reiniciar;
var i: Integer;
begin
   FQuantidade := 0;
   SetLength(FTempos, 0);
   Adicionar;
end;
// *****************************************************************************
end.
