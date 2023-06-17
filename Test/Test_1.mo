within Field_Package.Test;

model Test_1
  extends Modelica.Icons.Example;
  parameter String sheetName = "Pr_h" "Excel sheet name" annotation(
    Evaluate = true,
    choices(choice = "set1" "First Excel sheet", choice = "set2" "Second Excel sheet"));
  inner parameter ExternData.XLSXFile dataSource(fileName = Modelica.Utilities.Files.loadResource("modelica://Field_Package/Data/precipitazioni_7giorni_test1.xlsx")) "XLSX file" annotation(
    Placement(visible = true, transformation(extent = {{-266, 388}, {-246, 408}}, rotation = 0)));
  inner Field_Package.System system annotation(
    Placement(visible = true, transformation(origin = {-210, 395}, extent = {{-12, -11}, {12, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(extrapolation = Modelica.Blocks.Types.Extrapolation.HoldLastPoint, smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, startTime = -99 * 3600, table = dataSource.getRealArray2D("H99", "Foglio1", 72, 2), timeScale = 3600) annotation(
    Placement(visible = true, transformation(origin = {-258, 352}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Field_Package.Rain rain annotation(
    Placement(visible = true, transformation(origin = {-210, 350}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable h_veg1(smoothness = Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative1, table = [0, 0; 69, 0.4; 92, 0.6; 120, 1.19; 171, 1.2], timeScale = 3600 * 24) annotation(
    Placement(visible = true, transformation(origin = {-258, 314}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable ET(smoothness = Modelica.Blocks.Types.Smoothness.LinearSegments, startTime = -99 * 3600, table = dataSource.getRealArray2D("M99", "Foglio1", 72, 2), timeScale = 3600) annotation(
    Placement(visible = true, transformation(origin = {-260, 274}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Field_Package.H_veg_data h_veg_data annotation(
    Placement(visible = true, transformation(origin = {-212, 312}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  inner Field_Package.ET_data et_data annotation(
    Placement(visible = true, transformation(origin = {-213, 275}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Field_Package.Field.channel channel(C = 0.01, L_ch = 1000, bh = 2, z(fixed = true, start = 1.2)) annotation(
    Placement(visible = true, transformation(origin = {38, 302}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Field_Package.Field.field2_singleport field2(A = 49000, C = 0.01, z(fixed = true, start = 0.05)) annotation(
    Placement(visible = true, transformation(origin = {44, 136}, extent = {{28, -28}, {-28, 28}}, rotation = 0)));
  Field_Package.Field.field2_singleport field3(A = 60000, C = 0.01, z(fixed = true, start = 0.05)) annotation(
    Placement(visible = true, transformation(origin = {186, 138}, extent = {{28, -28}, {-28, 28}}, rotation = 0)));
  Field_Package.Sources.constant_flow_source constant_flow_source annotation(
    Placement(visible = true, transformation(origin = {-30, 306}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = 200) annotation(
    Placement(visible = true, transformation(origin = {-83, 314}, extent = {{-21, -18}, {21, 18}}, rotation = 0)));
  Field_Package.Sources.fuga fuga annotation(
    Placement(visible = true, transformation(origin = {144, 306}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Field_Package.Field.field2_singleport field1(A = 89000, C = 0.01, z(fixed = true, start = 0.05)) annotation(
    Placement(visible = true, transformation(origin = {-89, 133}, extent = {{25, -25}, {-25, 25}}, rotation = 0)));
  Field_Package.Field.field2_singleport field4(A = 132000, C = 0.01, z(fixed = true, start = 0.05)) annotation(
    Placement(visible = true, transformation(origin = {332, 138}, extent = {{30, -30}, {-30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.CombiTimeTable z_ref(smoothness = Modelica.Blocks.Types.Smoothness.ConstantSegments, table = [0, 0.05; 48, 0.05; 50, 0.05], timeScale = 3600) annotation(
    Placement(visible = true, transformation(origin = {-198, 30}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
  Field_Package.Valves.valve_portabattente3 valve_1(r = 0.22) annotation(
    Placement(visible = true, transformation(origin = {-158, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PI1(Ti = 9.78e+04, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1.2322e+06 / (10 *3600), yMax = 1, yMin = 0, y_start = 0.12) annotation(
    Placement(visible = true, transformation(origin = {-64, 222}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PI2(Ti = 9.78e+04, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 6.7843e+05 / (10 *3600), yMax = 1, yMin = 0, y_start = 0.066) annotation(
    Placement(visible = true, transformation(origin = {38, 220}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Field_Package.Valves.valve_portabattente3 valve_2(r = 0.22) annotation(
    Placement(visible = true, transformation(origin = {-6, 166}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Field_Package.Valves.valve_portabattente3 valve_3(r = 0.22) annotation(
    Placement(visible = true, transformation(origin = {128, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PI3(Ti = 9.78e+04, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 8.3073e+05 / (10 *3600), yMax = 1, yMin = 0, y_start = 0.081) annotation(
    Placement(visible = true, transformation(origin = {164, 216}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Field_Package.Valves.valve_portabattente3 valve_4(r = 0.22) annotation(
    Placement(visible = true, transformation(origin = {266, 176}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PI4(Ti = 9.78e+04, controllerType = Modelica.Blocks.Types.SimpleController.PI, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 1.8276e+06 / (10 *3600), yMax = 1, yMin = 0, y_start = 0.178) annotation(
    Placement(visible = true, transformation(origin = {352, 220}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Field_Package.Valves.valve_stramazzo valve_stramazzo(L = 1, height_port_a = 1.2, height_port_b = 1.2, mu = 0.41)  annotation(
    Placement(visible = true, transformation(origin = {101, 307}, extent = {{-21, -21}, {21, 21}}, rotation = 0)));
equation
  connect(combiTimeTable.y[1], rain.R) annotation(
    Line(points = {{-247, 352}, {-237.5, 352}, {-237.5, 353}, {-223, 353}}, color = {0, 0, 127}));
  connect(h_veg1.y[1], h_veg_data.h) annotation(
    Line(points = {{-247, 314}, {-236, 314}, {-236, 315}, {-225, 315}}, color = {0, 0, 127}));
  connect(ET.y[1], et_data.ET) annotation(
    Line(points = {{-249, 274}, {-236.5, 274}, {-236.5, 275}, {-226, 275}}, color = {0, 0, 127}));
  connect(constant_flow_source.a, channel.Port) annotation(
    Line(points = {{-19, 306}, {5.5, 306}, {5.5, 265}, {40.25, 265}, {40.25, 285}, {37, 285}}));
  connect(realExpression3.y, constant_flow_source.k) annotation(
    Line(points = {{-60, 314}, {-50.5, 314}, {-50.5, 315}, {-39, 315}}, color = {0, 0, 127}));
  connect(valve_1.b_batt, field1.Port) annotation(
    Line(points = {{-148, 166}, {-122, 166}, {-122, 100}, {-90, 100}, {-90, 107}}));
  connect(valve_1.a_batt, channel.Port) annotation(
    Line(points = {{-168, 166}, {-180, 166}, {-180, 246}, {37, 246}, {37, 285}}));
  connect(PI1.y, valve_1.x) annotation(
    Line(points = {{-75, 222}, {-158, 222}, {-158, 178}}, color = {0, 0, 127}));
  connect(z_ref.y[1], PI1.u_s) annotation(
    Line(points = {{-180, 30}, {-28, 30}, {-28, 146}, {-52, 146}, {-52, 222}}, color = {0, 0, 127}));
  connect(field1.y, PI1.u_m) annotation(
    Line(points = {{-63, 127}, {-64, 127}, {-64, 210}}, color = {0, 0, 127}));
  connect(valve_2.a_batt, channel.Port) annotation(
    Line(points = {{-16, 161}, {-32, 161}, {-32, 246}, {37, 246}, {37, 285}}));
  connect(valve_2.b_batt, field2.Port) annotation(
    Line(points = {{4, 161}, {10, 161}, {10, 102}, {43, 102}, {43, 107}}));
  connect(PI2.y, valve_2.x) annotation(
    Line(points = {{27, 220}, {-6, 220}, {-6, 175}}, color = {0, 0, 127}));
  connect(PI2.u_s, z_ref.y[1]) annotation(
    Line(points = {{50, 220}, {94, 220}, {94, 30}, {-180, 30}}, color = {0, 0, 127}));
  connect(valve_3.a_batt, channel.Port) annotation(
    Line(points = {{118, 166}, {114, 166}, {114, 246}, {37, 246}, {37, 285}}));
  connect(valve_3.b_batt, field3.Port) annotation(
    Line(points = {{138, 166}, {154, 166}, {154, 110}, {185, 110}, {185, 109}}));
  connect(PI3.y, valve_3.x) annotation(
    Line(points = {{153, 216}, {128, 216}, {128, 178}}, color = {0, 0, 127}));
  connect(PI3.u_m, field3.y) annotation(
    Line(points = {{164, 204}, {215, 204}, {215, 132}}, color = {0, 0, 127}));
  connect(PI3.u_s, z_ref.y[1]) annotation(
    Line(points = {{176, 216}, {234, 216}, {234, 30}, {-180, 30}}, color = {0, 0, 127}));
  connect(valve_4.a_batt, channel.Port) annotation(
    Line(points = {{256, 172}, {244, 172}, {244, 246}, {37, 246}, {37, 285}}));
  connect(PI4.y, valve_4.x) annotation(
    Line(points = {{341, 220}, {266, 220}, {266, 184}}, color = {0, 0, 127}));
  connect(PI4.u_s, z_ref.y[1]) annotation(
    Line(points = {{364, 220}, {390, 220}, {390, 30}, {-180, 30}}, color = {0, 0, 127}));
  connect(field2.y, PI2.u_m) annotation(
    Line(points = {{74, 130}, {84, 130}, {84, 196}, {38, 196}, {38, 208}}, color = {0, 0, 127}));
  connect(field4.y, PI4.u_m) annotation(
    Line(points = {{364, 132}, {372, 132}, {372, 192}, {352, 192}, {352, 208}}, color = {0, 0, 127}));
  connect(valve_4.b_batt, field4.Port) annotation(
    Line(points = {{276, 172}, {286, 172}, {286, 102}, {330, 102}, {330, 106}}));
  connect(valve_stramazzo.b_stram, fuga.a) annotation(
    Line(points = {{120, 307}, {128, 307}, {128, 306}, {134, 306}}));
  connect(valve_stramazzo.a_stram, channel.Port) annotation(
    Line(points = {{81, 307}, {74, 307}, {74, 266}, {38, 266}, {38, 284}}));
protected
  annotation(
    Documentation(info = "<html><head></head><body><p>
Test example in which there are four paddy chambers irrigated by an irrigation canal that connects them through 4 swing gates. The behavior of the system in the case of precipitation can be seen in the test, where the gates are controlled by PI controllers with antiwind-up action.


</p>
</body></html>"),
    Diagram(coordinateSystem(extent = {{-300, 440}, {400, -20}}), graphics = {Rectangle(origin = {-72, 305}, lineColor = {255, 255, 0}, fillColor = {251, 255, 170}, fillPattern = FillPattern.Solid, extent = {{-66, 35}, {66, -35}}), Rectangle(origin = {139, 304}, lineColor = {255, 255, 0}, fillColor = {251, 255, 170}, fillPattern = FillPattern.Solid, extent = {{-61, 38}, {61, -38}}), Rectangle(origin = {-241, 338}, lineColor = {189, 255, 202}, fillColor = {230, 255, 232}, fillPattern = FillPattern.Solid, extent = {{51, 90}, {-51, -90}}), Rectangle(origin = {-177, 29}, lineColor = {255, 158, 158}, fillColor = {255, 219, 221}, fillPattern = FillPattern.Solid, extent = {{-107, 49}, {107, -49}}), Text(origin = {159, 277}, extent = {{-53, 1}, {53, -1}}, textString = "Overflow", textStyle = {TextStyle.Bold}), Text(origin = {-75, 288}, extent = {{-53, 1}, {53, -1}}, textString = "Inflow Rate", textStyle = {TextStyle.Bold}), Text(origin = {-175, -8}, extent = {{-119, 1}, {119, -1}}, textString = "Target Pounding Water Level", textStyle = {TextStyle.Bold})}),
    experiment(StartTime = 0, StopTime = 172800, Tolerance = 1e-06, Interval = 180));
end Test_1;
