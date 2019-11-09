# fpga-fifo
Implementation of FIFO data structure in Verilog.
It has following input/output ports : 
1. Inputs:
    1. clk : input clock
    1. reset : asynchronous reset signal ; it resets the rear and front pointer in the data structure.
    1. push , pop : push and pop signals ; in order to write/or read to/from Fifo , a full signal (a posedge followed by a negedge) should be written on these ports.
    1. inp_data : input data with a range of (0 - 2^10-1)
1. Outputs
   1. empty : is fifo empty?                        (front == rear)
   1. full : is fifo full ?                         ((front - rear ) == 32)
   1. cur_size : number of elements in the fifo :   (front - rear)
   1. out_data : it should be obvious :D 