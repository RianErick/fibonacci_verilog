module fibC (input clk, rst,
            output [3:0] saida);
  
  // Registros para armazenar os valores atuais e anteriores do contador de Fibonacci
  reg [3:0] RegA, RegB, RegC;
  
  always @ (posedge clk) begin
    if (rst) begin
      RegA <= 4'h1;	//Iniciar RegA com o segundo valor da série de Fibonacci - '1'
      RegB <= 4'h0;	//Iniciar RegB com o primeiro valor da série de Fibonacci - '0'
      RegC <= 4'h0; // Redefinir RegC para '0'
    end
    else begin
      RegA <= RegB[3] ? 4'h1 : RegA + RegB; // se RegB == 8, redefinir RegA
      RegB <= RegB[3] ? 4'h0 : RegA;	// se RegB == 8, redefinir RegB
      RegC <= RegB;	//RegC é um registrador de sincronização
    end
  end
  
  
  assign saida = RegB;	//Para ignorar o '0' na inicialização após a redefinição, descomente esta linha
                        // Para começar com um '0' na inicialização após a redefinição
  
endmodule