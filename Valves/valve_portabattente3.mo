within Field_Package.Valves;

model valve_portabattente3
  //press atm
  parameter SI.AbsolutePressure P_atm = System.Patm "atmospheric pressure" annotation(
    Dialog(tab = "Assumptions"));
  parameter SI.Acceleration g = System.g "gravity acceleration" annotation(
    Dialog(tab = "Assumptions"));
  parameter SI.Density rho = System.rho "water density " annotation(
    Dialog(tab = "Assumptions"));
  import Modelica.Constants.pi;
  //raggio area valvola*
  parameter SI.Length r = 0.22 "valve opening radius" annotation(
    Dialog(group = "Geometric Parameters"));
  //coefficiente di contrazione*
  parameter Real Cc = 0.5 "Contraction coefficient";
  //altezza massimo dell'apertura della valvola(=diametro)
  parameter SI.Height h_max = 2 * r "unit=m" annotation(
    Dialog(group = "Geometric Parameters"));
  //area massima valvola di 20cm
  parameter SI.Area Av_max = pi * r ^ 2 annotation(
    Dialog(group = "Geometric Parameters"));
  //area di apertura valvola effettiva
  //SI.Area Av_eff;
  //segnale saturato apertura/chiusura valvola 0<u<1
  Real u_w;
  SI.PressureDifference dp_max;
  Real w_max;
  // maximum possible water flow, depends on the geometry of the port and on the
  //azione di controllo non saturata
  Modelica.Blocks.Interfaces.RealInput x annotation(
    Placement(visible = true, transformation(origin = {-4, 96}, extent = {{-34, -34}, {34, 34}}, rotation = -90), iconTransformation(origin = {-4, 86}, extent = {{-20, -20}, {20, 20}}, rotation = -90)));
  Field_Package.Interfaces.fluxport_a a_batt annotation(
    Placement(visible = true, transformation(origin = {-64, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -48}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
  Field_Package.Interfaces.fluxport_b b_batt annotation(
    Placement(visible = true, transformation(origin = {64, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {99, -49}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
  parameter SI.Height height_port_a = 0 "height of 'a' relative to the ground floor" annotation(
    Dialog(group = "Geometric parameters"));
  //altezza rispetto al fondo terreno*
  parameter SI.Height height_port_b = 0 "height of 'b' relative to the ground floor" annotation(
    Dialog(group = "Geometric parameters", groupImage = "modelica://Field_Package/images/Cattura2.jpg"));
  SI.AbsolutePressure press_a;
  //pressure at point a
  SI.AbsolutePressure press_b;
  //pressure at point b
  inner Modelica.Blocks.Interfaces.RealOutput wmax annotation(
    Placement(visible = true, transformation(origin = {-1, -107}, extent = {{-39, -39}, {39, 39}}, rotation = -90), iconTransformation(origin = {-2, -104}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));

equation
  press_a = max(P_atm, a_batt.p - rho * g * height_port_a);
  press_b = max(P_atm, b_batt.p - rho * g * height_port_b);
// mass balance
  a_batt.w + b_batt.w = 0;
  
  w_max = rho * Cc * Av_max * sqrt(2 * g * dp_max / (rho * g));
  dp_max = abs(press_a - press_b);

  u_w = max(0, min(w_max, x * w_max));
// the pressure difference drives the water flow
  if press_a > press_b then
    a_batt.w = u_w;
// entrante
  else
    b_batt.w = u_w;
// entrante
  end if;
  wmax = w_max;
//o forse mettere il valore dell'altezza come azione di controllo invece che parametro che varia tra 0 e 1;
//Av_eff = r ^ 2 * (pi - acos(u * h_max / r - 1) - 0.5 * sin(2 * acos(u * h_max / r - 1)));
//chiusura a saracinesca
//Av_eff = r ^ 2 * (pi - 2*acos(u/2 * h_max / r - 1) - sin(2 * acos(u/2 * h_max / r - 1))); // ciusura a mezza a luna da sistemare
  annotation(
    Documentation(info = "<html>
<p>
The valve is an automatic swinging light door (porta a luce battente) that allows for tuning the radius of the inlet port (<strong>r</strong>) and the height of the valve (<strong>height_port_a</strong>, <strong>height_port_b</strong>) relative to the bottom of the two fields in which it is inserted.
 The input control action is given as flow rate, then it is considered to have a controller inside with fast dynamics that opens and closes the valve gap, following the flow rate reference. Based on the maximum opening area of the valve port (<strong>A<sub>v</sub></strong>) and the pressure difference between the two parts of the valve, this acts as a maximum flow rate limiter, and it has an output, called <strong>wmax</strong>, that instantly reports the maximum value, use for anti-WindUp. In this way, the flow rate <strong>w</strong> is limited, such that <strong> 0&lt;w&lt;wmax </strong>.
<br>In general, the water flow (<strong>w</strong>) follows the following equation:

 <br> <strong>w = C<sub>c</sub> &#961; A<sub>v</sub> 
 <math xmlns=\"http://www.w3.org/1998/Math/MathML\">
  <msqrt>
    <mn>2gh</mn>
  </msqrt>
</math> </strong></p>
<p>
<img src=\"modelica://Field_Package/images/Cattura2.png\"
    width=\"200\" height=\"160\">
</p>
<p>
where <strong>C<sub>c</sub></strong> is the shrinkage coefficient, <strong>&#961;</strong> is the water density, A<sub>v</sub> is the area of the valve and <strong>h</strong> is the difference between the two water levels
</p>
</html>"),
    Diagram(graphics = {Rectangle(origin = {-4, 5}, lineColor = {188, 188, 188}, fillColor = {157, 157, 157}, fillPattern = FillPattern.VerticalCylinder, extent = {{-18, 67}, {18, -67}}), Rectangle(origin = {-2, -20}, fillColor = {122, 122, 122}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-44, 20}, {44, -20}}), Polygon(origin = {-49, -22}, fillPattern = FillPattern.Solid, points = {{3, 22}, {-5, 30}, {-5, -30}, {5, -16}, {3, -16}, {3, 22}}), Polygon(origin = {45, -20}, rotation = 180, fillPattern = FillPattern.Solid, points = {{3, 22}, {-5, 30}, {-5, -30}, {5, -16}, {3, -16}, {3, 22}}), Text(origin = {-69, 5}, extent = {{-13, 15}, {13, -15}}, textString = "a"), Text(origin = {71, 5}, extent = {{-13, 15}, {13, -15}}, textString = "b")}),
    Icon(graphics = {Text(origin = {-95, 1}, extent = {{-13, 15}, {13, -15}}, textString = "a"), Text(origin = {97, -1}, extent = {{-13, 15}, {13, -15}}, textString = "b"), Rectangle(origin = {0, -11}, lineColor = {188, 188, 188}, fillColor = {26, 26, 26}, fillPattern = FillPattern.VerticalCylinder, extent = {{-22, 83}, {22, -83}}), Polygon(origin = {-61, -44}, fillPattern = FillPattern.Solid, points = {{3, 22}, {-5, 32}, {-5, -40}, {5, -24}, {5, -22}, {3, 22}}), Polygon(origin = {63, -38}, rotation = 180, fillPattern = FillPattern.Solid, points = {{3, 32}, {-5, 42}, {-5, -30}, {5, -16}, {3, -16}, {3, 32}}), Rectangle(origin = {1, -46}, fillColor = {122, 122, 122}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-59, 24}, {59, -24}})}));
end valve_portabattente3;
