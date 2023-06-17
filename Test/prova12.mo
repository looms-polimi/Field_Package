within Field_Package.Test;

model prova12
  parameter String sheetName = "Pr_h" "Excel sheet name" annotation(
    Evaluate = true,
    choices(choice = "set1" "First Excel sheet", choice = "set2" "Second Excel sheet"));
  inner parameter ExternData.XLSXFile dataSource(fileName = Modelica.Utilities.Files.loadResource("modelica://Field_Package/Data_tesi/precipitazioni_7giorni_test1.xlsx")) "XLSX file" annotation(
    Placement(visible = true, transformation(extent = {{-246, 396}, {-226, 416}}, rotation = 0)));
  inner Field_Package.System system annotation(
    Placement(visible = true, transformation(origin = {-190, 403}, extent = {{-12, -11}, {12, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = -100 * 3600, table = dataSource.getRealArray2D("H100", "Foglio1", 120, 2), timeScale = 3600) annotation(
    Placement(visible = true, transformation(origin = {-238, 360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Field_Package.Rain rain annotation(
    Placement(visible = true, transformation(origin = {-190, 358}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable h_veg1(smoothness = Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1, table = [0, 0; 69, 0.4; 92, 0.6; 120, 1.19; 171, 1.2], timeScale = 3600 * 24) annotation(
    Placement(visible = true, transformation(origin = {-238, 322}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable ET(smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, table = dataSource.getRealArray2D("M1", "Foglio1", 4105, 2), timeScale = 3600) annotation(
    Placement(visible = true, transformation(origin = {-238, 282}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Field_Package.H_veg_data h_veg_data annotation(
    Placement(visible = true, transformation(origin = {-192, 320}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  inner Field_Package.ET_data et_data annotation(
    Placement(visible = true, transformation(origin = {-191, 283}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Field_Package.Field.channel channel(C = 0.01,L_ch = 1000, bh = 2, z(fixed = true, start = 1)) annotation(
    Placement(visible = true, transformation(origin = {40, 300}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Field_Package.Valves.valve_portabattente2 valve1(r = 0.22) annotation(
    Placement(visible = true, transformation(origin = {-155, 173}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Field_Package.Valves.valve_portabattente2 valve2(r = 0.22) annotation(
    Placement(visible = true, transformation(origin = {-16, 178}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Field_Package.Valves.valve_portabattente2 valve3(r = 0.22) annotation(
    Placement(visible = true, transformation(origin = {132, 186}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Field_Package.Field.field2_singleport field2(A = 49000, C = 0.01, z(fixed = true, start = 0.05)) annotation(
    Placement(visible = true, transformation(origin = {33, 123}, extent = {{17, -17}, {-17, 17}}, rotation = 0)));
  Field_Package.Field.field2_singleport field3(A = 60000, C = 0.01, z(fixed = true, start = 0.05)) annotation(
    Placement(visible = true, transformation(origin = {177, 131}, extent = {{17, -17}, {-17, 17}}, rotation = 0)));
  Field_Package.Sources.constant_flow_source constant_flow_source annotation(
    Placement(visible = true, transformation(origin = {-30, 306}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = 200) annotation(
    Placement(visible = true, transformation(origin = {-77, 310}, extent = {{-21, -18}, {21, 18}}, rotation = 0)));
  Field_Package.Valves.valve_stramazzo_unidirezionale valve_stramazzo_unidirezionale(L = 1, height_port_a = 1.2, height_port_b = 1, mu = 0.41) annotation(
    Placement(visible = true, transformation(origin = {102, 308}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Field_Package.Sources.fuga fuga annotation(
    Placement(visible = true, transformation(origin = {146, 306}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Field_Package.Field.field2_singleport field1(A = 89000, C = 0.01, z(fixed = true, start = 0.05)) annotation(
    Placement(visible = true, transformation(origin = {-98, 124}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Field_Package.Field.field2_singleport field4(A = 132000, C = 0.01, z(fixed = true, start = 0.05)) annotation(
    Placement(visible = true, transformation(origin = {330, 130}, extent = {{20, -20}, {-20, 20}}, rotation = 0)));
  Field_Package.Valves.valve_portabattente2 valve4(r = 0.22) annotation(
    Placement(visible = true, transformation(origin = {291, 181}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable z_ref(smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = [0, 0.05; 48, 0.05], timeScale = 3600) annotation(
    Placement(visible = true, transformation(origin = {-198, 26}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Field_Package.Regulators.PI_antiWindUp pid(Ti = system.rho / field1.C, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = system.rho * field1.A * 5 / (1 * 3600), yMin = 0) annotation(
    Placement(visible = true, transformation(origin = {-126, 210}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Field_Package.Regulators.PI_antiWindUp pid1(Ti = system.rho / field2.C, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = system.rho * field2.A * 5 / (1 * 3600), yMin = 0) annotation(
    Placement(visible = true, transformation(origin = {24, 206}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Field_Package.Regulators.PI_antiWindUp pid2(Ti = system.rho / field3.C, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = system.rho * field3.A * 5 / (1 * 3600), yMin = 0) annotation(
    Placement(visible = true, transformation(origin = {164, 216}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Field_Package.Regulators.PI_antiWindUp pid3(Ti = system.rho / field4.C, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = system.rho * field4.A * 5 / (1 * 3600), yMin = 0) annotation(
    Placement(visible = true, transformation(origin = {336, 210}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = dataSource.getRealArray2D("H1", "Foglio1", 4105, 2), timeScale = 3600) annotation(
    Placement(visible = true, transformation(origin = {-106, 408}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(combiTimeTable.y[1], rain.R) annotation(
    Line(points = {{-227, 360}, {-217.5, 360}, {-217.5, 361}, {-203, 361}}, color = {0, 0, 127}));
  connect(h_veg1.y[1], h_veg_data.h) annotation(
    Line(points = {{-227, 322}, {-216, 322}, {-216, 323}, {-205, 323}}, color = {0, 0, 127}));
  connect(ET.y[1], et_data.ET) annotation(
    Line(points = {{-227, 282}, {-216.5, 282}, {-216.5, 283}, {-204, 283}}, color = {0, 0, 127}));
  connect(channel.Port, valve1.a_batt) annotation(
    Line(points = {{39, 283}, {39, 246}, {-186, 246}, {-186, 168.25}, {-168, 168.25}, {-168, 167}}));
  connect(channel.Port, valve2.a_batt) annotation(
    Line(points = {{39, 283}, {39, 246}, {-40, 246}, {-40, 169.5}, {-30, 169.5}, {-30, 171}}));
  connect(channel.Port, valve3.a_batt) annotation(
    Line(points = {{39, 283}, {39, 246}, {118, 246}, {118, 179}}));
  connect(field2.Port, valve2.b_batt) annotation(
    Line(points = {{32.32, 105.32}, {32.32, 104.32}, {-2, 104.32}, {-2, 171}}));
  connect(field3.Port, valve3.b_batt) annotation(
    Line(points = {{176.32, 113.32}, {146, 113.32}, {146, 179}}));
  connect(constant_flow_source.a, channel.Port) annotation(
    Line(points = {{-19, 306}, {5.5, 306}, {5.5, 265}, {40.25, 265}, {40.25, 283}, {39, 283}}));
  connect(realExpression3.y, constant_flow_source.k) annotation(
    Line(points = {{-54, 310}, {-50.5, 310}, {-50.5, 315}, {-39, 315}}, color = {0, 0, 127}));
  connect(valve_stramazzo_unidirezionale.a_stram, channel.Port) annotation(
    Line(points = {{85, 308}, {82, 308}, {82, 266}, {39, 266}, {39, 283}}));
  connect(fuga.a, valve_stramazzo_unidirezionale.b_stram) annotation(
    Line(points = {{136, 306}, {128, 306}, {128, 308}, {118, 308}}));
  connect(field1.Port, valve1.b_batt) annotation(
    Line(points = {{-99, 103}, {-135.2, 103}, {-135.2, 167}, {-142, 167}}));
  connect(valve4.b_batt, field4.Port) annotation(
    Line(points = {{306, 174}, {306, 106}, {330, 106}, {330, 110}}));
  connect(channel.Port, valve4.a_batt) annotation(
    Line(points = {{39, 283}, {39, 246}, {268, 246}, {268, 174}, {276, 174}}));
  connect(z_ref.y[1], pid.u_s) annotation(
    Line(points = {{-180, 26}, {-54, 26}, {-54, 210}, {-114, 210}}, color = {0, 0, 127}));
  connect(pid.u, valve1.wmax) annotation(
    Line(points = {{-116, 216}, {-107.6, 216}, {-107.6, 228}, {-171.6, 228}, {-171.6, 161}, {-155, 161}}, color = {0, 0, 127}));
  connect(pid.y, valve1.x) annotation(
    Line(points = {{-137, 210}, {-156, 210}, {-156, 184}}, color = {0, 0, 127}));
  connect(pid.u_m, field1.y) annotation(
    Line(points = {{-126, 198}, {-72, 198}, {-72, 119}, {-77, 119}}, color = {0, 0, 127}));
  connect(pid1.y, valve2.x) annotation(
    Line(points = {{13, 206}, {-17, 206}, {-17, 190}}, color = {0, 0, 127}));
  connect(valve2.wmax, pid1.u) annotation(
    Line(points = {{-16, 165}, {-34, 165}, {-34, 229.84}, {42, 229.84}, {42, 211.84}, {34, 211.84}}, color = {0, 0, 127}));
  connect(pid1.u_m, field2.y) annotation(
    Line(points = {{24, 194}, {50, 194}, {50, 120}}, color = {0, 0, 127}));
  connect(z_ref.y[1], pid1.u_s) annotation(
    Line(points = {{-180, 26}, {68, 26}, {68, 206}, {36, 206}}, color = {0, 0, 127}));
  connect(pid2.y, valve3.x) annotation(
    Line(points = {{153, 216}, {131, 216}, {131, 198}}, color = {0, 0, 127}));
  connect(pid2.u_m, field3.y) annotation(
    Line(points = {{164, 204}, {194, 204}, {194, 128}}, color = {0, 0, 127}));
  connect(pid2.u, valve3.wmax) annotation(
    Line(points = {{174.4, 222}, {184.4, 222}, {184.4, 232}, {112.4, 232}, {112.4, 173}, {132, 173}}, color = {0, 0, 127}));
  connect(z_ref.y[1], pid2.u_s) annotation(
    Line(points = {{-180, 26}, {246, 26}, {246, 216}, {176, 216}}, color = {0, 0, 127}));
  connect(pid3.y, valve4.x) annotation(
    Line(points = {{325, 210}, {290, 210}, {290, 194}}, color = {0, 0, 127}));
  connect(pid3.u, valve4.wmax) annotation(
    Line(points = {{346, 216}, {360, 216}, {360, 232}, {274, 232}, {274, 159}, {282.5, 159}, {282.5, 167}, {291, 167}}, color = {0, 0, 127}));
  connect(pid3.u_m, field4.y) annotation(
    Line(points = {{336, 198}, {352, 198}, {352, 126}}, color = {0, 0, 127}));
  connect(z_ref.y[1], pid3.u_s) annotation(
    Line(points = {{-180, 26}, {390, 26}, {390, 210}, {348, 210}}, color = {0, 0, 127}));
protected
  annotation(
    Documentation(info = "<html>
<p>
Test con <strong> 5 </strong> appezzamenti di cui 1 è collegato con un rialzamento del canale. Irrigati tutti con un riferimento di livello d'acqua ottimale ricavato dalla presentazione. 
Controllori PI con azione anti-windup. 


</p>
</html>"),
    Diagram(coordinateSystem(extent = {{-280, 440}, {620, -20}}), graphics = {Rectangle(origin = {-68, 313}, lineColor = {255, 255, 0}, fillColor = {251, 255, 170}, fillPattern = FillPattern.Solid, extent = {{-66, 35}, {66, -35}}), Text(origin = {-107, 286}, extent = {{-21, 2}, {21, -2}}, textString = "source"), Rectangle(origin = {133, 308}, lineColor = {255, 255, 0}, fillColor = {251, 255, 170}, fillPattern = FillPattern.Solid, extent = {{-59, 36}, {59, -36}}), Rectangle(origin = {-222, 348}, lineColor = {189, 255, 202}, fillColor = {230, 255, 232}, fillPattern = FillPattern.Solid, extent = {{52, 88}, {-52, -88}}), Rectangle(origin = {-200, 24}, lineColor = {255, 158, 158}, fillColor = {255, 219, 221}, fillPattern = FillPattern.Solid, extent = {{-54, 38}, {54, -38}}), Text(origin = {-196, -5}, extent = {{-68, 1}, {68, -1}}, textString = "riferimento livello acqua"), Text(origin = {-8, 420}, extent = {{-134, 6}, {134, -6}}, textString = "timetable di tutta la stagione"), Text(origin = {-8, 420}, extent = {{-134, 6}, {134, -6}}, textString = "timetable di tutta la stagione"), Text(origin = {-336, 364}, extent = {{-134, 6}, {134, -6}}, textString = "timetable di test")}),
    experiment(StartTime = 0, StopTime = 432000, Tolerance = 1e-06, Interval = 180));
end prova12;
