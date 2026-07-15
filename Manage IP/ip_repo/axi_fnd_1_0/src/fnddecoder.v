`timescale 1ns / 1ps

module fnddecoder(
input  [3:0] a,
    output  reg [7:0] fnd    
    );
//reg [7:0] fndout;
//assign fnd = fndout;
    always @ (a) begin
        case (a)
			4'h0 : fnd = 8'h40; //0
			4'h1 : fnd = 8'h79; //1
			4'h2 : fnd = 8'h24; //2
			4'h3 : fnd = 8'h30; //3
			4'h4 : fnd = 8'h19; //4
			4'h5 : fnd = 8'h12; //5
			4'h6 : fnd = 8'h02; //6
			4'h7 : fnd = 8'h58; //7
			4'h8 : fnd = 8'h00; //8
			4'h9 : fnd = 8'h10; //9
			4'ha : fnd = 8'h20; //10
			4'hb : fnd = 8'h03; //11
			4'hc : fnd = 8'h27; //12
			4'hd : fnd = 8'h21; //13
			4'he : fnd = 8'h04; //14
			4'hf : fnd = 8'h0e; //15
         
            default:  fnd = 8'hff;
        endcase
    end
endmodule
