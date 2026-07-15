module fnddecoder(
    input [3:0] a,
    output reg [6:0] fnd
    );

    always @(*) begin 
        case(a)
            4'h0 : fnd = 7'b1000000; 
            4'h1 : fnd = 7'b1111001; 
            4'h2 : fnd = 7'b0100100; 
            4'h3 : fnd = 7'b0110000; 
            4'h4 : fnd = 7'b0011001; 
            4'h5 : fnd = 7'b0010010; 
            4'h6 : fnd = 7'b0000010; 
            4'h7 : fnd = 7'b1011000; 
            4'h8 : fnd = 7'b0000000; 
            4'h9 : fnd = 7'b0010000; 
            
            4'hA : fnd = 7'b0001000; 
            4'hB : fnd = 7'b0000011; 
            4'hC : fnd = 7'b1000110; 
            4'hD : fnd = 7'b0100001; 
            4'hE : fnd = 7'b0000110; 
            4'hF : fnd = 7'b0001110; 
            
            default : fnd = 7'b1111111; 
        endcase  
    end
endmodule