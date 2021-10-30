module parse;

int debug,file,clockcycle;
string inputfile, inputScan;
logic [1:0] op;
logic [36:0] address;


initial
begin
	$value$plusargs("debug=%d", debug);
	if($value$plusargs("tracefile=%s", inputfile))
	begin
		file = $fopen(inputfile, "r");
		if (file == 0) 
		begin
			if (debug == 1)
			begin
				$display ("ERROR file not opening");
				$stop;
			end
		end
		else 
		begin
			if (debug ==1)
			begin
				while(!$feof(file))
				begin
					$fgets(inputScan,file);
					$sscanf(inputScan,"%d %d %h",clockcycle,op,address);
					$display("%d %d %h",clockcycle,op,address);
				end
			end
		end
	end
end
endmodule