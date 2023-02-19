`timescale 1ns/1ps
module elevator(input clk,[1:0]in, output [1:0]out);
parameter ground = 0;
parameter first  = 1;
parameter second = 2;
parameter third  = 3;

reg [1:0] present, next;
assign out=present;
always@(posedge clk)
present <= next;

always@(present or in) begin
case(present)
    ground : begin 
        case(in)
            0 : next = ground;
            1 : next = first;
            2 : next = first;
            3 : next = first;            
        endcase
        end
    first : begin 
        case(in)
            0 : next = ground;
            1 : next = first;
            2 : next = second;
            3 : next = second;
        endcase
        end
    second : begin 
        case(in)
            0 : next = first;
            1 : next = first;
            2 : next = second;
            3 : next = third;
        endcase 
        end
    third : begin 
        case(in)
            0 : next = second;
            1 : next = second;
            2 : next = second;
            3 : next = third;
        endcase 
        end
    default : next=ground;
    endcase 
end
endmodule 