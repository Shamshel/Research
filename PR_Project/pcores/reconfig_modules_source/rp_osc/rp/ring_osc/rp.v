`uselib lib=unisims_ver
`uselib lib=proc_common_v3_00_a

module rp
(
	reg_0,
	reg_1,
	Clk,
	Reset_n
	
);

input reg_0;
input Clk;
input Reset_n;

output reg_1;

parameter RESET_COND							 = 32'h00000000;
parameter GO_DONE_MASK						 = 32'h80000000;
parameter BUS_WIDTH							 = 32;

//----------------------------------------------------------------------------
// Implementation
//----------------------------------------------------------------------------
  reg			 [BUS_WIDTH-1 : 0]				  	  Clk_count;
  reg			 [BUS_WIDTH-1 : 0]			     	  reg_1;

  integer                                   	  timeout_count;
  wire 		 	 [25 : 0]							  a;
  reg        										  	  on, done;

  // USER logic implementation added here
  
  //The ring oscillator requires an !!ODD!! number of 'not' gates to function
  assign a[0] = (a[25] & on);
  assign a[1] = !a[0];
  assign a[2] = !a[1];
  assign a[3] = !a[2];
  assign a[4] = !a[3];
  assign a[5] = !a[4];
  assign a[6] = !a[5];
  assign a[7] = !a[6];
  assign a[8] = !a[7];
  assign a[9] = !a[8];
  assign a[10] = !a[9];
  assign a[11] = !a[10];
  assign a[12] = !a[11];
  assign a[13] = !a[12];
  assign a[14] = !a[13];
  assign a[15] = !a[14];
  assign a[16] = !a[15];
  assign a[17] = !a[16];
  assign a[18] = !a[17];
  assign a[19] = !a[18];
  assign a[20] = !a[19];
  assign a[21] = !a[20];
  assign a[22] = !a[21];
  assign a[23] = !a[22];
  assign a[24] = !a[23];
  assign a[25] = !a[24];
  

initial
	begin
		reg_1 <= 0;
	
	end

//----------------------------------------------------------------------------
//
//		reg_0 operation:
//
//		bit 31:0:	Oscillation Count
//			Clearing this register initiates a module reset.  An oscillation
//			counter will continue to count posedge events from the ring
//			oscillator for this many module clock cycles.  The Oscillation Count
//			number is not cleared by hardware upon	timeout.  The module will not
//			start counting the ring oscillator's cycles again until the module is
//			reset by first clearing this register and writing a nonzero value.
//
//----------------------------------------------------------------------------

//----------------------------------------------------------------------------
//
//		reg_1 operation:
//
//		bit 31:		go/done bit
//			Cleared after reset.  When set, the go/done bit indicates a completed
// 		oscillation count and that the oscillation count timeout has been
//			poplulated with the measured data.
//
//		bit 30:0:	oscillation Count timeout
//			Cleared after reset.  An oscillation Counter internal to the
//			module will keep track of the number of oscillations from the ring
//			oscillator for a period of time specified in the reg_0 register.
//			this value will be updated at the same time as the go/done bit.
//
//----------------------------------------------------------------------------

	always @( posedge Clk )
    begin
	 
			//check reset condition
			if(reg_0 == RESET_COND)
				begin
					timeout_count <= 0;
					on <= 0;
				
				end
	 
		   //check if GO/DONE bit set
			else if ((reg_1 & GO_DONE_MASK) != GO_DONE_MASK)
				begin
					//check for timeout
					//timeout when timeout_count > reg_0
					if (reg_0 >= timeout_count)
						begin
							//set done bit, return result
							//reg_1 <= reg_1 | (GO_DONE_MASK | timeout_count);

							//turn off, clear timer count
							on <= 0;
							done <= 1;
							timeout_count <= 0;

						end

					else
						begin
							//check for startup
							if (on == 0)
								begin
									timeout_count <= 0;
									done <= 
									on <= 1;
								
								end
						
							//increment timeout
							timeout_count <= timeout_count + 1;

						end

				end
				
			//go bit set
			else if ((reg_1 & GO_DONE_MASK) == GO_DONE_MASK)
				begin
					done <= 0;
				
				end

    end // SLAVE_REG_WRITE_PROC


  //count positive edge events on the output of the first not gate of the ring oscillator
  always @(posedge a[0])
	begin
		//check for reset condition
		if(reg_0 == RESET_COND)
			begin
				reg_1 <= 0;
			
			end
	
		//check for cleared done bit: increment reg_1.
		if (!done)
			begin
				reg_1 <= reg_1 + 1;

			end
		
		//done bit set
		else
			begin
				reg_1 <= (GO_DONE_MASK | reg_1);
			
			end
	
	end

endmodule
