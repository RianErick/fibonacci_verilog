module fibC (input logic clock, resete,
            output logic [3:0] saida);
  
  // Registros para armazenar os valores atuais e anteriores do contador de Fibonacci
  reg [3:0] RegistroA, RegistroB, RegistroC;
  
  always @ (posedge clock)begin
    if (resete) begin
      RegistroA <= 4'h1;	//Iniciar RegA com o segundo valor da série de Fibonacci - '1'
      RegistroB <= 4'h0;	//Iniciar RegB com o primeiro valor da série de Fibonacci - '0'
      RegistroC <= 4'h0; // Redefinir RegC para '0'
    end
    else begin
      RegistroA <= RegistroB[3] ? 4'h1 : RegistroA + RegistroB; // se RegB == 8, redefinir RegA
      RegistroB <= RegistroB[3] ? 4'h0 : RegistroA;	// se RegB == 8, redefinir RegB
      RegistroC <= RegistroB;	//RegC é um registrador de sincronização
    end
  end
  
  assign saida = RegistroB;	//Para ignorar o '0' na inicialização após a redefinição, descomente esta linha
                        
endmodule