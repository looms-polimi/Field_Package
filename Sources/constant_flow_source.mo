within Field_Package.Sources;

model constant_flow_source
  parameter Real rho = System.rho;
  parameter Real P_atm = System.Patm;
  parameter Real g = System.g;
 Field_Package.Interfaces.fluxport_a a annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, -4}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
 
  Modelica.Blocks.Interfaces.RealInput k "forced water flow" annotation(
    Placement(visible = true, transformation(origin = {-102, 88}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-92, 90}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  a.w = -k;
  annotation(
    Icon(graphics = {Polygon(origin = {0, -10}, fillColor = {0, 150, 231}, fillPattern = FillPattern.Sphere, points = {{-100, 74}, {-90, 84}, {-78, 88}, {-66, 86}, {-50, 78}, {-28, 74}, {-8, 82}, {6, 86}, {18, 88}, {34, 84}, {46, 78}, {60, 74}, {76, 78}, {88, 84}, {100, 88}, {100, -90}, {-100, -90}, {-100, -88}, {-100, -88}, {-100, 74}}), Line(origin = {6.14, -44.66}, points = {{-56.8536, 4}, {33.1464, 4}, {33.1464, 24}, {57.1464, 1.77636e-15}, {35.1464, -22}, {33.1464, -24}, {33.1464, -8}, {33.1464, -6}, {-56.8536, -6}, {-56.8536, 4}, {-56.8536, 4}}, color = {170, 255, 255}, arrowSize = 17)}),
    Documentation(info = "<html><head></head><body><div style=\"orphans: 2; widows: 2;\">This model allows the input of a numeric value representing the water flow, and through the fluxport connector, it outputs the value of the water flow.</div></body></html>"));
end constant_flow_source;
