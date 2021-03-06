unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComObj, ExtCtrls;

type
  TFormMain = class(TForm)
    Open: TOpenDialog;
    Grid: TStringGrid;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure ExecuteQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses DataModule;

{$R *.dfm}
function XlsToStringGrid(AGrid: TStringGrid; AXLSFile: string): Boolean;
const
	xlCellTypeLastCell = $0000000B;
var
	XLApp, Sheet: OLEVariant;
	RangeMatrix: Variant;
	x, y, k, r: Integer;
begin
Result:=False;

//Cria Excel- OLE Object
XLApp:=CreateOleObject('Excel.Application');

try
	//Esconde Excel
	XLApp.Visible:=False;

	//Abre o Workbook
	XLApp.Workbooks.Open(AXLSFile);
	Sheet:=XLApp.Workbooks[ExtractFileName(AXLSFile)].WorkSheets[1];
	Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;

	x:=XLApp.ActiveCell.Row;    //Pegar o n�mero da �ltima linha
	y:=XLApp.ActiveCell.Column; //Pegar o n�mero da �ltima coluna

	//Seta Stringgrid linha e coluna
	AGrid.RowCount:=x;
	AGrid.ColCount:=y;

	//Associaca a variant WorkSheet com a variant do Delphi
	RangeMatrix:=XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;

	//Cria o loop para listar os registros na Grid
	k:=1;
	repeat
		for r:=1 to y do
			AGrid.Cells[(r - 1),(k - 1)]:=RangeMatrix[K, R];
		  Inc(k,1);
    until k > x;
	    RangeMatrix:=Unassigned;
  finally

	//Fecha o Excel
	if not VarIsEmpty(XLApp) then
		begin
		  XLApp.Quit;
		  XLAPP:=Unassigned;
		  Sheet:=Unassigned;
		  Result:=True;
		end;
	end;
end;

procedure TFormMain.ExecuteQuery;
var iIndice : Integer;
begin
   with Grid do   //StringGrid
   begin
      //if (Cells[0, iIndice] = '') or (Cells[0, iIndice] = '') or (Cells[0, iIndice] = '') or (Cells[0, iIndice] = '') or (Cells[0, iIndice] = '') or (Cells[0, iIndice] = '') then
      //begin
          //label1.Font.Color:=clRed;
          //label1.Visible:=true;
          //label1.Caption:='Erro ao inserir os dados: H� dados em branco';
          //exit;
      //end;

   For iIndice := 1 to RowCount -1 do //Cria o loop para adicioar os dados no banco
	  begin
          DM.QueryDB.Append;  //Abre a query para inserir os dados
					DM.QueryDBNome.Value:=Cells[0, iIndice];        //Adicionando os nomes
					DM.QueryDBSobrenome.Value:=Cells[1, iIndice];   //Adicionando os sobrenomes
					DM.QueryDBIdade.Value:=Cells[2, iIndice];       //Adicionando as idades
					DM.QueryDBTelefone.Value:=Cells[3, iIndice];    //Adicionando os telefones
					DM.QueryDBCelular.Value:=Cells[4, iIndice];     //Adicionando os celulares
				  DM.QueryDBCidade.Value:=Cells[5, iIndice];      //Adicionando as cidades
          DM.QueryDB.Refresh;  //Atualiza a query
    end;
    //Mostra a mensagem de sucesso
    label1.Font.Color:=clGreen;
    label1.Caption:='Dados inseridos no banco com sucesso';
    panel2.Color:=clGreen;
    panel2.Enabled:=false;
   end;
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
with DM.QueryDB do    //Limpa a query ao iniciar o programa
begin
Close;
SQL.Clear;
SQL.Add('Select * From clientes;');
Open;
end;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
with DM.QueryDB do    //Limpa a query ao fechar o programa
begin
Close;
SQL.Clear;
SQL.Add('Select * From clientes;');
Open;
end;
end;

procedure TFormMain.Panel1Click(Sender: TObject);
begin
    panel2.Color:=clSilver;
    panel2.Enabled:=true;
    label1.Caption:='';

    Open.execute; //Abre a tela para buscar o arquivo
    if Open.FileName = '' then //Se for vazio n�o faz nada
    else
      if Open.FileName <> '' then
      begin
        XlsToStringGrid(Grid,Open.FileName); //Chama a funcao para colocar os dados na Grade
        //Mostra a mensagem de sucesso
        label1.Visible:=true;
        label1.Font.Color:=clBlack;
        label1.Caption:='Dados carregados com sucesso';
      end
      else

end;

procedure TFormMain.Panel2Click(Sender: TObject);
begin
  ExecuteQuery();   //Chama a procedure que insere os dados no banco
end;

procedure TFormMain.Panel3Click(Sender: TObject);
var row, col : Integer;
begin
   for row := 1 to Grid.RowCount - 1 do
	begin
		for col := 0 to Grid.ColCount - 1 do    //Limpa a grade
			begin
				Grid.Cells[col, row] := '';
			end;
	end;
//Limpa as mensagens
label1.Visible:=false;
panel2.Color:=clSilver;
panel2.Enabled:=true;
label1.Font.Color:=clBlack;
label1.Caption:='';
end;
end.
