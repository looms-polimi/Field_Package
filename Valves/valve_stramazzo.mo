within Field_Package.Valves;

model valve_stramazzo
  outer System system;
  //press atm
  parameter SI.AbsolutePressure P_atm = System.Patm "atmospheric pressure" annotation(
    Dialog(tab = "Assumptions"));
  Field_Package.Interfaces.fluxport_a a_stram annotation(
    Placement(visible = true, transformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Field_Package.Interfaces.fluxport_b b_stram annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real mu = 0.456 "inflow coefficient";
  //larghezza della bocca di afflusso
  parameter SI.Length L = 0.5 "inflow gate width" annotation(
    Dialog(group = "Geometric parameters"));
  //gravity acceleration
  parameter SI.Acceleration g = System.g "gravity acceleration" annotation(
    Dialog(tab = "Assumptions"));
  //densità acqua
  parameter SI.Density rho = System.rho "water density " annotation(
    Dialog(tab = "Assumptions"));
  //altezza rispetto al fondo terreno*
  parameter SI.Height height_port_a = 0.5 "height of 'a' relative to the ground floor" annotation(
    Dialog(group = "Geometric parameters"));
  //altezza rispetto al fondo terreno*
  parameter SI.Height height_port_b = 0.5 "height of 'b' relative to the ground floor" annotation(
    Dialog(group = "Geometric parameters", groupImage = "modelica://Field_Package/images/Stramazzo.jpg"));
   
  SI.AbsolutePressure press_a;
  SI.AbsolutePressure press_b;
equation
//mass balance
  a_stram.w + b_stram.w = 0;
  press_a = max(P_atm, a_stram.p - rho * g * height_port_a);
  press_b = max(P_atm, b_stram.p - rho * g * height_port_b);
//the pressure difference drives the water flow
  if press_a > press_b then
    a_stram.w = rho * mu * L * sqrt(2 * g) * (abs((press_a - press_b)) / (rho * g)) ^ (3 / 2);
  else
    b_stram.w = rho * mu * L * sqrt(2 * g) * (abs((press_b - press_a)) / (rho * g)) ^ (3 / 2);
  end if;
//the pressure difference drives the water flow
//  if a_stram.p > b_stram.p then
//    a_stram.w = rho * mu * L * sqrt(2 * g) * ((a_stram.p - b_stram.p) / (rho * g)) ^ (3 / 2);
//  else
//    b_stram.w = rho * mu * L * sqrt(2 * g) * sqrt((b_stram.p - a_stram.p) / (rho * g)) ^ 3;
//  end if;
  annotation(Documentation(info="<html>
<p>
This valve model behaves as a weir door ('stramazzo'), allowing for the tuning of the width of the inlet opening (<strong>L</strong>) and the height of the threshold (<strong>height_port_a</strong>, <strong>height_port_b</strong>) relative to the bottom of the two fields in which it is inserted. <br>The water flow (<strong>w</strong>) follows this equation: <br> <strong>w = &#956; &#961; L <math xmlns=\"http://www.w3.org/1998/Math/MathML\">
  <msqrt>
    <mn>2g</mn>
  </msqrt>
</math> (h)<sup><sup><math xmlns=\"http://www.w3.org/1998/Math/MathML\">
  <mfrac>
    <mn>3</mn>
    <mn>2</mn>
  </mfrac>
</math></sup></sup> </strong></p>
<p>
<img src=\"modelica://Field_Package/images/Stramazzo.jpg\"
    width=\"200\" height=\"160\">
</p>
<p>
where <strong>&#956;</strong> is the outflow constant, <strong>&#961;</strong> is the water density and <strong>h</strong> is the overhead water level
</p>
</html>"),
    Diagram(graphics = {Polygon(origin = {24, 4}, lineColor = {0, 85, 255}, fillColor = {1, 145, 255}, fillPattern = FillPattern.Solid, points = {{-36, 12}, {-4, 22}, {26, 6}, {36, -10}, {26, -22}, {14, -22}, {0, -12}, {-8, -4}, {-12, -2}, {-36, -2}, {-36, 12}}), Rectangle(origin = {0, -29}, fillColor = {166, 166, 166}, fillPattern = FillPattern.Solid, lineThickness = 1.5, extent = {{-12, 31}, {12, -31}}), Rectangle(origin = {46, -41}, fillColor = {2, 145, 255}, fillPattern = FillPattern.Solid, extent = {{-34, 7}, {34, -7}}), Rectangle(origin = {-46, -22}, lineColor = {0, 85, 255}, fillColor = {5, 135, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-34, 38}, {34, -38}}), Polygon(origin = {42, -1}, lineColor = {255, 255, 255}, fillColor = {1, 162, 249}, fillPattern = FillPattern.Sphere, points = {{-8, 3}, {4, 5}, {8, 1}, {8, -3}, {4, -5}, {0, -3}, {-2, -1}, {-8, 3}, {-8, 3}}), Text(origin = {-86, 41}, extent = {{-14, 15}, {14, -15}}, textString = "a"), Text(origin = {84, 35}, extent = {{-14, 15}, {14, -15}}, textString = "b")}),
    Icon(graphics = {Polygon(origin = {42, -1}, lineColor = {255, 255, 255}, fillColor = {1, 162, 249}, fillPattern = FillPattern.Sphere, points = {{-8, 3}, {4, 5}, {8, 1}, {8, -3}, {4, -5}, {0, -3}, {-2, -1}, {-8, 3}, {-8, 3}}), Polygon(origin = {24, 4}, lineColor = {0, 85, 255}, fillColor = {1, 145, 255}, fillPattern = FillPattern.Solid, points = {{-36, 12}, {-4, 22}, {26, 6}, {36, -10}, {26, -22}, {14, -22}, {0, -12}, {-8, -4}, {-12, -2}, {-36, -2}, {-36, 12}}), Rectangle(origin = {46, -41}, fillColor = {2, 145, 255}, fillPattern = FillPattern.Solid, extent = {{-34, 7}, {34, -7}}), Rectangle(origin = {0, -29}, fillColor = {166, 166, 166}, fillPattern = FillPattern.Solid, lineThickness = 1.5, extent = {{-12, 31}, {12, -31}}), Text(origin = {-88, 43}, extent = {{-14, 15}, {14, -15}}, textString = "a"), Rectangle(origin = {-46, -22}, lineColor = {0, 85, 255}, fillColor = {5, 135, 235}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-34, 38}, {34, -38}}), Text(origin = {77, 39}, extent = {{-19, 17}, {19, -17}}, textString = "b"), Polygon(origin = {42, -1}, lineColor = {255, 255, 255}, fillColor = {1, 162, 249}, fillPattern = FillPattern.Sphere, points = {{-8, 3}, {4, 5}, {8, 1}, {8, -3}, {4, -5}, {0, -3}, {-2, -1}, {-8, 3}, {-8, 3}})}));
end valve_stramazzo;
