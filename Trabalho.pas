Program Trabalho;

//Constantes
const TIPO_COMPRADOR_SOCIO = 1;
const _TIPO_COMPRADOR_SOCIO = 'Sócio';
const TIPO_COMPRADOR_TORCEDOR_COBERTA = 2;
const _TIPO_COMPRADOR_TORCEDOR_COBERTA = 'Torcedor - Coberta';
const TIPO_COMPRADOR_TORCEDOR_GERAL = 3;
const _TIPO_COMPRADOR_TORCEDOR_GERAL = 'Torcedor - Geral';
const TIPO_COMPRADOR_VISITANTE = 4;
const _TIPO_COMPRADOR_VISITANTE = 'Visitante';

//Quantidade máxima de pessoas por arquibancada
const MAX_COBERTA = 2000;
const MAX_GERAL = 1000;

//Quantidade de pessoas por lugar e tipo
const MAX_COBERTA_SOCIOS = 500;
const MAX_GERAL_TORCEDORES = 700;

//Quantidade máxima de membros por tipo
const MAX_SOCIOS = 500;
const MAX_TORCEDORES_COBERTA = 1500;
const MAX_TORCEDORES_GERAL = 700;
const MAX_VISITANTES = 300;

const PRECO_COBERTA = 100;
const PRECO_SOCIOS = 50;
const PRECO_GERAL = 40;
const PRECO_VISITANTES = 80;

type filaSocios = array[1..MAX_SOCIOS] of string;
type filaTorcedoresCoberta = array[1..MAX_TORCEDORES_COBERTA] of string;
type filaTorcedoresGeral = array[1..MAX_TORCEDORES_COBERTA] of string;
type filaVisitantes = array[1..MAX_VISITANTES] of string;

type pilhaIngressosSocios = array[1..MAX_SOCIOS] of integer;
type pilhaIngressosTorcedoresCoberta = array[1..MAX_TORCEDORES_COBERTA] of integer;
type pilhaIngressosTorcedoresGeral = array[1..MAX_TORCEDORES_COBERTA] of integer;
type pilhaIngressosVisitantes = array[1..MAX_VISITANTES] of integer;

type listaLugarCobertaSocios = array[1..MAX_COBERTA_SOCIOS] of integer;
type listaLugarCobertaTorcedores = array[501..MAX_COBERTA] of integer;
type listaLugarGeralTorcedores = array[1..MAX_GERAL_TORCEDORES] of integer; 
type listaLugarGeralVisitantes = array[701..MAX_GERAL] of integer;


{
 =====================================================================================================
 =============================================== SÓCIO ===============================================
 ===================================================================================================== 
}

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
	Realiza a inclusão de um novo comprador na fila de sócios
	@param aFila filaSocios
	@param integer iQuantidadeAtual
}
procedure insereSocioFila(var aFila: filaSocios; var iQuantidadeAtual: integer);
var nomeSocio: string;
begin;
	writeln('Qual o seu nome?');
	readln(nomeSocio);
	iQuantidadeAtual := iQuantidadeAtual + 1;
	aFila[iQuantidadeAtual] := nomeSocio;
end;

{
	Marca um lugar da coberta dos sócios como utilizada
	@param listaLugarSocios aLista
	@param integer lugarEscolhido
	@param integer numeroSocio
}
procedure marcaLugarCobertaSocio(var aLista: listaLugarCobertaSocios; lugarEscolhido: integer; numeroSocio: integer);
begin;
	aLista[lugarEscolhido] := numeroSocio;
end;

{
	Verifica se determinado lugar está disponível para os sócios
	@param listaLugarCobertaSocios aLista
	@param integer lugarEscolhido
	@return boolean 
}
function validaLugarCobertaDisponivelSocio(aLista: listaLugarCobertaSocios; lugarEscolhido: integer): boolean;
var lugarDisponivel: integer;
begin;
	validaLugarCobertaDisponivelSocio := (aLista[lugarEscolhido] <> 0);   
end;

procedure exibeLocaisDisponiveisCobertaSocios(aLista: listaLugarCobertaSocios);
var i: integer;
begin;
	for i := 1 to MAX_COBERTA_SOCIOS do
		begin;
			if (aLista[i] = 0) then
				begin;
					write(i:3:0, ' - Disponível ');
				end;
			
			if (i MOD 5 = 0) then
				begin;
					writeln('');
				end;
		end;
end;

{
	Realiza a compra do ingresso de um sócio
	@param listaLugarSocios aLista
	@param integer numeroSocio
}
procedure comprarIngressoSocio(var aLista: listaLugarCobertaSocios; numeroSocio: integer);
var lugarDisponivel, lugarDesejado: integer;
begin;
	while (lugarDisponivel = 0) do
		begin;
			writeln('Ingresso comprado com sucesso por R$', PRECO_SOCIOS, ' reais!');
			writeln('Escolha o lugar desejado para a arquibancada coberta (Sócios)');
			exibeLocaisDisponiveisCobertaSocios(aLista);
			readln(lugarDesejado);
			if (validaLugarCobertaDisponivelSocio(aLista, lugarDesejado) = true) then
				begin;
					clrscr;
					writeln('O lugar desejado não está disponível! Escolha outro!');
				end
			else 
				begin;
					marcaLugarCobertaSocio(aLista, lugarDesejado, numeroSocio);
					lugarDisponivel := 1;
				end;
		end;	
end;

{
 =====================================================================================================
 ========================================== TORCEDOR (COBERTA) =======================================
 =====================================================================================================
}

{
	Verifica se foi alcançado o limite máximo de torcedores na arquibancada coberta
	@param aFila filaSocios - Array da fila de sócios
	@param integer iQuantidadeAtual - Quantidade atual de elementos na fila de torcedores na coberta
	@return boolean
}
function validaLimiteCompradorTorcedorCoberta(aFila: filaTorcedoresCoberta; iQuantidadeAtual: integer): boolean;
begin;
	validaLimiteCompradorTorcedorCoberta := false;
	
	if (iQuantidadeAtual = MAX_TORCEDORES_COBERTA)	then
		begin;
			validaLimiteCompradorTorcedorCoberta := true;
		end;
end;

{
	Realiza a inclusão de um novo comprador na fila de torcedores na arquibancada coberta
	@param filaTorcedoresCoberta aFila
	@param integer iQuantidadeAtual
}
procedure insereTorcedorCobertaFila(var aFila: filaTorcedoresCoberta; var iQuantidadeAtual: integer);
var nomeTorcedorCoberta: string;
begin;
	writeln('Qual o seu nome?');
	readln(nomeTorcedorCoberta);
	iQuantidadeAtual := iQuantidadeAtual + 1;
	aFila[iQuantidadeAtual] := nomeTorcedorCoberta;
end;

{
	Marca um lugar da arquibancada coberta dos torcedores como utilizada
	@param listaLugarCobertaTorcedores aLista
	@param integer lugarEscolhido
}
procedure marcaLugarCobertaTorcedor(var aLista: listaLugarCobertaTorcedores; lugarEscolhido: integer; numeroTorcedorCoberta: integer);
begin;
	aLista[lugarEscolhido] := numeroTorcedorCoberta;
end;

{
	Verifica se determinado lugar está disponível para os visitantes
	@param listaLugarGeralVisitantes aLista
	@param integer listaLugarVisitantes 
	@return boolean
}
function validaLugarCobertaDisponivelTorcedor(aLista: listaLugarCobertaTorcedores; lugarEscolhido: integer): boolean;
begin;
	validaLugarCobertaDisponivelTorcedor := (aLista[lugarEscolhido] <> 0);
end;

{
	Exibe uma listagem com os locais da geral que estão disponíveis para os visitantes
	@param listaLugarGeralVisitantes aLista 
}
procedure exibeLocaisDisponiveisCobertaTorcedor(aLista: listaLugarCobertaTorcedores);
var i: integer;
begin;
	for i := 501 to MAX_COBERTA do
		begin;
			if (aLista[i] = 0) then
				begin;
					write(i:3:0, ' - Disponível ');
				end;
			
			if (i MOD 5 = 0) then
				begin;
					writeln('');
				end;
		end;
end;

{
	Realiza a compra do ingresso de um torcedor na arquibancada coberta
	@param listaLugarCobertaTorcedores aLista
	@param integer numeroTorcedorCoberta
}
procedure comprarIngressoTorcedorCoberta(var aLista: listaLugarCobertaTorcedores; numeroTorcedorCoberta: integer);
var lugarDisponivel, lugarDesejado: integer;
begin;
	while (lugarDisponivel = 0) do
		begin;
			writeln('Ingresso comprado com sucesso por R$', PRECO_COBERTA, ' reais!');
			writeln('Escolha o lugar desejado para a arquibancada coberta (Torcedor)');
			exibeLocaisDisponiveisCobertaTorcedor(aLista);
			readln(lugarDesejado);
			if (validaLugarCobertaDisponivelTorcedor(aLista, lugarDesejado) = true) then
				begin;
					clrscr;
					writeln('O lugar desejado não está disponível! Escolha outro!');
				end
			else 
				begin;
					marcaLugarCobertaTorcedor(aLista, lugarDesejado, numeroTorcedorCoberta);
					lugarDisponivel := 1;
				end;
		end;
end;

{
 =====================================================================================================
 =========================================== TORCEDOR (GERAL) ========================================
 =====================================================================================================
{
	Verifica se foi alcançado o limite máximo de torcedores na arquibancada geral
	@param filaTorcedoresGeral aFila - Array da fila de torcedores da arquibancada geral
	@param integer iQuantidadeAtual - Quantidade atual de elementos na fila de torcedores na geral
	@return boolean
}
function validaLimiteCompradorTorcedorGeral(aFila: filaTorcedoresGeral; iQuantidadeAtual: integer): boolean;
begin;
	validaLimiteCompradorTorcedorGeral := false;
	
	if (iQuantidadeAtual = MAX_TORCEDORES_GERAL)	then
		begin;
			validaLimiteCompradorTorcedorGeral := true;
		end;
end;

{
	Realiza a inclusão de um novo comprador na fila de torcedores na arquibancada coberta
	@param filaTorcedoresCoberta aFila
	@param integer iQuantidadeAtual
}
procedure insereTorcedorGeralFila(var aFila: filaTorcedoresCoberta; var iQuantidadeAtual: integer);
var nomeTorcedorGeral: string;
begin;
	writeln('Qual o seu nome?');
	readln(nomeTorcedorGeral);
	iQuantidadeAtual := iQuantidadeAtual + 1;
	aFila[iQuantidadeAtual] := nomeTorcedorGeral;
end;

{
	Marca um lugar da arquibancada geral dos torcedores como utilizada
	@param listaLugarGeralTorcedores aLista
	@param integer lugarEscolhido
}
procedure marcaLugarGeralTorcedor(var aLista: listaLugarGeralTorcedores; lugarEscolhido: integer; numeroTorcedorGeral: integer);
begin;
	aLista[lugarEscolhido] := numeroTorcedorGeral;
end;

{
	Verifica se determinado lugar está disponível para os visitantes
	@param listaLugarGeralTorcedores aLista
	@param integer listaLugarVisitantes 
	@return boolean
}
function validaLugarGeralDisponivelTorcedor(aLista: listaLugarGeralTorcedores; lugarEscolhido: integer): boolean;
begin;
	validaLugarGeralDisponivelTorcedor := (aLista[lugarEscolhido] <> 0);
end;

{
	Exibe uma listagem com os locais da geral que estão disponíveis para os torcedores na arquibancada coberta
	@param listaLugarGeralTorcedores aLista 
}
procedure exibeLocaisDisponiveisGeralTorcedor(aLista: listaLugarGeralTorcedores);
var i: integer;
begin;
	for i := 1 to MAX_TORCEDORES_GERAL do
		begin;
			if (aLista[i] = 0) then
				begin;
					write(i:3:0, ' - Disponível ');
				end;
			
			if (i MOD 5 = 0) then
				begin;
					writeln('');
				end;
		end;
end; 

{
	Realiza a compra do ingresso de um torcedor na arquibancada geral
	@param listaLugarGeralTorcedores aLista
	@param integer numeroTorcedorGeral
}
procedure comprarIngressoTorcedorGeral(var aLista: listaLugarGeralTorcedores; numeroTorcedorGeral: integer);
var lugarDisponivel, lugarDesejado: integer;
begin;
	while (lugarDisponivel = 0) do
		begin;
		writeln('Ingresso comprado com sucesso por R$', PRECO_GERAL, ' reais!');
			writeln('Escolha o lugar desejado para a arquibancada geral (Torcedor)');
			exibeLocaisDisponiveisGeralTorcedor(aLista);
			readln(lugarDesejado);
			if (validaLugarGeralDisponivelTorcedor(aLista, lugarDesejado) = true) then
				begin;
					clrscr;
					writeln('O lugar desejado não está disponível! Escolha outro!');
				end
			else 
				begin;
					marcaLugarGeralTorcedor(aLista, lugarDesejado, numeroTorcedorGeral);
					lugarDisponivel := 1;
				end;
		end;
end;

{
 =====================================================================================================
 ============================================= VISITANTE =============================================
 =====================================================================================================
}

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
	Realiza a inclusão de um novo comprador na fila de visitantes
	@param aFila filaVisitantes
	@param integer iQuantidadeAtual
}
procedure insereVisitanteFila(var aFila: filaVisitantes; var iQuantidadeAtual: integer);
var nomeVisitante: string;
begin;
	writeln('Qual o seu nome?');
	readln(nomeVisitante);
	iQuantidadeAtual := iQuantidadeAtual + 1;
	aFila[iQuantidadeAtual] := nomeVisitante;
end;

{
	Marca um lugar da geral dos visitantes como utilizada
	@param listaLugarGeralVisitantes aLista
	@param integer lugarEscolhido
}
procedure marcaLugarGeralVisitante(var aLista: listaLugarGeralVisitantes; lugarEscolhido: integer; numeroVisitante: integer);
begin;
	aLista[lugarEscolhido] := numeroVisitante;
end;

{
	Verifica se determinado lugar está disponível para os visitantes
	@param listaLugarGeralVisitantes aLista
	@param integer listaLugarVisitantes 
	@return boolean
}
function validaLugarGeralDisponivelVisitantes(aLista: listaLugarGeralVisitantes; lugarEscolhido: integer): boolean;
begin;
	validaLugarGeralDisponivelVisitantes := (aLista[lugarEscolhido] <> 0);
end;

{
	Exibe uma listagem com os locais da geral que estão disponíveis para os visitantes
	@param listaLugarGeralVisitantes aLista 
}
procedure exibeLocaisDisponiveisGeralVisitantes(aLista: listaLugarGeralVisitantes);
var i: integer;
begin;
	for i := 701 to MAX_GERAL do
		begin;
			if (aLista[i] = 0) then
				begin;
					write(i:3:0, ' - Disponível ');
				end;
			
			if (i MOD 5 = 0) then
				begin;
					writeln('');
				end;
		end;
end;

{
	Realiza a compra do ingresso de um visitante
	@param listaLugarVisitantes aLista
}
procedure comprarIngressoVisitante(var aLista: listaLugarGeralVisitantes; numeroVisitante: integer);
var lugarDisponivel, lugarDesejado: integer;
begin;
	while (lugarDisponivel = 0) do
		begin;
			writeln('Ingresso comprado com sucesso por R$', PRECO_VISITANTES, ' reais!');
			writeln('Informe o número do lugar desejado para a arquibancada geral (Visitante)');
			exibeLocaisDisponiveisGeralVisitantes(aLista);
			readln(lugarDesejado);
			if (validaLugarGeralDisponivelVisitantes(aLista, lugarDesejado) = true) then
				begin;
					clrscr;
					writeln('O lugar desejado já foi escolhido! Escolha outro!');
				end
			else 
				begin;
					marcaLugarGeralVisitante(aLista, lugarDesejado, numeroVisitante);
					lugarDisponivel := 1;
				end;
		end;
end; 

{
 =====================================================================================================
 ============================================= RELATÓRIO =============================================
 =====================================================================================================
}

{
	Gera o relatório com o total arrecadado por tipo e o total geral
	@param integer quantidadeSocios
	@param integer quantidadeTorcedoresCoberta
	@param integer quantidadeTorcedoresGeral
	@param integer quantidadeVisitantes
}
procedure geraRelatorioFinal(quantidadeSocios, quantidadeTorcedoresCoberta, quantidadeTorcedoresGeral, quantidadeVisitantes: integer);
var totalSocios, totalTorcedoresCoberta, totalTorcedoresGeral, totalVisitantes: integer;
begin;
	totalSocios := (quantidadeSocios * PRECO_SOCIOS);
	totalTorcedoresCoberta := (quantidadeTorcedoresCoberta * PRECO_COBERTA);
	totalTorcedoresGeral := (quantidadeTorcedoresGeral * PRECO_GERAL);
	totalVisitantes := (quantidadeVisitantes * PRECO_VISITANTES);
	clrscr;
	writeln('Total Arrecadado por Tipo de Ingresso:');
	writeln('=====================================');
	writeln(_TIPO_COMPRADOR_SOCIO    				, ': R$', totalSocios:4:2, ' reais');
	writeln(_TIPO_COMPRADOR_TORCEDOR_COBERTA, ': R$', totalTorcedoresCoberta:4:2, ' reais');
	writeln(_TIPO_COMPRADOR_TORCEDOR_GERAL  , ': R$', totalTorcedoresGeral:4:2, ' reais');
	writeln(_TIPO_COMPRADOR_VISITANTE			  , ': R$', totalVisitantes:4:2, ' reais');
	writeln('=====================================');
	writeln('Total Arrecadado: R$', (totalSocios + totalTorcedoresCoberta + totalTorcedoresGeral + totalVisitantes):6:2);
	writeln('=====================================');
end;

{
 =====================================================================================================
 =============================================== MENU ================================================
 =====================================================================================================
}

{
	Inicia o menu de compra dos ingressos
}
procedure iniciaMenu();
var opcao: integer;

var aFilaSocios: filaSocios;
var aFilaTorcedoresCoberta: filaTorcedoresCoberta;
var aFilaTorcedoresGeral: filaTorcedoresGeral;
var aFilaVisitantes: filaVisitantes;

var aListaLugarCobertaSocios: listaLugarCobertaSocios;
var aListaLugarCobertaTorcedores: listaLugarCobertaTorcedores;
var aListaLugarGeralTorcedores: listaLugarGeralTorcedores; 
var aListaLugarGeralVisitantes: listaLugarGeralVisitantes;

var iQuantidadeSocios, iQuantidadeTorcedoresCoberta, iQuantidadeTorcedoresGeral, iQuantidadeVisitantes: integer;
begin;
	while(opcao <> 5) do
		begin;
			writeln ('    MENU    ');
			writeln ('------------');
			writeln;
			writeln (TIPO_COMPRADOR_SOCIO, ' - Comprar Ingresso (', _TIPO_COMPRADOR_SOCIO, ')');
			writeln (TIPO_COMPRADOR_TORCEDOR_COBERTA, ' - Comprar Ingresso (', _TIPO_COMPRADOR_TORCEDOR_COBERTA, ')');
			writeln (TIPO_COMPRADOR_TORCEDOR_GERAL, ' - Comprar Ingresso (', _TIPO_COMPRADOR_TORCEDOR_GERAL, ')');
			writeln (TIPO_COMPRADOR_VISITANTE, ' - Comprar Ingresso (', _TIPO_COMPRADOR_VISITANTE, ')');
			writeln ('5 - sair');
			writeln;
			readln(opcao);
			clrscr;
			if (opcao = 1) then
				begin;
					if (validaLimiteCompradorSocio(aFilaSocios, iQuantidadeSocios) = true) then
						begin;
							write('A quantidade máxima de sócios foi atingida! Você pode tentar comprar ingresso como torcedor.');
						end
					else
						begin;
							insereSocioFila(aFilaSocios, iQuantidadeSocios);
							comprarIngressoSocio(aListaLugarCobertaSocios, iQuantidadeSocios);
						end;                                                                             
				end
			else if (opcao = 2) then
				begin;
					if (validaLimiteCompradorTorcedorCoberta(aFilaTorcedoresCoberta, iQuantidadeTorcedoresCoberta) = true) then
						begin;
							write('A quantidade máxima de torcedores na arquibancada coberta foi atingida! Você pode tentar comprar um ingresso na geral');
						end
					else
						begin;
							insereTorcedorCobertaFila(aFilaTorcedoresCoberta, iQuantidadeTorcedoresCoberta);
							comprarIngressoTorcedorCoberta(aListaLugarCobertaTorcedores, iQuantidadeTorcedoresCoberta);
						end;
				end	
			else if (opcao = 3) then
				begin;
					if (validaLimiteCompradorTorcedorCoberta(aFilaTorcedoresGeral, iQuantidadeTorcedoresGeral) = true) then
						begin;
							write('A quantidade máxima de torcedores na arquibancada geral foi atingida!');
						end
					else
						begin;
							insereTorcedorGeralFila(aFilaTorcedoresGeral, iQuantidadeTorcedoresGeral);
							comprarIngressoTorcedorGeral(aListaLugarGeralTorcedores, iQuantidadeTorcedoresGeral);
						end;
				end
			else if (opcao = 4) then
				if (validaLimiteCompradorVisitante(aFilaVisitantes, iQuantidadeVisitantes) = true) then
						begin;
							write('A quantidade máxima de visitantes foi atingida! Você pode tentar comprar ingresso como torcedor na arquibancada geral.');
						end
					else
						begin;
							insereVisitanteFila(aFilaVisitantes,iQuantidadeVisitantes);
							comprarIngressoVisitante(aListaLugarGeralVisitantes, iQuantidadeVisitantes);
						end;	
		end;
		
		geraRelatorioFinal(iQuantidadeSocios, iQuantidadeTorcedoresCoberta, iQuantidadeTorcedoresGeral, iQuantidadeVisitantes);
end;

Begin
	iniciaMenu();  
End.