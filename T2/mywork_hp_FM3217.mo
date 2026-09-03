within ;
package mywork_hp_FM3217
  package T1_hp
    model SimplePendulumT1 "model of a simple pendulum"

      import    Modelica.Units.SI "named import to allow compact names";
      constant SI.Acceleration g = 9.81 "gravitational constant";
      parameter SI.Length L=1 "length of the pendulum";
      // Now come the variables
      SI.Angle Theta(start=0.1, fixed=true) "displacement angle";
      SI.AngularVelocity ThetaDot "displacement velocity";

    equation
      ThetaDot = der(Theta) "equation to allow second derivative";
      der(ThetaDot) = -g/L*sin(Theta);

    end SimplePendulumT1;
  end T1_hp;

  package T2_hp
    model MotorT2
      Modelica.Electrical.Analog.Basic.Resistor resistor
        annotation (Placement(transformation(extent={{-36,20},{-16,40}})));
      Modelica.Electrical.Analog.Basic.Inductor inductor
        annotation (Placement(transformation(extent={{-2,20},{18,40}})));
      Modelica.Electrical.Analog.Basic.Ground ground
        annotation (Placement(transformation(extent={{-66,-70},{-46,-50}})));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-56,-16})));
    equation
      connect(signalVoltage.p, resistor.p) annotation (Line(points={{-56,-6},{
              -56,30},{-36,30}}, color={0,0,255}));
      connect(resistor.n, inductor.p)
        annotation (Line(points={{-16,30},{-2,30}}, color={0,0,255}));
      connect(signalVoltage.n, ground.p)
        annotation (Line(points={{-56,-26},{-56,-50}}, color={0,0,255}));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end MotorT2;
  end T2_hp;
  annotation (uses(Modelica(version="4.0.0")));
end mywork_hp_FM3217;
