module regfile(
    input clk,
    input reset,
    input [1:0] readReg1,
    input [1:0] readReg2,
    input [31:0] writeData,
    input regWrite,
    input  [1:0] writeReg,
    output [31:0] readData1,
    output [31:0] readData2);

    wire [3:0][31:0] regOut;
    // wire [31:0] regIn;
    wire [3:0] decoderOut;
    wire [3:0] regClk;

    decoder2_4 dec1( decoderOut, writeReg );    

    assign regClk[0] = (clk & regWrite & decoderOut[0]);
    assign regClk[1] = (clk & regWrite & decoderOut[1]);
    assign regClk[2] = (clk & regWrite & decoderOut[2]);
    assign regClk[3] = (clk & regWrite & decoderOut[3]);

    reg_32bit r0( regOut[0], writeData, regClk[0], reset );
    reg_32bit r1( regOut[1], writeData, regClk[1], reset );
    reg_32bit r2( regOut[2], writeData, regClk[2], reset );
    reg_32bit r3( regOut[3], writeData, regClk[3], reset );

    mux_4to1 m1( readData1, regOut[0] , regOut[1] , regOut[2], regOut[3], readReg1 );
    mux_4to1 m2( readData2, regOut[0] , regOut[1] , regOut[2] , regOut[3], readReg2 );
       

endmodule

// module tbRegFile4;
//   reg Clock, Reset, RegWrite;
//   reg [1:0] ReadReg1, ReadReg2, WriteRegNo;
//   reg [31:0]  WriteData;
//   wire  [31:0]  ReadData1, ReadData2;
//   regfile rgf(Clock, Reset,  ReadReg1, ReadReg2,WriteData, RegWrite, WriteRegNo,ReadData1,ReadData2);
//   initial begin
//     $monitor($time, ": Reset = %b, RegWrite = %b, ReadReg1 = %b, ReadReg2 = %b, WriteRegNo = %b, WriteData = %b, ReadData1 = %b, ReadData2 = %b.", Reset, RegWrite, ReadReg1, ReadReg2, WriteRegNo, WriteData, ReadData1, ReadData2);
//     #0  Clock = 1'b1; Reset = 1'b1;
//     #2  Reset = 1'b0;
//     #10 Reset = 1'b1; RegWrite = 1'b1;  WriteData = 32'hF0F0F0F0; WriteRegNo = 2'b00;
//     #10 RegWrite = 1'b1;  WriteData = 32'hF8F8F8F8; WriteRegNo = 2'b01;
//     #10 RegWrite = 1'b1;  WriteData = 32'hFAFAFAFA; WriteRegNo = 2'b10;
//     #10 RegWrite = 1'b1;  WriteData = 32'hFFFFFFFF; WriteRegNo = 2'b11;
//     #10 RegWrite = 1'b0;
//     #10 ReadReg1 = 2'b00; ReadReg2 = 2'b01;
//     #10 ReadReg1 = 2'b10; ReadReg2 = 2'b11;
//     #10 $finish;
//   end
//   always
//     #5  Clock = ~Clock;
// endmodule

module testregfile();
    reg clk;
    reg reset;
    reg [1:0] readReg1;
    reg [1:0] readReg2;
    reg [31:0] writeData;
    reg regWrite;
    reg  [1:0] writeReg;
    wire [31:0] readData1;
    wire [31:0] readData2;

    regfile r(clk, reset, readReg1, readReg2, writeData, regWrite, writeReg, readData1, readData2);

    initial begin
        clk = 0;
        forever begin
            # 5 clk = ~clk;
        end
    end

    initial begin
        $monitor($time,
                 "clk=%b ", clk,
                 "reset=%b ", reset,
                 "readReg1=%b ", readReg1,
                 "readReg2=%b\n", readReg2,
                 "writeData=%b\n", writeData,
                 "regWrite=%b ", regWrite,
                 "writeReg=%b\n", writeReg,
                 "readData1=%b\n", readData1,
                 "readData2=%b\n", readData2);

            reset=1'b1;
            regWrite=1'b1;


        #2 reset=1'b0;

        #10 writeData=32'd1000;
            reset=1'b1;
            writeReg=2'b00;


        #10 readReg1=2'b00;
            writeData=32'd023;
            regWrite=1'b1;
            writeReg=2'b01;

        #10 writeData=32'd1232;
            regWrite=1'b1;
            writeReg=2'b10;

        #10 writeData=32'd3444;
            regWrite=1'b1;
            writeReg=2'b11;

        #10 regWrite=1'b0;
            readReg1=2'b00;
            readReg2=2'b01;

        #10 readReg1=2'b10;
            readReg2=2'b11;

        #50 $finish;

    end

endmodule

