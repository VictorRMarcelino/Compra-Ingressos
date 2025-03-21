//Program Trabalho;
//
//Constantes
//const TIPO_COMPRADOR_SOCIO = 1;
//const _TIPO_COMPRADOR_SOCIO = 'Sócio';
//const TIPO_COMPRADOR_TORCEDOR_COBERTA = 2;
//const _TIPO_COMPRADOR_TORCEDOR_COBERTA = 'Torcedor - Coberta';
//const TIPO_COMPRADOR_TORCEDOR_GERAL = 3;
//const _TIPO_COMPRADOR_TORCEDOR_GERAL = 'Torcedor - Geral';
//const TIPO_COMPRADOR_VISITANTE = 4;
//const _TIPO_COMPRADOR_VISITANTE = 'Visitante';
//
//Quantidade máxima de pessoas por arquibancada
//const MAX_COBERTA = 2000;
//const MAX_GERAL = 1000;
//
//Quantidade de pessoas por lugar e tipo
//const MAX_COBERTA_SOCIOS = 500;
//const MAX_GERAL_TORCEDORES = 700;
//
//Quantidade máxima de membros por tipo
//const MAX_SOCIOS = 500;
//const MAX_TORCEDORES_COBERTA = 1500;
//const MAX_TORCEDORES_GERAL = 700;
//const MAX_VISITANTES = 300;
//
//const PRECO_COBERTA = 100;
//const PRECO_SOCIOS = 50;
//const PRECO_GERAL = 40;
//const PRECO_VISITANTES = 80;
//
//type filaComprador = array[1..3000] of integer;
//type pilhaIngressos = array[1..3000] of integer;
//type listaLugar = array[1..3000] of integer;
//
//{
// =====================================================================================================
// =========================================== Métodos Gerais ==========================================
// =====================================================================================================
//}
//
//{
// 	Valida se o lugar informado válido
// 	@param integer valorInformado
// 	@param integer valorMinimo
// 	@param integer valorMaximo
//}
//function validaLugarInformadoIsValido(lugarInformado, valorMinimo, valorMaximo): boolean;
//begin;
//	validaLugarInformadoIsValido := ((lugarInfomado >= valorMinimo) AND (lugarInformado <= valorMaximo));	
//end;
//
//{
// =====================================================================================================
// =============================================== SÓCIO ===============================================
// ===================================================================================================== 
//}
//
//{
//	Verifica se foi alcançado o limite máximo de sócios
//	@param filaSocios aFila - Array da fila de sócios
//	@param integer iQuantidadeAtual - Quantidade atual de elementos na fila de sócios
//	@return boolean
//}
//function validaLimiteCompradorSocio(aFila: filaSocios; iQuantidadeAtual: integer): boolean;
//begin;
//	validaLimiteCompradorSocio := false;
//	
//	if (iQuantidadeAtual = MAX_SOCIOS)	then
//		begin;
//			validaLimiteCompradorSocio := true;
//		end;
//end;
//
//{
//	Realiza a inclusão de um novo comprador na fila de sócios
//	@param aFila filaSocios
//	@param integer iQuantidadeAtual
//}
//procedure insereSocioFila(var aFila: filaSocios; var iQuantidadeAtual: integer);
//var nomeSocio: string;
//begin;
//	writeln('Qual o seu nome?');
//	readln(nomeSocio);
//	iQuantidadeAtual := iQuantidadeAtual + 1;
//	aFila[iQuantidadeAtual] := nomeSocio;
//end;
//
//{
//	Marca um lugar da coberta dos sócios como utilizada
//	@param listaLugarSocios aLista
//	@param integer lugarEscolhido
//	@param integer numeroSocio
//}
//procedure marcaLugarCobertaSocio(var aLista: listaLugarCobertaSocios; lugarEscolhido: integer; numeroSocio: integer);
//begin;
//	aLista[lugarEscolhido] := numeroSocio;
//end;
//
//{
//	Verifica se determinado lugar está disponível para os sócios
//	@param listaLugarCobertaSocios aLista
//	@param integer lugarEscolhido
//	@return boolean 
//}
//function validaLugarCobertaDisponivelSocio(aLista: listaLugarCobertaSocios; lugarEscolhido: integer): boolean;
//var lugarDisponivel: integer;
//begin;
//	validaLugarCobertaDisponivelSocio := (aLista[lugarEscolhido] <> 0);   
//end;
//
//procedure exibeLocaisDisponiveisCobertaSocios(aLista: listaLugarCobertaSocios);
//var i: integer;
//begin;
//	for i := 1 to MAX_COBERTA_SOCIOS do
//		begin;
//			if (aLista[i] = 0) then
//				begin;
//					write(i:3:0, ' - Disponível ');
//				end;
//			
//			if (i MOD 5 = 0) then
//				begin;
//					writeln('');
//				end;
//		end;
//end;
//
//{
//	Realiza a compra do ingresso de um sócio
//	@param listaLugarSocios aLista
//	@param integer numeroSocio
//}
//procedure comprarIngresso(var aLista: listaLugarCobertaSocios; numeroSocio: integer);
//var lugarDisponivel, lugarDesejado: integer;
//begin;
//	while (lugarDisponivel = 0) do
//		begin;
//			writeln('Ingresso comprado com sucesso por R$', PRECO_SOCIOS, ' reais!');
//			writeln('Escolha o lugar desejado para a arquibancada coberta (Sócios)');
//			exibeLocaisDisponiveisCobertaSocios(aLista);
//			readln(lugarDesejado);
//			
//			if (validaLugarInformadoIsValido(lugarDesejado, 1, MAX_COBERTA_SOCIOS) == true) then
//				begin;
//					if (validaLugarCobertaDisponivelSocio(aLista, lugarDesejado) = true) then
//						begin;
//							clrscr;
//							writeln('O lugar desejado não está disponível! Escolha outro!');
//						end
//					else 
//						begin;
//							marcaLugarCobertaSocio(aLista, lugarDesejado, numeroSocio);
//							lugarDisponivel := 1;
//						end;
//					end
//			else 
//				begin;
//					writeln('O lugar informado é inválido! Escolha outro!');
//				end;
//		end;	
//end;
//
//{
// =====================================================================================================
// ============================================= RELATÓRIO =============================================
// =====================================================================================================
//}
//
//{
//	Gera o relatório com o total arrecadado por tipo e o total geral
//	@param integer quantidadeSocios
//	@param integer quantidadeTorcedoresCoberta
//	@param integer quantidadeTorcedoresGeral
//	@param integer quantidadeVisitantes
//}
//procedure geraRelatorioFinal(quantidadeSocios, quantidadeTorcedoresCoberta, quantidadeTorcedoresGeral, quantidadeVisitantes: integer);
//var totalSocios, totalTorcedoresCoberta, totalTorcedoresGeral, totalVisitantes: integer;
//begin;
//	totalSocios := (quantidadeSocios * PRECO_SOCIOS);
//	totalTorcedoresCoberta := (quantidadeTorcedoresCoberta * PRECO_COBERTA);
//	totalTorcedoresGeral := (quantidadeTorcedoresGeral * PRECO_GERAL);
//	totalVisitantes := (quantidadeVisitantes * PRECO_VISITANTES);
//	clrscr;
//	writeln('Total Arrecadado por Tipo de Ingresso:');
//	writeln('=====================================');
//	writeln(_TIPO_COMPRADOR_SOCIO    				, ': R$', totalSocios:4:2, ' reais');
//	writeln(_TIPO_COMPRADOR_TORCEDOR_COBERTA, ': R$', totalTorcedoresCoberta:4:2, ' reais');
//	writeln(_TIPO_COMPRADOR_TORCEDOR_GERAL  , ': R$', totalTorcedoresGeral:4:2, ' reais');
//	writeln(_TIPO_COMPRADOR_VISITANTE			  , ': R$', totalVisitantes:4:2, ' reais');
//	writeln('=====================================');
//	writeln('Total Arrecadado: R$', (totalSocios + totalTorcedoresCoberta + totalTorcedoresGeral + totalVisitantes):6:2);
//	writeln('=====================================');
//end;
//
//{
// =====================================================================================================
// =============================================== MENU ================================================
// =====================================================================================================
//}
//
//{
//	Inicia o menu de compra dos ingressos
//}
//procedure iniciaMenu();
//var opcao: integer;
//
//var aFilaSocios: filaSocios;
//var aFilaTorcedoresCoberta: filaTorcedoresCoberta;
//var aFilaTorcedoresGeral: filaTorcedoresGeral;
//var aFilaVisitantes: filaVisitantes;
//
//var aListaLugarCobertaSocios: listaLugarCobertaSocios;
//var aListaLugarCobertaTorcedores: listaLugarCobertaTorcedores;
//var aListaLugarGeralTorcedores: listaLugarGeralTorcedores; 
//var aListaLugarGeralVisitantes: listaLugarGeralVisitantes;
//
//var iQuantidadeSocios, iQuantidadeTorcedoresCoberta, iQuantidadeTorcedoresGeral, iQuantidadeVisitantes: integer;
//begin;
//	while(opcao <> 5) do
//		begin;
//			writeln ('    MENU    ');
//			writeln ('------------');
//			writeln;
//			writeln (TIPO_COMPRADOR_SOCIO, ' - Comprar Ingresso (', _TIPO_COMPRADOR_SOCIO, ')');
//			writeln (TIPO_COMPRADOR_TORCEDOR_COBERTA, ' - Comprar Ingresso (', _TIPO_COMPRADOR_TORCEDOR_COBERTA, ')');
//			writeln (TIPO_COMPRADOR_TORCEDOR_GERAL, ' - Comprar Ingresso (', _TIPO_COMPRADOR_TORCEDOR_GERAL, ')');
//			writeln (TIPO_COMPRADOR_VISITANTE, ' - Comprar Ingresso (', _TIPO_COMPRADOR_VISITANTE, ')');
//			writeln ('5 - sair');
//			writeln;
//			readln(opcao);
//			clrscr;
//			if (opcao = 1) then
//				begin;
//					if (validaLimiteCompradorSocio(aFilaSocios, iQuantidadeSocios) = true) then
//						begin;
//							write('A quantidade máxima de sócios foi atingida! Você pode tentar comprar ingresso como torcedor.');
//						end
//					else
//						begin;
//							insereSocioFila(aFilaSocios, iQuantidadeSocios);
//							comprarIngressoSocio(aListaLugarCobertaSocios, iQuantidadeSocios);
//						end;                                                                             
//				end
//			else if (opcao = 2) then
//				begin;
//					if (validaLimiteCompradorTorcedorCoberta(aFilaTorcedoresCoberta, iQuantidadeTorcedoresCoberta) = true) then
//						begin;
//							write('A quantidade máxima de torcedores na arquibancada coberta foi atingida! Você pode tentar comprar um ingresso na geral');
//						end
//					else
//						begin;
//							insereTorcedorCobertaFila(aFilaTorcedoresCoberta, iQuantidadeTorcedoresCoberta);
//							comprarIngressoTorcedorCoberta(aListaLugarCobertaTorcedores, iQuantidadeTorcedoresCoberta);
//						end;
//				end	
//			else if (opcao = 3) then
//				begin;
//					if (validaLimiteCompradorTorcedorCoberta(aFilaTorcedoresGeral, iQuantidadeTorcedoresGeral) = true) then
//						begin;
//							write('A quantidade máxima de torcedores na arquibancada geral foi atingida!');
//						end
//					else
//						begin;
//							insereTorcedorGeralFila(aFilaTorcedoresGeral, iQuantidadeTorcedoresGeral);
//							comprarIngressoTorcedorGeral(aListaLugarGeralTorcedores, iQuantidadeTorcedoresGeral);
//						end;
//				end
//			else if (opcao = 4) then
//				if (validaLimiteCompradorVisitante(aFilaVisitantes, iQuantidadeVisitantes) = true) then
//						begin;
//							write('A quantidade máxima de visitantes foi atingida! Você pode tentar comprar ingresso como torcedor na arquibancada geral.');
//						end
//					else
//						begin;
//							insereVisitanteFila(aFilaVisitantes,iQuantidadeVisitantes);
//							comprarIngressoVisitante(aListaLugarGeralVisitantes, iQuantidadeVisitantes);
//						end;	
//		end;
//		
//		geraRelatorioFinal(iQuantidadeSocios, iQuantidadeTorcedoresCoberta, iQuantidadeTorcedoresGeral, iQuantidadeVisitantes);
//end;
//
//Begin
//	iniciaMenu();  
//End.

Program Trabalho2;

//Constantes
const TIPO_COMPRADOR_SOCIO = 1;
 		 _TIPO_COMPRADOR_SOCIO = 'Sócio';
      TIPO_COMPRADOR_TORCEDOR_COBERTA = 2;
     _TIPO_COMPRADOR_TORCEDOR_COBERTA = 'Torcedor - Coberta';
      TIPO_COMPRADOR_TORCEDOR_GERAL = 3;
     _TIPO_COMPRADOR_TORCEDOR_GERAL = 'Torcedor - Geral';
      TIPO_COMPRADOR_VISITANTE = 4;
     _TIPO_COMPRADOR_VISITANTE = 'Visitante';

//Quantidade máxima de membros por tipo
		  MAX_SOCIOS = 500;
      MAX_TORCEDORES_COBERTA = 1500;
      MAX_TORCEDORES_GERAL = 700;
      MAX_VISITANTES = 300;

type filaComprador = array[1..3000] of integer;
 		 pilhaIngressos = array[1..3000] of integer;
 		 listaLugar = array[1..3000] of integer;

function isCheia(quantidadeAtual: integer; quantidadeMaxima: integer): boolean;
begin;
	isCheia := false;
	
	if (quantidadeAtual = quantidadeMaxima) then
		begin;
			isCheia := true;
		end;
end;

{
 =====================================================================================================
 =============================================== Fila ================================================
 =====================================================================================================
}

procedure insereFila(var fila: filaComprador; var quantidadeAtual: integer; quantidadeMaxima: integer; valor: integer);
begin;
	if (isCheia(quantidadeAtual, quantidadeMaxima) == true) then
		begin;
			writeln('A quantidade máxima para esta fila foi atingida!');
		end
	else
		begin;
			quantidadeAtual := quantidadeAtual + 1;
			fila[quantidadeAtual] := valor;	
		end;	
end;

{
 =====================================================================================================
 ============================================== Pilha ================================================
 =====================================================================================================
}

procedure inserePilha(var pilha: PilhaIngressos, var quantidadeAtual: integer, valor: integer);
begin;
	quantidadeAtual := quantidadeAtual + 1;
	pilha[quantidadeAtual] := valor;
end;

procedure removePilha(var quantidadeAtual: integer);
begin;
	quantidadeAtual := quantidadeAtual - 1;
end;

{
 =====================================================================================================
 ========================================== PROCESSAMENTO ============================================
 =====================================================================================================
}

procedure carregaPilhaIngressos(var aPilhaIngressos: pilhaIngressos, var quantidadeAtual: integer, quantidadeMaxima: integer);
var i: integer;
begin;
	for i := 1 to quantidadeMaxima do
		begin;
			quantidadeAtual := quantidadeAtual + 1;
			aPilhaIngressos[quantidadeAtual] := i;
		end;
end;

procedure exibeLocaisDisponiveis(aLista: listaLugarCobertaSocios, quantidadeMaxima: integer);
var i: integer;
begin;
	for i := 1 to quantidadeMaxima do
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

procedure realizaVendaIngressos(fila: filaComprador;, quantidadeFila: integer; var quantidadePilha: integer, lista: listaLugar, quantidadeMaximaPilha: integer);
var i, lugarDisponivel, lugarDesejado: integer;
begin;
	for i := 1 to quantidadeFila do
		begin;
			while (lugarDisponivel = 0) do
				begin;
					writeln('Ingresso comprado com sucesso!');
					writeln('Escolha o o número do lugar desejado');
					exibeLocaisDisponiveis(lista);
					readln(lugarDesejado);
			
					if (validaLugarInformadoIsValido(lugarDesejado, 1, MAX_COBERTA_SOCIOS) == true) then
						begin;
							if (validaLugarCobertaDisponivelSocio(aLista, lugarDesejado) = true) then
								begin;
									clrscr;
									writeln('O lugar desejado não está disponível! Escolha outro!');
								end
							else 
								begin;
									marcaLugarCobertaSocio(aLista, lugarDesejado, numeroSocio);
									removeFila(filaComprador, );
									removePilha(quantidadePilha);
									lugarDisponivel := 1;
								end;
						end
				else 
					begin;
						writeln('O lugar informado é inválido! Escolha outro!');
					end;
			end;			
		end;
end;

{
 =====================================================================================================
 ============================================== MENU =================================================
 =====================================================================================================
}

procedure iniciaMenu();
var opcao: integer;

var filaSocios, filaTorcedoresCoberta, filaTorcedoresGeral, filaVisitantes: filaComprador;
var quantidadeSocios, quantidadeTorcedoresCoberta, quantidadeTorcedoresGeral, quantidadeVisitantes: integer;

var pilhaIngressosSocios, pilhaIngressosTorcedoresCoberta, pilhaIngressosTorcedoresGeral, pilhaIngressosVisitantes: pilhaIngressos;
var quantidadeIngressosSocios, quantidadeIngressosTorcedoresCoberta, quantidadeIngressosTorcedoresGeral, quantidadeIngressosVisitantes: integer

var listaLugarSocios, listaLugarTorcedoresCoberta: listaLugar;

begin;
	carregaPilhaIngressos(pilhaIngressosSocios, quantidadeIngressosSocios, MAX_SOCIOS);
	carregaPilhaIngressos(pilhaIngressosTorcedoresCoberta, quantidadeIngressosTorcedoresCoberta, MAX_TORCEDORES_COBERTA);
	carregaPilhaIngressos(pilhaIngressosTorcedoresGeral, quantidadeIngressosTorcedoresGeral, MAX_TORCEDORES_GERAL);
	carregaPilhaIngressos(pilhaIngressosVisitantes, quantidadeIngressosVisitantes, MAX_VISITANTES);
	
	while(opcao <> 6) do
		begin;
			writeln ('    MENU    ');
			writeln ('------------');
			writeln;
			writeln (TIPO_COMPRADOR_SOCIO, ' - Entrar na fila (', _TIPO_COMPRADOR_SOCIO, ')');
			writeln (TIPO_COMPRADOR_TORCEDOR_COBERTA, ' - Entrar na fila (', _TIPO_COMPRADOR_TORCEDOR_COBERTA, ')');
			writeln (TIPO_COMPRADOR_TORCEDOR_GERAL, ' - Entrar na fila (', _TIPO_COMPRADOR_TORCEDOR_GERAL, ')');
			writeln (TIPO_COMPRADOR_VISITANTE, ' - Entrar na fila (', _TIPO_COMPRADOR_VISITANTE, ')');
			writeln ('5 - Realizar compra de Ingressos');
			writeln;
			readln(opcao);
			clrscr;
			if (opcao = 1) then
				begin;
					insereFila(filaSocios, quantidadeSocios, MAX_SOCIOS, (quantidadeSocios + 1));
				end;
			else if (opcao = 2) then
				begin;
					insereFila(filaTorcedoresCoberta, quantidadeTorcedoresCoberta, MAX_TORCEDORES_COBERTA, (quantidadeTorcedoresCoberta + 1));
				end;	
			else if (opcao = 3) then
				begin;
					insereFila(filaTorcedoresGeral, quantidadeTorcedoresGeral, MAX_TORCEDORES_GERAL, (quantidadeTorcedoresGeral + 1));
				end;	
			else if (opcao = 4) then
				begin;
					insereFila(filaVisitantes, quantidadeVisitantes, MAX_VISITANTES, (quantidadeVisitantes + 1));
				end;
			else if (opcao = 5) then
				begin;
					realizaVendaIngressos(filaSocios, quantidadeSocios, pilhaIngressosSocios, quantidadeIngressosSocios, listaLugarSocios, MAX_SOCIOS);
					realizaVendaIngressos(filaTorcedoresCoberta, quantidadeTorcedoresCoberta, pilhaIngressosTorcedoresCoberta, quantidadeIngressosTorcedoresCoberta, listaLugarTorcedoresCoberta, MAX_TORCEDORES_COBERTA);
					realizaVendaIngressos(filaTorcedoresGeral, quantidadeTorcedoresGeral, pilhaIngressosTorcedoresGeral, quantidadeIngressosTorcedoresGeral, listaLugarTorcedoresGeral, MAX_TORCEDORES_GERAL);
					realizaVendaIngressos(filaVisitantes, quantidadeVisitantes, pilhaIngressosVisitantes, quantidadeIngressosVisitantes, listaLugarVisitantes, MAX_VISITANTES);
				end;	
		end;

Begin
	iniciaMenu();  
End.