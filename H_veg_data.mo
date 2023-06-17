within Field_Package;

model H_veg_data

 SI.Height H_veg;
  Modelica.Blocks.Interfaces.RealInput h annotation(
    Placement(visible = true, transformation(origin = {-104, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-84, 16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 
equation
  H_veg = h;

  annotation(
    Placement(visible = true, transformation(origin = {-96, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-88, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)),
    defaultComponentPrefixes = "inner",
    defaultComponentName = "h_veg_data",
    Diagram(graphics = {Rectangle(origin = {0, 3}, lineThickness = 1, extent = {{-92, 93}, {92, -93}})}),
    Icon(graphics = {Rectangle(origin = {2, 0}, lineThickness = 1, extent = {{-92, 94}, {92, -94}}), Text(origin = {-12, 59}, extent = {{-66, 35}, {66, -35}}, textString = "height_veg"), Polygon(origin = {17, -22}, lineColor = {0, 170, 0}, fillColor = {71, 212, 5}, fillPattern = FillPattern.CrossDiag, points = {{1, -50}, {1, -12}, {-11, -8}, {-19, 0}, {-21, 12}, {-11, 6}, {-5, -2}, {1, -10}, {-1, 20}, {-11, 32}, {-13, 44}, {-5, 34}, {-1, 20}, {1, 40}, {9, 50}, {9, 38}, {-1, 22}, {-1, -4}, {9, 18}, {21, 24}, {11, 6}, {-1, -4}, {1, -28}, {15, -6}, {21, -2}, {15, -18}, {7, -24}, {1, -28}, {3, -48}, {3, -50}, {1, -50}}), Line(origin = {-15.48, -19.92}, points = {{0, 51}, {0, -51}, {0, -51}}, thickness = 0.5, arrow = {Arrow.Open, Arrow.Open}, arrowSize = 10), Rectangle(origin = {2, -83}, fillColor = {216, 162, 0}, fillPattern = FillPattern.Sphere, extent = {{-90, 9}, {90, -9}})}),
 Documentation);

end H_veg_data;
