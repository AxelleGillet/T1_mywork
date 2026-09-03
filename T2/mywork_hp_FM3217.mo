within ;
package mywork_hp_FM3217
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
end mywork_hp_FM3217;
