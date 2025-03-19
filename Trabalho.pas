Program Trabalho;

//Constantes
const TIPO_COMPRADOR_SOCIO = 1;
const _TIPO_COMPRADOR_SOCIO = 'Sócio';
const TIPO_COMPRADOR_TORCEDOR_COBERTA = 2;
const _TIPO_COMPRADOR_TORCEDOR_COBERTA = 'Torcedor (Coberta)';
const TIPO_COMPRADOR_TORCEDOR_GERAL = 3;
const _TIPO_COMPRADOR_TORCEDOR_GERAL = 'Torcedor (Geral)';
const TIPO_COMPRADOR_VISITANTE = 4;
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
const MAX_TORCEDORES = 2200;
const MAX_VISITANTES = 300;

const PRECO_COBERTA = 100;
const PRECO_SOCIOS = 50;
const PRECO_GERAL = 40;
const PRECO_VISITANTES = 80;

//Tipos
type filaSocios = array[1..MAX_SOCIOS] of string;
type filaTorcedores = array[1..MAX_SOCIOS] of string;
type filaVisitantes = array[1..MAX_VISITANTES] of string;
 
type listaLugarCobertaSocios = array[1..MAX_COBERTA_SOCIOS] of integer;
type listaLugarCobertaTorcedores = array[1..MAX_COBERTA_TORCEDORES] of integer;
type listaLugarGeralTorcedores = array[1..MAX_GERAL_TORCEDORES] of integer; 
type listaLugarGeralVisitantes = array[1..MAX_GERAL_VISITANTES] of integer;


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
					write(i, ' - Disponível ');
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
			writeln('Escolha o lugar desejado');
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
	Realiza a compra do ingresso de um torcedor na arquibancada coberta
	@param listaLugarCobertaTorcedores aLista
	@param integer numeroTorcedor
}
procedure comprarIngressoTorcedorCoberta(var aLista: listaLugarCobertaTorcedores; numeroTorcedor: integer);
begin;
	{@todo replicar dos demais modelos}
end;

{
 =====================================================================================================
 =========================================== TORCEDOR (GERAL) ========================================
 =====================================================================================================
}

{
	Realiza a compra do ingresso de um torcedor na arquibancada geral
	@param listaLugarGeralTorcedores aLista
	@param integer numeroTorcedor
}
procedure comprarIngressoTorcedorGeral(var aLista: listaLugarGeralTorcedores; numeroTorcedor: integer);
begin;
	{@todo replicar dos demais modelos}
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
	for i := 1 to MAX_GERAL_VISITANTES do
		begin;
			if (aLista[i] = 0) then
				begin;
					write(i, ' - Disponível ');
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
			writeln('Informe o número do lugar desejado');
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

procedure geraRelatorioFinal(quantidadeSocios: integer; quantidadeVisitantes: integer);
begin;
	writeln('Total por Tipo de Ingresso');
	writeln(_TIPO_COMPRADOR_SOCIO    , ': R$', (quantidadeSocios * PRECO_SOCIOS));
	writeln(_TIPO_COMPRADOR_VISITANTE, ': R$', (quantidadeVisitantes * PRECO_VISITANTES));
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
					comprarIngressoTorcedorCoberta(aListaLugarCobertaTorcedores, iQuantidadeTorcedoresCoberta);
				end	
			else if (opcao = 3) then
				begin;
					comprarIngressoTorcedorGeral(aListaLugarGeralTorcedores, iQuantidadeTorcedoresGeral)
				end
			else if (opcao = 4) then
				if (validaLimiteCompradorVisitante(aFilaVisitantes, iQuantidadeVisitantes) = true) then
						begin;
							write('A quantidade máxima de visitantes foi atingida! Você pode tentar comprar ingresso como torcedor.');
						end
					else
						begin;
							insereVisitanteFila(aFilaVisitantes,iQuantidadeVisitantes);
							comprarIngressoVisitante(aListaLugarGeralVisitantes, iQuantidadeVisitantes);
						end;	
		end;
		
		geraRelatorioFinal(iQuantidadeSocios, iQuantidadeVisitantes);
end;

Begin
	iniciaMenu();  
End.