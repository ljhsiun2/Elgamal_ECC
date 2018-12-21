module elg_decrypt
	#(parameter P = 256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFFFC2F)
	(input logic Clk, Reset,
	input logic [255:0]  Cx, Cy, Dx, Dy,
	input logic [255:0] priv, // here, privKey is Bob's
	output logic Done,
	output logic [255:0] outx, outy); // (Mx, My) is message is a point

	// Px, Py is bob_point/other person's point i.e. public key.
	// Qx, Qx is shared secret point.
	logic[255:0] Mx, My_temp, My, newMy;
	/* insert message stuff here; possibly do in C? */
	logic Done_C, Done_D, Done_tempD;
	logic[255:0] tempDx, tempDy;
	/* insert rand() function here; outputs r*/
	/* Generates C1 = r*G */
	gen_point #(P) gen_C(.Clk, .Reset, .privKey(priv), .Gx(Cx), .Gy(Cy), .Done(Done_C), .outX(Mx), .outY(My_temp));
	assign My = ~(My_temp) + 1'b1;
	assign newMy = My + P;
	point_add #(P) gen_D(.Clk, .Reset(Reset | ~Done_C), .Px(Dx), .Py(Dy), .Qx(Mx), .Qy(newMy), .Done(Done_D),
					.Rx(outx), .Ry(outy));

	assign Done = Done_D;

endmodule
