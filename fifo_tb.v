`timescale 1ns / 100ps 

module fifo_tb;
    reg reset;
    reg clk ; 
    reg push=0;
    reg pop =0; 

    reg [9:0] data = 0  ; 

    wire empty ; 
    wire full ; 
    wire [4:0] cur_size ; 
    wire [9:0] out_data ; 

    fifo uut(
        .clk(clk),
        .reset(reset),
        .push(push),
        .pop(pop),
        .inp_data(data),
        .empty(empty) ,
        .full(full),
        .cur_size(cur_size),
        .out_data(out_data)
    );


    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, fifo_tb);
        reset = 1;
        clk = 1;
        #20;
        clk = 0;
        reset = 0;
        #20;

        repeat (4) begin
            #20;
            clk = 1;
            #20;
            clk = 0 ;
            
        end
        repeat (4) begin
            #20;
            clk = 1;
            data += 1;
            push = 1;
            #20;
            clk = 0 ;
            push = 0;
            #20;
            clk = 1 ;
            #20;
            clk = 0 ;
            #20;
            
        end
        repeat (6) begin
            #20;
            clk = 1;
            data += 1;
            pop = 1;
            #20;
            clk = 0 ;
            pop = 0;
            #20;
            clk = 1 ;
            #20;
            clk = 0 ;
            
        end
    end

endmodule
