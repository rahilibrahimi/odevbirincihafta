module VGAMod
(
    input                   CLK,
    input                   nRST,

    input                   PixelClk,

    output                  LCD_DE,
    output                  LCD_HSYNC,
    output                  LCD_VSYNC,

    output          [4:0]   LCD_B,
    output          [5:0]   LCD_G,
    output          [4:0]   LCD_R
);

localparam      V_BackPorch = 16'd6; //0 or 45
localparam      V_Pluse 	= 16'd5; 
localparam      HightPixel  = 16'd480;
localparam      V_FrontPorch= 16'd62; //45 or 0

localparam      H_BackPorch = 16'd182; 	
localparam      H_Pluse 	= 16'd1; 
localparam      WidthPixel  = 16'd800;
localparam      H_FrontPorch= 16'd210;

localparam      PixelForHS  =   WidthPixel + H_BackPorch + H_FrontPorch;  	
localparam      LineForVS   =   HightPixel + V_BackPorch + V_FrontPorch;

reg [15:0] LineCount;
reg [15:0] PixelCount;

reg	[9:0]  Data_R;
reg	[9:0]  Data_G;
reg	[9:0]  Data_B;
    always @(  posedge PixelClk or negedge nRST  )begin
        if( !nRST ) begin
            LineCount       <=  16'b0;    
            PixelCount      <=  16'b0;
            end
        else if(  PixelCount  ==  PixelForHS ) begin
            PixelCount      <=  16'b0;
            LineCount       <=  LineCount + 1'b1;
            end
        else if(  LineCount  == LineForVS  ) begin
            LineCount       <=  16'b0;
            PixelCount      <=  16'b0;
            end
        else
            PixelCount      <=  PixelCount + 1'b1;
    end

   always @(  posedge PixelClk or negedge nRST  )begin
        if( !nRST ) begin
    		Data_R <= 9'b0;
    		Data_G <= 9'b0;
    		Data_B <= 9'b0;
            end
        else begin
    		end
    end
endmodule
