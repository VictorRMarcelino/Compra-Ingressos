Program Trabalho;

//Constantes
const TIPO_COMPRADOR_SOCIO = 1;
const _TIPO_COMPRADOR_SOCIO = 'S�cio';
const TIPO_COMPRADOR_TORCEDOR = 2;
const _TIPO_COMPRADOR_TORCEDOR = 'Torcedor';
const TIPO_COMPRADOR_VISITANTE = 3;
const _TIPO_COMPRADOR_VISITANTE = 'Visitante';

const ARQUIBANCADA_COBERTA = 1;
const _ARQUIBANCADA_COBERTA = 'Coberta';
const ARQUIBANCADA_GERAL = 2;
const _ARQUIBANCADA_GERAL = 'Geral';

const MAX_COBERTA_SOCIOS = 500;
const MAX_COBERTA_TORCEDORES = 1500;
const MAX_GERAL_TORCEDORES = 700;
const MAX_GERAL_VISITANTES = 300;

const MAX_SOCIOS = 500;
const MAX_VISITANTES = 300;

const PRECO_COBERTA = 100;
const PRECO_SOCIOS = 50;
const PRECO_GERAL = 40;
const PRECO_VISITANTES = 80;

//Tipos
type filaSocios = array[1..MAX_SOCIOS] of integer;
type filaVisitantes = array[1..MAX_VISITANTES] of integer;
 
type listaLugarCoberturaSocios = array[1..MAX_COBERTA_SOCIOS] of integer;
type listaLugarCoberturaTorcedores = array[1..MAX_COBERTA_TORCEDORES] of integer;
type listaLugarGeralTorcedores = array[1..MAX_GERAL_TORCEDORES] of integer; 
type listaLugarGeralVisitantes = array[1..MAX_GERAL_VISITANTES] of integer;

{
	Verifica se foi alcan�ado o limite m�ximo de s�cios
	@param filaSocios aFila - Array da fila de s�cios
	@param integer iQuantidadeAtual - Quantidade atual de elementos na fila de s�cios
	@return boolean
}
function validaLimiteCompradorSocio(aFila: filaSocios; iQuantidadeAtual: integer): boolean;
begin;
	validaLimiteCompradorSocio := false;
	
	if (iQuantidadeAtual = MAX_SOCIOS)	then
		begin;
			validaLimiteCompradorSocio := true;
		end;
end;

{
	Marca um lugar da coberta dos s�cios como utilizada
	@param listaLugarSocios aLista
	@param integer lugarEscolhido
}
procedure marcaLugarCobertaSocio(var aLista: listaLugarSocios, lugarEscolhido: integer);
begin;
	aLista[lugarEscolhido] := 1;
end;

{
	Verifica se determinado lugar est� dispon�vel para os s�cios
	@param listaLugarSocios aLista
	@param integer lugarEscolhido 
}
function validaLugarCobertaDisponivelSocio(aLista: listaLugarSocios, lugarEscolhido: integer): integer;
begin;
	validaLugarCobertaDisponivelSocio := (aLista[lugarEscolhido] = 1);
end;

{
	Realiza a compra do ingresso de um s�cio
	@param listaLugarSocios aLista
}
procedure comprarIngressoSocio(var aLista: listaLugarSocios);
var lugarDisponivel, lugarDesejado: integer;
begin;
	while (lugarDisponivel <> 0) do
		begin;
			writeln('Informe o n�mero do lugar desejado');
			readln(lugarDisponivel);
			if (validaLugarCobertaDisponivelSocio(aLista, lugarDesejado) = true) then
				begin;
					writeln('O lugar desejado j� foi escolhido! Escolha outro!');
				end
			else 
				begin;
					marcaLugarCobertaSocio(aLista, lugarDesejado);
					lugarDisponivel := 1;
				end;
		end;	
end;

{
	Questiona ao torcedor qual bancada ele deseja comprar o ingresso
	@return integer
}
function perguntaArquibancadaTorcedor(): integer;
var arquibancada: integer;
begin;
	writeln('Para qual arquibancada voc� deseja comprar um ingresso?');
	writeln(ARQUIBANCADA_COBERTA, ' - ', _ARQUIBANCADA_COBERTA);
	writeln(ARQUIBANCADA_GERAL  , ' - ', _ARQUIBANCADA_GERAL);
	readln(arquibancada);
	perguntaArquibancadaTorcedor := arquibancada;
end;

{
	Realiza a compra do ingresso de um torcedor
}
procedure comprarIngressoTorcedor();
var arquibancada: integer;
begin;
	while ((arquibancada <> ARQUIBANCADA_COBERTA) AND (arquibancada <> ARQUIBANCADA_GERAL)) do
		begin;
			arquibancada := perguntaArquibancadaTorcedor();
		end;
end;

{
	Verifica se foi alcan�ado o limite m�ximo de visitantes
	@param filaSocios aFila - Array da fila de visitantes
	@param integer iQuantidadeAtual - Quantidade atual de elementos na fila de visitantes
	@return boolean
}
function validaLimiteCompradorVisitante(aFila: filaVisitantes; iQuantidadeAtual: integer): boolean;
begin;
	validaLimiteCompradorVisitante := false;
	
	if (iQuantidadeAtual = MAX_VISITANTES)	then
		begin;
			validaLimiteCompradorVisitante := true;
		end;
end;

{
	Verifica se determinado lugar est� dispon�vel para os s�cios
	@param listaLugarSocios aLista
	@param integer listaLugarVisitantes 
}
function validaLugarGeralDisponivelVisitantes(aLista: listaLugarVisitantes, lugarEscolhido: integer): integer;
begin;
	validaLugarGeralDisponivelVisitantes := (aLista[lugarEscolhido] = 1);
end;

{
	Realiza a compra do ingresso de um visitante
	@param listaLugarVisitantes aLista
}
procedure comprarIngressoVisitante(aLista: listaLugarVisitantes);
var lugarDisponivel, lugarDesejado: integer;
begin;
	while (lugarDisponivel <> 0) do
		begin;
			writeln('Informe o n�mero do lugar desejado');
			readln(lugarDisponivel);
			if (validaLugarCobertaDisponivelSocio(aLista, lugarDesejado) = true) then
				begin;
					writeln('O lugar desejado j� foi escolhido! Escolha outro!');
				end
			else 
				begin;
					marcaLugarCobertaSocio(aLista, lugarDesejado);
					lugarDisponivel := 1;
				end;
		end;
end; 

procedure geraRelatorioFinal(quantidadeSocios: integer, quantidadeVisitantes: integer);
	writeln('Total por Tipo de Ingresso');
begin;
end;

{
	Inicia o menu de compra dos ingressos
}
procedure iniciaMenu();
var opcao: integer;
var aFilaSocios: filaSocios;
var aFilaVisitantes: filaVisitantes;
var aListaLugarCobertaSocios: listaLugarCoberturaSocios;
var aListaLugarGeralVisitantes: listaLugarGeralVisitantes;
var iQuantidadeSocios, iQuantidadeVisitantes: integer;
begin;
	while(opcao <> 4) do
		begin;
			writeln ('    MENU    ');
			writeln ('------------');
			writeln;
			writeln (TIPO_COMPRADOR_SOCIO, ' - Comprar Ingresso (', _TIPO_COMPRADOR_SOCIO , ')');
			writeln (TIPO_COMPRADOR_TORCEDOR, ' - Comprar Ingresso (', _TIPO_COMPRADOR_TORCEDOR , ')');
			writeln (TIPO_COMPRADOR_VISITANTE, ' - Comprar Ingresso (', _TIPO_COMPRADOR_VISITANTE , ')');
			writeln ('4 - sair');
			writeln;
			readln(opcao);
			
			if (opcao = 1) then
				begin;
					if (validaLimiteCompradorSocio(aFilaSocios, iQuantidadeSocios) = true) then
						begin;
							write('A quantidade m�xima de s�cios foi atingida! Voc� pode tentar comprar ingresso como torcedor.');
						end
					else
						begin;
							comprarIngressoSocio(aListaLugarCobertaSocios);
							iQuantidadeSocios := iQuantidadeSocios + 1;	
						end;
				end
			else if (opcao = 2) then
				comprarIngressoTorcedor()
			else if (opcao = 3) then
				if (validaLimiteCompradorVisitante(aFilaVisitantes, iQuantidadeVisitantes) = true) then
						begin;
							write('A quantidade m�xima de visitantes foi atingida! Voc� pode tentar comprar ingresso como torcedor.');
						end
					else
						begin;
							comprarIngressoVisitante(aListaLugarVisitantes);
							iQuantidadeVisitantes := iQuantidadeVisitantes + 1;
						end;	
		end;
		
		geraRelatorioFinal(iQuantidadeSocios, iQuantidadeVisitantes);
end;

Begin
	iniciaMenu();  
End.