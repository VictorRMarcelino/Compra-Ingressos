Program Trabalho;

//Constantes
const TIPO_COMPRADOR_SOCIO = 1;
const TIPO_COMPRADOR_TORCEDOR = 2;
const TIPO_COMPRADOR_VISITANTE = 3;

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

{
	Verifica se foi alcançado o limite máximo de sócios
	@param filaSocios aFila - Array da fila de sócios
	@param integer iQuantidadeAtual - Quantidade atual de elementos na fila de sócios
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
	Verifica se foi alcançado o limite máximo de visitantes
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
	Questiona ao torcedor qual bancada ele deseja comprar o ingresso
	@return integer
}
function perguntaArquibancadaTorcedor(): integer;
var arquibancada: integer;
begin;
	writeln('Para qual arquibancada você deseja comprar um ingresso?');
	writeln(ARQUIBANCADA_COBERTA, ' - ', _ARQUIBANCADA_COBERTA);
	writeln(ARQUIBANCADA_GERAL  , ' - ', _ARQUIBANCADA_GERAL);
	readln(arquibancada);
	perguntaArquibancadaTorcedor := arquibancada;
end;

{
	Decide para qual arquibancada o ingresso será vendido
	@param integer tipoComprador - Código do tipo de comprador
	@return integer
}
function escolheArquibancada(tipoComprador: integer): integer;
var arquibancada: integer;
begin;
	if (tipoComprador = TIPO_COMPRADOR_SOCIO) then
		begin;
			escolheArquibancada := ARQUIBANCADA_COBERTA;		
		end
	else if (tipoComprador = TIPO_COMPRADOR_TORCEDOR) then
		begin;
			while ((arquibancada <> ARQUIBANCADA_COBERTA) AND (arquibancada <> ARQUIBANCADA_GERAL)) do
				begin;
					arquibancada := perguntaArquibancadaTorcedor();
				end;
		end
	else if (tipoComprador = TIPO_COMPRADOR_VISITANTE) then
		begin;
			escolheArquibancada := ARQUIBANCADA_GERAL;	
		end;
end;

{
	Realiza a compra do ingresso
	@param integer tipoComprador
}
procedure comprarIngresso(tipoComprador: integer);
var arquibancada: integer;
begin;
	arquibancada := escolheArquibancada(tipoComprador);	
end; 

{
	Inicia o menu de compra dos ingressos
}
procedure iniciaMenu();
var opcao: integer;
var aFilaSocios: filaSocios;
var aFilaVisitantes: filaVisitantes;
var iQuantidadeSocios, iQuantidadeVisitantes: integer;
begin;
	while(opcao <> 4) do
		begin;
			writeln ('    MENU    ');
			writeln ('------------');
			writeln;
			writeln (' 1 - Comprar Ingresso (Sócio)');
			writeln (' 2 - Comprar Ingresso (Torcedor)');
			writeln (' 3 - Comprar Ingresso (Visitante)');
			writeln (' 4 - sair');
			writeln;
			readln(opcao);
			
			if (opcao = 1) then
				begin;
					if (validaLimiteCompradorSocio(aFilaSocios, iQuantidadeSocios) = true) then
						begin;
							write('A quantidade máxima de sócios foi atingida! Você pode tentar comprar ingresso como torcedor.');
						end
					else
						begin;
							comprarIngresso(TIPO_COMPRADOR_SOCIO);
							iQuantidadeSocios := iQuantidadeSocios + 1;	
						end;
				end
			else if (opcao = 2) then
				comprarIngresso(TIPO_COMPRADOR_TORCEDOR)
			else if (opcao = 3) then
				if (validaLimiteCompradorSocio(aFilaSocios, iQuantidadeSocios) = true) then
						begin;
							write('A quantidade máxima de visitantes foi atingida! Você pode tentar comprar ingresso como torcedor.');
						end
					else
						begin;
							comprarIngresso(TIPO_COMPRADOR_VISITANTE);
							iQuantidadeVisitantes := iQuantidadeVisitantes + 1;
						end;	
		end;
end;

Begin
	iniciaMenu();  
End.