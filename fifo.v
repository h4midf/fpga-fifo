module fifo(
    input clk, reset,
    input push , pop , 
    input [9:0] inp_data,
    output empty , 
    output full , 
    output [4:0] cur_size,
    output reg [9:0] out_data
);
    reg [9:0] mem[0:31];
    reg [4:0] rear = 0 ;
    reg [4:0] front = 0 ;

    reg push_state = 0 ;
    reg pop_state = 0 ;

    integer i;
    always@(posedge clk or reset) begin
        if(reset == 1 ) begin
            for (i = 0; i < 32 ; i+=1) begin
                mem[i] <= 0 ;
                rear <= 0 ;
                front <= 0 ;
                
                out_data <= 0 ;

            end
        end 
        if ((push == 1) && (!full)) begin
            if(push_state == 0) begin
                push_state <= 1 ;
                mem[front] <= inp_data ;
                front <= front + 1 ;
                
            end
            
        end else if (push == 0 ) begin
            push_state <= 0 ;

        end

        if ((pop == 1) && (!empty) ) begin
            if(pop_state == 0) begin
                pop_state <= 1;
                out_data <= mem[rear];
                rear <= rear + 1 ;

            end    
        end else if (pop == 0 ) begin
            pop_state <= 0 ;
        end


    end

    assign cur_size = front - rear; 
    assign empty = cur_size == 0 ; 
    assign full = cur_size == 32 ;


endmodule
