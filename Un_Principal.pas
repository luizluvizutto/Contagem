unit Un_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation,

  Un_Contagem;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    btReiniciar: TButton;
    btContar: TButton;
    LbQuantidade: TLabel;
    LbTempoMedio: TLabel;
    LbTempo: TLabel;
    procedure btReiniciarClick(Sender: TObject);
    procedure btContarClick(Sender: TObject);
  private
    { Private declarations }
    FContador: TContagem;
    procedure AtualizarDados;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TForm1 }

procedure TForm1.AtualizarDados;
begin
   LbQuantidade.Text := 'Quantidade: ' + FContador.Quantidade.ToString;
   LbTempoMedio.Text := 'Tempo Médio: ' + FormatDateTime( 'hh:nn:ss', FContador.TempoMedio );
   LbTempo.Text      := 'Tempo decorrido: ' + FormatDateTime( 'hh:nn:ss', Now - FContador.Primeiro );
end;
// *****************************************************************************
procedure TForm1.btContarClick(Sender: TObject);
begin
   FContador.Adicionar;
   AtualizarDados;
end;
// *****************************************************************************
procedure TForm1.btReiniciarClick(Sender: TObject);
begin
   FContador.Reiniciar;
   AtualizarDados;
end;
// *****************************************************************************
constructor TForm1.Create(AOwner: TComponent);
begin
   inherited;
   FContador := TContagem.Create( Self );
end;
// *****************************************************************************
destructor TForm1.Destroy;
begin
   FContador.Free;
   inherited;
end;
// *****************************************************************************
end.
