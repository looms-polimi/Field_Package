within Field_Package.Interfaces;

connector fluxport
  /////// potential variable /////
  SI.AbsolutePressure p;
  /////// flow variable /////
  flow SI.MassFlowRate w;
  annotation(
    Diagram(graphics = {Ellipse(origin = {2, 10}, fillColor = {1, 1, 166}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-48, 46}, {48, -46}})}),
    Icon(graphics = {Ellipse(origin = {-1, 0}, fillColor = {1, 1, 166}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-45, 56}, {45, -56}})}));
end fluxport;
