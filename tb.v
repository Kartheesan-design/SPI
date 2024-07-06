`timescale 1ns / 1ps

module tb();
    
    reg clk;
    reg rst;
    reg [15:0]datain;
    
    
    wire spi_cs_l;
    wire spi_sclk;
    wire spi_data;
    wire [4:0]counter;
    
    spi spi1(
        .clk(clk),
        .rst(rst),
        .datain(datain),
        .spi_cs_l(spi_cs_l),
        .spi_sclk(spi_sclk),
        .spi_data(spi_data),
        .counter(counter)
        );


        initial begin
            clk = 1'b0;
            rst = 1'b1;
            datain = 0;
        end

        always #5 clk = ~ clk;
        
        initial begin
            #10 rst = 1'b0;
            #10 datain = 16'hA569;
            #335 datain = 16'h2563;
            #335 datain = 16'h9B63;
            #335 datain = 16'h6A61;
            #335 datain = 16'hA265;
            #335 datain = 16'h7564;
        end
        
        initial
            #1695 $stop;
endmodule
