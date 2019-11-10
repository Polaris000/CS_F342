module memory(WE, DataToWrite, RegSel, ReadData);
  input WE;
  input [7:0] DataToWrite;
  input [15:0]  RegSel;
  output  [7:0] ReadData;
  reg [7:0] ReadData;
  reg [0:15][7:0] Mem ;
  
  always  @ (WE or DataToWrite or RegSel) begin
    case(RegSel)
      16'h8000: begin
        if(WE)
          Mem[4'h0] = DataToWrite;
        {ReadData} = Mem[4'h0];
      end
      16'h4000: begin
        if(WE)
          Mem[4'h1] = DataToWrite;
        {ReadData} = Mem[4'h1];
      end
      16'h2000: begin
        if(WE)
          Mem[4'h2] = DataToWrite;
        {ReadData} = Mem[4'h2];
      end
      16'h1000: begin
        if(WE)
          Mem[4'h3] = DataToWrite;
        {ReadData} = Mem[4'h3];
      end
      16'h0800: begin
        if(WE)
          Mem[4'h4] = DataToWrite;
        {ReadData} = Mem[4'h4];
      end
      16'h0400: begin
        if(WE)
          Mem[4'h5] = DataToWrite;
        {ReadData} = Mem[4'h5];
      end
      16'h0200: begin
        if(WE)
          Mem[4'h6] = DataToWrite;
        {ReadData} = Mem[4'h6];
      end
      16'h0100: begin
        if(WE)
          Mem[4'h7] = DataToWrite;
        {ReadData} = Mem[4'h7];
      end
      16'h0080: begin
        if(WE)
          Mem[4'h8] = DataToWrite;
        {ReadData} = Mem[4'h8];
      end
      16'h0040: begin
        if(WE)
          Mem[4'h9] = DataToWrite;
        {ReadData} = Mem[4'h9];
      end
      16'h0020: begin
        if(WE)
          Mem[4'hA] = DataToWrite;
        {ReadData} = Mem[4'hA];
      end
      16'h0010: begin
        if(WE)
          Mem[4'hB] = DataToWrite;
        {ReadData} = Mem[4'hB];
      end
      16'h0008: begin
        if(WE)
          Mem[4'hC] = DataToWrite;
        {ReadData} = Mem[4'hC];
      end
      16'h0004: begin
        if(WE)
          Mem[4'hD] = DataToWrite;
        {ReadData} = Mem[4'hD];
      end
      16'h0002: begin
        if(WE)
          Mem[4'hE] = DataToWrite;
        {ReadData} = Mem[4'hE];
      end
      16'h0001: begin
        if(WE)
          Mem[4'hF] = DataToWrite;
        {ReadData} = Mem[4'hF];
      end
    endcase
  end
endmodule
