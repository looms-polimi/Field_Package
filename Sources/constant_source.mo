within Field_Package.Sources;

model constant_source
  parameter Real rho = System.rho;
  parameter Real P_atm = System.Patm;
  parameter Real g = System.g;
  Field_Package.Interfaces.fluxport_a a annotation(
    Placement(visible = true, transformation(origin = {98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 4}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  parameter SI.Height z_source "level of water of the source";
equation
  a.p = z_source * rho * g + P_atm;
  annotation(
    Icon(graphics = {Polygon(origin = {0, -10}, fillColor = {0, 150, 231}, fillPattern = FillPattern.Sphere, points = {{-100, 74}, {-90, 84}, {-78, 88}, {-66, 86}, {-50, 78}, {-28, 74}, {-8, 82}, {6, 86}, {18, 88}, {34, 84}, {46, 78}, {60, 74}, {76, 78}, {88, 84}, {100, 88}, {100, -90}, {-100, -90}, {-100, -88}, {-100, -88}, {-100, 74}})}),
    Documentation(info = "<html><head></head><body><div>This model enables the input of a specific water level and outputs the corresponding pressure exerted by the water on the bottom.</div><!--EndFragment--></body></html>"));
end constant_source;
