within Field_Package.Regulators;

block PI_antiWindUp
  "P, PI, PD, and PID controller with limited output, anti-windup compensation, setpoint weighting and optional feed-forward"
  import Modelica.Blocks.Types.Init;
  import Modelica.Blocks.Types.SimpleController;
  extends Modelica.Blocks.Interfaces.SVcontrol;
  output Real controlError = u_s - u_m
    "Control error (set point - measurement)";
  
 
 
  parameter .Modelica.Blocks.Types.SimpleController controllerType=
         .Modelica.Blocks.Types.SimpleController.PID "Type of controller";
  parameter Real k(min=0, unit="1") = 1 "Gain of controller";
  parameter SI.Time Ti(min=Modelica.Constants.small)=0.5
    "Time constant of Integrator block" annotation (Dialog(enable=
          controllerType == .Modelica.Blocks.Types.SimpleController.PI or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter SI.Time Td(min=0)=0.1
    "Time constant of Derivative block" annotation (Dialog(enable=
          controllerType == .Modelica.Blocks.Types.SimpleController.PD or
          controllerType == .Modelica.Blocks.Types.SimpleController.PID));
  parameter Real yMax(start=1) "Upper limit of output";
  parameter Real yMin=-yMax "Lower limit of output";
  parameter Real wp(min=0) = 1
    "Set-point weight for Proportional block (0..1)";
  parameter Real wd(min=0) = 0 "Set-point weight for Derivative block (0..1)"
     annotation(Dialog(enable=controllerType==.Modelica.Blocks.Types.SimpleController.PD or
                                controllerType==.Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Ni(min=100*Modelica.Constants.eps) = 0.9
    "Ni*Ti is time constant of anti-windup compensation"
     annotation(Dialog(enable=controllerType==.Modelica.Blocks.Types.SimpleController.PI or
                              controllerType==.Modelica.Blocks.Types.SimpleController.PID));
  parameter Real Nd(min=100*Modelica.Constants.eps) = 10
    "The higher Nd, the more ideal the derivative block"
     annotation(Dialog(enable=controllerType==.Modelica.Blocks.Types.SimpleController.PD or
                                controllerType==.Modelica.Blocks.Types.SimpleController.PID));
  parameter Boolean withFeedForward=false "Use feed-forward input?"
    annotation(Evaluate=true, choices(checkBox=true));
  parameter Real kFF=1 "Gain of feed-forward input"
    annotation(Dialog(enable=withFeedForward));
  parameter Init initType = Init.InitialState
    "Type of initialization (1: no init, 2: steady state, 3: initial state, 4: initial output)"
    annotation(Evaluate=true, Dialog(group="Initialization"));
  parameter Real xi_start=0
    "Initial or guess value for integrator output (= integrator state)"
    annotation (Dialog(group="Initialization",
                enable=controllerType==.Modelica.Blocks.Types.SimpleController.PI or
                       controllerType==.Modelica.Blocks.Types.SimpleController.PID));
  parameter Real xd_start=0
    "Initial or guess value for state of derivative block"
    annotation (Dialog(group="Initialization",
                         enable=controllerType==.Modelica.Blocks.Types.SimpleController.PD or
                                controllerType==.Modelica.Blocks.Types.SimpleController.PID));
  parameter Real y_start=0 "Initial value of output"
    annotation(Dialog(enable=initType == Init.InitialOutput, group=
          "Initialization"));
  parameter Modelica.Blocks.Types.LimiterHomotopy homotopyType = Modelica.Blocks.Types.LimiterHomotopy.Linear
    "Simplified model for homotopy-based initialization" annotation (Evaluate=true, Dialog(group="Initialization"));
  parameter Boolean strict=false "= true, if strict limits with noEvent(..)"
    annotation (Evaluate=true, choices(checkBox=true), Dialog(tab="Advanced"));
  constant SI.Time unitTime=1 annotation (HideResult=true);
  Modelica.Blocks.Math.Add addP(k1=wp, k2=-1)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Math.Gain P(k=1)
    annotation (Placement(transformation(extent={{-50,40},{-30,60}})));
  Modelica.Blocks.Continuous.Integrator I(
    k=unitTime/Ti,
    y_start=xi_start,
    initType=if initType == Init.SteadyState then Init.SteadyState else if
        initType == Init.InitialState
         then Init.InitialState else Init.NoInit) if with_I
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
  Modelica.Blocks.Math.Gain gainPID(k=k)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Add3 addPID
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Math.Add3 addI(k2=-1) if with_I
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Math.Add addSat(k1=+1, k2=-1) if with_I annotation (Placement(
        transformation(
        origin={80,-50},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.Blocks.Math.Gain gainTrack(k=1/(k*Ni)) if with_I
    annotation (Placement(transformation(extent={{0,-80},{-20,-60}})));
  Modelica.Blocks.Sources.Constant Izero(k=0) if not with_I
    annotation (Placement(transformation(extent={{0,-55},{-10,-45}})));
  Modelica.Blocks.Sources.Constant const(k = 0) annotation(
    Placement(visible = true, transformation(extent = {{-38, -5}, {-28, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter annotation(
    Placement(visible = true, transformation(origin = {72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(
    Placement(visible = true, transformation(origin = {-110, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-104, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 0) annotation(
    Placement(visible = true, transformation(extent = {{18, -43}, {28, -33}}, rotation = 0)));
protected
  parameter Boolean with_I = controllerType==SimpleController.PI or
                             controllerType==SimpleController.PID annotation(Evaluate=true, HideResult=true);
  parameter Boolean with_D = controllerType==SimpleController.PD or
                             controllerType==SimpleController.PID annotation(Evaluate=true, HideResult=true);
initial equation
  if initType==Init.InitialOutput then
    gainPID.y = y_start;
  end if;
equation
 
  if initType == Init.InitialOutput and (y_start < yMin or y_start > yMax) then
    Modelica.Utilities.Streams.error("LimPID: Start value y_start (=" + String(y_start) + ") is outside of the limits of yMin (=" + String(yMin) + ") and yMax (=" + String(yMax) + ")");
  end if;
  connect(u_s, addP.u1) annotation(
    Line(points = {{-120, 0}, {-96, 0}, {-96, 56}, {-82, 56}}, color = {0, 0, 127}));
  connect(u_s, addI.u1) annotation(
    Line(points = {{-120, 0}, {-96, 0}, {-96, -42}, {-82, -42}}, color = {0, 0, 127}));
  connect(addP.y, P.u) annotation(
    Line(points = {{-59, 50}, {-52, 50}}, color = {0, 0, 127}));
  connect(addI.y, I.u) annotation(
    Line(points = {{-59, -50}, {-52, -50}}, color = {0, 0, 127}));
  connect(P.y, addPID.u1) annotation(
    Line(points = {{-29, 50}, {-20, 50}, {-20, 8}, {-12, 8}}, color = {0, 0, 127}));
  connect(I.y, addPID.u3) annotation(
    Line(points = {{-29, -50}, {-20, -50}, {-20, -8}, {-12, -8}}, color = {0, 0, 127}));
  connect(addSat.y, gainTrack.u) annotation(
    Line(points = {{80, -61}, {80, -70}, {2, -70}}, color = {0, 0, 127}));
  connect(gainTrack.y, addI.u3) annotation(
    Line(points = {{-21, -70}, {-88, -70}, {-88, -58}, {-82, -58}}, color = {0, 0, 127}));
  connect(u_m, addP.u2) annotation(
    Line(points = {{0, -120}, {0, -92}, {-92, -92}, {-92, 44}, {-82, 44}}, color = {0, 0, 127}));
  connect(u_m, addI.u2) annotation(
    Line(points = {{0, -120}, {0, -92}, {-92, -92}, {-92, -50}, {-82, -50}}, color = {0, 0, 127}));
  connect(Izero.y, addPID.u3) annotation(
    Line(points = {{-10.5, -50}, {-20, -50}, {-20, -8}, {-12, -8}}, color = {0, 0, 127}));
  connect(addPID.y, gainPID.u) annotation(
    Line(points = {{11, 0}, {18, 0}}, color = {0, 0, 127}));
  connect(const.y, addPID.u2) annotation(
    Line(points = {{-27.5, 0}, {-12, 0}}, color = {0, 0, 127}));
  connect(gainPID.y, addSat.u2) annotation(
    Line(points = {{42, 0}, {50, 0}, {50, -30}, {74, -30}, {74, -38}}, color = {0, 0, 127}));
  connect(gainPID.y, variableLimiter.u) annotation(
    Line(points = {{42, 0}, {60, 0}}, color = {0, 0, 127}));
  connect(variableLimiter.y, y) annotation(
    Line(points = {{84, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(variableLimiter.y, addSat.u1) annotation(
    Line(points = {{84, 0}, {88, 0}, {88, -38}, {86, -38}}, color = {0, 0, 127}));
  connect(u, variableLimiter.limit1) annotation(
    Line(points = {{-110, 80}, {50, 80}, {50, 8}, {60, 8}}, color = {0, 0, 127}));
  connect(const1.y, variableLimiter.limit2) annotation(
    Line(points = {{28.5, -38}, {60, -38}, {60, -8}}, color = {0, 0, 127}));
  annotation (defaultComponentName="PID",
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}}), graphics={
        Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
        Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{-80, 90}, {-88, 68}, {-72, 68}, {-80, 90}}),
        Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
        Polygon(lineColor = {192, 192, 192}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid, points = {{90, -80}, {68, -72}, {68, -88}, {90, -80}}),
        Line(points={{-80,-80},{-80,-20},{30,60},{80,60}}, color={0,0,127}),
        Text(lineColor = {192, 192, 192}, extent = {{-20, -20}, {80, -60}}, textString = "%controllerType"),
        Line(visible = false, points = {{30, 60}, {81, 60}}, color = {255, 0, 0}), Text(origin = {-116, 98}, extent = {{-28, 18}, {28, -18}}, textString = "limit1"), Text(origin = {-112, -35}, extent = {{-26, 17}, {26, -17}}, textString = "u_ref"), Text(origin = {41, -120}, extent = {{-39, 16}, {39, -16}}, textString = "fb")}),
    Diagram,
    Documentation(info="<html>
<p>
Via parameter <strong>controllerType</strong> either <strong>P</strong>, <strong>PI</strong>, <strong>PD</strong>,
or <strong>PID</strong> can be selected. If, e.g., PI is selected, all components belonging to the
D-part are removed from the block (via conditional declarations).
The example model
<a href=\"modelica://Modelica.Blocks.Examples.PID_Controller\">Modelica.Blocks.Examples.PID_Controller</a>
demonstrates the usage of this controller.
Several practical aspects of PID controller design are incorporated
according to chapter 3 of the book:
</p>

<dl>
<dt>&Aring;str&ouml;m K.J., and H&auml;gglund T.:</dt>
<dd> <strong>PID Controllers: Theory, Design, and Tuning</strong>.
   Instrument Society of America, 2nd edition, 1995.
</dd>
</dl>

<p>
Besides the additive <strong>proportional, integral</strong> and <strong>derivative</strong>
part of this controller, the following features are present:
</p>
<ul>
<li> The output of this controller is limited. If the controller is
   in its limits, anti-windup compensation is activated to drive
   the integrator state to zero.</li>
<li> The high-frequency gain of the derivative part is limited
   to avoid excessive amplification of measurement noise.</li>
<li> Setpoint weighting is present, which allows to weight
   the setpoint in the proportional and the derivative part
   independently from the measurement. The controller will respond
   to load disturbances and measurement noise independently of this setting
   (parameters wp, wd). However, setpoint changes will depend on this
   setting. For example, it is useful to set the setpoint weight wd
   for the derivative part to zero, if steps may occur in the
   setpoint signal.</li>
<li> Optional feed-forward. It is possible to add a feed-forward signal.
   The feed-forward signal is added before limitation.</li>
</ul>

<p>
The parameters of the controller can be manually adjusted by performing
simulations of the closed loop system (= controller + plant connected
together) and using the following strategy:
</p>

<ol>
<li> Set very large limits, e.g., yMax = Modelica.Constants.inf</li>
<li> Select a <strong>P</strong>-controller and manually enlarge parameter <strong>k</strong>
   (the total gain of the controller) until the closed-loop response
   cannot be improved any more.</li>
<li> Select a <strong>PI</strong>-controller and manually adjust parameters
   <strong>k</strong> and <strong>Ti</strong> (the time constant of the integrator).
   The first value of Ti can be selected, such that it is in the
   order of the time constant of the oscillations occurring with
   the P-controller. If, e.g., vibrations in the order of T=10 ms
   occur in the previous step, start with Ti=0.01 s.</li>
<li> If you want to make the reaction of the control loop faster
   (but probably less robust against disturbances and measurement noise)
   select a <strong>PID</strong>-Controller and manually adjust parameters
   <strong>k</strong>, <strong>Ti</strong>, <strong>Td</strong> (time constant of derivative block).</li>
<li> Set the limits yMax and yMin according to your specification.</li>
<li> Perform simulations such that the output of the PID controller
   goes in its limits. Tune <strong>Ni</strong> (Ni*Ti is the time constant of
   the anti-windup compensation) such that the input to the limiter
   block (= limiter.u) goes quickly enough back to its limits.
   If Ni is decreased, this happens faster. If Ni=infinity, the
   anti-windup compensation is switched off and the controller works bad.</li>
</ol>

<p>
<strong>Initialization</strong>
</p>

<p>
This block can be initialized in different
ways controlled by parameter <strong>initType</strong>. The possible
values of initType are defined in
<a href=\"modelica://Modelica.Blocks.Types.Init\">Modelica.Blocks.Types.Init</a>.
</p>

<p>
Based on the setting of initType, the integrator (I) and derivative (D)
blocks inside the PID controller are initialized according to the following table:
</p>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"2\">
<tr><td><strong>initType</strong></td>
    <td><strong>I.initType</strong></td>
    <td><strong>D.initType</strong></td></tr>

<tr><td><strong>NoInit</strong></td>
    <td>NoInit</td>
    <td>NoInit</td></tr>

<tr><td><strong>SteadyState</strong></td>
    <td>SteadyState</td>
    <td>SteadyState</td></tr>

<tr><td><strong>InitialState</strong></td>
    <td>InitialState</td>
    <td>InitialState</td></tr>

<tr><td><strong>InitialOutput</strong><br>
        and initial equation: y = y_start</td>
    <td>NoInit</td>
    <td>SteadyState</td></tr>
</table>

<p>
In many cases, the most useful initial condition is
<strong>SteadyState</strong> because initial transients are then no longer
present. If initType = Init.SteadyState, then in some
cases difficulties might occur. The reason is the
equation of the integrator:
</p>

<blockquote><pre>
<strong>der</strong>(y) = k*u;
</pre></blockquote>

<p>
The steady state equation \"der(x)=0\" leads to the condition that the input u to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <strong>singular</strong>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is natural to
initialize it with zero. As sketched this is, however, not possible.
The solution is to not initialize u_m or the variable that is used
to compute u_m by an algebraic equation.
</p>

<p>
When initializing in steady-state, homotopy-based initialization can help the convergence of the solver,
by using a simplified model a the beginning of the solution process. Different options are available.
</p>

<ul>
<li><strong>homotopyType=Linear</strong> (default): the limitations are removed from the simplified model,
making it linear. Use this if you know that the controller will not be saturated at steady state.</li>
<li><strong>homotopyType=UpperLimit</strong>: if it is known a priori the controller will be stuck at the upper
limit yMax, this option assumes y = yMax as a simplified model.</li>
<li><strong>homotopyType=LowerLimit</strong>: if it is known a priori the controller will be stuck at the lower
limit yMin, this option assumes y = yMin as a simplified model.</li>
<li><strong>homotopyType=NoHomotopy</strong>: this option does not apply any simplification and keeps the
limiter active throughout the homotopy transformation. Use this if it is unknown whether the controller
is saturated or not at initialization and if the limitations on the output must be enforced throughout
the entire homotopy transformation.</li>
</ul>
</html>"));


end PI_antiWindUp;
