module security_test(
        input KC,
        input PIN,
        input LOCK,
        output reg AL);

wire temp1,temp2;
initial begin
$monitor("KC=%b PIN=%b LOCK=%b AL=%b",KC,PIN,LOCK,AL);


end

 always @ (KC or PIN or LOCK) begin//Use switch case to test which condition lock is in
      case ({KC, LOCK})
         2'b00 : AL <= 0;
         2'b01 : AL <= 1;
         2'b10 : AL <= 0;
         2'b11 : AL <= !PIN;
      endcase
   end

endmodule
