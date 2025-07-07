module UART_receiver #(
parameter data_width = 8)(clk,rx_enable,rx_start,rx_in,rx_received_data);
input clk,rx_enable,rx_start;
input rx_in;
output reg [data_width-1:0] rx_received_data;

localparam data_width_len = (data_width-1) + 3'd3;
reg [1:0] state = 0;
reg [data_width_len:0] data_received = 0; //start bit + data + parity + stop bit
reg [4:0] count;

localparam IDLE = 0;
localparam START = 1;
localparam RECEIVE_DATA = 2;
localparam END = 3;

always@(posedge clk or posedge rx_enable)
begin
	if(rx_enable)
	begin
		count <= 0;
		rx_received_data <= 0;
		state <= IDLE;
	end
	else
	begin
		case(state)
			IDLE:
				begin
					if(rx_start) begin
						count <= data_width_len;
						state <= START;
					end
					else begin
						state <= IDLE;
						end
				end
			START:
				begin
					state <= RECEIVE_DATA;
				end
			RECEIVE_DATA:
				begin
					data_received[count] <= rx_in;
					if(count == 0) state <= END;
					else count <= count - 1;
				end
			END:
				begin
					rx_received_data <= data_received[data_width_len:1];
					state <= IDLE;
				end
		endcase
	end
end

endmodule