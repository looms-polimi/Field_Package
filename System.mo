within Field_Package;

model System
  //the system variable are the same in every single model
  extends Modelica.Icons.Package;
  //atmospheric pressure
  parameter SI.Pressure Patm = 1.01e5 "atmospheric pressure ";
  //gravity acceleration
  parameter SI.Acceleration g = 9.81 "gravity acceleration";
  //water density
  parameter SI.Density rho = 999.97 "water density Kg/m³";
equation

  annotation(
    defaultComponentName = "system",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "
Your model is using an outer \"system\" component but
an inner \"system\" component is not defined.",
    Icon(graphics = {Text(origin = {-48, 41}, lineColor = {244, 216, 0}, extent = {{-66, 87}, {66, -87}}, textString = "S", textStyle = {TextStyle.Bold})}),
  Documentation(info = "<html><head></head><body><p>
 The 'system' model plays a crucial role by providing a platform to fine-tune global parameters that affect the entire system being modeled.
</p>  
</body></html>"));
end System;
