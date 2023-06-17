within Field_Package.Field;

model channel
  //press atm
  parameter SI.AbsolutePressure Patm = System.Patm "atmospheric pressure" annotation(
    Dialog(tab = "Assumptions"));
  //gravity acceleration
  parameter SI.Acceleration g = System.g "gravity acceleration" annotation(
    Dialog(tab = "Assumptions"));
  //water density
  parameter SI.Density rho = System.rho "water density " annotation(
    Dialog(tab = "Assumptions"));
  // Initial water level
  parameter SI.Height z_start = 0.1 "Initial water level";
  // Water level height
  SI.Height z(start = z_start, min=0);
  // pressure on the bottom of the canal
  SI.AbsolutePressure p_bottom;
  parameter Real C = 0.0446 "percolation coefficient";
  parameter SI.Length L_ch=5 "lenght of the channel";
  parameter SI.Length bl=1 "width of the base of the channel";
  parameter SI.Length bh=2 "width of the top of the channel";
  parameter SI.Length z_max=2 "height of the top of the channel";
  
  outer Field_Package.Rain rain;

  SI.MassFlowRate rain_volumeflow;
  Field_Package.Interfaces.fluxport_a Port annotation(
    Placement(visible = true, transformation(origin = {-6, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-3, -97}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  SI.MassFlowRate Percol_flow;
  Modelica.Blocks.Interfaces.RealOutput z_ch annotation(
    Placement(visible = true, transformation(origin = {104, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {104, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  z_ch=z;
  p_bottom = Port.p;
  p_bottom = Patm + rho * g * z;
  rain_volumeflow = rain.RainFlow*(bh*L_ch);
// the area over which rain falls by assumption is the high area of the canal basin, without the interference of vegetation
  Percol_flow = C * z * (L_ch * bl);
// the area of percolation is only the lower area
  rho * (L_ch * bl + L_ch * (z / z_max) * (bh - bl) / 2) * der(z) = Port.w + rain_volumeflow - Percol_flow;
  annotation(Documentation(info= "<html>
<p>
The channel model interfaces with other blocks through a single portal whose potential variable is the pressure at the bottom of the channel. This pressure is used to calculate the water level height within the channel. The equation that describes the channel model is as follows: 
<br> 
<strong>&#961; A </math> <math xmlns=\"http://www.w3.org/1998/Math/MathML\">
  <mfrac>
    <mn>dz</mn>
    <mn>dt</mn>
  </mfrac>
</math>
= w<sub>i</sub> + ER - DP; </strong>
<br> where z is the water level, A is the area of the field, &#961; is the water density,  w<sub>i</sub> the water flow rate entering in the field, ER is the rainfall, DP is the deep percolation.
<p>
<img src=\"modelica://Field_Package/images/field_image1.png\"
    width=\"200\" height=\"130\">
</p>
-----------------------------------------------------
<p>

<img src=\"modelica://Field_Package/images/channel1.png\" width=\"130\" height=\"130\">
<img src=\"modelica://Field_Package/images/immagine2.png\" width=\"160\" height=\"120\">

</p> bh represent the width at the top of the channel, bl is the width at bottom of the channel, z_max is the height of the channel.

As output, we have the height of the water level (<strong>z</strong>) within the channel.
</p>
</html>"),
    Icon(graphics = {Text(origin = {-12, 126}, extent = {{-66, 18}, {66, -18}}, textString = "%name"), Polygon(origin = {-1, 0}, fillColor = {195, 98, 0}, fillPattern = FillPattern.CrossDiag, points = {{-97, 100}, {-97, -98}, {99, -98}, {99, 98}, {99, 98}, {-97, 100}}), Polygon(origin = {-4, 17}, lineColor = {0, 30, 253}, fillColor = {6, 36, 144}, fillPattern = FillPattern.Sphere, points = {{-92, 83}, {-92, 83}, {98, 83}, {56, -95}, {-54, -95}, {-92, 83}, {-92, 83}}), Text(origin = {-6, -62}, lineColor = {170, 255, 255}, extent = {{-32, 14}, {32, -14}}, textString = "bl"), Text(origin = {-5, 83}, lineColor = {170, 255, 255}, extent = {{-35, 11}, {35, -11}}, textString = "bh"), Line(origin = {-38, -70.2822}, points = {{-20, 0}, {20, 0}, {20, 0}, {20, 0}}, color = {170, 255, 255}, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 7), Line(origin = {-73.9086, 81.3092}, points = {{-20, 0}, {20, 0}, {20, 0}, {54, 0}}, color = {170, 255, 255}, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 7), Line(origin = {32.74, 80.68}, points = {{-20, 0}, {20, 0}, {20, 0}, {60, 0}}, color = {170, 255, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Line(origin = {-2.68526, -69.2749}, points = {{10, 7.10543e-15}, {20, 0}, {20, 0}, {54, 0}}, color = {170, 255, 255}, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 7), Line(origin = {-73.9086, 81.3092}, points = {{-20, 0}, {20, 0}, {20, 0}, {54, 0}}, color = {170, 255, 255}, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 7), Line(origin = {-74.73, 48.55}, points = {{-18, 28}, {-18, -32}, {-18, -58}, {-18, -124}}, color = {170, 255, 255}, thickness = 0.5, arrow = {Arrow.Filled, Arrow.None}, arrowSize = 7), Text(origin = {-63, 15}, lineColor = {170, 255, 255}, extent = {{-35, 11}, {35, -11}}, textString = "z_max")}),
    Diagram);
end channel;
