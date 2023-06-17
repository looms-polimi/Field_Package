within Field_Package.field_element;

model field2_singleport
  //press atm
  parameter SI.AbsolutePressure Patm = System.Patm "atmospheric pressure" annotation(
    Dialog(tab = "Assumptions"));
  //gravity acceleration
  parameter SI.Acceleration g = System.g "gravity acceleration" annotation(
    Dialog(tab = "Assumptions"));
  //water density
  parameter SI.Density rho = System.rho "water density " annotation(
    Dialog(tab = "Assumptions"));
  //area della sezione di campo
  parameter SI.Area A = 40 "area della sezione di campo";
  // livello acqua iniziale
  parameter SI.Height z_start = 0.1 "livello acqua iniziale ";
  //altezza livello d'acqua
  SI.Height z(start = z_start);
  //pressione sul fondo del campo
  SI.AbsolutePressure p_bottom;
  parameter Real C = 0.0446 "costante di percolazione";
  //outer prova_modello_campo.Rain rain;
  fluxport_a Port annotation(
    Placement(visible = true, transformation(origin = {0, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  p_bottom = Port.p;
  p_bottom = Patm + rho * g * z;
  
  rho * A * der(z) = Port.w;
// - C * z; percolazione
// manca contributo precipitazione ed evapotrastpirazione
  annotation(
    Icon(graphics = {Rectangle(origin = {5, -18}, fillColor = {193, 135, 0}, fillPattern = FillPattern.Solid, extent = {{-65, 30}, {65, -30}}), Rectangle(origin = {5, 11}, fillColor = {107, 207, 0}, fillPattern = FillPattern.Solid, extent = {{-65, 59}, {65, -59}})}),
    Diagram(graphics = {Rectangle(origin = {3, -16}, fillColor = {193, 135, 0}, fillPattern = FillPattern.Solid, extent = {{-65, 30}, {65, -30}}), Rectangle(origin = {4, 13}, fillColor = {107, 207, 0}, fillPattern = FillPattern.Solid, extent = {{-66, 59}, {66, -59}})}));
end field2_singleport;
