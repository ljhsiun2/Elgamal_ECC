module sha_256	#(parameter MSG_SIZE = 96,
				parameter PADDED_SIZE = 512)
				(input logic [MSG_SIZE-1:0] message,
				input logic clk, rst,
				output logic [255:0] hashed,
				output logic done);

// https://github.com/unixb0y/SystemVerilogSHA256

	logic[PADDED_SIZE-1:0] padded;

	sha_padder #(.MSG_SIZE(MSG_SIZE), .PADDED_SIZE(PADDED_SIZE)) padder (.message(message), .padded(padded));
	sha_mainloop #(.PADDED_SIZE(PADDED_SIZE)) loop (.padded(padded), .hashed(hashed), .clk(clk), .rst(rst), .done(done));
endmodule // sha_256
