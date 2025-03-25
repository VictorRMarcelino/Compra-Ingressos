Program Trabalho;

//Constantes
const TIPO_COMPRADOR_SOCIO = 1;
 		 _TIPO_COMPRADOR_SOCIO = 'S?cio';
      TIPO_COMPRADOR_TORCEDOR_COBERTA = 2;
     _TIPO_COMPRADOR_TORCEDOR_COBERTA = 'Torcedor - Coberta';
      TIPO_COMPRADOR_TORCEDOR_GERAL = 3;
     _TIPO_COMPRADOR_TORCEDOR_GERAL = 'Torcedor - Geral';
      TIPO_COMPRADOR_VISITANTE = 4;
     _TIPO_COMPRADOR_VISITANTE = 'Visitante';

		  MAX_SOCIOS = 500;
      MAX_TORCEDORES_COBERTA = 1500;
      MAX_TORCEDORES_GERAL = 700;
      MAX_VISITANTES = 300;
      
      MAX_COBERTA = 2000;
      MAX_GERAL = 1000;
      
 			PRECO_COBERTA = 100;
 			PRECO_VISITANTES = 80;
 			PRECO_SOCIOS = 50;
 			PRECO_GERAL = 40;
 			
type filaComprador = array[1..3000] of integer;
 		 pilhaIngressos = array[1..3000] of integer;
 		 listaLugares = array[1..3000] of integer;

{
	Retorna se um array est? cheio
	@param integer quantidadeAtual
	@param integer quantidadeMaxima
}
function isCheia(quantidadeAtual: integer; quantidadeMaxima: integer): boolean;
begin;
	isCheia := false;
	
	if (quantidadeAtual = quantidadeMaxima) then
		begin;
			isCheia := true;
		end;
end;

{
	Retorna se um array est? vazia
	@param integer quantidadeElemento
}
function isVazia(quantidadeElemento: integer): boolean;
begin;
	isVazia := false;
	
	if (quantidadeElemento = 0) then
		begin;
			isVazia := true;
		end;
end;

{
	Retorna o valor do ingresso a partir do tipo de s?cio
	@param integer iTipoComprador
	@return string
}
function getNomeFilaByTipoComprador(iTipoComprador: integer): string;
begin;
	getNomeFilaByTipoComprador := '';
	
	if (iTipoComprador = TIPO_COMPRADOR_SOCIO) then
		begin;
			getNomeFilaByTipoComprador := _TIPO_COMPRADOR_SOCIO;
		end
	else if (iTipoComprador = TIPO_COMPRADOR_TORCEDOR_COBERTA) then
		begin;
			getNomeFilaByTipoComprador := _TIPO_COMPRADOR_TORCEDOR_COBERTA;
		end	
	else if (iTipoComprador = TIPO_COMPRADOR_TORCEDOR_GERAL) then
		begin;
			getNomeFilaByTipoComprador := _TIPO_COMPRADOR_TORCEDOR_GERAL;
		end	
	else if (iTipoComprador = TIPO_COMPRADOR_VISITANTE) then
		begin;
			getNomeFilaByTipoComprador := _TIPO_COMPRADOR_VISITANTE;
		end	
end;

{
	Retorna o valor do ingresso a partir do tipo de s?cio
	@param integer iTipoComprador
	@return integer
}
function getValorIngressoByTipoComprador(iTipoComprador: integer): integer;
begin;
	getValorIngressoByTipoComprador := 0;
	
	if (iTipoComprador = TIPO_COMPRADOR_SOCIO) then
		begin;
			getValorIngressoByTipoComprador := PRECO_SOCIOS;
		end
	else if (iTipoComprador = TIPO_COMPRADOR_TORCEDOR_COBERTA) then
		begin;
			getValorIngressoByTipoComprador := PRECO_COBERTA;
		end	
	else if (iTipoComprador = TIPO_COMPRADOR_TORCEDOR_GERAL) then
		begin;
			getValorIngressoByTipoComprador := PRECO_GERAL;
		end	
	else if (iTipoComprador = TIPO_COMPRADOR_VISITANTE) then
		begin;
			getValorIngressoByTipoComprador := PRECO_VISITANTES;
		end	
end;

{
	Realiza pesquisa bin?ria para encontrar o ?ndice de um determinado elemento
	@param listaLugares lista
	@param integer quantidadeElementos
	@param integer elemento
	@return integer
}
function pesquisaBinaria(var lista:listaLugares; var quantidadeElementos, elemento: integer): integer;
var inicio, fim, meio, achouElemento: integer;
begin;
	achouElemento := 0;
	inicio := 1;
	meio := 1;
	fim := quantidadeElementos;
	while ((inicio <= fim) AND (achouElemento = 0)) do
		begin;
			meio := (inicio + fim) div 2;
			if (lista[meio] < elemento) then
				begin;
					inicio := meio + 1;
				end
			else if (lista[meio] > elemento) then
				begin;
					fim := meio - 1;
				end
			else 
				begin;
					pesquisaBinaria := meio;
					achouElemento := 1;
				end;
		end;
end;

{
 =====================================================================================================
 =============================================== Fila ================================================
 =====================================================================================================
}

{
	Insere um novo elemento em uma fila
	@param filaComprador fila
	@param integer quantidadeAtual
	@param integer quantidadeMaxima
	@param integer valor
}
procedure insereFila(var fila: filaComprador; var quantidadeAtual: integer; quantidadeMaxima: integer; valor: integer);
begin;
	if (isCheia(quantidadeAtual, quantidadeMaxima) = true) then
		begin;
			writeln('A quantidade m?xima para esta fila foi atingida!');
		end
	else
		begin;
			quantidadeAtual := quantidadeAtual + 1;
			fila[quantidadeAtual] := valor;	
		end;	
end;

{
	Remove um elemento de uma fila
	@param filaComprador fila
	@param integer quantidadeAtual
}
procedure removeFila(var fila: filaComprador; var quantidadeAtual: integer);
var i: integer;
begin;
	if (isVazia(quantidadeAtual) <> true) then
		begin;
			for i := 1 to (quantidadeAtual - 1) do
				begin;
					fila[i] := fila[i + 1];
				end;
			quantidadeAtual := quantidadeAtual - 1;
		end
	else 
		begin;
			writeln('A fila j? est? vazia!');
		end;	
end;

{
	Insere um novo comprador em uma fila
	@param filaComprador fila
	@param integer quantidadeAtual
	@param integer quantidadeMaxima
}
procedure insereCompradorFila(var fila: filaComprador; var quantidadeAtual: integer; quantidadeMaxima: integer);
begin;
	insereFila(fila, quantidadeAtual, quantidadeMaxima, (quantidadeAtual + 1));
end;

{
	Remove um comprador de uma fila
	@param filaComprador fila
	@param integer quantidadeAtual
}
procedure removeCompradorFila(var fila: filaComprador; var quantidadeAtual: integer);
begin;
	removeFila(fila, quantidadeAtual);	
end;

{
 =====================================================================================================
 ============================================== Pilha ================================================
 =====================================================================================================
}

{
	Insere um novo elemento em uma pilha
	@param PilhaIngressos pilha
	@param integer quantidadeAtual
	@param integer valor
}
procedure inserePilha(var pilha: PilhaIngressos; var quantidadeAtual, quantidadeMaxima, valor: integer);
begin;
	if (isCheia(quantidadeAtual, quantidadeMaxima) <> true) then
		begin;
			quantidadeAtual := quantidadeAtual + 1;
			pilha[quantidadeAtual] := valor;
		end
	else
		begin;
			writeln('A pilha j? est? cheia!');
		end;
end;

{
	Remove elemento da pilha
	@param integer quantidadeAtual
}
procedure removePilha(var quantidadeAtual: integer);
begin;
	if (isVazia(quantidadeAtual) <> true) then
		begin;
			quantidadeAtual := quantidadeAtual - 1;
		end
	else
		begin;
			writeln('A pilha j? est? vazia!');
		end;
end;

{
	Realiza o carregamento inicial dos ingressos
	@param pilhaIngressos pilha
	@param integer quantidadeAtual
	@param integer quantidadeMaxima 
}                               
procedure carregaPilhaIngressos(var pilha: pilhaIngressos; var quantidadeAtual, quantidadeMaxima: integer);
var i: integer;
begin;
	for i := 1 to quantidadeMaxima do
		begin;
			inserePilha(pilha, quantidadeAtual, quantidadeMaxima, i);
		end;
end;

{
	Remove um ingresso da pilha
	@param integer quantidadeAtual
}
procedure removeIngressoPilha(quantidadeAtual: integer);
begin;
	removePilha(quantidadeAtual);
end;

{
 =====================================================================================================
 ============================================== LISTA ================================================
 =====================================================================================================
}

{
	Insere um novo elemento em uma lista
	@param listaLugares lista
	@param integer quantidadeAtual
	@param integer novoElemento
}
procedure insereLista(var lista: listaLugares; var quantidadeAtual, quantidadeMaxima, novoElemento: integer);
var i, j, elementoExistente: integer;
begin;
	i := 1;
	if (isCheia(quantidadeAtual, quantidadeMaxima) <> true) then
		begin;
			while ((novoElemento > lista[i]) AND (i <= quantidadeAtual)) do
				begin;
					i := i + 1;
				end;
	    
	    if (lista[i] = novoElemento) then
	    	begin;
	    		writeln('O elemento ', novoElemento, ' j? est? na lista');
	    	end
	    else
	    	begin;
	    		for j := quantidadeAtual downto i do
						begin;
							lista[j + 1] := lista[j];				
						end;
	
					lista[i] := novoElemento;
					quantidadeAtual := quantidadeAtual + 1;
	    	end;
		end
	else
		begin;
			writeln('A lista est? cheia');
		end;
end;

{
	Insere um novo elemento em uma lista
	@param listaLugares lista
	@param integer quantidadeAtual
	@param integer elemento
}
procedure removeLista(var lista:listaLugares; var quantidadeElementos, elemento: integer);
var indiceElemento, i, removeuElemento: Integer;
begin;
	if (isVazia(quantidadeElementos) <> true) then
		begin;
			indiceElemento := pesquisaBinaria(lista, quantidadeElementos, elemento);
			
			if (indiceElemento <> 0) then
				begin;
					for i := indiceElemento to (quantidadeElementos - 1) do
						begin;
							lista[i] := lista[i + 1];
						end;
					quantidadeElementos := quantidadeElementos - 1;
					removeuElemento := 1;
				end;
				
				if (removeuElemento = 0) then
					begin;
						writeln('O valor informado n?o est? na lista');	
					end;		
		end
	else
		begin;
			writeln('A lista est? vazia');
		end;	
end;

{
	Realiza o carregamento inicial da lista de lugares dispon?veis
	@param listaLugares lista
	@param integer quantidadeAtual
	@param integer quantidadeLugares
}
procedure carregaListaLugares(var lista: listaLugares; var quantidadeAtual, quantidadeLugares: integer); 
var i: integer;
begin;
	begin;
		for i := 1 to quantidadeLugares do
			begin;
				insereLista(lista, quantidadeAtual, quantidadeLugares, i);
			end;
	end;
end;

{
	Remove um lugar da lista de lugares dispon?veis
	@param listaLugares lista
	@param integer quantidadeAtual
	@param integer elemento
}
procedure removeLugarDisponivel(var lista:listaLugares; var quantidadeElementos, elemento: integer);
begin;
	removeLista(lista, quantidadeElementos, elemento);
end;

{
 =====================================================================================================
 ========================================== PROCESSAMENTO ============================================
 =====================================================================================================
}

{
	Exibe os lugares dispon?ves em uma arquibancada
	@param listaLugares lista
	@param integer quantidadeLugares
}
procedure exibeLocaisDisponiveis(lista: listaLugares; quantidadeLugares: integer);
var i: integer;
begin;
	for i := 1 to quantidadeLugares do
		begin;
			write(lista[i]:3:0, ' - Dispon?vel ');
			
			if (i MOD 5 = 0) then
				begin;
					writeln('');
				end;
		end;
	writeln('');
end;

{
	Valida se o valor informado para o lugar ? v?lido
	@param listaLugares lista
	@param integer quantidadeAtual
	@param integer lugarInformado 
}
function validaLugarInformadoIsValido(lista: listaLugares; quantidadeLugares, lugarInformado: integer): boolean;
var indiceElemento: integer;
begin;
	validaLugarInformadoIsValido := false;
	indiceElemento := pesquisaBinaria(lista, quantidadeLugares, lugarInformado);
	
	if (indiceElemento <> 0) then
		begin;
			validaLugarInformadoIsValido := true;	
		end;
end;

{
	Realiza a venda de ingressos para determinada fila
	@param filaComprador fila
	@param integer quantidadeFila
	@param integer quantidadePilha
	@param listaLugares lista
	@param integer quantidadeLugares
	@param string nomeFila
}
procedure realizaVendaIngressos(var fila: filaComprador; var quantidadeFila: integer; var quantidadePilha: integer; var lista: listaLugares; var quantidadeLugares: integer; tipoComprador: integer; var valorTotal, valorIngresso: integer);
var i, lugarDisponivel, lugarDesejado, quantidadeTotalFila: integer;
begin;
	clrscr;
	writeln('Iniciando a venda de ingressos da fila ', getNomeFilaByTipoComprador(tipoComprador));
	quantidadeTotalFila := quantidadeFila;
	for i := 1 to quantidadeTotalFila do
		begin;
			lugarDisponivel := 0;
			writeln('Seja bem-vindo comprador de n?mero ', i , ' (', getNomeFilaByTipoComprador(tipoComprador), ')! Seu ingresso foi comprado com sucesso por R$', getValorIngressoByTipoComprador(tipoComprador), ' reais');
			while (lugarDisponivel = 0) do
				begin;
					exibeLocaisDisponiveis(lista, quantidadeLugares);
					readln(lugarDesejado);
			
					if (validaLugarInformadoIsValido(lista, quantidadeLugares, lugarDesejado) = true) then
						begin;
								removeLugarDisponivel(lista, quantidadeLugares, lugarDesejado);
								removeCompradorFila(fila, quantidadeFila);
								removeIngressoPilha(quantidadePilha);
								valorTotal := valorTotal + valorIngresso;
								lugarDisponivel := 1;
								clrscr;	
						end
					else 
						begin;
							clrscr;
							writeln('O lugar desejado n?o est? dispon?vel! Escolha outro!');
						end;
				end;			
		end;
end;

{
	Gera o relat?rio com o saldo final de vendas
	@param integer iTotalSocios
	@param integer iTotalCobertura
	@param integer iTotalGeral
	@param integer iTotalVisitantes
}
procedure geraRelatorioVenda(iTotalSocios, iTotalCobertura, iTotalGeral, iTotalVisitantes: integer);
begin;
	
	clrscr;
	textcolor(white);
	writeln('=======================================');
	textcolor(red);
	writeln(' Total Arrecadado por Tipo de Ingresso:');
	textcolor(white);
	writeln('=======================================');
	textcolor(cyan);
	writeln(' ',_TIPO_COMPRADOR_SOCIO    				, ': R$',	iTotalSocios:4:2, ' reais');
	textcolor(cyan);
	writeln(' ',_TIPO_COMPRADOR_TORCEDOR_COBERTA, ': R$', iTotalCobertura:4:2, ' reais');
	textcolor(cyan);
	writeln(' ',_TIPO_COMPRADOR_TORCEDOR_GERAL  , ': R$', iTotalGeral:4:2, ' reais');
	textcolor(cyan);
	writeln(' ',_TIPO_COMPRADOR_VISITANTE			  , ': R$', iTotalVisitantes:4:2, ' reais');
	textcolor(white);
	writeln('=======================================');
	textcolor(red);
	writeln(' Total Arrecadado: R$', (iTotalSocios + iTotalCobertura + iTotalGeral + iTotalVisitantes):6:2);
	textcolor(white);
	writeln('=======================================');
end;

{
 =====================================================================================================
 ============================================== MENU =================================================
 =====================================================================================================
}

{
	Inicia o menu de compra de ingressos
}
procedure iniciaMenu();
var opcao, 
	 	totalSocios, 
		totalCobertura, 
		totalGeral, 
		totalVisitantes, 
		quantidadeMaximaCoberta, 
		quantidadeMaximaGeral, 
	  finalizouCompra,
	  totalIngressoSocios,
		totalIngressoCoberta, 
		totalIngressoGeral, 
		totalIngressoVisitante,
		valorIngressoSocios,
		valorIngressoCoberta, 
		valorIngressoGeral, 
		valorIngressoVisitante: integer;

var filaSocios, filaTorcedoresCoberta, filaTorcedoresGeral, filaVisitantes: filaComprador;
var quantidadeSocios, quantidadeTorcedoresCoberta, quantidadeTorcedoresGeral, quantidadeVisitantes: integer;

var pilhaIngressosCoberta, pilhaIngressosGeral: pilhaIngressos;
var quantidadeIngressosCoberta, quantidadeIngressosGeral: integer;

var listaCoberta, listaGeral: listaLugares;
var quantidadeLugaresCoberta, quantidadeLugaresGeral: integer;

begin;
	quantidadeMaximaCoberta := MAX_COBERTA;
	quantidadeMaximaGeral := MAX_GERAL;
	valorIngressoSocios := PRECO_SOCIOS;
	valorIngressoCoberta := PRECO_COBERTA;
	valorIngressoGeral := PRECO_GERAL;
	valorIngressoVisitante := PRECO_VISITANTES;
	finalizouCompra := 0;
	writeln('Aguarde! Estamos carregando os ingressos dispon?veis');
	carregaPilhaIngressos(pilhaIngressosCoberta, quantidadeIngressosCoberta, quantidadeMaximaCoberta);
	carregaPilhaIngressos(pilhaIngressosGeral	 , quantidadeIngressosGeral	 , quantidadeMaximaGeral);
	carregaListaLugares(listaCoberta, quantidadeLugaresCoberta, quantidadeMaximaCoberta);
	carregaListaLugares(listaGeral	, quantidadeLugaresGeral	, quantidadeMaximaGeral);
	clrscr;
	
	while(finalizouCompra <> 1) do
		begin;
			writeln ('    MENU    ');
			writeln ('------------');
			writeln;
			writeln (TIPO_COMPRADOR_SOCIO, ' - Entrar na fila (', _TIPO_COMPRADOR_SOCIO, ')');
			writeln (TIPO_COMPRADOR_TORCEDOR_COBERTA, ' - Entrar na fila (', _TIPO_COMPRADOR_TORCEDOR_COBERTA, ')');
			writeln (TIPO_COMPRADOR_TORCEDOR_GERAL, ' - Entrar na fila (', _TIPO_COMPRADOR_TORCEDOR_GERAL, ')');
			writeln (TIPO_COMPRADOR_VISITANTE, ' - Entrar na fila (', _TIPO_COMPRADOR_VISITANTE, ')');
			writeln ('5 - Realizar compra de Ingressos');
			writeln ('6 - Sair');
			writeln;
			readln(opcao);
			clrscr;
			if (opcao = 1) then
				begin;
					insereCompradorFila(filaSocios, quantidadeSocios, MAX_SOCIOS);
					writeln('Comprador ',quantidadeSocios,' entrou na fila de S?cios com sucesso!');
				end
			else if (opcao = 2) then
				begin;
					insereCompradorFila(filaTorcedoresCoberta, quantidadeTorcedoresCoberta, MAX_TORCEDORES_COBERTA);
					writeln('Comprador ',quantidadeTorcedoresCoberta,' entrou na fila de Torcedores (Coberta) com sucesso!');
				end
			else if (opcao = 3) then
				begin;
					insereCompradorFila(filaTorcedoresGeral, quantidadeTorcedoresGeral, MAX_TORCEDORES_GERAL);
					writeln('Comprador ',quantidadeTorcedoresGeral,' entrou na fila de Torcedores (Geral) com sucesso!');
				end
			else if (opcao = 4) then
				begin;
					insereCompradorFila(filaVisitantes, quantidadeVisitantes, MAX_VISITANTES);
					writeln('Comprador ',quantidadeVisitantes,' entrou na fila de Visitantes com sucesso!');
				end
			else if (opcao = 5) then
				begin;
					realizaVendaIngressos(filaSocios					 , quantidadeSocios           , quantidadeIngressosCoberta, listaCoberta, quantidadeLugaresCoberta, TIPO_COMPRADOR_SOCIO					 , totalIngressoSocios	  , valorIngressoSocios);
					realizaVendaIngressos(filaTorcedoresCoberta, quantidadeTorcedoresCoberta, quantidadeIngressosCoberta, listaCoberta, quantidadeLugaresCoberta, TIPO_COMPRADOR_TORCEDOR_COBERTA, totalIngressoCoberta   , valorIngressoCoberta);
					realizaVendaIngressos(filaTorcedoresGeral	 , quantidadeTorcedoresGeral  , quantidadeIngressosGeral  , listaGeral  , quantidadeLugaresGeral  , TIPO_COMPRADOR_TORCEDOR_GERAL  , totalIngressoGeral			, valorIngressoGeral);
					realizaVendaIngressos(filaVisitantes		   , quantidadeVisitantes       , quantidadeIngressosGeral  , listaGeral  , quantidadeLugaresGeral  , TIPO_COMPRADOR_VISITANTE	  	 , totalIngressoVisitante , valorIngressoVisitante);
					geraRelatorioVenda(totalIngressoSocios, totalIngressoCoberta, totalIngressoGeral, totalIngressoVisitante);
					finalizouCompra := 1;
				end
			else if (opcao = 6) then
				begin;
					writeln('Compras canceladas!');
					finalizouCompra := 1;
				end;
		end;
end;

Begin
	TextBackground(black);
	iniciaMenu();  
End.