within Field_Package;

model Rain
  SI.MassFlowRate RainFlow;
  Modelica.Blocks.Interfaces.RealInput R annotation(
    Placement(visible = true, transformation(origin = {-104, 32}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-84, 16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
 
equation
  RainFlow = R/3600;// divided by 3600 because of hourly time-step data
  annotation(Documentation(info="<html> <p>
   The 'Rain' model takes as input the scheduled value of rain from the CombiTimeTable. It's divided by the 3600 seconds, in order to have the instantaneus value of rain flow rate.
   The rainfall values are propagated to the field models using the inner/outer mechanism.
  
  </p>
   </html>"),
    Placement(visible = true, transformation(origin = {-96, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-88, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)),
    defaultComponentPrefixes = "inner",
    defaultComponentName = "rain",
    Diagram(graphics = {Rectangle(origin = {0, 3}, lineThickness = 1, extent = {{-92, 93}, {92, -93}}), Text(origin = {-29, 71}, lineColor = {0, 27, 181}, extent = {{-53, 25}, {53, -25}}, textString = "Rain flow"), Polygon(origin = {-10, 33}, lineColor = {255, 255, 255}, fillColor = {0, 199, 254}, fillPattern = FillPattern.VerticalCylinder, points = {{-2, 25}, {-16, -19}, {-32, -47}, {-36, -69}, {-18, -93}, {0, -97}, {22, -87}, {34, -59}, {20, -35}, {12, -13}, {-2, 25}, {-2, 25}, {-2, 25}})}),
    Icon(graphics = {Rectangle(origin = {2, 0}, lineThickness = 1, extent = {{-92, 94}, {92, -94}}), Text(origin = {-29, 71}, lineColor = {0, 27, 181}, extent = {{-53, 25}, {53, -25}}, textString = "Rain flow"), Polygon(origin = {2, 29}, lineColor = {255, 255, 255}, fillColor = {0, 199, 254}, fillPattern = FillPattern.VerticalCylinder, points = {{-2, 25}, {-16, -19}, {-30, -49}, {-34, -71}, {-18, -93}, {0, -97}, {22, -87}, {30, -59}, {20, -35}, {10, -15}, {-2, 25}, {-2, 25}, {-2, 25}})}));
end Rain;
