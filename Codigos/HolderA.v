module HolderA(clock, A, Sel, Out);
	input clock;
	input [7:0] A;
	input [2:0] Sel;
	output [7:0] Out;
	
	reg [7:0] Out, reg1, reg2 = 0;
	
	wire wSel, wSel2, wSel3, wSel4, SelNot3, SelNot2;
	
	not n1(SelNot3, Sel[2]);
	not n2(SelNot2, Sel[1]);
	not n3(SelNot1, Sel[0]);
	
	and a1(wSel, SelNot3, SelNot2, Sel[0]);
	and a2(wSel2, Sel[2], SelNot2, SelNot1);
	and a3(wSel3, Sel[2], SelNot2, Sel[0]);
	
	or o1(wSel4, wSel, wSel3);
	
	always @(posedge clock) begin
		reg1 = reg2; 
		reg2 = A;
		
		if(wSel4) begin
			if(reg1 == reg2)
				Out <= A;
		end
		else if(wSel2)
			Out <= 0;
	end
endmodule
