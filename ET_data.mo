within Field_Package;

model ET_data
  SI.MassFlowRate ET_Flow;
  Modelica.Blocks.Interfaces.RealInput ET annotation(
    Placement(visible = true, transformation(origin = {-104, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-86, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 
equation
  ET_Flow = ET/3600;
// divided by 3600 because of hourly time-step data
  annotation(
    Placement(visible = true, transformation(origin = {-96, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-88, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)),
    defaultComponentPrefixes = "inner",
    defaultComponentName = "et_data",
    Diagram(graphics = {Rectangle(origin = {0, 3}, lineThickness = 1, extent = {{-92, 93}, {92, -93}})}),
    Icon(graphics = {Rectangle( lineThickness = 1, extent = {{-94, 94}, {94, -94}}), Text(origin = {4, 68}, lineColor = {0, 27, 181}, extent = {{-88, 52}, {88, -52}}, textString = "Evapotranspiration"), Polygon(origin = {-34, -12}, lineColor = {219, 255, 252}, fillColor = {0, 220, 236}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -12}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -12}}), Polygon(origin = {38, -40}, lineColor = {219, 255, 252}, fillColor = {0, 220, 236}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -12}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -12}}), Polygon(origin = {80, -40}, lineColor = {219, 255, 252}, fillColor = {0, 220, 236}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -12}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -12}}), Polygon(origin = {-10, 18}, lineColor = {219, 255, 252}, fillColor = {0, 193, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -16}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -16}}), Polygon(origin = {38, 18}, lineColor = {219, 255, 252}, fillColor = {0, 220, 236}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -18}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -18}}), Polygon(origin = {78, 18}, lineColor = {219, 255, 252}, fillColor = {0, 220, 236}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -12}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -12}}), Polygon(origin = {-34, -62}, lineColor = {219, 255, 252}, fillColor = {0, 220, 236}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -12}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -12}}), Polygon(origin = {14, -62}, lineColor = {219, 255, 252}, fillColor = {0, 220, 236}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -12}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -12}}), Rectangle(origin = {0, -83}, lineColor = {27, 12, 112}, fillColor = {0, 129, 227}, fillPattern = FillPattern.Sphere, extent = {{-92, 9}, {92, -9}}), Polygon(origin = {14, -10}, lineColor = {219, 255, 252}, fillColor = {0, 193, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -16}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -16}}), Polygon(origin = {60, -10}, lineColor = {219, 255, 252}, fillColor = {0, 193, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -16}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -16}}), Polygon(origin = {-10, -32}, lineColor = {219, 255, 252}, fillColor = {0, 193, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -16}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -16}}), Polygon(origin = {-62, -32}, lineColor = {219, 255, 252}, fillColor = {0, 193, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -16}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -16}}), Polygon(origin = {-56, 20}, lineColor = {219, 255, 252}, fillColor = {0, 193, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -16}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -16}}), Polygon(origin = {56, -56}, lineColor = {219, 255, 252}, fillColor = {0, 193, 207}, fillPattern = FillPattern.VerticalCylinder, points = {{0, -16}, {-2, -4}, {-4, 0}, {-6, 4}, {-6, 8}, {-2, 12}, {0, 12}, {2, 12}, {4, 10}, {6, 8}, {6, 4}, {2, -4}, {0, -12}, {0, -16}}), Line(origin = {4.54, -13.92}, points = {{0, -31}, {0, 37}, {0, 39}}, color = {255, 0, 0}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}, arrowSize = 10)}),
 experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));

end ET_data;
