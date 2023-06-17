within Field_Package.Field;

model field2_singleport
  // press atm
  parameter SI.AbsolutePressure Patm = System.Patm "atmospheric pressure" annotation(
    Dialog(tab = "Assumptions"));
  // gravity acceleration
  parameter SI.Acceleration g = System.g "gravity acceleration" annotation(
    Dialog(tab = "Assumptions"));
  // water density
  parameter SI.Density rho = System.rho "water density " annotation(
    Dialog(tab = "Assumptions"));
  // field section area
  parameter SI.Area A = 40 "field section area";
  // initial water level
  parameter SI.Height z_start = 0.01 " initial water level ";
  // water level height
  SI.Height z(start = z_start, min = 0);
  // pressure on the bottom of the field
  SI.AbsolutePressure p_bottom;
  parameter Real C = 0.01 "percolation coefficient";
  parameter Real a = 0.005 "coeff costante di I";
  parameter Real b = 0.005 "coeff costante di I";
  outer Field_Package.Rain rain;
  outer Field_Package.H_veg_data h_veg_data;
  outer Field_Package.ET_data et_data;
  SI.MassFlowRate rain_volumeflow;
  SI.MassFlowRate I;
  SI.MassFlowRate ET_flow;
  Field_Package.Interfaces.fluxport_a Port annotation(
    Placement(visible = true, transformation(origin = {0, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {4, -104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SI.MassFlowRate Percol_flow;
  SI.MassFlowRate ER;
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(visible = true, transformation(origin = {104, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-105, -23}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
equation
  p_bottom = Port.p;
  p_bottom = Patm + rho * g * z;
  rain_volumeflow = rain.RainFlow * A;
  I = a * h_veg_data.H_veg + b * h_veg_data.H_veg * rain.RainFlow * A;
//a*h+b*h*R
  ER = if rain_volumeflow > I and rain_volumeflow - I > 0 then rain_volumeflow - I else 0;
  Percol_flow = if z > 0.001 then C * z * A else 0;
  ET_flow = if et_data.ET_Flow * A > 0 and z > 0.01 then et_data.ET_Flow * A else 0;
//Port.W: flusso attraverso la porta | ER: precipitazione netta | Percol_flow: percolazione
//ET_flow: evapotraspirazione
  rho * A * der(z) = Port.w + ER - Percol_flow - ET_flow;
  y = z;
  annotation(
    Documentation(info = "<html>
<p>
The field model interfaces with other blocks through a single portal whose potential variable is the pressure at the bottom of the field. This pressure is used to calculate the water level height within the field. The equation that describes the field model is as follows: 
<br> 
<strong>&#961; A </math> <math xmlns=\"http://www.w3.org/1998/Math/MathML\">
  <mfrac>
    <mn>dz</mn>
    <mn>dt</mn>
  </mfrac>
</math>
= w<sub>i</sub> + ER - DP - ET; </strong>
<br> where z is the water level, A is the area of the field, &#961; is the water density,  w<sub>i</sub> the water flow rate entering in the field, ER is the rainfall, DP is the deep percolation, ET is the evapotranspiration effect.
<p>
<img src=\"modelica://Field_Package/images/field_image1.png\"
    width=\"210\" height=\"140\">
</p>
<p>

As output, we have the height of the water level (<strong>z</strong>) within the field.

</html>"),
    Icon(graphics = {Rectangle(origin = {5, -18}, fillColor = {193, 135, 0}, fillPattern = FillPattern.Solid, extent = {{-65, 30}, {65, -30}}), Rectangle(lineColor = {151, 227, 0}, fillColor = {107, 207, 0}, fillPattern = FillPattern.Cross, extent = {{-100, 100}, {100, -100}}), Text(origin = {-12, 125}, extent = {{-70, 19}, {70, -19}}, textString = "%name")}),
    Diagram,
    experiment(StartTime = 0, StopTime = 1.4778e+07, Tolerance = 1e-06, Interval = 1));
end field2_singleport;
