model ADN_Modelica
  extends Modelica.Icons.Package;
  import SI = Modelica.SIunits;

  package Interfaces
    connector Node "Active Distribution Network Node"
      SI.Voltage vRe "Real part of voltage phasor";
      SI.Voltage vIm "Imaginary part of voltage phasor";
      flow SI.Current iRe "Real part of current phasor";
      flow SI.Current iIm "Imaginary part of current phasor";
      annotation(Icon(graphics = {Rectangle(origin = {-1, 1}, lineColor = {0, 0, 255}, fillColor = {0, 0, 127}, extent = {{-33, 41}, {33, -41}})}));
    end Node;

    connector FRNode "Frome Node"
      extends Node;
      annotation(defaultComponentName = "pin", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-40, 100}, {-100, 40}, {-100, -40}, {-40, -100}, {40, -100}, {100, -40}, {100, 40}, {40, 100}, {-40, 100}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-200, 110}, {0, 50}}, lineColor = {0, 0, 255}, textString = "%name"), Polygon(points = {{-10, 30}, {-30, 10}, {-30, -10}, {-10, -30}, {10, -30}, {30, -10}, {30, 10}, {10, 30}, {-10, 30}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid)}));
    end FRNode;

    connector TONode "To Node"
      extends Node;
      annotation(defaultComponentName = "pin_n", Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Polygon(points = {{-40, 100}, {-100, 40}, {-100, -40}, {-40, -100}, {40, -100}, {100, -40}, {100, 40}, {40, 100}, {-40, 100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{0, 110}, {200, 50}}, textString = "%name"), Polygon(points = {{-10, 30}, {-30, 10}, {-30, -10}, {-10, -30}, {10, -30}, {30, -10}, {30, 10}, {10, 30}, {-10, 30}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid)}), Terminal(Rectangle(extent = [-100, 100; 100, -100], style(color = 3))));
    end TONode;

    model OnePhaseBranch "General One Phase Branch Definition"
      SI.Voltage vRe(start = 1.1) "Real voltage";
      SI.Voltage vIm(start = 0.1) "Imagine voltage";
      SI.Current iRe(start = 0.1) "Real Current";
      SI.Current iIm(start = 0.1) "Imagine Current";
      FRNode p annotation(Placement(transformation(extent = {{-110, -10}, {-90, 10}}, rotation = 0)));
      TONode n annotation(Placement(transformation(extent = {{110, -10}, {90, 10}}, rotation = 0)));
    equation
      vRe = p.vRe - n.vRe;
      vIm = p.vIm - n.vIm;
      0 = p.iRe + n.iRe;
      0 = p.iIm + n.iIm;
      iRe = p.iRe;
      iIm = p.iIm;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Line(points = {{-110, 20}, {-85, 20}}, color = {160, 160, 164}), Polygon(lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, points = {{-95, 23}, {-85, 20}, {-95, 17}, {-95, 23}}), Line(points = {{90, 20}, {115, 20}}, color = {160, 160, 164}), Line(points = {{-125, 0}, {-115, 0}}, color = {160, 160, 164}), Line(points = {{-120, -5}, {-120, 5}}, color = {160, 160, 164}), Text(lineColor = {160, 160, 164}, extent = {{-110, 25}, {-90, 45}}, textString = "i"), Polygon(lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, points = {{105, 23}, {91, 20}, {105, 17}, {105, 23}}), Line(points = {{115, 0}, {125, 0}}, color = {160, 160, 164}), Text(lineColor = {160, 160, 164}, extent = {{90, 45}, {110, 25}}, textString = "i")}), Window(x = 0.33, y = 0.04, width = 0.63, height = 0.67), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics));
    end OnePhaseBranch;

    partial model TwoPhaseBranch
      SI.Voltage v1Re;
      SI.Voltage v1Im;
      SI.Voltage v2Re;
      SI.Voltage v2Im;
      SI.Current i1Re;
      SI.Current i1Im;
      SI.Current i2Re;
      SI.Current i2Im;
      FRNode p1 annotation(Placement(transformation(extent = {{-110, 40}, {-90, 60}}, rotation = 0)));
      FRNode p2 annotation(Placement(transformation(extent = {{110, 40}, {90, 60}}, rotation = 0)));
      TONode n1 annotation(Placement(transformation(extent = {{-90, -60}, {-110, -40}}, rotation = 0)));
      TONode n2 annotation(Placement(transformation(extent = {{90, -60}, {110, -40}}, rotation = 0)));
    equation
      v1Re = p1.vRe - n1.vRe;
      v1Im = p1.vIm - n1.vIm;
      v2Re = p2.vRe - n2.vRe;
      v2Im = p2.vIm - n2.vIm;
      0 = p1.iRe + n1.iRe;
      0 = p1.iIm + n1.iIm;
      0 = p2.iRe + n2.iRe;
      0 = p2.iIm + n2.iIm;
      i1Re = p1.iRe;
      i1Im = p1.iIm;
      i2Re = p2.iRe;
      i2Im = p2.iIm;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Polygon(points = {{-120, 53}, {-110, 50}, {-120, 47}, {-120, 53}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Line(points = {{-136, 50}, {-111, 50}}, color = {160, 160, 164}), Polygon(points = {{127, -47}, {137, -50}, {127, -53}, {127, -47}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Line(points = {{111, -50}, {136, -50}}, color = {160, 160, 164}), Text(extent = {{112, -44}, {128, -29}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, textString = "i2"), Text(extent = {{118, 52}, {135, 67}}, lineColor = {0, 0, 0}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {160, 160, 164}, textString = "i2"), Polygon(points = {{120, 53}, {110, 50}, {120, 47}, {120, 53}}, lineColor = {160, 160, 164}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {160, 160, 164}), Line(points = {{111, 50}, {136, 50}}, color = {160, 160, 164}), Line(points = {{-136, -49}, {-111, -49}}, color = {160, 160, 164}), Polygon(points = {{-126, -46}, {-136, -49}, {-126, -52}, {-126, -46}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid), Text(extent = {{-127, -46}, {-110, -31}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, textString = "i1"), Text(extent = {{-136, 53}, {-119, 68}}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, textString = "i1")}), Window(x = 0.16, y = 0.12, width = 0.6, height = 0.6), Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics));
    end TwoPhaseBranch;

    partial model ThreePhaseBranch
      SI.Voltage v1Re;
      SI.Voltage v1Im;
      SI.Voltage v2Re;
      SI.Voltage v2Im;
      SI.Voltage v3Re;
      SI.Voltage v3Im;
      SI.Current i1Re;
      SI.Current i1Im;
      SI.Current i2Re;
      SI.Current i2Im;
      SI.Current i3Re;
      SI.Current i3Im;
      FRNode p1 annotation(Placement(transformation(extent = {{-110, 40}, {-90, 60}}, rotation = 0)));
      ADN_Modelica.Interfaces.FRNode p2 annotation(Placement(visible = true, transformation(extent = {{10, 39}, {-10, 59}}, rotation = 0), iconTransformation(extent = {{7, 42}, {-13, 62}}, rotation = 0)));
      TONode n1 annotation(Placement(transformation(extent = {{-90, -60}, {-110, -40}}, rotation = 0)));
      ADN_Modelica.Interfaces.TONode n2 annotation(Placement(visible = true, transformation(extent = {{-10, -61}, {10, -41}}, rotation = 0), iconTransformation(extent = {{-10, -61}, {10, -41}}, rotation = 0)));
      ADN_Modelica.Interfaces.FRNode p3 annotation(Placement(visible = true, transformation(origin = {97, 51}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 51}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Interfaces.TONode n3 annotation(Placement(visible = true, transformation(origin = {96, -51}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -53}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      v1Re = p1.vRe - n1.vRe;
      v1Im = p1.vIm - n1.vIm;
      v2Re = p2.vRe - n2.vRe;
      v2Im = p2.vIm - n2.vIm;
      v3Re = p3.vRe - n3.vRe;
      v3Im = p3.vIm - n3.vIm;
      0 = p1.iRe + n1.iRe;
      0 = p1.iIm + n1.iIm;
      0 = p2.iRe + n2.iRe;
      0 = p2.iIm + n2.iIm;
      0 = p3.iRe + n3.iRe;
      0 = p3.iIm + n3.iIm;
      i1Re = p1.iRe;
      i1Im = p1.iIm;
      i2Re = p2.iRe;
      i2Im = p2.iIm;
      i3Re = p3.iRe;
      i3Im = p3.iIm;
      annotation(Diagram(coordinateSystem(preserveAspectRatio = false, grid = {1, 1}, initialScale = 0.1), graphics = {Polygon(lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, points = {{-120, 53}, {-110, 50}, {-120, 47}, {-120, 53}}), Line(points = {{-136, 50}, {-111, 50}}, color = {160, 160, 164}), Polygon(origin = {-100, -1}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, points = {{127, -47}, {137, -50}, {127, -53}, {127, -47}}), Line(origin = {-100, -1}, points = {{111, -50}, {136, -50}}, color = {160, 160, 164}), Text(origin = {-100, -1}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{112, -44}, {128, -29}}, textString = "i2", fontName = "DejaVu Sans Mono"), Text(origin = {-100, -1}, fillColor = {160, 160, 164}, fillPattern = FillPattern.HorizontalCylinder, extent = {{118, 52}, {135, 67}}, textString = "i2", fontName = "DejaVu Sans Mono"), Polygon(origin = {-100, -1}, lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.HorizontalCylinder, points = {{120, 53}, {110, 50}, {120, 47}, {120, 53}}), Line(origin = {-100, -1}, points = {{111, 50}, {136, 50}}, color = {160, 160, 164}), Line(points = {{-136, -49}, {-111, -49}}, color = {160, 160, 164}), Polygon(lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, points = {{-126, -46}, {-136, -49}, {-126, -52}, {-126, -46}}), Text(lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{-127, -46}, {-110, -31}}, textString = "i1", fontName = "DejaVu Sans Mono"), Text(lineColor = {160, 160, 164}, fillColor = {160, 160, 164}, fillPattern = FillPattern.Solid, extent = {{-136, 53}, {-119, 68}}, textString = "i1", fontName = "DejaVu Sans Mono")}), Window(x = 0.16, y = 0.12, width = 0.6, height = 0.6), Icon(coordinateSystem(preserveAspectRatio = false, grid = {1, 1}, initialScale = 0.1), graphics = {Text(origin = {-81.5, 32}, extent = {{-2.5, 4}, {2.5, -4}}, textString = "A"), Text(origin = {0.5, 31}, extent = {{-2.5, 4}, {2.5, -4}}, textString = "B"), Text(origin = {89.5, 31}, extent = {{-2.5, 4}, {2.5, -4}}, textString = "C")}));
    end ThreePhaseBranch;

    model SixPort
      FRNode pa annotation(Placement(visible = true, transformation(origin = {-92, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      FRNode pb annotation(Placement(visible = true, transformation(origin = {-92, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      FRNode pc annotation(Placement(visible = true, transformation(origin = {-92, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TONode na annotation(Placement(visible = true, transformation(origin = {80, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TONode nb annotation(Placement(visible = true, transformation(origin = {80, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TONode nc annotation(Placement(visible = true, transformation(origin = {82, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {82, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      annotation(Icon(graphics = {Text(origin = {-71, -10}, extent = {{-3, 2}, {3, -2}}, textString = "B", fontSize = 50, textStyle = {TextStyle.UnderLine})}));
    end SixPort;

    model ThreePort
      FRNode pA annotation(Placement(visible = true, transformation(origin = {90, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      FRNode pB annotation(Placement(visible = true, transformation(origin = {88, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {88, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      FRNode pC annotation(Placement(visible = true, transformation(origin = {86, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    end ThreePort;

    connector PosSeqNode
      SI.Voltage vRe;
      SI.Voltage vIm;
      flow SI.Current iRe;
      flow SI.Current iIm;
      annotation();
    end PosSeqNode;

    connector NegSeqNode
      SI.Voltage vRe;
      SI.Voltage vIm;
      flow SI.Current iRe;
      flow SI.Current iIm;
      annotation();
    end NegSeqNode;

connector ZeroSeqNode
  SI.Voltage vRe;
  SI.Voltage vIm;
  flow SI.Current iRe;
  flow SI.Current iIm;
  annotation();
end ZeroSeqNode;

connector PosSeqFRNode
  extends PosSeqNode;
  annotation(Icon(graphics = {Ellipse(origin = {-3, 7}, extent = {{-79, 77}, {73, -77}}, endAngle = 360), Text(origin = {-7, 0}, extent = {{-3, 2}, {3, -2}}, textString = "+", fontSize = 300, fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
end PosSeqFRNode;
connector PosSeqTONode
  extends PosSeqNode;
  annotation(Icon(graphics = {Ellipse(origin = {-3, 7}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-79, 77}, {73, -77}}, endAngle = 360), Text(origin = {-7, 0}, extent = {{-3, 2}, {3, -2}}, textString = "+", fontSize = 300, fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
end PosSeqTONode;
connector NegSeqFRNode
  extends NegSeqNode;
  annotation(Icon(graphics = {Ellipse(origin = {-3, 7}, extent = {{-79, 77}, {73, -77}}, endAngle = 360), Text(origin = {-7, 0}, extent = {{-3, 2}, {3, -2}}, textString = "-", fontSize = 300, fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
end NegSeqFRNode;
connector NegSeqTONode
  extends NegSeqNode;
  annotation(Icon(graphics = {Ellipse(origin = {-3, 7}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-79, 77}, {73, -77}}, endAngle = 360), Text(origin = {-7, 0}, extent = {{-3, 2}, {3, -2}}, textString = "-", fontSize = 300, fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
end NegSeqTONode;
connector ZeroSeqFRNode
  extends ZeroSeqNode;
  annotation(Icon(graphics = {Ellipse(origin = {-3, 7}, extent = {{-79, 77}, {73, -77}}, endAngle = 360), Text(origin = {-7, 0}, extent = {{-3, 2}, {3, -2}}, textString = "0", fontSize = 300, fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
end ZeroSeqFRNode;


connector ZeroSeqTONode
  extends ZeroSeqNode;
  annotation(Icon(graphics = {Ellipse(origin = {-3, 7}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-79, 77}, {73, -77}}, endAngle = 360), Text(origin = {-7, 0}, extent = {{-3, 2}, {3, -2}}, textString = "0", fontSize = 300, fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
end ZeroSeqTONode;
model PhaseToSequence
  FRNode pa annotation(Placement(visible = true, transformation(origin = {-80, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FRNode pb annotation(Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FRNode pc annotation(Placement(visible = true, transformation(origin = {-78, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-78, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PosSeqFRNode pos_p annotation(Placement(visible = true, transformation(origin = {86, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  NegSeqFRNode neg_p annotation(Placement(visible = true, transformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ZeroSeqFRNode zero_p annotation(Placement(visible = true, transformation(origin = {86, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {86, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//v0=1/3*(va+vb+vc);
//v1=1/3*(va+a*(vb)+a^2*vc);
//v2=1/3*(va+a^2*(vb)+a*vc);
  zero_p.vRe = 1 / 3 * (pa.vRe + pb.vRe + pc.vRe);
  zero_p.vIm = 1 / 3 * (pa.vIm + pb.vIm + pc.vIm);
  pos_p.vRe = 1 / 3 * (pa.vRe + pb.vRe * Constants.aRe - pb.vIm * Constants.aIm + pc.vRe * Constants.aRe + pc.vIm * Constants.aIm);
  pos_p.vIm = 1 / 3 * (pa.vIm + pb.vRe * Constants.aIm + pb.vIm * Constants.aRe - pc.vRe * Constants.aIm + pc.vIm * Constants.aRe);
  neg_p.vRe = 1 / 3 * (pa.vRe + pb.vRe * Constants.aRe + pb.vIm * Constants.aIm + pc.vRe * Constants.aRe - pc.vIm * Constants.aIm);
  neg_p.vIm = 1 / 3 * (pa.vIm - pb.vRe * Constants.aIm + pb.vIm * Constants.aRe + pc.vRe * Constants.aIm + pc.vIm * Constants.aRe);
  zero_p.iRe = -1 / 3 * (pa.iRe + pb.iRe + pc.iRe);
  zero_p.iIm = -1 / 3 * (pa.iIm + pb.iIm + pc.iIm);
  pos_p.iRe = -1 / 3 * (pa.iRe + pb.iRe * Constants.aRe - pb.iIm * Constants.aIm + pc.iRe * Constants.aRe + pc.iIm * Constants.aIm);
  pos_p.iIm = -1 / 3 * (pa.iIm + pb.iRe * Constants.aIm + pb.iIm * Constants.aRe - pc.iRe * Constants.aIm + pc.iIm * Constants.aRe);
  neg_p.iRe = -1 / 3 * (pa.iRe + pb.iRe * Constants.aRe + pb.iIm * Constants.aIm + pc.iRe * Constants.aRe - pc.iIm * Constants.aIm);
  neg_p.iIm = -1 / 3 * (pa.iIm - pb.iRe * Constants.aIm + pb.iIm * Constants.aRe + pc.iRe * Constants.aIm + pc.iIm * Constants.aRe);
  annotation(Icon(graphics = {Rectangle(origin = {3, -5}, extent = {{-61, 73}, {61, -73}})}));
end PhaseToSequence;


    model test
    end test;  end Interfaces;

  package Basic
    model Ground
      Interfaces.FRNode p annotation(Placement(transformation(origin = {0, 100}, extent = {{10, -10}, {-10, 10}}, rotation = 270)));
    equation
      p.vRe = 0;
      p.vIm = 0;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points = {{-60, 50}, {60, 50}}), Line(points = {{-40, 30}, {40, 30}}), Line(points = {{-20, 10}, {20, 10}}), Line(points = {{0, 100}, {0, 50}}), Text(extent = {{-144, -60}, {138, 0}}, lineColor = {0, 0, 255}, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Line(points = {{-60, 50}, {60, 50}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{-40, 30}, {40, 30}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{-20, 10}, {20, 10}}, color = {0, 0, 255}, thickness = 0.5), Line(points = {{0, 100}, {0, 50}}, color = {0, 0, 255}, thickness = 0.5), Text(extent = {{-24, -38}, {22, -6}}, textString = "p.v=0")}), Window(x = 0.23, y = 0.23, width = 0.59, height = 0.63));
    end Ground;

    model OnePhaseImpedance
      extends Interfaces.OnePhaseBranch;
      parameter SI.Resistance R = 1;
      parameter SI.Reactance X = 1;
    equation
      vRe = R * iRe - X * iIm;
      vIm = R * iIm + X * iRe;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-100, 0}, {-70, 0}}), Line(points = {{70, 0}, {100, 0}}), Text(extent = {{-144, -60}, {144, -100}}, lineColor = {0, 0, 0}, textString = "Z"), Text(extent = {{-144, 50}, {144, 110}}, lineColor = {0, 0, 255}, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}), Line(points = {{-100, 0}, {-70, 0}}), Line(points = {{70, 0}, {100, 0}})}), Window(x = 0.2, y = 0.06, width = 0.62, height = 0.69));
    end OnePhaseImpedance;

    model TwoPhaseImpedance
      extends Interfaces.TwoPhaseBranch;
      parameter SI.Resistance R11 = 1 "R11";
      parameter SI.Reactance X11 = 1 "X11";
      parameter SI.Resistance R12 = 1 "R12";
      parameter SI.Reactance X12 = 1 "X12";
      parameter SI.Resistance R21 = 1 "R21";
      parameter SI.Reactance X21 = 1 "X21";
      parameter SI.Resistance R22 = 1 "R22";
      parameter SI.Reactance X22 = 1 "X22";
    equation
      v1Re = R11 * i1Re + R12 * i2Re - X11 * i1Im - X12 * i2Im;
      v2Re = R21 * i1Re + R22 * i2Re - X21 * i1Im - X22 * i2Im;
      v1Im = X11 * i1Re + X12 * i2Re + R11 * i1Im + R12 * i2Im;
      v2Im = X21 * i1Re + X22 * i2Re + R12 * i1Im + R22 * i2Im;
      annotation(Diagram(graphics = {Line(origin = {-18, -3}, points = {{-44, 37}})}, coordinateSystem(initialScale = 0.1)), Icon(graphics = {Line(origin = {-98, -3}, points = {{0, 51}, {0, -51}}), Line(origin = {58, -4}, points = {{0, 52}}), Line(origin = {100, -3}, points = {{0, 49}, {0, -49}}), Line(origin = {3, 1}, points = {{-55, -37}}), Line(origin = {-40, 6}, points = {{-58, -46}, {140, 34}}), Line(origin = {-36, -7}, points = {{-62, 47}, {136, -33}}), Text(origin = {-77, 54}, extent = {{7, 2}, {-7, -2}}, textString = "A", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
    end TwoPhaseImpedance;

    model ThreePhaseImpedance
      extends Interfaces.ThreePhaseBranch;
      parameter SI.Resistance R11 = 1 "R11";
      parameter SI.Reactance X11 = 1 "X11";
      parameter SI.Resistance R12 = 0 "R12";
      parameter SI.Reactance X12 = 0 "X12";
      parameter SI.Resistance R13 = 0 "R13";
      parameter SI.Reactance X13 = 0 "X13";
      parameter SI.Resistance R21 = 0 "R21";
      parameter SI.Reactance X21 = 0 "X21";
      parameter SI.Resistance R22 = 1 "R22";
      parameter SI.Reactance X22 = 1 "X22";
      parameter SI.Resistance R23 = 0 "R23";
      parameter SI.Reactance X23 = 0 "X23";
      parameter SI.Resistance R31 = 0 "R31";
      parameter SI.Reactance X31 = 0 "X31";
      parameter SI.Resistance R32 = 0 "R32";
      parameter SI.Reactance X32 = 0 "X32";
      parameter SI.Resistance R33 = 1 "R33";
      parameter SI.Reactance X33 = 1 "X33";
    equation
      v1Re = R11 * i1Re + R12 * i2Re + R13 * i3Re - X11 * i1Im - X12 * i2Im - X13 * i3Im;
      v2Re = R21 * i1Re + R22 * i2Re + R23 * i3Re - X21 * i1Im - X22 * i2Im - X23 * i3Im;
      v3Re = R31 * i1Re + R32 * i2Re + R33 * i3Re - X31 * i1Im - X32 * i2Im - X33 * i3Im;
      v1Im = X11 * i1Re + X12 * i2Re + X13 * i3Re + R11 * i1Im + R12 * i2Im + R13 * i3Im;
      v2Im = X21 * i1Re + X22 * i2Re + X23 * i3Re + R21 * i1Im + R22 * i2Im + R23 * i3Im;
      v3Im = X31 * i1Re + X32 * i2Re + X33 * i3Re + R31 * i1Im + R32 * i2Im + R33 * i3Im;
      annotation(Diagram(graphics = {Rectangle(origin = {-68, -2}, extent = {{-2, 40}, {2, -40}}), Rectangle(origin = {34, -2}, extent = {{-2, 40}, {2, -40}}), Line(origin = {-82, 44}, points = {{-14, 6}, {14, 6}, {14, -6}, {14, -6}}), Line(origin = {-31.9048, -8.79848}, points = {{-62.0952, -41.2015}, {-54.0952, -43.2015}, {-36.0952, -43.2015}, {-36.0952, -33.2015}, {-36.0952, -33.2015}, {61.9048, 42.7985}}), Line(origin = {-18, -3}, points = {{-44, 37}}), Line(origin = {-19, -1}, points = {{-43, 37}, {43, -37}}), Line(origin = {66.0154, 44.9998}, points = {{31.9846, 5.00024}, {-32.0154, 7.00024}, {-32.0154, -6.99976}}), Line(origin = {66.04, -48}, points = {{31.9568, -4}, {9.95679, -6}, {-32.0432, -6}, {-32.0432, 6}}), Line(origin = {66.8017, -0.585706}, points = {{-24.8017, 36.5857}, {25.1983, -37.4143}}), Line(origin = {68, 4}, points = {{-20, -22}})}, coordinateSystem(initialScale = 0.1)), Icon(graphics = {Line(origin = {-98, -1}, points = {{0, 51}, {0, -51}}), Line(origin = {58, -4}, points = {{0, 52}}), Line(origin = {100, -7}, points = {{0, 49}, {0, -49}}), Line(origin = {3, 1}, points = {{-55, -37}}), Line(origin = {0, -2}, points = {{0, 42}, {0, -40}}), Bitmap(origin = {-69, 19}, extent = {{-39, 23}, {177, -55}})}, coordinateSystem(initialScale = 0.1)));
    end ThreePhaseImpedance;

    model VoltageSource "Voltage source"
      extends Interfaces.OnePhaseBranch;
      parameter SI.Voltage Vmag = 1;
      parameter SI.Angle Vangle = 0;
    equation
      vRe = Vmag * cos(Vangle);
      vIm = Vmag * sin(Vangle);
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-150, 80}, {150, 120}}, textString = ""), Line(points = {{-100, 0}, {100, 0}}, color = {0, 0, 0}), Line(points = {{-60, 0}, {-51.6, 34.2}, {-46.1, 53.1}, {-41.3, 66.4}, {-37.1, 74.6}, {-32.9, 79.1}, {-28.64, 79.8}, {-24.42, 76.6}, {-20.201, 69.7}, {-15.98, 59.4}, {-11.16, 44.1}, {-5.1, 21.2}, {7.5, -30.8}, {13, -50.2}, {17.8, -64.2}, {22, -73.1}, {26.2, -78.4}, {30.5, -80}, {34.7, -77.6}, {38.9, -71.5}, {43.1, -61.9}, {47.9, -47.2}, {54, -24.8}, {60, 0}}, color = {0, 0, 0}, thickness = 0.5), Text(extent = {{-100, -109}, {100, -69}}, lineColor = {0, 0, 255}, textString = "%name")}), Window(x = 0.31, y = 0.09, width = 0.6, height = 0.6), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Ellipse(extent = {{-50, 50}, {50, -50}}, lineColor = {0, 0, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-100, 0}, {100, 0}}, color = {0, 0, 0}), Line(points = {{-60, 0}, {-51.6, 34.2}, {-46.1, 53.1}, {-41.3, 66.4}, {-37.1, 74.6}, {-32.9, 79.1}, {-28.64, 79.8}, {-24.42, 76.6}, {-20.201, 69.7}, {-15.98, 59.4}, {-11.16, 44.1}, {-5.1, 21.2}, {7.5, -30.8}, {13, -50.2}, {17.8, -64.2}, {22, -73.1}, {26.2, -78.4}, {30.5, -80}, {34.7, -77.6}, {38.9, -71.5}, {43.1, -61.9}, {47.9, -47.2}, {54, -24.8}, {60, 0}}, color = {0, 0, 0}, thickness = 0.5)}));
    end VoltageSource;

    package ThreePhaseVoltageSource
      model Y0ThreePhaVSource
        parameter SI.Voltage Vmag1 = 1;
        parameter SI.Angle Vangle1 = 0;
        parameter SI.Voltage Vmag2 = 1;
        parameter SI.Angle Vangle2 = 0;
        parameter SI.Voltage Vmag3 = 1;
        parameter SI.Angle Vangle3 = 0;
        VoltageSource voltageSource1(Vangle = Vangle1, Vmag = Vmag1) annotation(Placement(visible = true, transformation(origin = {4, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        VoltageSource voltageSource2(Vangle = Vangle2, Vmag = Vmag2) annotation(Placement(visible = true, transformation(origin = {2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        VoltageSource voltageSource3(Vangle = Vangle3, Vmag = Vmag3) annotation(Placement(visible = true, transformation(origin = {4, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {94, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {-52, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(voltageSource3.p, pin3) annotation(Line(points = {{14, -30}, {34, -30}, {34, -64}, {94, -64}, {94, -64}}, color = {0, 0, 255}));
        connect(voltageSource2.p, pin2) annotation(Line(points = {{12, 2}, {42, 2}, {42, 6}, {92, 6}, {92, 6}}, color = {0, 0, 255}));
        connect(voltageSource1.p, pin1) annotation(Line(points = {{14, 36}, {18, 36}, {18, 76}, {94, 76}, {94, 76}}, color = {0, 0, 255}));
        connect(voltageSource1.n, ground1.p) annotation(Line(points = {{-6, 36}, {-68, 36}, {-68, -36}, {-68, -36}, {-68, -46}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
        connect(voltageSource2.n, ground1.p) annotation(Line(points = {{-8, 2}, {-84, 2}, {-84, -48}, {-52, -48}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
        connect(voltageSource3.n, ground1.p) annotation(Line(points = {{-6, -30}, {-42, -30}, {-42, -30}, {-52, -30}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Ellipse(origin = {-19, 12}, extent = {{-53, 56}, {83, -82}}, endAngle = 360), Text(origin = {76, 80}, extent = {{4, -2}, {-4, 2}}, textString = "A", fontSize = 50), Text(extent = {{74, 6}, {74, 6}}, textString = "B", fontSize = 50), Text(origin = {76, 12}, extent = {{4, -2}, {-4, 2}}, textString = "B", fontSize = 50), Text(origin = {75, -63}, extent = {{-1, 3}, {1, -3}}, textString = "C", fontSize = 50), Text(origin = {109, 23}, extent = {{-121, -21}, {-119, -19}}, textString = "Y0", fontSize = 500, fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
      end Y0ThreePhaVSource;

      model Y0ThreePhaVSourcePU
        parameter SI.Voltage Vmag1 = 1;
        parameter SI.Angle Vangle1 = 0;
        parameter SI.Voltage Vmag2 = 1;
        parameter SI.Angle Vangle2 = 0;
        parameter SI.Voltage Vmag3 = 1;
        parameter SI.Angle Vangle3 = 0;
        parameter Real V_base = 1;
        VoltageSource voltageSource1(Vangle = Vangle1, Vmag = Vmag1 / V_base) annotation(Placement(visible = true, transformation(origin = {4, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        VoltageSource voltageSource2(Vangle = Vangle2, Vmag = Vmag2 / V_base) annotation(Placement(visible = true, transformation(origin = {2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        VoltageSource voltageSource3(Vangle = Vangle3, Vmag = Vmag3 / V_base) annotation(Placement(visible = true, transformation(origin = {4, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {94, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {-52, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(voltageSource3.p, pin3) annotation(Line(points = {{14, -30}, {34, -30}, {34, -64}, {94, -64}, {94, -64}}, color = {0, 0, 255}));
        connect(voltageSource2.p, pin2) annotation(Line(points = {{12, 2}, {42, 2}, {42, 6}, {92, 6}, {92, 6}}, color = {0, 0, 255}));
        connect(voltageSource1.p, pin1) annotation(Line(points = {{14, 36}, {18, 36}, {18, 76}, {94, 76}, {94, 76}}, color = {0, 0, 255}));
        connect(voltageSource1.n, ground1.p) annotation(Line(points = {{-6, 36}, {-68, 36}, {-68, -36}, {-68, -36}, {-68, -46}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
        connect(voltageSource2.n, ground1.p) annotation(Line(points = {{-8, 2}, {-84, 2}, {-84, -48}, {-52, -48}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
        connect(voltageSource3.n, ground1.p) annotation(Line(points = {{-6, -30}, {-42, -30}, {-42, -30}, {-52, -30}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Ellipse(origin = {-19, 12}, extent = {{-53, 56}, {83, -82}}, endAngle = 360), Text(origin = {76, 80}, extent = {{4, -2}, {-4, 2}}, textString = "A", fontSize = 50), Text(extent = {{74, 6}, {74, 6}}, textString = "B", fontSize = 50), Text(origin = {76, 12}, extent = {{4, -2}, {-4, 2}}, textString = "B", fontSize = 50), Text(origin = {75, -63}, extent = {{-1, 3}, {1, -3}}, textString = "C", fontSize = 50), Text(origin = {109, 23}, extent = {{-121, -21}, {-119, -19}}, textString = "Y0", fontSize = 500, fontName = "DejaVu Sans Mono")}, coordinateSystem(initialScale = 0.1)));
      end Y0ThreePhaVSourcePU;

      model ThreePhaseVoltageSource2
        extends Interfaces.ThreePort;
        parameter SI.Voltage Vmag1 = 1;
        parameter SI.Angle Vangle1 = 0;
        parameter SI.Voltage Vmag2 = 1;
        parameter SI.Angle Vangle2 = 0;
        parameter SI.Voltage Vmag3 = 1;
        parameter SI.Angle Vangle3 = 0;
        Real i1Re(start = 0);
        Real i2Re(start = 0);
        Real i3Re(start = 0);
        Real i1Im(start = 0);
        Real i2Im(start = 0);
        Real i3Im(start = 0);
      equation
        pA.vRe - 0 = Vmag1 * cos(Vangle1);
        pA.vIm - 0 = Vmag1 * sin(Vangle1);
        pB.vRe - 0 = Vmag2 * cos(Vangle2);
        pB.vIm - 0 = Vmag2 * sin(Vangle2);
        pC.vRe - 0 = Vmag3 * cos(Vangle3);
        pC.vIm - 0 = Vmag3 * sin(Vangle3);
        i1Re = pA.iRe;
        i2Re = pB.iRe;
        i3Re = pC.iRe;
        i1Im = pA.iIm;
        i2Im = pB.iIm;
        i3Im = pC.iIm;
        annotation(Icon(graphics = {Ellipse(origin = {31, 1}, extent = {{-53, 51}, {37, -35}}, endAngle = 360)}));
      end ThreePhaseVoltageSource2;
    end ThreePhaseVoltageSource;

    model ThreePhaImpedancePerKm3
      extends Interfaces.ThreePhaseBranch;
      parameter Real Length = 1 "km";
      parameter SI.Resistance UR11 = 1 "Ohm/km";
      parameter SI.Inductance UL11 = 1 "H/km";
      SI.Resistance R11 = 1 "R11";
      SI.Reactance X11 = 1 "X11";
      parameter SI.Resistance R12 = 0 "R12";
      parameter SI.Reactance X12 = 0 "X12";
      parameter SI.Resistance R13 = 0 "R13";
      parameter SI.Reactance X13 = 0 "X13";
      parameter SI.Resistance R21 = 0 "R21";
      parameter SI.Reactance X21 = 0 "X21";
      parameter SI.Resistance R22 = 1 "R22";
      parameter SI.Reactance X22 = 1 "X22";
      parameter SI.Resistance R23 = 0 "R23";
      parameter SI.Reactance X23 = 0 "X23";
      parameter SI.Resistance R31 = 0 "R31";
      parameter SI.Reactance X31 = 0 "X31";
      parameter SI.Resistance R32 = 0 "R32";
      parameter SI.Reactance X32 = 0 "X32";
      parameter SI.Resistance R33 = 1 "R33";
      parameter SI.Reactance X33 = 1 "X33";
    equation
      R11 = UR11 * Length;
      X11 = 2 * Modelica.Constants.pi * AND_Modelica.SystemSettings.frequency * UL11 * Length;
      v1Re = R11 * i1Re + R12 * i2Re + R13 * i3Re - X11 * i1Im - X12 * i2Im - X13 * i3Im;
      v2Re = R21 * i1Re + R22 * i2Re + R23 * i3Re - X21 * i1Im - X22 * i2Im - X23 * i3Im;
      v3Re = R31 * i1Re + R32 * i2Re + R33 * i3Re - X31 * i1Im - X32 * i2Im - X33 * i3Im;
      v1Im = X11 * i1Re + X12 * i2Re + X13 * i3Re + R11 * i1Im + R12 * i2Im + R13 * i3Im;
      v2Im = X21 * i1Re + X22 * i2Re + X23 * i3Re + R21 * i1Im + R22 * i2Im + R23 * i3Im;
      v3Im = X31 * i1Re + X32 * i2Re + X33 * i3Re + R31 * i1Im + R32 * i2Im + R33 * i3Im;
      annotation(Diagram(graphics = {Rectangle(origin = {-68, -2}, extent = {{-2, 40}, {2, -40}}), Rectangle(origin = {34, -2}, extent = {{-2, 40}, {2, -40}}), Line(origin = {-82, 44}, points = {{-14, 6}, {14, 6}, {14, -6}, {14, -6}}), Line(origin = {-31.9048, -8.79848}, points = {{-62.0952, -41.2015}, {-54.0952, -43.2015}, {-36.0952, -43.2015}, {-36.0952, -33.2015}, {-36.0952, -33.2015}, {61.9048, 42.7985}}), Line(origin = {-18, -3}, points = {{-44, 37}}), Line(origin = {-19, -1}, points = {{-43, 37}, {43, -37}}), Line(origin = {66.0154, 44.9998}, points = {{31.9846, 5.00024}, {-32.0154, 7.00024}, {-32.0154, -6.99976}}), Line(origin = {66.04, -48}, points = {{31.9568, -4}, {9.95679, -6}, {-32.0432, -6}, {-32.0432, 6}}), Line(origin = {66.8017, -0.585706}, points = {{-24.8017, 36.5857}, {25.1983, -37.4143}}), Line(origin = {68, 4}, points = {{-20, -22}})}, coordinateSystem(initialScale = 0.1)), Icon(graphics = {Line(origin = {-98, -1}, points = {{0, 51}, {0, -51}}), Line(origin = {58, -4}, points = {{0, 52}}), Line(origin = {100, -7}, points = {{0, 49}, {0, -49}}), Line(origin = {3, 1}, points = {{-55, -37}}), Line(origin = {0, -2}, points = {{0, 42}, {0, -40}}), Bitmap(origin = {-69, 19}, extent = {{-39, 23}, {177, -55}})}, coordinateSystem(initialScale = 0.1)));
    end ThreePhaImpedancePerKm3;

    model ThreePhaImpedancePerKm
      parameter SI.Frequency frequency = 60;
      extends Interfaces.ThreePhaseBranch;
      parameter Real Length = 1 "km";
      parameter SI.Resistance UR11 = 1 "Ohm/km";
      parameter SI.Resistance UR12 = 0 "UR12";
      parameter SI.Resistance UR13 = 0 "UR13";
      parameter SI.Resistance UR21 = 0 "R21";
      parameter SI.Resistance UR22 = 1 "R22";
      parameter SI.Resistance UR23 = 0 "R23";
      parameter SI.Resistance UR31 = 0 "R31";
      parameter SI.Resistance UR32 = 0 "R32";
      parameter SI.Resistance UR33 = 1 "R33";
      parameter SI.Inductance UL11 = 1 "H/km";
      parameter SI.Inductance UL12 = 0 "X12";
      parameter SI.Inductance UL13 = 0 "X13";
      parameter SI.Inductance UL21 = 0 "X21";
      parameter SI.Inductance UL22 = 1 "X22";
      parameter SI.Inductance UL23 = 0 "X23";
      parameter SI.Inductance UL31 = 0 "X31";
      parameter SI.Inductance UL32 = 0 "X32";
      parameter SI.Inductance UL33 = 1 "X33";
      SI.Resistance R11 "R11";
      SI.Reactance X11 "X11";
      SI.Resistance R12 "R11";
      SI.Reactance X12 "X11";
      SI.Resistance R13 "R11";
      SI.Reactance X13 "X11";
      SI.Resistance R21 "R11";
      SI.Reactance X21 "X11";
      SI.Resistance R22 "R11";
      SI.Reactance X22 "X11";
      SI.Resistance R23 "R11";
      SI.Reactance X23 "X11";
      SI.Resistance R31 "R11";
      SI.Reactance X31 "X11";
      SI.Resistance R32 "R11";
      SI.Reactance X32 "X11";
      SI.Resistance R33 "R11";
      SI.Reactance X33 "X11";
    equation
      R11 = UR11 * Length;
      R12 = UR12 * Length;
      R13 = UR13 * Length;
      R21 = UR21 * Length;
      R22 = UR22 * Length;
      R23 = UR23 * Length;
      R31 = UR31 * Length;
      R32 = UR32 * Length;
      R33 = UR33 * Length;
      X11 = 2 * Modelica.Constants.pi * frequency * UL11 * Length;
//ADN_Modelica.SystemSettings.frequency
      X12 = 2 * Modelica.Constants.pi * frequency * UL12 * Length;
      X13 = 2 * Modelica.Constants.pi * frequency * UL13 * Length;
      X21 = 2 * Modelica.Constants.pi * frequency * UL21 * Length;
      X22 = 2 * Modelica.Constants.pi * frequency * UL22 * Length;
      X23 = 2 * Modelica.Constants.pi * frequency * UL23 * Length;
      X31 = 2 * Modelica.Constants.pi * frequency * UL31 * Length;
      X32 = 2 * Modelica.Constants.pi * frequency * UL32 * Length;
      X33 = 2 * Modelica.Constants.pi * frequency * UL33 * Length;
      v1Re = R11 * i1Re + R12 * i2Re + R13 * i3Re - X11 * i1Im - X12 * i2Im - X13 * i3Im;
      v2Re = R21 * i1Re + R22 * i2Re + R23 * i3Re - X21 * i1Im - X22 * i2Im - X23 * i3Im;
      v3Re = R31 * i1Re + R32 * i2Re + R33 * i3Re - X31 * i1Im - X32 * i2Im - X33 * i3Im;
      v1Im = X11 * i1Re + X12 * i2Re + X13 * i3Re + R11 * i1Im + R12 * i2Im + R13 * i3Im;
      v2Im = X21 * i1Re + X22 * i2Re + X23 * i3Re + R21 * i1Im + R22 * i2Im + R23 * i3Im;
      v3Im = X31 * i1Re + X32 * i2Re + X33 * i3Re + R31 * i1Im + R32 * i2Im + R33 * i3Im;
      annotation(Diagram(graphics = {Rectangle(origin = {-68, -2}, extent = {{-2, 40}, {2, -40}}), Rectangle(origin = {34, -2}, extent = {{-2, 40}, {2, -40}}), Line(origin = {-82, 44}, points = {{-14, 6}, {14, 6}, {14, -6}, {14, -6}}), Line(origin = {-31.9048, -8.79848}, points = {{-62.0952, -41.2015}, {-54.0952, -43.2015}, {-36.0952, -43.2015}, {-36.0952, -33.2015}, {-36.0952, -33.2015}, {61.9048, 42.7985}}), Line(origin = {-18, -3}, points = {{-44, 37}}), Line(origin = {-19, -1}, points = {{-43, 37}, {43, -37}}), Line(origin = {66.0154, 44.9998}, points = {{31.9846, 5.00024}, {-32.0154, 7.00024}, {-32.0154, -6.99976}}), Line(origin = {66.04, -48}, points = {{31.9568, -4}, {9.95679, -6}, {-32.0432, -6}, {-32.0432, 6}}), Line(origin = {66.8017, -0.585706}, points = {{-24.8017, 36.5857}, {25.1983, -37.4143}}), Line(origin = {68, 4}, points = {{-20, -22}})}, coordinateSystem(initialScale = 0.1)), Icon(graphics = {Line(origin = {-98, -1}, points = {{0, 51}, {0, -51}}), Line(origin = {58, -4}, points = {{0, 52}}), Line(origin = {100, -7}, points = {{0, 49}, {0, -49}}), Line(origin = {3, 1}, points = {{-55, -37}}), Line(origin = {0, -2}, points = {{0, 42}, {0, -40}}), Bitmap(origin = {-69, 19}, extent = {{-39, 23}, {177, -55}})}, coordinateSystem(initialScale = 0.1)));
    end ThreePhaImpedancePerKm;

    model TwoPhaseImpedancePerKm
      parameter SI.Frequency frequency = 60;
      extends Interfaces.TwoPhaseBranch;
      parameter Real Length = 1 "km";
      parameter SI.Resistance UR11 = 1 "R11";
      parameter SI.Reactance UL11 = 1 "X11";
      parameter SI.Resistance UR12 = 1 "R12";
      parameter SI.Reactance UL12 = 1 "X12";
      parameter SI.Resistance UR21 = 1 "R21";
      parameter SI.Reactance UL21 = 1 "X21";
      parameter SI.Resistance UR22 = 1 "R22";
      parameter SI.Reactance UL22 = 1 "X22";
      SI.Resistance R11;
      SI.Resistance X11;
      SI.Resistance R12;
      SI.Resistance X12;
      SI.Resistance R21;
      SI.Resistance X21;
      SI.Resistance R22;
      SI.Resistance X22;
    equation
      R11 = UR11 * Length;
      R12 = UR12 * Length;
      R21 = UR21 * Length;
      R22 = UR22 * Length;
      X11 = 2 * Modelica.Constants.pi * frequency * UL11 * Length;
      X12 = 2 * Modelica.Constants.pi * frequency * UL12 * Length;
      X21 = 2 * Modelica.Constants.pi * frequency * UL21 * Length;
      X22 = 2 * Modelica.Constants.pi * frequency * UL22 * Length;
      v1Re = R11 * i1Re + R12 * i2Re - X11 * i1Im - X12 * i2Im;
      v2Re = R21 * i1Re + R22 * i2Re - X21 * i1Im - X22 * i2Im;
      v1Im = X11 * i1Re + X12 * i2Re + R11 * i1Im + R12 * i2Im;
      v2Im = X21 * i1Re + X22 * i2Re + R12 * i1Im + R22 * i2Im;
      annotation(Diagram(graphics = {Line(origin = {-18, -3}, points = {{-44, 37}})}, coordinateSystem(initialScale = 0.1)), Icon(graphics = {Line(origin = {-98, -3}, points = {{0, 51}, {0, -51}}), Line(origin = {58, -4}, points = {{0, 52}}), Line(origin = {100, -3}, points = {{0, 49}, {0, -49}}), Line(origin = {3, 1}, points = {{-55, -37}}), Line(origin = {-40, 6}, points = {{-58, -46}, {140, 34}}), Line(origin = {-36, -7}, points = {{-62, 47}, {136, -33}}), Text(origin = {-76, 54}, extent = {{0, 2}, {0, -2}}, textString = "A", fontSize = 50), Text(origin = {-77, 55}, extent = {{-1, 1}, {1, -1}}, textString = "A", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
    end TwoPhaseImpedancePerKm;

    model OnePhaPQLoad
      extends Interfaces.OnePhaseBranch;
      //parameter SI.Resistance R = 1 "Resistance of component";
      parameter SI.ActivePower P = 0.1 "Active Power";
      parameter SI.ReactivePower Q = 0.1 "Reactive Power";
      // parameter SI.Voltage vnRe = 1.0;
      // parameter SI.Voltage vnIm = 0.0;
      //initial equation
      // vnRe * iRe + vnIm * iIm = P;
      // (-vnRe * iIm) + vnIm * iRe = Q;
    equation
    
    if time == 0 then
        iRe = 0.01;
        iIm = 0.01;
      else
    
      vRe * iRe + vIm * iIm = P;
      (-vRe * iIm) + vIm * iRe = Q;
      
      end if;
      
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(origin = {2, 0}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Line(points = {{-100, 0}, {-70, 0}}), Line(origin = {2, 0}, points = {{70, 0}, {100, 0}}), Text(extent = {{-144, -60}, {144, -100}}, textString = "PQ", fontName = "DejaVu Sans Mono"), Text(origin = {0, -8}, lineColor = {0, 0, 255}, extent = {{-144, 50}, {144, 110}}, textString = "%name", fontName = "DejaVu Sans Mono"), Text(origin = {-8, 0}, extent = {{0, 2}, {0, -2}}, textString = "PQLoad", fontSize = 100, fontName = "DejaVu Sans Mono"), Text(origin = {-6, 0}, extent = {{-26, 2}, {26, -2}}, textString = "PQLoad", fontSize = 60, fontName = "DejaVu Sans Mono")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}), Line(points = {{-100, 0}, {-70, 0}}), Line(points = {{70, 0}, {100, 0}})}), Window(x = 0.2, y = 0.06, width = 0.62, height = 0.69));
    end OnePhaPQLoad;

    package ThreePhaPQLoad
      model Y0Load
        parameter SI.ActivePower P1 = 0.1 "Active Power";
        parameter SI.ReactivePower Q1 = 0.1 "Reactive Power";
        parameter SI.ActivePower P2 = 0.1 "Active Power";
        parameter SI.ReactivePower Q2 = 0.1 "Reactive Power";
        parameter SI.ActivePower P3 = 0.1 "Active Power";
        parameter SI.ReactivePower Q3 = 0.1 "Reactive Power";
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {58, 25}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
        Ground ground2 annotation(Placement(visible = true, transformation(origin = {60, -3}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
        Ground ground3 annotation(Placement(visible = true, transformation(origin = {60, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad1(P = P1, Q = Q1) annotation(Placement(visible = true, transformation(origin = {-18, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad2(P = P2, Q = Q2) annotation(Placement(visible = true, transformation(origin = {-18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad3(P = P3, Q = Q3) annotation(Placement(visible = true, transformation(origin = {-16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(ground3.p, onePhaPQLoad3.n) annotation(Line(points = {{60, -30}, {-6, -30}, {-6, -30}, {-6, -30}}, color = {0, 0, 255}));
        connect(pin3, onePhaPQLoad3.p) annotation(Line(points = {{-90, -30}, {-26, -30}, {-26, -30}, {-26, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad1.n, ground1.p) annotation(Line(points = {{-8, 30}, {48, 30}, {48, 34}, {58, 34}, {58, 32}, {58, 32}}, color = {0, 0, 255}));
        connect(onePhaPQLoad2.n, ground2.p) annotation(Line(points = {{-8, 2}, {60, 2}, {60, 4}, {60, 4}}, color = {0, 0, 255}));
        connect(pin2, onePhaPQLoad2.p) annotation(Line(points = {{-90, 2}, {-28, 2}, {-28, 2}, {-28, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaPQLoad1.p) annotation(Line(points = {{-90, 30}, {-28, 30}, {-28, 30}, {-28, 30}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {52, 3}, extent = {{-6, 11}, {6, -11}}, textString = "YO", fontSize = 50), Line(origin = {-29.1181, 3.63736}, points = {{-28.8819, -5.63736}, {-24.8819, 8.36264}, {-22.8819, -5.63736}, {-18.8819, 6.36264}, {-18.8819, 6.36264}, {-16.8819, -5.63736}, {-12.8819, 6.36264}, {-10.8819, -3.63736}, {-8.88188, 0.362639}, {-0.881877, 0.362639}, {1.11812, 6.36264}, {3.11812, 6.36264}, {5.11812, 0.362639}, {5.11812, -3.63736}, {7.11812, -7.63736}, {9.1181, -1.63736}, {11.1181, 4.36264}, {13.1181, 6.36264}, {15.1181, 4.36264}, {15.1181, -1.63736}, {15.1181, -5.63736}, {19.1181, -7.63736}, {21.1181, -1.63736}, {23.1181, 4.36264}, {27.1181, 6.36264}, {29.1181, -1.63736}, {29.1181, -5.63736}, {29.1181, -7.63736}}), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end Y0Load;

      model Y0LoadP_FactorLag
        parameter SI.ActivePower P1 = 0.1 "Active Power";
        parameter Real Power_Factor1 = 0.1 "Reactive Power";
        parameter SI.ActivePower P2 = 0.1 "Active Power";
        parameter Real Power_Factor2 = 0.1 "Reactive Power";
        parameter SI.ActivePower P3 = 0.1 "Active Power";
        parameter Real Power_Factor3 = 0.1 "Reactive Power";
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {58, 25}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
        Ground ground2 annotation(Placement(visible = true, transformation(origin = {60, -3}, extent = {{-8, -7}, {8, 7}}, rotation = 0)));
        Ground ground3 annotation(Placement(visible = true, transformation(origin = {60, -38}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad1(P = P1, Q = P1 * sqrt(1 - Power_Factor1 ^ 2) / Power_Factor1, vRe(start = 7150)) annotation(Placement(visible = true, transformation(origin = {-18, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad2(P = P2, Q = P2 * sqrt(1 - Power_Factor2 ^ 2) / Power_Factor2, vIm(start = -6000), vRe(start = -3200)) annotation(Placement(visible = true, transformation(origin = {-18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad3(P = P3, Q = P3 * sqrt(1 - Power_Factor3 ^ 2) / Power_Factor3, vIm(start = 6000), vRe(start = -3200)) annotation(Placement(visible = true, transformation(origin = {-16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(ground3.p, onePhaPQLoad3.n) annotation(Line(points = {{60, -30}, {-6, -30}, {-6, -30}, {-6, -30}}, color = {0, 0, 255}));
        connect(pin3, onePhaPQLoad3.p) annotation(Line(points = {{-90, -30}, {-26, -30}, {-26, -30}, {-26, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad1.n, ground1.p) annotation(Line(points = {{-8, 30}, {48, 30}, {48, 34}, {58, 34}, {58, 32}, {58, 32}}, color = {0, 0, 255}));
        connect(onePhaPQLoad2.n, ground2.p) annotation(Line(points = {{-8, 2}, {60, 2}, {60, 4}, {60, 4}}, color = {0, 0, 255}));
        connect(pin2, onePhaPQLoad2.p) annotation(Line(points = {{-90, 2}, {-28, 2}, {-28, 2}, {-28, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaPQLoad1.p) annotation(Line(points = {{-90, 30}, {-28, 30}, {-28, 30}, {-28, 30}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {52, 3}, extent = {{-6, 11}, {6, -11}}, textString = "YO", fontSize = 50), Line(origin = {-29.1181, 3.63736}, points = {{-28.8819, -5.63736}, {-24.8819, 8.36264}, {-22.8819, -5.63736}, {-18.8819, 6.36264}, {-18.8819, 6.36264}, {-16.8819, -5.63736}, {-12.8819, 6.36264}, {-10.8819, -3.63736}, {-8.88188, 0.362639}, {-0.881877, 0.362639}, {1.11812, 6.36264}, {3.11812, 6.36264}, {5.11812, 0.362639}, {5.11812, -3.63736}, {7.11812, -7.63736}, {9.1181, -1.63736}, {11.1181, 4.36264}, {13.1181, 6.36264}, {15.1181, 4.36264}, {15.1181, -1.63736}, {15.1181, -5.63736}, {19.1181, -7.63736}, {21.1181, -1.63736}, {23.1181, 4.36264}, {27.1181, 6.36264}, {29.1181, -1.63736}, {29.1181, -5.63736}, {29.1181, -7.63736}}), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end Y0LoadP_FactorLag;

      model DLoad
        parameter SI.ActivePower PAB = 0.1 "Active Power";
        parameter SI.ReactivePower QAB = 0.1 "Reactive Power";
        parameter SI.ActivePower PBC = 0.1 "Active Power";
        parameter SI.ReactivePower QBC = 0.1 "Reactive Power";
        parameter SI.ActivePower PCA = 0.1 "Active Power";
        parameter SI.ReactivePower QCA = 0.1 "Reactive Power";
        ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaPQLoad onePhaPQLoad_AB(P = PAB, Q = QAB, iIm(start = 0.01), iRe(start = 0.01), vIm(start = sqrt(3) / 2), vRe(start = 1.5)) annotation(Placement(visible = true, transformation(origin = {-16, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_BC(P = PBC, Q = QBC, iIm(start = 0.01), iRe(start = 0.01), vIm(start = -sqrt(3)), vRe(start = 0)) annotation(Placement(visible = true, transformation(origin = {-18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_CA(P = PCA, Q = QCA, iIm(start = 0.01), iRe(start = 0.01), vIm(start = sqrt(3) / 2), vRe(start = -1.5)) annotation(Placement(visible = true, transformation(origin = {-16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(onePhaPQLoad_CA.n, onePhaPQLoad_AB.p) annotation(Line(points = {{-6, -30}, {-4, -30}, {-4, -46}, {-46, -46}, {-46, 42}, {-26, 42}, {-26, 32}, {-26, 32}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.n, onePhaPQLoad_CA.p) annotation(Line(points = {{-8, 2}, {2, 2}, {2, -10}, {-36, -10}, {-36, -26}, {-26, -26}, {-26, -30}, {-26, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_AB.n, onePhaPQLoad_BC.p) annotation(Line(points = {{-6, 32}, {-6, 16}, {-34, 16}, {-34, 8}, {-28, 8}, {-28, 2}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_CA.p, pin3) annotation(Line(points = {{-26, -30}, {-58, -30}, {-58, -30}, {-90, -30}, {-90, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.p, pin2) annotation(Line(points = {{-28, 2}, {-50, 2}, {-50, 2}, {-90, 2}, {-90, 2}, {-90, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaPQLoad_AB.p) annotation(Line(points = {{-90, 30}, {-26, 30}, {-26, 32}, {-26, 32}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {-30, 3}, extent = {{-6, 11}, {6, -11}}, textString = "D PQ", fontSize = 120), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end DLoad;

      model DLoad_7150V
        parameter SI.ActivePower PAB = 0.1 "Active Power";
        parameter SI.ReactivePower QAB = 0.1 "Reactive Power";
        parameter SI.ActivePower PBC = 0.1 "Active Power";
        parameter SI.ReactivePower QBC = 0.1 "Reactive Power";
        parameter SI.ActivePower PCA = 0.1 "Active Power";
        parameter SI.ReactivePower QCA = 0.1 "Reactive Power";
        ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaPQLoad onePhaPQLoad_AB(P = PAB, Q = QAB, iIm(start = 0.01), iRe(start = 0.01), vIm(start = sqrt(3) / 2), vRe(start = 1.5)) annotation(Placement(visible = true, transformation(origin = {-16, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_BC(P = PBC, Q = QBC, iIm(start = 0.01), iRe(start = 0.01), vIm(start = -sqrt(3)), vRe(start = 0)) annotation(Placement(visible = true, transformation(origin = {-18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_CA(P = PCA, Q = QCA, iIm(start = 0.01), iRe(start = 0.01), vIm(start = sqrt(3) / 2), vRe(start = -1.5)) annotation(Placement(visible = true, transformation(origin = {-16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(onePhaPQLoad_CA.n, onePhaPQLoad_AB.p) annotation(Line(points = {{-6, -30}, {-4, -30}, {-4, -46}, {-46, -46}, {-46, 42}, {-26, 42}, {-26, 32}, {-26, 32}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.n, onePhaPQLoad_CA.p) annotation(Line(points = {{-8, 2}, {2, 2}, {2, -10}, {-36, -10}, {-36, -26}, {-26, -26}, {-26, -30}, {-26, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_AB.n, onePhaPQLoad_BC.p) annotation(Line(points = {{-6, 32}, {-6, 16}, {-34, 16}, {-34, 8}, {-28, 8}, {-28, 2}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_CA.p, pin3) annotation(Line(points = {{-26, -30}, {-58, -30}, {-58, -30}, {-90, -30}, {-90, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.p, pin2) annotation(Line(points = {{-28, 2}, {-50, 2}, {-50, 2}, {-90, 2}, {-90, 2}, {-90, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaPQLoad_AB.p) annotation(Line(points = {{-90, 30}, {-26, 30}, {-26, 32}, {-26, 32}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {52, 3}, extent = {{-6, 11}, {6, -11}}, textString = "YO", fontSize = 50), Line(origin = {-29.1181, 3.63736}, points = {{-28.8819, -5.63736}, {-24.8819, 8.36264}, {-22.8819, -5.63736}, {-18.8819, 6.36264}, {-18.8819, 6.36264}, {-16.8819, -5.63736}, {-12.8819, 6.36264}, {-10.8819, -3.63736}, {-8.88188, 0.362639}, {-0.881877, 0.362639}, {1.11812, 6.36264}, {3.11812, 6.36264}, {5.11812, 0.362639}, {5.11812, -3.63736}, {7.11812, -7.63736}, {9.1181, -1.63736}, {11.1181, 4.36264}, {13.1181, 6.36264}, {15.1181, 4.36264}, {15.1181, -1.63736}, {15.1181, -5.63736}, {19.1181, -7.63736}, {21.1181, -1.63736}, {23.1181, 4.36264}, {27.1181, 6.36264}, {29.1181, -1.63736}, {29.1181, -5.63736}, {29.1181, -7.63736}}), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end DLoad_7150V;

      model DLoad_2400V
        parameter SI.ActivePower PAB = 0.1 "Active Power";
        parameter SI.ReactivePower QAB = 0.1 "Reactive Power";
        parameter SI.ActivePower PBC = 0.1 "Active Power";
        parameter SI.ReactivePower QBC = 0.1 "Reactive Power";
        parameter SI.ActivePower PCA = 0.1 "Active Power";
        parameter SI.ReactivePower QCA = 0.1 "Reactive Power";
        ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaPQLoad onePhaPQLoad_AB(P = PAB, Q = QAB, iIm(start = 0.01), iRe(start = 0.01), vIm(start = -1200), vRe(start = 2080)) annotation(Placement(visible = true, transformation(origin = {-16, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_BC(P = PBC, Q = QBC, iIm(start = 0.01), iRe(start = 0.01), vIm(start = -1200), vRe(start = -2080)) annotation(Placement(visible = true, transformation(origin = {-18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_CA(P = PCA, Q = QCA, iIm(start = 0.01), iRe(start = 0.01), vIm(start = 2400), vRe(start = 0)) annotation(Placement(visible = true, transformation(origin = {-16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(onePhaPQLoad_CA.n, onePhaPQLoad_AB.p) annotation(Line(points = {{-6, -30}, {-4, -30}, {-4, -46}, {-46, -46}, {-46, 42}, {-26, 42}, {-26, 32}, {-26, 32}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.n, onePhaPQLoad_CA.p) annotation(Line(points = {{-8, 2}, {2, 2}, {2, -10}, {-36, -10}, {-36, -26}, {-26, -26}, {-26, -30}, {-26, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_AB.n, onePhaPQLoad_BC.p) annotation(Line(points = {{-6, 32}, {-6, 16}, {-34, 16}, {-34, 8}, {-28, 8}, {-28, 2}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_CA.p, pin3) annotation(Line(points = {{-26, -30}, {-58, -30}, {-58, -30}, {-90, -30}, {-90, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.p, pin2) annotation(Line(points = {{-28, 2}, {-50, 2}, {-50, 2}, {-90, 2}, {-90, 2}, {-90, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaPQLoad_AB.p) annotation(Line(points = {{-90, 30}, {-26, 30}, {-26, 32}, {-26, 32}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {52, 3}, extent = {{-6, 11}, {6, -11}}, textString = "D", fontSize = 50), Line(origin = {-29.1181, 3.63736}, points = {{-28.8819, -5.63736}, {-24.8819, 8.36264}, {-22.8819, -5.63736}, {-18.8819, 6.36264}, {-18.8819, 6.36264}, {-16.8819, -5.63736}, {-12.8819, 6.36264}, {-10.8819, -3.63736}, {-8.88188, 0.362639}, {-0.881877, 0.362639}, {1.11812, 6.36264}, {3.11812, 6.36264}, {5.11812, 0.362639}, {5.11812, -3.63736}, {7.11812, -7.63736}, {9.1181, -1.63736}, {11.1181, 4.36264}, {13.1181, 6.36264}, {15.1181, 4.36264}, {15.1181, -1.63736}, {15.1181, -5.63736}, {19.1181, -7.63736}, {21.1181, -1.63736}, {23.1181, 4.36264}, {27.1181, 6.36264}, {29.1181, -1.63736}, {29.1181, -5.63736}, {29.1181, -7.63736}}), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end DLoad_2400V;

      model DLoad_2400VFactor_Lag
        parameter SI.ActivePower PAB = 0.1 "Active Power";
        parameter Real Power_FactorAB = 0.1 "Reactive Power";
        parameter SI.ActivePower PBC = 0.1 "Active Power";
        parameter Real Power_FactorBC = 0.1 "Reactive Power";
        parameter SI.ActivePower PCA = 0.1 "Active Power";
        parameter Real Power_FactorCA = 0.1 "Reactive Power";
        ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaPQLoad onePhaPQLoad_AB(P = PAB, Q = PAB * sqrt(1 - Power_FactorAB ^ 2) / Power_FactorAB, iIm(start = -900), iRe(start = 438), vIm(start = -466.4544), vRe(start = 3.4052e+03)) annotation(Placement(visible = true, transformation(origin = {-16, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_BC(P = PBC, Q = PBC * sqrt(1 - Power_FactorBC ^ 2) / Power_FactorBC, iIm(start = 87.2), iRe(start = -996.1947), vIm(start = -2.6597e+03), vRe(start = -2.1769e+03)) annotation(Placement(visible = true, transformation(origin = {-18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_CA(P = PCA, Q = PCA * sqrt(1 - Power_FactorCA ^ 2) / Power_FactorCA, iIm(start = 819.1520), iRe(start = 573.5764), vIm(start = 3.2172e+03), vRe(start = -1.2093e+03)) annotation(Placement(visible = true, transformation(origin = {-16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(onePhaPQLoad_CA.n, onePhaPQLoad_AB.p) annotation(Line(points = {{-6, -30}, {-4, -30}, {-4, -46}, {-46, -46}, {-46, 42}, {-26, 42}, {-26, 32}, {-26, 32}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.n, onePhaPQLoad_CA.p) annotation(Line(points = {{-8, 2}, {2, 2}, {2, -10}, {-36, -10}, {-36, -26}, {-26, -26}, {-26, -30}, {-26, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_AB.n, onePhaPQLoad_BC.p) annotation(Line(points = {{-6, 32}, {-6, 16}, {-34, 16}, {-34, 8}, {-28, 8}, {-28, 2}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_CA.p, pin3) annotation(Line(points = {{-26, -30}, {-58, -30}, {-58, -30}, {-90, -30}, {-90, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.p, pin2) annotation(Line(points = {{-28, 2}, {-50, 2}, {-50, 2}, {-90, 2}, {-90, 2}, {-90, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaPQLoad_AB.p) annotation(Line(points = {{-90, 30}, {-26, 30}, {-26, 32}, {-26, 32}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {52, 3}, extent = {{-6, 11}, {6, -11}}, textString = "D", fontSize = 50), Line(origin = {-29.1181, 3.63736}, points = {{-28.8819, -5.63736}, {-24.8819, 8.36264}, {-22.8819, -5.63736}, {-18.8819, 6.36264}, {-18.8819, 6.36264}, {-16.8819, -5.63736}, {-12.8819, 6.36264}, {-10.8819, -3.63736}, {-8.88188, 0.362639}, {-0.881877, 0.362639}, {1.11812, 6.36264}, {3.11812, 6.36264}, {5.11812, 0.362639}, {5.11812, -3.63736}, {7.11812, -7.63736}, {9.1181, -1.63736}, {11.1181, 4.36264}, {13.1181, 6.36264}, {15.1181, 4.36264}, {15.1181, -1.63736}, {15.1181, -5.63736}, {19.1181, -7.63736}, {21.1181, -1.63736}, {23.1181, 4.36264}, {27.1181, 6.36264}, {29.1181, -1.63736}, {29.1181, -5.63736}, {29.1181, -7.63736}}), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end DLoad_2400VFactor_Lag;

      model Z_Load
        extends Interfaces.OnePhaseBranch;
        parameter SI.ActivePower P = 0.1 "Active Power";
        parameter SI.ReactivePower Q = 0.1 "Reactive Power";
      equation
        vRe = R * iRe - X * iIm;
        vIm = R * iIm + X * iRe;
        annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-100, 0}, {-70, 0}}), Line(points = {{70, 0}, {100, 0}}), Text(extent = {{-144, -60}, {144, -100}}, lineColor = {0, 0, 0}, textString = "Z"), Text(extent = {{-144, 50}, {144, 110}}, lineColor = {0, 0, 255}, textString = "%name")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}), Line(points = {{-100, 0}, {-70, 0}}), Line(points = {{70, 0}, {100, 0}})}), Window(x = 0.2, y = 0.06, width = 0.62, height = 0.69));
      end Z_Load;

      model DLoad_2400VFactor_Lag1
        parameter SI.ActivePower PAB = 0.1 "Active Power";
        parameter Real Power_FactorAB = 0.1 "Reactive Power";
        parameter SI.ActivePower PBC = 0.1 "Active Power";
        parameter Real Power_FactorBC = 0.1 "Reactive Power";
        parameter SI.ActivePower PCA = 0.1 "Active Power";
        parameter Real Power_FactorCA = 0.1 "Reactive Power";
        ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaPQLoad onePhaPQLoad_AB(P = PAB, Q = PAB * sqrt(1 - Power_FactorAB ^ 2) / Power_FactorAB, iIm(start = -900), iRe(start = 438), vIm(start = -466.4544), vRe(start = 3.4052e+03)) annotation(Placement(visible = true, transformation(origin = {-18, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_BC(P = PBC, Q = PBC * sqrt(1 - Power_FactorBC ^ 2) / Power_FactorBC, iIm(start = 87.2), iRe(start = -996.1947), vIm(start = -2.6597e+03), vRe(start = -2.1769e+03)) annotation(Placement(visible = true, transformation(origin = {-18, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaPQLoad onePhaPQLoad_CA(P = PCA, Q = PCA * sqrt(1 - Power_FactorCA ^ 2) / Power_FactorCA, iIm(start = 819.1520), iRe(start = 573.5764), vIm(start = 3.2172e+03), vRe(start = -1.2093e+03)) annotation(Placement(visible = true, transformation(origin = {-16, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      initial equation
        onePhaPQLoad_AB.vRe = 0;
        onePhaPQLoad_AB.vIm = 0;
//, vnIm = 4180 * cos(2 * Modelica.Constants.pi / 3), vnRe = 4180 * cos(2 * Modelica.Constants.pi / 3)
        onePhaPQLoad_BC.vRe = 0;
        onePhaPQLoad_BC.vIm = 0;
        onePhaPQLoad_CA.vRe = 0;
        onePhaPQLoad_CA.vIm = 0;
        onePhaPQLoad_AB.iRe = 0;
        onePhaPQLoad_AB.iIm = 0;
        onePhaPQLoad_BC.iRe = 0;
        onePhaPQLoad_BC.iIm = 0;
        onePhaPQLoad_CA.iRe = 0;
        onePhaPQLoad_CA.iIm = 0;
      equation
        connect(pin1, onePhaPQLoad_AB.p) annotation(Line(points = {{-90, 30}, {-28, 30}, {-28, 32}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_AB.n, onePhaPQLoad_BC.p) annotation(Line(points = {{-8, 32}, {-8, 16}, {-34, 16}, {-34, 8}, {-28, 8}, {-28, 2}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_CA.n, onePhaPQLoad_AB.p) annotation(Line(points = {{-6, -30}, {-4, -30}, {-4, -46}, {-46, -46}, {-46, 42}, {-28, 42}, {-28, 32}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.n, onePhaPQLoad_CA.p) annotation(Line(points = {{-8, 2}, {2, 2}, {2, -10}, {-36, -10}, {-36, -26}, {-26, -26}, {-26, -30}, {-26, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_CA.p, pin3) annotation(Line(points = {{-26, -30}, {-58, -30}, {-58, -30}, {-90, -30}, {-90, -30}}, color = {0, 0, 255}));
        connect(onePhaPQLoad_BC.p, pin2) annotation(Line(points = {{-28, 2}, {-50, 2}, {-50, 2}, {-90, 2}, {-90, 2}, {-90, 2}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {52, 3}, extent = {{-6, 11}, {6, -11}}, textString = "D", fontSize = 50), Line(origin = {-29.1181, 3.63736}, points = {{-28.8819, -5.63736}, {-24.8819, 8.36264}, {-22.8819, -5.63736}, {-18.8819, 6.36264}, {-18.8819, 6.36264}, {-16.8819, -5.63736}, {-12.8819, 6.36264}, {-10.8819, -3.63736}, {-8.88188, 0.362639}, {-0.881877, 0.362639}, {1.11812, 6.36264}, {3.11812, 6.36264}, {5.11812, 0.362639}, {5.11812, -3.63736}, {7.11812, -7.63736}, {9.1181, -1.63736}, {11.1181, 4.36264}, {13.1181, 6.36264}, {15.1181, 4.36264}, {15.1181, -1.63736}, {15.1181, -5.63736}, {19.1181, -7.63736}, {21.1181, -1.63736}, {23.1181, 4.36264}, {27.1181, 6.36264}, {29.1181, -1.63736}, {29.1181, -5.63736}, {29.1181, -7.63736}}), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end DLoad_2400VFactor_Lag1;

      model Y0Load2
        extends Interfaces.ThreePort;
        parameter SI.ActivePower P = 0.1 "Active Power";
        parameter SI.ReactivePower Q = 0.1 "Reactive Power";
        Real vARe;
        //brach voltage
        Real vBRe;
        Real vCRe;
        Real vAIm;
        //brach voltage
        Real vBIm;
        Real vCIm;
        Real iARe;
        //brach i
        Real iBRe;
        Real iCRe;
        Real iAIm;
        //brach  i
        Real iBIm;
        Real iCIm;
      equation
        vARe = pA.vRe - 0;
        vBRe = pB.vRe - 0;
        vCRe = pC.vRe - 0;
        vAIm = pA.vIm - 0;
        vBIm = pB.vIm - 0;
        vCIm = pC.vIm - 0;
        pA.iRe = iARe;
        pB.iRe = iBRe;
        pC.iRe = iCRe;
        pA.iIm = iAIm;
        pB.iIm = iBIm;
        pC.iIm = iCIm;
        vARe * iARe + vAIm * iAIm = P;
        (-vARe * iAIm) + vAIm * iARe = Q;
        vBRe * iBRe + vBIm * iBIm = P;
        (-vBRe * iBIm) + vBIm * iBRe = Q;
        vCRe * iCRe + vCIm * iCIm = P;
        (-vCRe * iCIm) + vCIm * iCRe = Q;
        annotation(Icon(graphics = {Text(origin = {94, 76}, extent = {{-10, 14}, {10, -14}}, textString = "A", fontSize = 50), Rectangle(origin = {15, 13}, extent = {{-47, 27}, {47, -27}})}, coordinateSystem(initialScale = 0.1)));
      end Y0Load2;

      model DLoad2
        extends Interfaces.ThreePort;
        parameter SI.ActivePower P1 = 0.1 "Active Power";
        parameter SI.ReactivePower Q1 = 0.1 "Reactive Power";
        parameter SI.ActivePower P2 = 0.1 "Active Power";
        parameter SI.ReactivePower Q2 = 0.1 "Reactive Power";
        parameter SI.ActivePower P3 = 0.1 "Active Power";
        parameter SI.ReactivePower Q3 = 0.1 "Reactive Power";
        Real vABRe;
        //brach voltage
        Real vBCRe;
        Real vCARe;
        Real vABIm;
        //brach voltage
        Real vBCIm;
        Real vCAIm;
        Real iABRe;
        //brach i
        Real iBCRe;
        Real iCARe;
        Real iABIm;
        //brach  i
        Real iBCIm;
        Real iCAIm;
      equation
        pA.vRe - vABRe = pB.vRe;
        pB.vRe - vBCRe = pC.vRe;
        pC.vRe - vCARe = pA.vRe;
        pA.vIm - vABIm = pB.vIm;
        pB.vIm - vBCIm = pC.vIm;
        pC.vIm - vCAIm = pA.vIm;
        pA.iRe + iCARe = iABRe;
        pB.iRe + iABRe = iBCRe;
        pC.iRe + iBCRe = iCARe;
        pA.iIm + iCAIm = iABIm;
        pB.iIm + iABIm = iBCIm;
        pC.iIm + iBCIm = iCAIm;
        vABRe * iABRe + vABIm * iABIm = P1;
        (-vABRe * iABIm) + vABIm * iABRe = Q1;
        vBCRe * iBCRe + vBCIm * iBCIm = P2;
        (-vBCRe * iBCIm) + vBCIm * iBCRe = Q2;
        vCARe * iCARe + vCAIm * iCAIm = P3;
        (-vCARe * iCAIm) + vCAIm * iCARe = Q3;
        annotation(Icon(graphics = {Text(origin = {87, 75}, extent = {{-11, 17}, {11, -17}}, textString = "A", fontSize = 50), Rectangle(origin = {22, 11}, extent = {{-42, 29}, {42, -29}})}));
      end DLoad2;

      model Y0LoadP_FactorLag2
        extends Interfaces.ThreePort;
        //parameter SI.ActivePower P = 0.1 "Active Power";
        // parameter SI.ReactivePower Q = 0.1 "Reactive Power";
        parameter SI.ActivePower P1 = 0.1 "Active Power";
        parameter Real Power_Factor1 = 0.1 "Reactive Power";
        parameter SI.ActivePower P2 = 0.1 "Active Power";
        parameter Real Power_Factor2 = 0.1 "Reactive Power";
        parameter SI.ActivePower P3 = 0.1 "Active Power";
        parameter Real Power_Factor3 = 0.1 "Reactive Power";
        Real vARe;
        //brach voltage
        Real vBRe;
        Real vCRe;
        Real vAIm;
        //brach voltage
        Real vBIm;
        Real vCIm;
        Real iARe;
        //brach i
        Real iBRe;
        Real iCRe;
        Real iAIm;
        //brach  i
        Real iBIm;
        Real iCIm;
      equation
        vARe = pA.vRe - 0;
        vBRe = pB.vRe - 0;
        vCRe = pC.vRe - 0;
        vAIm = pA.vIm - 0;
        vBIm = pB.vIm - 0;
        vCIm = pC.vIm - 0;
        pA.iRe = iARe;
        pB.iRe = iBRe;
        pC.iRe = iCRe;
        pA.iIm = iAIm;
        pB.iIm = iBIm;
        pC.iIm = iCIm;
        vARe * iARe + vAIm * iAIm = P1;
        (-vARe * iAIm) + vAIm * iARe = P1 * sqrt(1 - Power_Factor1 ^ 2) / Power_Factor1;
        vBRe * iBRe + vBIm * iBIm = P2;
        (-vBRe * iBIm) + vBIm * iBRe = P2 * sqrt(1 - Power_Factor2 ^ 2) / Power_Factor2;
        vCRe * iCRe + vCIm * iCIm = P3;
        (-vCRe * iCIm) + vCIm * iCRe = P3 * sqrt(1 - Power_Factor3 ^ 2) / Power_Factor3;
        annotation(Icon(graphics = {Text(origin = {94, 76}, extent = {{-10, 14}, {10, -14}}, textString = "A", fontSize = 50), Rectangle(origin = {15, 13}, extent = {{-47, 27}, {47, -27}}), Text(origin = {16, 12}, extent = {{-24, 12}, {24, -12}}, textString = "Y0", fontSize = 180)}, coordinateSystem(initialScale = 0.1)));
      end Y0LoadP_FactorLag2;

      model DLoadP_FactorLag2
        extends Interfaces.ThreePort;
        // parameter SI.ActivePower P = 0.1 "Active Power";
        //parameter SI.ReactivePower Q = 0.1 "Reactive Power";
        parameter SI.ActivePower P1 = 0.1 "Active Power";
        parameter Real Power_Factor1 = 0.1 "Reactive Power";
        parameter SI.ActivePower P2 = 0.1 "Active Power";
        parameter Real Power_Factor2 = 0.1 "Reactive Power";
        parameter SI.ActivePower P3 = 0.1 "Active Power";
        parameter Real Power_Factor3 = 0.1 "Reactive Power";
        Real vABRe;
        //brach voltage
        Real vBCRe;
        Real vCARe;
        Real vABIm;
        //brach voltage
        Real vBCIm;
        Real vCAIm;
        Real iABRe;
        //brach i
        Real iBCRe;
        Real iCARe;
        Real iABIm;
        //brach  i
        Real iBCIm;
        Real iCAIm;
        //initial equation
        //  pA.vRe - vABRe = pB.vRe;
        //  pB.vRe - vBCRe = pC.vRe;
        //  pC.vRe - vCARe = pA.vRe;
        //  pA.vIm - vABIm = pB.vIm;
        //  pB.vIm - vBCIm = pC.vIm;
        //  pC.vIm - vCAIm = pA.vIm;
        //  pA.iRe + iCARe = iABRe;
        //  pB.iRe + iABRe = iBCRe;
        //  pC.iRe + iBCRe = iCARe;
        //  pA.iIm + iCAIm = iABIm;
        //  pB.iIm + iABIm = iBCIm;
        //  pC.iIm + iBCIm = iCAIm;
        //  iABRe=0;
        //  iABIm=0;
        //  iBCRe=0;
        //  iBCIm=0;
        //  iCARe=0;
        //  iCAIm=0;
      equation
        pA.vRe - vABRe = pB.vRe;
        pB.vRe - vBCRe = pC.vRe;
        pC.vRe - vCARe = pA.vRe;
        pA.vIm - vABIm = pB.vIm;
        pB.vIm - vBCIm = pC.vIm;
        pC.vIm - vCAIm = pA.vIm;
        pA.iRe + iCARe = iABRe;
        pB.iRe + iABRe = iBCRe;
        pC.iRe + iBCRe = iCARe;
        pA.iIm + iCAIm = iABIm;
        pB.iIm + iABIm = iBCIm;
        pC.iIm + iBCIm = iCAIm;
        if time == 0 then
          iABRe = 0.1;
          iABIm = 0.1;
          iBCRe = 0.1;
          iBCIm = 0.1;
          iCARe = 0.1;
          iCAIm = 0.1;
        else
          vABRe * iABRe + vABIm * iABIm = P1;
          (-vABRe * iABIm) + vABIm * iABRe = P1 * sqrt(1 - Power_Factor1 ^ 2) / Power_Factor1;
          vBCRe * iBCRe + vBCIm * iBCIm = P2;
          (-vBCRe * iBCIm) + vBCIm * iBCRe = P2 * sqrt(1 - Power_Factor2 ^ 2) / Power_Factor2;
          vCARe * iCARe + vCAIm * iCAIm = P3;
          (-vCARe * iCAIm) + vCAIm * iCARe = P3 * sqrt(1 - Power_Factor3 ^ 2) / Power_Factor3;
        end if;
        annotation(Icon(graphics = {Text(origin = {87, 75}, extent = {{-11, 17}, {11, -17}}, textString = "A", fontSize = 50), Rectangle(origin = {22, 11}, extent = {{-42, 29}, {42, -29}}), Text(origin = {21, 12}, extent = {{-19, 14}, {19, -14}}, textString = "D", fontSize = 200)}, coordinateSystem(initialScale = 0.1)));
      end DLoadP_FactorLag2;
    end ThreePhaPQLoad;

    model ThreePhaseShunt
      extends Interfaces.ThreePhaseBranch;
      parameter Real G11 = 1 "G11";
      parameter Real G12 = 1;
      parameter Real G13 = 1;
      parameter Real G21 = 1;
      parameter Real G22 = 1;
      parameter Real G23 = 1;
      parameter Real G31 = 1;
      parameter Real G32 = 1;
      parameter Real G33 = 1;
      parameter Real B11 = 1 "G11";
      parameter Real B12 = 1;
      parameter Real B13 = 1;
      parameter Real B21 = 1;
      parameter Real B22 = 1;
      parameter Real B23 = 1;
      parameter Real B31 = 1;
      parameter Real B32 = 1;
      parameter Real B33 = 1;
    equation
      i1Re = G11 * v1Re + G12 * v2Re + G13 * v3Re - B11 * v1Im - B12 * v2Im - B13 * v3Im;
      i2Re = G21 * v1Re + G22 * v2Re + G23 * v3Re - B21 * v1Im - B22 * v2Im - B23 * v3Im;
      i3Re = G31 * v1Re + G32 * v2Re + G33 * v3Re - B31 * v1Im - B32 * v2Im - B33 * v3Im;
      i1Im = B11 * v1Re + B12 * v2Re + B13 * v3Re + G11 * v1Im + G12 * v2Im + G13 * v3Im;
      i2Im = B21 * v1Re + B22 * v2Re + B23 * v3Re + G21 * v1Im + G22 * v2Im + G23 * v3Im;
      i3Im = B31 * v1Re + B32 * v2Re + B33 * v3Re + G31 * v1Im + G32 * v2Im + G33 * v3Im;
      annotation(Icon(graphics = {Polygon(origin = {-85.0097, -3.34916}, points = {{-4.99029, 25.3492}, {-4.99029, -24.6508}, {3.00971, -20.6508}, {-4.99029, 25.3492}, {5.00971, -24.6508}, {-4.99029, 25.3492}}), Polygon(origin = {2.57103, -2.40055}, points = {{-4.57103, 28.4006}, {-6.57103, -27.5994}, {7.42897, -25.5994}, {5.42897, -25.5994}, {5.42897, -23.5994}, {-4.57103, 28.4006}}), Polygon(origin = {91.9976, -3.44855}, points = {{-1.99764, 29.4486}, {-3.99764, -28.5514}, {4.00236, -28.5514}, {-1.99764, 29.4486}})}, coordinateSystem(initialScale = 0.1)));
    end ThreePhaseShunt;

    model Y0ThreePhaVSource
      parameter SI.Voltage Vmag1 = 1;
      parameter SI.Angle Vangle1 = 0;
      parameter SI.Voltage Vmag2 = 1;
      parameter SI.Angle Vangle2 = 0;
      parameter SI.Voltage Vmag3 = 1;
      parameter SI.Angle Vangle3 = 0;
      VoltageSource voltageSource1(Vangle = Vangle1, Vmag = Vmag1, vRe(start = 7200)) annotation(Placement(visible = true, transformation(origin = {4, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      VoltageSource voltageSource2(Vangle = Vangle2, Vmag = Vmag2, vIm(start = -6235), vRe(start = -3200)) annotation(Placement(visible = true, transformation(origin = {2, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      VoltageSource voltageSource3(Vangle = Vangle3, Vmag = Vmag3, vIm(start = 6235), vRe(start = -3500)) annotation(Placement(visible = true, transformation(origin = {4, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {94, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {92, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Ground ground1 annotation(Placement(visible = true, transformation(origin = {-52, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(voltageSource3.p, pin3) annotation(Line(points = {{14, -30}, {34, -30}, {34, -64}, {94, -64}, {94, -64}}, color = {0, 0, 255}));
      connect(voltageSource2.p, pin2) annotation(Line(points = {{12, 2}, {42, 2}, {42, 6}, {92, 6}, {92, 6}}, color = {0, 0, 255}));
      connect(voltageSource1.p, pin1) annotation(Line(points = {{14, 36}, {18, 36}, {18, 76}, {94, 76}, {94, 76}}, color = {0, 0, 255}));
      connect(voltageSource1.n, ground1.p) annotation(Line(points = {{-6, 36}, {-68, 36}, {-68, -36}, {-68, -36}, {-68, -46}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
      connect(voltageSource2.n, ground1.p) annotation(Line(points = {{-8, 2}, {-84, 2}, {-84, -48}, {-52, -48}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
      connect(voltageSource3.n, ground1.p) annotation(Line(points = {{-6, -30}, {-42, -30}, {-42, -30}, {-52, -30}, {-52, -46}, {-52, -46}}, color = {0, 0, 255}));
      annotation(Icon(graphics = {Ellipse(origin = {-19, 10}, extent = {{-53, 56}, {83, -82}}, endAngle = 360), Text(origin = {-7, -1}, extent = {{-1, -1}, {1, 1}}, textString = "Y0", fontSize = 500, fontName = "DejaVu Sans Mono"), Text(origin = {66, 78}, extent = {{4, -2}, {-4, 2}}, textString = "A", fontSize = 50), Text(extent = {{74, 6}, {74, 6}}, textString = "B", fontSize = 50), Text(origin = {67, -66}, extent = {{-1, 0}, {1, 0}}, textString = "C", fontSize = 50), Text(origin = {72, 8}, extent = {{4, -2}, {-4, 2}}, textString = "B", fontSize = 50), Text(origin = {67, -67}, extent = {{-19, -21}, {19, 21}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
    end Y0ThreePhaVSource;

    package ThreePhaseTransformer
      model GrYGrY
        parameter Real N1 = 0.1;
        parameter Real N2 = 0.1;
        parameter Real Vb = 0.1 "kV";
        parameter Real Sb = 0.1 "kVA";
        parameter Real Rp = 0.1 "%";
        parameter Real Xp = 0.1 "%";
        //Sb % %vb;
        IdealTransformer idealTransformer1(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {10, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.IdealTransformer idealTransformer2(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {4, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        IdealTransformer idealTransformer3(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {10, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin annotation(Placement(visible = true, transformation(origin = {-90, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n annotation(Placement(visible = true, transformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n1 annotation(Placement(visible = true, transformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n2 annotation(Placement(visible = true, transformation(origin = {94, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {-14, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance1(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {56, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance2(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance3(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {64, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(idealTransformer2.n1, ground1.p) annotation(Line(points = {{-6, -8}, {-50, -8}, {-50, -92}, {-24, -92}, {-24, -88}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(onePhaseImpedance1.n, pin_n) annotation(Line(points = {{66, 64}, {80, 64}, {80, 60}, {96, 60}, {96, 60}}, color = {0, 0, 255}));
        connect(onePhaseImpedance1.p, idealTransformer1.p2) annotation(Line(points = {{46, 64}, {20, 64}, {20, 62}, {20, 62}}, color = {0, 0, 255}));
        connect(onePhaseImpedance2.n, pin_n1) annotation(Line(points = {{68, 0}, {94, 0}, {94, 0}, {94, 0}}, color = {0, 0, 255}));
        connect(onePhaseImpedance3.n, pin_n2) annotation(Line(points = {{74, -62}, {94, -62}, {94, -62}, {94, -62}}, color = {0, 0, 255}));
        connect(idealTransformer3.p2, onePhaseImpedance3.p) annotation(Line(points = {{20, -60}, {48, -60}, {48, -62}, {54, -62}, {54, -62}}, color = {0, 0, 255}));
        connect(pin1, idealTransformer2.p1) annotation(Line(points = {{-90, 2}, {-72, 2}, {-72, -2}, {-6, -2}, {-6, 1}}, color = {0, 0, 255}));
        connect(idealTransformer2.p2, onePhaseImpedance2.p) annotation(Line(points = {{14, 1}, {42, 1}, {42, 0}, {48, 0}}, color = {0, 0, 255}));
        connect(idealTransformer2.n2, ground1.p) annotation(Line(points = {{14, -9}, {44, -9}, {44, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(idealTransformer1.n2, ground1.p) annotation(Line(points = {{20, 52}, {24, 52}, {24, 10}, {-36, 10}, {-36, -88}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(idealTransformer3.n2, ground1.p) annotation(Line(points = {{20, -70}, {20, -70}, {20, -80}, {-26, -80}, {-26, -88}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(idealTransformer3.n1, ground1.p) annotation(Line(points = {{0, -70}, {2, -70}, {2, -90}, {-14, -90}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(pin2, idealTransformer3.p1) annotation(Line(points = {{-90, -60}, {-88, -60}, {-88, -32}, {0, -32}, {0, -60}, {0, -60}}, color = {0, 0, 255}));
        connect(idealTransformer1.p1, pin) annotation(Line(points = {{0, 62}, {-90, 62}, {-90, 58}, {-90, 58}}, color = {0, 0, 255}));
        connect(idealTransformer1.n1, ground1.p) annotation(Line(points = {{0, 50}, {-10, 50}, {-10, -74}, {-14, -74}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Text(origin = {-62, 56}, extent = {{-6, 4}, {6, -4}}, textString = "A", fontSize = 50), Text(origin = {-62, 8}, extent = {{-6, 4}, {6, -4}}, textString = "B", fontSize = 50), Text(origin = {-62, -58}, extent = {{-6, 4}, {6, -4}}, textString = "C", fontSize = 50), Ellipse(origin = {-21, 2}, extent = {{-37, 52}, {39, -50}}, endAngle = 360), Ellipse(origin = {25, 1}, extent = {{43, 53}, {-35, -51}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
      end GrYGrY;

      model GrYD
        parameter Real N1 = 0.1;
        parameter Real N2 = 0.1;
        parameter Real Vb = 0.1 "kV";
        parameter Real Sb = 0.1 "kVA";
        parameter Real Rp = 0.1 "%";
        parameter Real Xp = 0.1 "%";
        //Sb % %vb;
        IdealTransformer idealTransformer1(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {10, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.IdealTransformer idealTransformer2(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {4, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        IdealTransformer idealTransformer3(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {10, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin annotation(Placement(visible = true, transformation(origin = {-90, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n annotation(Placement(visible = true, transformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n1 annotation(Placement(visible = true, transformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n2 annotation(Placement(visible = true, transformation(origin = {94, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {-14, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance1(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {56, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance2(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance3(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {64, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(idealTransformer3.n2, ground1.p) annotation(Line(points = {{20, -70}, {20, -70}, {20, -88}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(onePhaseImpedance2.n, pin_n1) annotation(Line(points = {{68, 0}, {68, 0}, {68, 18}, {94, 18}, {94, 0}, {94, 0}}, color = {0, 0, 255}));
        connect(onePhaseImpedance1.n, pin_n) annotation(Line(points = {{66, 64}, {68, 64}, {68, 82}, {96, 82}, {96, 60}, {96, 60}}, color = {0, 0, 255}));
        connect(idealTransformer2.n2, onePhaseImpedance1.n) annotation(Line(points = {{14, -8}, {30, -8}, {30, 38}, {74, 38}, {74, 64}, {66, 64}, {66, 64}}, color = {0, 0, 255}));
        connect(idealTransformer3.n2, onePhaseImpedance2.n) annotation(Line(points = {{20, -70}, {44, -70}, {44, -10}, {74, -10}, {74, 0}, {68, 0}, {68, 0}}, color = {0, 0, 255}));
        connect(idealTransformer1.n2, onePhaseImpedance3.n) annotation(Line(points = {{20, 52}, {78, 52}, {78, -42}, {74, -42}, {74, -62}, {74, -62}}, color = {0, 0, 255}));
        connect(onePhaseImpedance3.n, pin_n2) annotation(Line(points = {{74, -62}, {76, -62}, {76, -76}, {94, -76}, {94, -62}, {94, -62}}, color = {0, 0, 255}));
        connect(idealTransformer2.n1, ground1.p) annotation(Line(points = {{-6, -8}, {-50, -8}, {-50, -92}, {-24, -92}, {-24, -88}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(onePhaseImpedance1.p, idealTransformer1.p2) annotation(Line(points = {{46, 64}, {20, 64}, {20, 62}, {20, 62}}, color = {0, 0, 255}));
        connect(idealTransformer3.p2, onePhaseImpedance3.p) annotation(Line(points = {{20, -60}, {48, -60}, {48, -62}, {54, -62}, {54, -62}}, color = {0, 0, 255}));
        connect(pin1, idealTransformer2.p1) annotation(Line(points = {{-90, 2}, {-72, 2}, {-72, -2}, {-6, -2}, {-6, 1}}, color = {0, 0, 255}));
        connect(idealTransformer2.p2, onePhaseImpedance2.p) annotation(Line(points = {{14, 1}, {42, 1}, {42, 0}, {48, 0}}, color = {0, 0, 255}));
        connect(idealTransformer3.n1, ground1.p) annotation(Line(points = {{0, -70}, {2, -70}, {2, -90}, {-14, -90}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(pin2, idealTransformer3.p1) annotation(Line(points = {{-90, -60}, {-88, -60}, {-88, -32}, {0, -32}, {0, -60}, {0, -60}}, color = {0, 0, 255}));
        connect(idealTransformer1.p1, pin) annotation(Line(points = {{0, 62}, {-90, 62}, {-90, 58}, {-90, 58}}, color = {0, 0, 255}));
        connect(idealTransformer1.n1, ground1.p) annotation(Line(points = {{0, 50}, {-10, 50}, {-10, -74}, {-14, -74}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Text(origin = {-62, 56}, extent = {{-6, 4}, {6, -4}}, textString = "A", fontSize = 50), Text(origin = {-62, 8}, extent = {{-6, 4}, {6, -4}}, textString = "B", fontSize = 50), Text(origin = {-62, -58}, extent = {{-6, 4}, {6, -4}}, textString = "C", fontSize = 50), Ellipse(origin = {-21, 2}, extent = {{-37, 52}, {39, -50}}, endAngle = 360), Ellipse(origin = {25, 1}, extent = {{43, 53}, {-35, -51}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
      end GrYD;

      model GrYD1
        parameter Real N1 = 0.1;
        parameter Real N2 = 0.1;
        parameter Real Vb = 0.1 "kV";
        parameter Real Sb = 0.1 "kVA";
        parameter Real Rp = 0.1 "%";
        parameter Real Xp = 0.1 "%";
        ADN_Modelica.Basic.IdealTransformer idealTransformer1(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {-28, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.IdealTransformer idealTransformer2(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {-28, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.IdealTransformer idealTransformer3(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {-28, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaseImpedance onePhaseImpedance1(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {34, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaseImpedance onePhaseImpedance2(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {34, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaseImpedance onePhaseImpedance3(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {34, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.FRNode pinA annotation(Placement(visible = true, transformation(origin = {-92, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.FRNode pinB annotation(Placement(visible = true, transformation(origin = {-92, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.FRNode pinC annotation(Placement(visible = true, transformation(origin = {-90, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.TONode pin_a annotation(Placement(visible = true, transformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.TONode pin_b annotation(Placement(visible = true, transformation(origin = {96, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.TONode pin_c annotation(Placement(visible = true, transformation(origin = {96, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-19, -80}, extent = {{-13, -12}, {13, 12}}, rotation = 0)));
      equation
        connect(idealTransformer3.n2, ground1.p) annotation(Line(points = {{-18, -34}, {-18, -34}, {-18, -50}, {-8, -50}, {-8, -68}, {-18, -68}, {-18, -68}}, color = {0, 0, 255}));
        connect(onePhaseImpedance3.n, pin_c) annotation(Line(points = {{44, -26}, {44, -26}, {44, -22}, {96, -22}, {96, -22}}, color = {0, 0, 255}));
        connect(onePhaseImpedance2.n, pin_b) annotation(Line(points = {{44, 14}, {96, 14}, {96, 16}, {96, 16}}, color = {0, 0, 255}));
        connect(onePhaseImpedance1.n, pin_a) annotation(Line(points = {{44, 54}, {44, 54}, {44, 60}, {96, 60}, {96, 60}}, color = {0, 0, 255}));
        connect(idealTransformer2.n2, onePhaseImpedance1.n) annotation(Line(points = {{-18, 6}, {74, 6}, {74, 56}, {44, 56}, {44, 54}, {44, 54}, {44, 54}}, color = {0, 0, 255}));
        connect(onePhaseImpedance2.p, idealTransformer2.p2) annotation(Line(points = {{24, 14}, {-18, 14}, {-18, 16}, {-18, 16}}, color = {0, 0, 255}));
        connect(idealTransformer3.n2, onePhaseImpedance2.n) annotation(Line(points = {{-18, -34}, {68, -34}, {68, 16}, {44, 16}, {44, 14}, {44, 14}}, color = {0, 0, 255}));
        connect(onePhaseImpedance3.p, idealTransformer3.p2) annotation(Line(points = {{24, -26}, {-18, -26}, {-18, -24}, {-18, -24}}, color = {0, 0, 255}));
        connect(idealTransformer1.n2, onePhaseImpedance3.n) annotation(Line(points = {{-18, 46}, {2, 46}, {2, 44}, {56, 44}, {56, -26}, {44, -26}, {44, -26}}, color = {0, 0, 255}));
        connect(idealTransformer1.p2, onePhaseImpedance1.p) annotation(Line(points = {{-18, 56}, {24, 56}, {24, 54}, {24, 54}}, color = {0, 0, 255}));
        connect(idealTransformer3.n1, ground1.p) annotation(Line(points = {{-38, -34}, {-46, -34}, {-46, -60}, {-18, -60}, {-18, -68}, {-18, -68}}, color = {0, 0, 255}));
        connect(idealTransformer2.n1, ground1.p) annotation(Line(points = {{-38, 6}, {-52, 6}, {-52, -64}, {-18, -64}, {-18, -68}, {-18, -68}}, color = {0, 0, 255}));
        connect(idealTransformer1.n1, ground1.p) annotation(Line(points = {{-38, 46}, {-56, 46}, {-56, -68}, {-18, -68}, {-18, -68}}, color = {0, 0, 255}));
        connect(pinC, idealTransformer3.p1) annotation(Line(points = {{-90, -26}, {-38, -26}, {-38, -24}, {-38, -24}}, color = {0, 0, 255}));
        connect(pinB, idealTransformer2.p1) annotation(Line(points = {{-92, 14}, {-38, 14}, {-38, 16}, {-38, 16}}, color = {0, 0, 255}));
        connect(pinA, idealTransformer1.p1) annotation(Line(points = {{-92, 54}, {-38, 54}, {-38, 56}, {-38, 56}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Text(origin = {-68, 49}, extent = {{-12, 17}, {12, -17}}, textString = "A", fontSize = 50), Text(origin = {-67, 9}, extent = {{-9, 17}, {9, -17}}, textString = "B", fontSize = 50), Text(origin = {-69, -31}, extent = {{-9, 17}, {9, -17}}, textString = "C", fontSize = 50), Ellipse(origin = {-17, 4}, extent = {{-29, 48}, {35, -50}}, endAngle = 360), Ellipse(origin = {26, 4}, extent = {{-30, 50}, {34, -50}}, endAngle = 360)}));
      end GrYD1;

      model GrYD2
        extends Interfaces.SixPort;
        parameter Real k = 1;
        parameter Real R = 0.1;
        parameter Real X = 0.1;
        Real vaRe;
        //brach voltage
        Real vbRe;
        Real vcRe;
        Real vaIm;
        //brach voltage
        Real vbIm;
        Real vcIm;
        Real vnodeaRe;
        Real vnodebRe;
        Real vnodecRe;
        Real vnodeaIm;
        Real vnodebIm;
        Real vnodecIm;
        Real vARe;
        //right side branch voltage
        Real vBRe;
        Real vCRe;
        Real vAIm;
        Real vBIm;
        Real vCIm;
        Real iaRe;
        Real ibRe;
        Real icRe;
        Real iaIm;
        Real ibIm;
        Real icIm;
        Real iARe;
        Real iBRe;
        Real iCRe;
        Real iAIm;
        Real iBIm;
        Real iCIm;
        Real UZRea;
        //Zbranch voltage
        Real UZReb;
        Real UZRec;
        Real UZIma;
        Real UZImb;
        Real UZImc;
        Real igroundaRe;
        Real igroundaIm;
      equation
        pa.vRe - 0 = vaRe;
        pb.vRe - 0 = vbRe;
        pc.vRe - 0 = vcRe;
        pa.vIm - 0 = vaIm;
        pb.vIm - 0 = vbIm;
        pc.vIm - 0 = vcIm;
        na.vRe = 0;
        na.vIm = 0;
        vARe = vnodeaRe - nb.vRe;
        vBRe = vnodebRe - nc.vRe;
        vCRe = vnodecRe - na.vRe;
        vAIm = vnodeaIm - nb.vIm;
        vBIm = vnodebIm - nc.vIm;
        vCIm = vnodecIm - na.vIm;
        vARe = k * vaRe;
        vBRe = k * vbRe;
        vCRe = k * vcRe;
        vAIm = k * vaIm;
        vBIm = k * vbIm;
        vCIm = k * vcIm;
        iaRe = pa.iRe;
        ibRe = pb.iRe;
        icRe = pc.iRe;
        iaIm = pa.iIm;
        ibIm = pb.iIm;
        icIm = pc.iIm;
        iARe = na.iRe + iCRe + igroundaRe;
        iBRe = nb.iRe + iARe;
        iCRe = nc.iRe + iBRe;
        iAIm = na.iIm + iCIm + igroundaIm;
        iBIm = nb.iIm + iAIm;
        iCIm = nc.iIm + iBIm;
//na.iRe+nb.iRe+nc.iRe=0;
//na.iIm+nb.iIm+nc.iIm=0;
        iaRe = -k * iARe;
        ibRe = -k * iBRe;
        icRe = -k * iCRe;
        iaIm = -k * iAIm;
        ibIm = -k * iBIm;
        icIm = -k * iCIm;
        UZRea = na.vRe - vnodeaRe;
//na.vRe=vnodecRe-vCRe;
        UZReb = nb.vRe - vnodebRe;
        UZRec = nc.vRe - vnodecRe;
        UZIma = na.vIm - vnodeaIm;
        UZImb = nb.vIm - vnodebIm;
        UZImc = nc.vIm - vnodecIm;
        UZRea = R * iARe - X * iAIm;
        UZIma = R * iAIm + X * iARe;
        UZReb = R * iBRe - X * iBIm;
        UZImb = R * iBIm + X * iBRe;
        UZRec = R * iCRe - X * iCIm;
        UZImc = R * iCIm + X * iCRe;
      end GrYD2;

      model GrYGrY2
        extends Interfaces.SixPort;
        parameter Real k = 1;
        parameter Real R = 0.1;
        parameter Real X = 0.1;
        Real vaRe;
        //brach voltage
        Real vbRe;
        Real vcRe;
        Real vaIm;
        //brach voltage
        Real vbIm;
        Real vcIm;
        Real vnodeaRe;
        Real vnodebRe;
        Real vnodecRe;
        Real vnodeaIm;
        Real vnodebIm;
        Real vnodecIm;
        Real vARe;
        //right side branch voltage
        Real vBRe;
        Real vCRe;
        Real vAIm;
        Real vBIm;
        Real vCIm;
        Real iaRe;
        Real ibRe;
        Real icRe;
        Real iaIm;
        Real ibIm;
        Real icIm;
        Real iARe;
        Real iBRe;
        Real iCRe;
        Real iAIm;
        Real iBIm;
        Real iCIm;
        Real UZRea;
        //Zbranch voltage
        Real UZReb;
        //Zbranch voltage
        Real UZRec;
        //Zbranch voltage
        Real UZIma;
        //Zbranch voltage
        Real UZImb;
        //Zbranch voltage
        Real UZImc;
        //Zbranch voltage
      equation
        pa.vRe - 0 = vaRe;
        pb.vRe - 0 = vbRe;
        pc.vRe - 0 = vcRe;
        pa.vIm - 0 = vaIm;
        pb.vIm - 0 = vbIm;
        pc.vIm - 0 = vcIm;
        vARe = vnodeaRe - 0;
        vBRe = vnodebRe - 0;
        vCRe = vnodecRe - 0;
        vAIm = vnodeaIm - 0;
        vBIm = vnodebIm - 0;
        vCIm = vnodecIm - 0;
        vARe = k * vaRe;
        vBRe = k * vbRe;
        vCRe = k * vcRe;
        vAIm = k * vaIm;
        vBIm = k * vbIm;
        vCIm = k * vcIm;
        iaRe = pa.iRe;
        ibRe = pb.iRe;
        icRe = pc.iRe;
        iaIm = pa.iIm;
        ibIm = pb.iIm;
        icIm = pc.iIm;
        iARe = na.iRe;
        iBRe = nb.iRe;
        iCRe = nc.iRe;
        iAIm = na.iIm;
        iBIm = nb.iIm;
        iCIm = nc.iIm;
        iaRe = -k * iARe;
        ibRe = -k * iBRe;
        icRe = -k * iCRe;
        iaIm = -k * iAIm;
        ibIm = -k * iBIm;
        icIm = -k * iCIm;
        UZRea = na.vRe - vnodeaRe;
        UZReb = nb.vRe - vnodebRe;
        UZRec = nc.vRe - vnodecRe;
        UZIma = na.vIm - vnodeaIm;
        UZImb = nb.vIm - vnodebIm;
        UZImc = nc.vIm - vnodecIm;
        UZRea = R * iARe - X * iAIm;
        UZIma = R * iAIm + X * iARe;
        UZReb = R * iBRe - X * iBIm;
        UZImb = R * iBIm + X * iBRe;
        UZRec = R * iCRe - X * iCIm;
        UZImc = R * iCIm + X * iCRe;
      end GrYGrY2;

      model GrYD_
        parameter Real N1 = 0.1;
        parameter Real N2 = 0.1;
        parameter Real Vb = 0.1 "kV";
        parameter Real Sb = 0.1 "kVA";
        parameter Real Rp = 0.1 "%";
        parameter Real Xp = 0.1 "%";
        ADN_Modelica.Basic.IdealTransformer idealTransformer1(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {-28, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.IdealTransformer idealTransformer2(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {-28, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.IdealTransformer idealTransformer3(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {-28, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaseImpedance onePhaseImpedance1(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {34, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaseImpedance onePhaseImpedance2(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {34, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaseImpedance onePhaseImpedance3(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {34, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.FRNode pinA annotation(Placement(visible = true, transformation(origin = {-92, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.FRNode pinB annotation(Placement(visible = true, transformation(origin = {-92, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.FRNode pinC annotation(Placement(visible = true, transformation(origin = {-90, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.TONode pin_a annotation(Placement(visible = true, transformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.TONode pin_b annotation(Placement(visible = true, transformation(origin = {96, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Interfaces.TONode pin_c annotation(Placement(visible = true, transformation(origin = {96, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-19, -80}, extent = {{-13, -12}, {13, 12}}, rotation = 0)));
      equation
        connect(onePhaseImpedance3.n, pin_c) annotation(Line(points = {{44, -26}, {44, -26}, {44, -22}, {96, -22}, {96, -22}}, color = {0, 0, 255}));
        connect(onePhaseImpedance2.n, pin_b) annotation(Line(points = {{44, 14}, {46, 14}, {46, 16}, {96, 16}, {96, 16}}, color = {0, 0, 255}));
        connect(onePhaseImpedance1.n, pin_a) annotation(Line(points = {{44, 54}, {44, 54}, {44, 60}, {96, 60}, {96, 60}}, color = {0, 0, 255}));
        connect(idealTransformer3.n2, onePhaseImpedance1.n) annotation(Line(points = {{-18, -34}, {62, -34}, {62, 54}, {44, 54}, {44, 54}}, color = {0, 0, 255}));
        connect(idealTransformer2.n2, onePhaseImpedance3.n) annotation(Line(points = {{-18, 6}, {54, 6}, {54, -26}, {44, -26}, {44, -26}}, color = {0, 0, 255}));
        connect(idealTransformer1.n2, onePhaseImpedance2.n) annotation(Line(points = {{-18, 46}, {52, 46}, {52, 14}, {44, 14}, {44, 14}}, color = {0, 0, 255}));
        connect(idealTransformer3.n2, ground1.p) annotation(Line(points = {{-18, -34}, {-18, -34}, {-18, -50}, {-8, -50}, {-8, -68}, {-18, -68}, {-18, -68}}, color = {0, 0, 255}));
        connect(onePhaseImpedance2.p, idealTransformer2.p2) annotation(Line(points = {{24, 14}, {-18, 14}, {-18, 16}, {-18, 16}}, color = {0, 0, 255}));
        connect(onePhaseImpedance3.p, idealTransformer3.p2) annotation(Line(points = {{24, -26}, {-18, -26}, {-18, -24}, {-18, -24}}, color = {0, 0, 255}));
        connect(idealTransformer1.p2, onePhaseImpedance1.p) annotation(Line(points = {{-18, 56}, {24, 56}, {24, 54}, {24, 54}}, color = {0, 0, 255}));
        connect(idealTransformer3.n1, ground1.p) annotation(Line(points = {{-38, -34}, {-46, -34}, {-46, -60}, {-18, -60}, {-18, -68}, {-18, -68}}, color = {0, 0, 255}));
        connect(idealTransformer2.n1, ground1.p) annotation(Line(points = {{-38, 6}, {-52, 6}, {-52, -64}, {-18, -64}, {-18, -68}, {-18, -68}}, color = {0, 0, 255}));
        connect(idealTransformer1.n1, ground1.p) annotation(Line(points = {{-38, 46}, {-56, 46}, {-56, -68}, {-18, -68}, {-18, -68}}, color = {0, 0, 255}));
        connect(pinC, idealTransformer3.p1) annotation(Line(points = {{-90, -26}, {-38, -26}, {-38, -24}, {-38, -24}}, color = {0, 0, 255}));
        connect(pinB, idealTransformer2.p1) annotation(Line(points = {{-92, 14}, {-38, 14}, {-38, 16}, {-38, 16}}, color = {0, 0, 255}));
        connect(pinA, idealTransformer1.p1) annotation(Line(points = {{-92, 54}, {-38, 54}, {-38, 56}, {-38, 56}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Text(origin = {-68, 49}, extent = {{-12, 17}, {12, -17}}, textString = "A", fontSize = 50), Text(origin = {-67, 9}, extent = {{-9, 17}, {9, -17}}, textString = "B", fontSize = 50), Text(origin = {-69, -31}, extent = {{-9, 17}, {9, -17}}, textString = "C", fontSize = 50), Ellipse(origin = {-17, 4}, extent = {{-29, 48}, {35, -50}}, endAngle = 360), Ellipse(origin = {26, 4}, extent = {{-30, 50}, {34, -50}}, endAngle = 360)}));
      end GrYD_;

      model GrYGrY2_1
        extends Interfaces.SixPort;
        /*parameter Real k=1;
                                                parameter Real R=0.1;
                                                parameter Real X=0.1;*/
        parameter Real N1 = 0.1;
        parameter Real N2 = 0.1;
        parameter Real Vb = 0.1 "kV";
        parameter Real Sb = 0.1 "kVA";
        parameter Real Rp = 0.1 "%";
        parameter Real Xp = 0.1 "%";
        Real k;
        Real R;
        Real X;
        Real vaRe;
        //brach voltage
        Real vbRe;
        Real vcRe;
        Real vaIm;
        //brach voltage
        Real vbIm;
        Real vcIm;
        Real vnodeaRe;
        Real vnodebRe;
        Real vnodecRe;
        Real vnodeaIm;
        Real vnodebIm;
        Real vnodecIm;
        Real vARe;
        //right side branch voltage
        Real vBRe;
        Real vCRe;
        Real vAIm;
        Real vBIm;
        Real vCIm;
        Real iaRe;
        Real ibRe;
        Real icRe;
        Real iaIm;
        Real ibIm;
        Real icIm;
        Real iARe;
        Real iBRe;
        Real iCRe;
        Real iAIm;
        Real iBIm;
        Real iCIm;
        Real UZRea;
        //Zbranch voltage
        Real UZReb;
        //Zbranch voltage
        Real UZRec;
        //Zbranch voltage
        Real UZIma;
        //Zbranch voltage
        Real UZImb;
        //Zbranch voltage
        Real UZImc;
        //Zbranch voltage
      equation
        k = N2 / N1;
        R = Vb * Vb * 1000 / Sb * Rp;
        X = Vb * Vb * 1000 / Sb * Xp;
        pa.vRe - 0 = vaRe;
        pb.vRe - 0 = vbRe;
        pc.vRe - 0 = vcRe;
        pa.vIm - 0 = vaIm;
        pb.vIm - 0 = vbIm;
        pc.vIm - 0 = vcIm;
        vARe = vnodeaRe - 0;
        vBRe = vnodebRe - 0;
        vCRe = vnodecRe - 0;
        vAIm = vnodeaIm - 0;
        vBIm = vnodebIm - 0;
        vCIm = vnodecIm - 0;
        vARe = k * vaRe;
        vBRe = k * vbRe;
        vCRe = k * vcRe;
        vAIm = k * vaIm;
        vBIm = k * vbIm;
        vCIm = k * vcIm;
        iaRe = pa.iRe;
        ibRe = pb.iRe;
        icRe = pc.iRe;
        iaIm = pa.iIm;
        ibIm = pb.iIm;
        icIm = pc.iIm;
        iARe = na.iRe;
        iBRe = nb.iRe;
        iCRe = nc.iRe;
        iAIm = na.iIm;
        iBIm = nb.iIm;
        iCIm = nc.iIm;
        iaRe = -k * iARe;
        ibRe = -k * iBRe;
        icRe = -k * iCRe;
        iaIm = -k * iAIm;
        ibIm = -k * iBIm;
        icIm = -k * iCIm;
        UZRea = na.vRe - vnodeaRe;
        UZReb = nb.vRe - vnodebRe;
        UZRec = nc.vRe - vnodecRe;
        UZIma = na.vIm - vnodeaIm;
        UZImb = nb.vIm - vnodebIm;
        UZImc = nc.vIm - vnodecIm;
        UZRea = R * iARe - X * iAIm;
        UZIma = R * iAIm + X * iARe;
        UZReb = R * iBRe - X * iBIm;
        UZImb = R * iBIm + X * iBRe;
        UZRec = R * iCRe - X * iCIm;
        UZImc = R * iCIm + X * iCRe;
        annotation(Icon(graphics = {Text(origin = {-70, 53}, extent = {{-8, 21}, {8, -21}}, textString = "A", fontSize = 50), Ellipse(origin = {-25, -6}, extent = {{-23, 56}, {23, -56}}, endAngle = 360), Ellipse(origin = {12, -4}, extent = {{-22, 56}, {22, -56}}, endAngle = 360), Text(origin = {-27, -4}, extent = {{-7, 16}, {7, -16}}, textString = "Y", fontSize = 100), Text(origin = {13, -2}, extent = {{-7, 16}, {7, -16}}, textString = "Y", fontSize = 100)}, coordinateSystem(initialScale = 0.1)), Diagram);
      end GrYGrY2_1;

      model GrYD2_1
        extends Interfaces.SixPort;
        //parameter Real k=1;
        //parameter Real R=0.1;
        //parameter Real X=0.1;
        parameter Real N1 = 0.1;
        parameter Real N2 = 0.1;
        parameter Real Vb = 0.1 "kV";
        parameter Real Sb = 0.1 "kVA";
        parameter Real Rp = 0.1 "%";
        parameter Real Xp = 0.1 "%";
        Real k;
        Real R;
        Real X;
        Real vaRe;
        //brach voltage
        Real vbRe;
        Real vcRe;
        Real vaIm;
        //brach voltage
        Real vbIm;
        Real vcIm;
        Real vnodeaRe;
        Real vnodebRe;
        Real vnodecRe;
        Real vnodeaIm;
        Real vnodebIm;
        Real vnodecIm;
        Real vARe;
        //right side branch voltage
        Real vBRe;
        Real vCRe;
        Real vAIm;
        Real vBIm;
        Real vCIm;
        Real iaRe;
        Real ibRe;
        Real icRe;
        Real iaIm;
        Real ibIm;
        Real icIm;
        Real iARe;
        Real iBRe;
        Real iCRe;
        Real iAIm;
        Real iBIm;
        Real iCIm;
        Real UZRea;
        //Zbranch voltage
        Real UZReb;
        //Zbranch voltage
        Real UZRec;
        //Zbranch voltage
        Real UZIma;
        //Zbranch voltage
        Real UZImb;
        //Zbranch voltage
        Real UZImc;
        //Zbranch voltage
        Real igroundaRe;
        Real igroundaIm;
      equation
        k = N2 / N1;
        R = Vb * Vb * 1000 / Sb * Rp;
        X = Vb * Vb * 1000 / Sb * Xp;
        pa.vRe - 0 = vaRe;
        pb.vRe - 0 = vbRe;
        pc.vRe - 0 = vcRe;
        pa.vIm - 0 = vaIm;
        pb.vIm - 0 = vbIm;
        pc.vIm - 0 = vcIm;
        na.vRe = 0;
        na.vIm = 0;
        vARe = vnodeaRe - nb.vRe;
        vBRe = vnodebRe - nc.vRe;
        vCRe = vnodecRe - na.vRe;
        vAIm = vnodeaIm - nb.vIm;
        vBIm = vnodebIm - nc.vIm;
        vCIm = vnodecIm - na.vIm;
        vARe = k * vaRe;
        vBRe = k * vbRe;
        vCRe = k * vcRe;
        vAIm = k * vaIm;
        vBIm = k * vbIm;
        vCIm = k * vcIm;
        iaRe = pa.iRe;
        ibRe = pb.iRe;
        icRe = pc.iRe;
        iaIm = pa.iIm;
        ibIm = pb.iIm;
        icIm = pc.iIm;
        iARe = na.iRe + iCRe + igroundaRe;
        iBRe = nb.iRe + iARe;
        iCRe = nc.iRe + iBRe;
        iAIm = na.iIm + iCIm + igroundaIm;
        iBIm = nb.iIm + iAIm;
        iCIm = nc.iIm + iBIm;
//na.iRe+nb.iRe+nc.iRe=0;
//na.iIm+nb.iIm+nc.iIm=0;
        iaRe = -k * iARe;
        ibRe = -k * iBRe;
        icRe = -k * iCRe;
        iaIm = -k * iAIm;
        ibIm = -k * iBIm;
        icIm = -k * iCIm;
        UZRea = na.vRe - vnodeaRe;
//na.vRe=vnodecRe-vCRe;
        UZReb = nb.vRe - vnodebRe;
        UZRec = nc.vRe - vnodecRe;
        UZIma = na.vIm - vnodeaIm;
        UZImb = nb.vIm - vnodebIm;
        UZImc = nc.vIm - vnodecIm;
        UZRea = R * iARe - X * iAIm;
        UZIma = R * iAIm + X * iARe;
        UZReb = R * iBRe - X * iBIm;
        UZImb = R * iBIm + X * iBRe;
        UZRec = R * iCRe - X * iCIm;
        UZImc = R * iCIm + X * iCRe;
        annotation(Icon(graphics = {Text(origin = {27, -4}, extent = {{-17, 38}, {17, -38}}, textString = "D", fontSize = 200), Text(origin = {-29, -4}, extent = {{-17, 38}, {17, -38}}, textString = "Y", fontSize = 200), Rectangle(origin = {0, -3}, extent = {{-54, 37}, {54, -37}}), Text(origin = {-70, 60}, extent = {{-10, 10}, {10, -10}}, textString = "A", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end GrYD2_1;

      model YD
        parameter Real N1 = 0.1;
        parameter Real N2 = 0.1;
        parameter Real Vb = 0.1 "kV";
        parameter Real Sb = 0.1 "kVA";
        parameter Real Rp = 0.1 "%";
        parameter Real Xp = 0.1 "%";
        //Sb % %vb;
        IdealTransformer idealTransformer1(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {10, 56}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.IdealTransformer idealTransformer2(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {4, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        IdealTransformer idealTransformer3(k = N1 / N2) annotation(Placement(visible = true, transformation(origin = {10, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin annotation(Placement(visible = true, transformation(origin = {-90, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n annotation(Placement(visible = true, transformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {96, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n1 annotation(Placement(visible = true, transformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.TONode pin_n2 annotation(Placement(visible = true, transformation(origin = {94, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {94, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {-14, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance1(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {56, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance2(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaseImpedance onePhaseImpedance3(R = Vb * Vb * 1000 / Sb * Rp, X = Vb * Vb * 1000 / Sb * Xp) annotation(Placement(visible = true, transformation(origin = {64, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(idealTransformer3.n2, ground1.p) annotation(Line(points = {{20, -70}, {20, -70}, {20, -88}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(onePhaseImpedance2.n, pin_n1) annotation(Line(points = {{68, 0}, {68, 0}, {68, 18}, {94, 18}, {94, 0}, {94, 0}}, color = {0, 0, 255}));
        connect(onePhaseImpedance1.n, pin_n) annotation(Line(points = {{66, 64}, {68, 64}, {68, 82}, {96, 82}, {96, 60}, {96, 60}}, color = {0, 0, 255}));
        connect(idealTransformer2.n2, onePhaseImpedance1.n) annotation(Line(points = {{14, -8}, {30, -8}, {30, 38}, {74, 38}, {74, 64}, {66, 64}, {66, 64}}, color = {0, 0, 255}));
        connect(idealTransformer3.n2, onePhaseImpedance2.n) annotation(Line(points = {{20, -70}, {44, -70}, {44, -10}, {74, -10}, {74, 0}, {68, 0}, {68, 0}}, color = {0, 0, 255}));
        connect(idealTransformer1.n2, onePhaseImpedance3.n) annotation(Line(points = {{20, 52}, {78, 52}, {78, -42}, {74, -42}, {74, -62}, {74, -62}}, color = {0, 0, 255}));
        connect(onePhaseImpedance3.n, pin_n2) annotation(Line(points = {{74, -62}, {76, -62}, {76, -76}, {94, -76}, {94, -62}, {94, -62}}, color = {0, 0, 255}));
        connect(idealTransformer2.n1, ground1.p) annotation(Line(points = {{-6, -8}, {-50, -8}, {-50, -92}, {-24, -92}, {-24, -88}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(onePhaseImpedance1.p, idealTransformer1.p2) annotation(Line(points = {{46, 64}, {20, 64}, {20, 62}, {20, 62}}, color = {0, 0, 255}));
        connect(idealTransformer3.p2, onePhaseImpedance3.p) annotation(Line(points = {{20, -60}, {48, -60}, {48, -62}, {54, -62}, {54, -62}}, color = {0, 0, 255}));
        connect(pin1, idealTransformer2.p1) annotation(Line(points = {{-90, 2}, {-72, 2}, {-72, -2}, {-6, -2}, {-6, 1}}, color = {0, 0, 255}));
        connect(idealTransformer2.p2, onePhaseImpedance2.p) annotation(Line(points = {{14, 1}, {42, 1}, {42, 0}, {48, 0}}, color = {0, 0, 255}));
        connect(idealTransformer3.n1, ground1.p) annotation(Line(points = {{0, -70}, {2, -70}, {2, -90}, {-14, -90}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        connect(pin2, idealTransformer3.p1) annotation(Line(points = {{-90, -60}, {-88, -60}, {-88, -32}, {0, -32}, {0, -60}, {0, -60}}, color = {0, 0, 255}));
        connect(idealTransformer1.p1, pin) annotation(Line(points = {{0, 62}, {-90, 62}, {-90, 58}, {-90, 58}}, color = {0, 0, 255}));
        connect(idealTransformer1.n1, ground1.p) annotation(Line(points = {{0, 50}, {-10, 50}, {-10, -74}, {-14, -74}, {-14, -88}, {-14, -88}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Text(origin = {-62, 56}, extent = {{-6, 4}, {6, -4}}, textString = "A", fontSize = 50), Text(origin = {-62, 8}, extent = {{-6, 4}, {6, -4}}, textString = "B", fontSize = 50), Text(origin = {-62, -58}, extent = {{-6, 4}, {6, -4}}, textString = "C", fontSize = 50), Ellipse(origin = {-21, 2}, extent = {{-37, 52}, {39, -50}}, endAngle = 360), Ellipse(origin = {25, 1}, extent = {{43, 53}, {-35, -51}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
      end YD;

      model D_GrY
        extends Interfaces.SixPort;
        parameter Real N1 = 0.1;
        parameter Real N2 = 0.1;
        parameter Real Vb = 0.1 "kV";
        parameter Real Sb = 0.1 "kVA";
        parameter Real Rp = 0.1 "%";
        parameter Real Xp = 0.1 "%";
        Real k;
        Real R;
        Real X;
        Real vaRe;
        //brach voltage
        Real vbRe;
        Real vcRe;
        Real vaIm;
        //brach voltage
        Real vbIm;
        Real vcIm;
        Real vnodeaRe;
        Real vnodebRe;
        Real vnodecRe;
        Real vnodeaIm;
        Real vnodebIm;
        Real vnodecIm;
        Real vARe;
        //right side branch voltage
        Real vBRe;
        Real vCRe;
        Real vAIm;
        Real vBIm;
        Real vCIm;
        Real iaRe;
        Real ibRe;
        Real icRe;
        Real iaIm;
        Real ibIm;
        Real icIm;
        Real iARe;
        Real iBRe;
        Real iCRe;
        Real iAIm;
        Real iBIm;
        Real iCIm;
        Real UZRea;
        //Zbranch voltage
        Real UZReb;
        //Zbranch voltage
        Real UZRec;
        //Zbranch voltage
        Real UZIma;
        //Zbranch voltage
        Real UZImb;
        //Zbranch voltage
        Real UZImc;
        // Real igroundaRe;
        // Real igroundaIm;
      equation
        k = N2 / N1;
        R = Vb * Vb * 1000 / Sb * Rp;
        X = Vb * Vb * 1000 / Sb * Xp;
        pa.vRe - pb.vRe = vaRe;
        pb.vRe - pc.vRe = vbRe;
        pc.vRe - pa.vRe = vcRe;
        pa.vIm - pb.vIm = vaIm;
        pb.vIm - pc.vIm = vbIm;
        pc.vIm - pa.vIm = vcIm;
//pa.vRe = 0;//
//pa.vIm = 0;
        vARe = vnodeaRe - 0;
        vBRe = vnodebRe - 0;
        vCRe = vnodecRe - 0;
        vAIm = vnodeaIm - 0;
        vBIm = vnodebIm - 0;
        vCIm = vnodecIm - 0;
        vARe = k * vaRe;
        vBRe = k * vbRe;
        vCRe = k * vcRe;
        vAIm = k * vaIm;
        vBIm = k * vbIm;
        vCIm = k * vcIm;
        iaRe = pa.iRe + icRe;
//+ igroundaRe;
        ibRe = pb.iRe + iaRe;
        icRe = pc.iRe + ibRe;
        iaIm = pa.iIm + icIm;
//+ igroundaIm;
        ibIm = pb.iIm + iaIm;
        icIm = pc.iIm + ibIm;
        iARe = na.iRe;
        iBRe = nb.iRe;
        iCRe = nc.iRe;
        iAIm = na.iIm;
        iBIm = nb.iIm;
        iCIm = nc.iIm;
/*iARe = na.iRe + iCRe + igroundaRe;
        iBRe = nb.iRe + iARe;
        iCRe = nc.iRe + iBRe;
        iAIm = na.iIm + iCIm + igroundaIm;
        iBIm = nb.iIm + iAIm;
        iCIm = nc.iIm + iBIm;*/
        iaRe = -k * iARe;
        ibRe = -k * iBRe;
        icRe = -k * iCRe;
        iaIm = -k * iAIm;
        ibIm = -k * iBIm;
        icIm = -k * iCIm;
        UZRea = na.vRe - vnodeaRe;
//na.vRe=vnodecRe-vCRe;
        UZReb = nb.vRe - vnodebRe;
        UZRec = nc.vRe - vnodecRe;
        UZIma = na.vIm - vnodeaIm;
        UZImb = nb.vIm - vnodebIm;
        UZImc = nc.vIm - vnodecIm;
        UZRea = R * iARe - X * iAIm;
        UZIma = R * iAIm + X * iARe;
        UZReb = R * iBRe - X * iBIm;
        UZImb = R * iBIm + X * iBRe;
        UZRec = R * iCRe - X * iCIm;
        UZImc = R * iCIm + X * iCRe;
        annotation(Icon(graphics = {Text(origin = {-71, 61}, extent = {{-11, 17}, {11, -17}}, textString = "A", fontSize = 50), Ellipse(origin = {-13, -6}, extent = {{-29, 54}, {27, -54}}, endAngle = 360), Ellipse(origin = {34, -6}, extent = {{-28, 56}, {28, -56}}, endAngle = 360), Text(origin = {10, -6}, extent = {{-14, 22}, {14, -22}}, textString = "D GrY", fontSize = 120)}, coordinateSystem(initialScale = 0.1)));
      end D_GrY;
    end ThreePhaseTransformer;

    model IdealTransformer
      extends Interfaces.TwoPhaseBranch;
      parameter Real k = 1;
    equation
      v1Re = k * v2Re;
      v1Im = k * v2Im;
      i2Re = -k * i1Re;
      i2Im = -k * i1Im;
      annotation(Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, grid = {1, 1}), graphics = {Text(extent = {{-101, 115}, {99, 57}}, lineColor = {0, 0, 255}, textString = "%name"), Ellipse(extent = {{-45, -50}, {-20, -25}}), Ellipse(extent = {{-45, -25}, {-20, 0}}), Ellipse(extent = {{-45, 0}, {-20, 25}}), Ellipse(extent = {{-45, 25}, {-20, 50}}), Rectangle(extent = {{-72, -60}, {-33, 60}}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{-100, 50}, {-32, 50}}), Line(points = {{-100, -50}, {-32, -50}}), Ellipse(extent = {{20, -50}, {45, -25}}), Ellipse(extent = {{20, -25}, {45, 0}}), Ellipse(extent = {{20, 0}, {45, 25}}), Ellipse(extent = {{20, 25}, {45, 50}}), Rectangle(extent = {{33, -60}, {72, 60}}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Line(points = {{32, 50}, {100, 50}}), Line(points = {{32, -50}, {100, -50}}), Text(extent = {{-18, -70}, {20, -98}}, textString = "n=%n")}), Diagram(coordinateSystem(grid = {1, 1}, initialScale = 0.1), graphics = {Ellipse(extent = {{-45, -50}, {-20, -25}}, endAngle = 360), Ellipse(extent = {{-45, -25}, {-20, 0}}, endAngle = 360), Ellipse(extent = {{-45, 0}, {-20, 25}}, endAngle = 360), Ellipse(extent = {{-45, 25}, {-20, 50}}, endAngle = 360), Rectangle(origin = {0, -2}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-72, -60}, {-33, 60}}), Line(points = {{-100, 50}, {-33, 50}}), Line(points = {{-100, -50}, {-32, -50}}), Ellipse(extent = {{20, -50}, {45, -25}}, endAngle = 360), Ellipse(extent = {{20, -25}, {45, 0}}, endAngle = 360), Ellipse(extent = {{20, 0}, {45, 25}}, endAngle = 360), Ellipse(extent = {{20, 25}, {45, 50}}, endAngle = 360), Rectangle(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{33, -60}, {72, 60}}), Line(points = {{32, 50}, {100, 50}}), Line(points = {{32, -50}, {100, -50}}), Text(origin = {-50, 0.5}, extent = {{-1, 0.5}, {1, -0.5}}, textString = "1", fontSize = 200, fontName = "DejaVu Sans Mono"), Text(origin = {41, 5}, extent = {{-1, 6}, {1, -6}}, textString = "2", fontSize = 200, fontName = "DejaVu Sans Mono")}), Window(x = 0.26, y = 0.43, width = 0.6, height = 0.6));
    end IdealTransformer;

    model ThreePhaImpedancePerMile
      extends Interfaces.ThreePhaseBranch;
      parameter Real Length = 1 "Foot";
      parameter SI.Resistance UR11 = 1 "Ohm/Mile";
      parameter SI.Resistance UR12 = 0 "UR12";
      parameter SI.Resistance UR13 = 0 "UR13";
      parameter SI.Resistance UR21 = 0 "R21";
      parameter SI.Resistance UR22 = 1 "R22";
      parameter SI.Resistance UR23 = 0 "R23";
      parameter SI.Resistance UR31 = 0 "R31";
      parameter SI.Resistance UR32 = 0 "R32";
      parameter SI.Resistance UR33 = 1 "R33";
      parameter SI.Reactance UX11 = 1 "Ohm/km";
      parameter SI.Reactance UX12 = 0 "X12";
      parameter SI.Reactance UX13 = 0 "X13";
      parameter SI.Reactance UX21 = 0 "X21";
      parameter SI.Reactance UX22 = 1 "X22";
      parameter SI.Reactance UX23 = 0 "X23";
      parameter SI.Reactance UX31 = 0 "X31";
      parameter SI.Reactance UX32 = 0 "X32";
      parameter SI.Reactance UX33 = 1 "X33";
      SI.Resistance R11 "R11";
      SI.Reactance X11 "X11";
      SI.Resistance R12 "R11";
      SI.Reactance X12 "X11";
      SI.Resistance R13 "R11";
      SI.Reactance X13 "X11";
      SI.Resistance R21 "R11";
      SI.Reactance X21 "X11";
      SI.Resistance R22 "R11";
      SI.Reactance X22 "X11";
      SI.Resistance R23 "R11";
      SI.Reactance X23 "X11";
      SI.Resistance R31 "R11";
      SI.Reactance X31 "X11";
      SI.Resistance R32 "R11";
      SI.Reactance X32 "X11";
      SI.Resistance R33 "R11";
      SI.Reactance X33 "X11";
    equation
      R11 = UR11 * Length * Constants.foot2mile;
      R12 = UR12 * Length * Constants.foot2mile;
      R13 = UR13 * Length * Constants.foot2mile;
      R21 = UR21 * Length * Constants.foot2mile;
      R22 = UR22 * Length * Constants.foot2mile;
      R23 = UR23 * Length * Constants.foot2mile;
      R31 = UR31 * Length * Constants.foot2mile;
      R32 = UR32 * Length * Constants.foot2mile;
      R33 = UR33 * Length * Constants.foot2mile;
      X11 = UX11 * Length * Constants.foot2mile;
      X12 = UX12 * Length * Constants.foot2mile;
      X13 = UX13 * Length * Constants.foot2mile;
      X21 = UX21 * Length * Constants.foot2mile;
      X22 = UX22 * Length * Constants.foot2mile;
      X23 = UX23 * Length * Constants.foot2mile;
      X31 = UX31 * Length * Constants.foot2mile;
      X32 = UX32 * Length * Constants.foot2mile;
      X33 = UX33 * Length * Constants.foot2mile;
      v1Re = R11 * i1Re + R12 * i2Re + R13 * i3Re - X11 * i1Im - X12 * i2Im - X13 * i3Im;
      v2Re = R21 * i1Re + R22 * i2Re + R23 * i3Re - X21 * i1Im - X22 * i2Im - X23 * i3Im;
      v3Re = R31 * i1Re + R32 * i2Re + R33 * i3Re - X31 * i1Im - X32 * i2Im - X33 * i3Im;
      v1Im = X11 * i1Re + X12 * i2Re + X13 * i3Re + R11 * i1Im + R12 * i2Im + R13 * i3Im;
      v2Im = X21 * i1Re + X22 * i2Re + X23 * i3Re + R21 * i1Im + R22 * i2Im + R23 * i3Im;
      v3Im = X31 * i1Re + X32 * i2Re + X33 * i3Re + R31 * i1Im + R32 * i2Im + R33 * i3Im;
      annotation(Diagram(graphics = {Rectangle(origin = {-68, -4}, extent = {{-2, 40}, {2, -40}}), Rectangle(origin = {6, -4}, extent = {{-2, 40}, {2, -40}}), Line(origin = {-82, 42}, points = {{-14, 6}, {14, 6}, {14, -6}, {14, -6}}), Line(origin = {-33.9048, -8.79848}, points = {{-62.0952, -41.2015}, {-54.0952, -43.2015}, {-36.0952, -43.2015}, {-36.0952, -33.2015}, {-30.0952, -33.2015}, {31.9048, 40.7985}}), Line(origin = {-18, -3}, points = {{-44, 37}}), Line(origin = {-21, 1}, points = {{-43, 37}, {9, -43}}), Line(origin = {66.8017, -0.585706}, points = {{-36.8017, 34.5857}, {19.1983, -31.4143}}), Line(origin = {68, 4}, points = {{-20, -22}}), Line(origin = {51.8025, 2.80251}, points = {{-23.8025, -34.8025}, {20.1975, 27.1975}, {20.1975, 27.1975}, {20.1975, 29.1975}, {28.1975, 41.1975}}), Rectangle(origin = {96, -3}, extent = {{-2, 37}, {2, -37}})}, coordinateSystem(initialScale = 0.1)), Icon(graphics = {Line(origin = {-98, -1}, points = {{0, 51}, {0, -51}}), Line(origin = {58, -4}, points = {{0, 52}}), Line(origin = {100, -7}, points = {{0, 49}, {0, -49}}), Line(origin = {3, 1}, points = {{-55, -37}}), Line(origin = {0, -2}, points = {{0, 42}, {0, -40}}), Bitmap(origin = {-69, 19}, extent = {{-39, 23}, {177, -55}})}, coordinateSystem(initialScale = 0.1)));
    end ThreePhaImpedancePerMile;

    model OnePhaseCurrentSource
      extends Interfaces.OnePhaseBranch;
      parameter SI.Current IRe = 1;
      parameter SI.Current IIm = 1;
    equation
      iRe = IRe;
      iIm = IIm;
      annotation(Icon(graphics = {Ellipse(origin = {20, -12}, extent = {{-44, 32}, {44, -32}}, endAngle = 360), Line(origin = {18, -9}, points = {{-42, -1}, {42, 1}})}));
    end OnePhaseCurrentSource;

    model test
    end test;

    model OnePhaILoad
      extends Interfaces.OnePhaseBranch;
      //parameter SI.Resistance R = 1 "Resistance of component";
      parameter SI.ActivePower P = 0.1 "Active Power";
      parameter SI.ReactivePower Q = 0.1 "Reactive Power";
      parameter SI.Voltage Vn = 10e3 "normal voltage";
      // Real phi;//i magnitude, power factor,
    equation
      if time == 0 then
        iRe = 0.01;
        iIm = 0.01;
      else
        iRe ^ 2 + iIm ^ 2 = (P ^ 2 + Q ^ 2) / Vn ^ 2;
        (vRe * iRe + vIm * iIm) * Q = P * ((-vRe * iIm) + vIm * iRe);
        //(vRe * iRe + vIm * iIm) /(-vRe * iIm) + vIm * iRe= P /Q ;
//vRe * iRe + vIm * iIm = P;
//(-vRe * iIm) + vIm * iRe = Q;
// iIm^2+iIm^2=I^2;
// P/sqrt(P^2+Q^2)=tan(phi);
//P ^ 2 + Q ^ 2 = (vRe ^ 2 + vIm ^ 2) * (iRe ^ 2 + iIm ^ 2);
// P/sqrt(P^2+Q^2)=cos(phi);
//tan(phi)=iIm/iRe;
//Q / P = iIm / iRe;
      end if;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(origin = {2, 0}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Line(points = {{-100, 0}, {-70, 0}}), Line(origin = {2, 0}, points = {{70, 0}, {100, 0}}), Text(origin = {6, 18}, extent = {{-144, -60}, {144, -100}}, textString = "I", fontName = "DejaVu Sans Mono"), Text(origin = {-8, 0}, extent = {{0, 2}, {0, -2}}, textString = "PQLoad", fontSize = 100, fontName = "DejaVu Sans Mono"), Text(origin = {-6, 0}, extent = {{-26, 2}, {26, -2}}, textString = "I Load", fontSize = 60, fontName = "DejaVu Sans Mono")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}), Line(points = {{-100, 0}, {-70, 0}}), Line(points = {{70, 0}, {100, 0}})}), Window(x = 0.2, y = 0.06, width = 0.62, height = 0.69));
    end OnePhaILoad;

    model OnePhaZLoad
      extends Interfaces.OnePhaseBranch;
      //parameter SI.Resistance R = 1 "Resistance of component";
      parameter SI.ActivePower P = 0.1 "Active Power";
      parameter SI.ReactivePower Q = 0.1 "Reactive Power";
      parameter SI.Voltage Vn = 10e3 "normal voltage";
      SI.Resistance R;
      SI.Reactance X;
    equation
 //if time == 0 then
  //iRe = 0.01;
  //iIm = 0.01;
 //else
      R * (P ^ 2 + Q ^ 2) = Vn * Vn * P;
      X * (P ^ 2 + Q ^ 2) = Vn * Vn * Q;
// R = Vn*Vn * P / (P ^ 2 + Q ^ 2);
// X = Vn*Vn* Q / (P ^ 2 + Q ^ 2);
      vRe = R * iRe - X * iIm;
      vIm = R * iIm + X * iRe;
//end if;
//vRe * iRe + vIm * iIm = P;
//(-vRe * iIm) + vIm * iRe = Q;
//iRe * (vRe ^ 2 + vIm ^ 2) = vRe * P + vIm * Q;
//iIm * (vRe ^ 2 + vIm ^ 2) = vIm * P - vRe * Q;
      annotation(Icon(coordinateSystem(preserveAspectRatio = false, initialScale = 0.1), graphics = {Rectangle(origin = {2, 0}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-70, 30}, {70, -30}}), Line(points = {{-100, 0}, {-70, 0}}), Line(origin = {2, 0}, points = {{70, 0}, {100, 0}}), Text(origin = {-8, 0}, extent = {{0, 2}, {0, -2}}, textString = "PQLoad", fontSize = 100, fontName = "DejaVu Sans Mono"), Text(origin = {-6, 0}, extent = {{-26, 2}, {26, -2}}, textString = "Z Load", fontSize = 60, fontName = "DejaVu Sans Mono")}), Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}, grid = {2, 2}), graphics = {Rectangle(extent = {{-70, 30}, {70, -30}}), Line(points = {{-100, 0}, {-70, 0}}), Line(points = {{70, 0}, {100, 0}})}), Window(x = 0.2, y = 0.06, width = 0.62, height = 0.69));
    end OnePhaZLoad;

    package ThreePhaseZorILoad
      model D_ZLoad
        parameter SI.ActivePower PAB = 0.1 "Active Power";
        parameter SI.ReactivePower QAB = 0.1 "Reactive Power";
        parameter SI.ActivePower PBC = 0.1 "Active Power";
        parameter SI.ReactivePower QBC = 0.1 "Reactive Power";
        parameter SI.ActivePower PCA = 0.1 "Active Power";
        parameter SI.ReactivePower QCA = 0.1 "Reactive Power";
        ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaZLoad onePhaZLoad1(P = PAB, Q = QAB) annotation(Placement(visible = true, transformation(origin = {-34, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaZLoad onePhaZLoad2 annotation(Placement(visible = true, transformation(origin = {-24, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaZLoad onePhaZLoad3 annotation(Placement(visible = true, transformation(origin = {-34, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(onePhaZLoad1.n, onePhaZLoad2.n) annotation(Line(points = {{-24, 30}, {-12, 30}, {-12, 20}, {-50, 20}, {-50, 2}, {-14, 2}}, color = {0, 0, 255}));
        connect(onePhaZLoad2.n, onePhaZLoad3.p) annotation(Line(points = {{-14, 2}, {-12, 2}, {-12, -10}, {-50, -10}, {-50, -30}, {-44, -30}}, color = {0, 0, 255}));
        connect(pin2, onePhaZLoad2.p) annotation(Line(points = {{-90, 2}, {-34, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaZLoad1.p) annotation(Line(points = {{-90, 30}, {-44, 30}, {-44, 30}, {-44, 30}}, color = {0, 0, 255}));
        connect(pin3, onePhaZLoad3.p) annotation(Line(points = {{-90, -30}, {-44, -30}, {-44, -30}, {-44, -30}}, color = {0, 0, 255}));
        connect(onePhaZLoad3.n, onePhaZLoad1.p) annotation(Line(points = {{-24, -30}, {-14, -30}, {-14, -40}, {-58, -40}, {-58, 36}, {-44, 36}, {-44, 30}, {-44, 30}}, color = {0, 0, 255}));
        connect(pin1, onePhaZLoad1.p) annotation(Line(points = {{-90, 30}, {-44, 30}, {-44, 30}, {-44, 30}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {52, 3}, extent = {{-6, 11}, {6, -11}}, textString = "DZ", fontSize = 50), Line(origin = {-29.1181, 3.63736}, points = {{-28.8819, -5.63736}, {-24.8819, 8.36264}, {-22.8819, -5.63736}, {-18.8819, 6.36264}, {-18.8819, 6.36264}, {-16.8819, -5.63736}, {-12.8819, 6.36264}, {-10.8819, -3.63736}, {-8.88188, 0.362639}, {-0.881877, 0.362639}, {1.11812, 6.36264}, {3.11812, 6.36264}, {5.11812, 0.362639}, {5.11812, -3.63736}, {7.11812, -7.63736}, {9.1181, -1.63736}, {11.1181, 4.36264}, {13.1181, 6.36264}, {15.1181, 4.36264}, {15.1181, -1.63736}, {15.1181, -5.63736}, {19.1181, -7.63736}, {21.1181, -1.63736}, {23.1181, 4.36264}, {27.1181, 6.36264}, {29.1181, -1.63736}, {29.1181, -5.63736}, {29.1181, -7.63736}}), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end D_ZLoad;

      model Y_ZLoad
        parameter SI.ActivePower PAB = 0.1 "Active Power";
        parameter SI.ReactivePower QAB = 0.1 "Reactive Power";
        parameter SI.ActivePower PBC = 0.1 "Active Power";
        parameter SI.ReactivePower QBC = 0.1 "Reactive Power";
        parameter SI.ActivePower PCA = 0.1 "Active Power";
        parameter SI.ReactivePower QCA = 0.1 "Reactive Power";
        ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin3 annotation(Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-92, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaZLoad onePhaZLoad1(P = PAB, Q = QAB) annotation(Placement(visible = true, transformation(origin = {-34, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaZLoad onePhaZLoad2 annotation(Placement(visible = true, transformation(origin = {-34, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaZLoad onePhaZLoad3 annotation(Placement(visible = true, transformation(origin = {-34, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {20, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground2 annotation(Placement(visible = true, transformation(origin = {20, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground3 annotation(Placement(visible = true, transformation(origin = {20, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(pin1, onePhaZLoad1.p) annotation(Line(points = {{-90, 30}, {-44, 30}, {-44, 30}, {-44, 30}}, color = {0, 0, 255}));
        connect(pin2, onePhaZLoad2.p) annotation(Line(points = {{-90, 2}, {-44, 2}, {-44, 2}, {-44, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaZLoad1.p) annotation(Line(points = {{-90, 30}, {-44, 30}, {-44, 30}, {-44, 30}}, color = {0, 0, 255}));
        connect(pin3, onePhaZLoad3.p) annotation(Line(points = {{-90, -30}, {-44, -30}, {-44, -30}, {-44, -30}}, color = {0, 0, 255}));
        connect(onePhaZLoad3.n, ground3.p) annotation(Line(points = {{-24, -30}, {-2, -30}, {-2, -26}, {20, -26}, {20, -24}, {20, -24}}, color = {0, 0, 255}));
        connect(onePhaZLoad2.n, ground2.p) annotation(Line(points = {{-24, 2}, {0, 2}, {0, 8}, {20, 8}, {20, 8}}, color = {0, 0, 255}));
        connect(onePhaZLoad1.n, ground1.p) annotation(Line(points = {{-24, 30}, {2, 30}, {2, 38}, {20, 38}, {20, 38}}, color = {0, 0, 255}));
        connect(pin2, onePhaZLoad2.p) annotation(Line(points = {{-90, 2}, {-44, 2}, {-44, 2}, {-44, 2}}, color = {0, 0, 255}));
        connect(pin1, onePhaZLoad1.p) annotation(Line(points = {{-90, 30}, {-44, 30}, {-44, 30}, {-44, 30}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-30, 5}, extent = {{-44, 31}, {52, -37}}), Ellipse(origin = {46, 7}, extent = {{-14, 15}, {24, -27}}, endAngle = 360), Text(origin = {52, 3}, extent = {{-6, 11}, {6, -11}}, textString = "YO", fontSize = 50), Line(origin = {-29.1181, 3.63736}, points = {{-28.8819, -5.63736}, {-24.8819, 8.36264}, {-22.8819, -5.63736}, {-18.8819, 6.36264}, {-18.8819, 6.36264}, {-16.8819, -5.63736}, {-12.8819, 6.36264}, {-10.8819, -3.63736}, {-8.88188, 0.362639}, {-0.881877, 0.362639}, {1.11812, 6.36264}, {3.11812, 6.36264}, {5.11812, 0.362639}, {5.11812, -3.63736}, {7.11812, -7.63736}, {9.1181, -1.63736}, {11.1181, 4.36264}, {13.1181, 6.36264}, {15.1181, 4.36264}, {15.1181, -1.63736}, {15.1181, -5.63736}, {19.1181, -7.63736}, {21.1181, -1.63736}, {23.1181, 4.36264}, {27.1181, 6.36264}, {29.1181, -1.63736}, {29.1181, -5.63736}, {29.1181, -7.63736}}), Text(origin = {-76, 51}, extent = {{2, -1}, {-2, 1}}, textString = "A", fontSize = 50), Text(origin = {-78, 9}, extent = {{2, -1}, {-2, 1}}, textString = "B", fontSize = 50), Text(origin = {-72, -7}, extent = {{-4, -71}, {-2, 1}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
      end Y_ZLoad;

      model Y_ZLoad2
        extends Interfaces.ThreePort;
        //parameter SI.Resistance R = 1 "Resistance of component";
        parameter SI.ActivePower P1 = 0.1 "Active Power";
        parameter SI.ReactivePower Q1 = 0.1 "Reactive Power";
        parameter SI.ActivePower P2 = 0.1 "Active Power";
        parameter SI.ReactivePower Q2 = 0.1 "Reactive Power";
        parameter SI.ActivePower P3 = 0.1 "Active Power";
        parameter SI.ReactivePower Q3 = 0.1 "Reactive Power";
        parameter SI.Voltage Vn = 10e3 "normal voltage";
        SI.Resistance R1;
        SI.Reactance X1;
        SI.Resistance R2;
        SI.Reactance X2;
        SI.Resistance R3;
        SI.Reactance X3;
        Real vARe;
        //brach voltage
        Real vBRe;
        Real vCRe;
        Real vAIm;
        //brach voltage
        Real vBIm;
        Real vCIm;
        Real iARe;
        //brach i
        Real iBRe;
        Real iCRe;
        Real iAIm;
        //brach  i
        Real iBIm;
        Real iCIm;
      equation
        vARe = pA.vRe - 0;
        vBRe = pB.vRe - 0;
        vCRe = pC.vRe - 0;
        vAIm = pA.vIm - 0;
        vBIm = pB.vIm - 0;
        vCIm = pC.vIm - 0;
        pA.iRe = iARe;
        pB.iRe = iBRe;
        pC.iRe = iCRe;
        pA.iIm = iAIm;
        pB.iIm = iBIm;
        pC.iIm = iCIm;
//  vARe * iARe + vAIm * iAIm = P;
//  (-vARe * iAIm) + vAIm * iARe = Q;
//  vBRe * iBRe + vBIm * iBIm = P;
//  (-vBRe * iBIm) + vBIm * iBRe = Q;
//  vCRe * iCRe + vCIm * iCIm = P;
//  (-vCRe * iCIm) + vCIm * iCRe = Q;
      equation
        R1 = Vn * P1 / (P1 ^ 2 + Q1 ^ 2);
        X1 = Vn * Q1 / (P1 ^ 2 + Q1 ^ 2);
        vARe = R1 * iARe - X1 * iAIm;
        vAIm = R1 * iAIm + X1 * iARe;
        R2 = Vn * P2 / (P2 ^ 2 + Q2 ^ 2);
        X2 = Vn * Q2 / (P2 ^ 2 + Q2 ^ 2);
        vBRe = R2 * iBRe - X2 * iBIm;
        vBIm = R2 * iBIm + X2 * iBRe;
        R3 = Vn * P3 / (P3 ^ 2 + Q3 ^ 2);
        X3 = Vn * Q3 / (P3 ^ 2 + Q3 ^ 2);
        vCRe = R3 * iCRe - X3 * iCIm;
        vCIm = R3 * iCIm + X3 * iCRe;
//vRe * iRe + vIm * iIm = P;
//(-vRe * iIm) + vIm * iRe = Q;
//iRe * (vRe ^ 2 + vIm ^ 2) = vRe * P + vIm * Q;
//iIm * (vRe ^ 2 + vIm ^ 2) = vIm * P - vRe * Q;
        annotation(Icon(graphics = {Text(origin = {91, 76}, extent = {{-9, 24}, {9, -24}}, textString = "A", fontSize = 50), Rectangle(origin = {25, 15}, extent = {{-41, 37}, {41, -37}}), Text(origin = {20, 14}, extent = {{-24, 20}, {24, -20}}, textString = "YZ", fontSize = 150)}));
      end Y_ZLoad2;

      model D_ILoad
        parameter SI.ActivePower P1 = 0.1 "Active Power";
        parameter SI.ReactivePower Q1 = 0.1 "Reactive Power";
        parameter SI.ActivePower P2 = 0.1 "Active Power";
        parameter SI.ReactivePower Q2 = 0.1 "Reactive Power";
        parameter SI.ActivePower P3 = 0.1 "Active Power";
        parameter SI.ReactivePower Q3 = 0.1 "Reactive Power";
        OnePhaILoad onePhaILoad1(P = P1, Q = Q1) annotation(Placement(visible = true, transformation(origin = {0, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaILoad onePhaILoad2(P = P1, Q = Q1) annotation(Placement(visible = true, transformation(origin = {2, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        OnePhaILoad onePhaILoad3(P = P1, Q = Q1) annotation(Placement(visible = true, transformation(origin = {2, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin annotation(Placement(visible = true, transformation(origin = {-88, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-88, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-90, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-86, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(pin2, onePhaILoad3.p) annotation(Line(points = {{-90, -26}, {-26, -26}, {-26, -32}, {-8, -32}, {-8, -28}, {-8, -28}}, color = {0, 0, 255}));
        connect(pin1, onePhaILoad2.p) annotation(Line(points = {{-90, 10}, {-22, 10}, {-22, 4}, {-8, 4}, {-8, 10}, {-8, 10}}, color = {0, 0, 255}));
        connect(onePhaILoad3.n, onePhaILoad1.p) annotation(Line(points = {{12, -28}, {24, -28}, {24, -38}, {-32, -38}, {-32, 52}, {-10, 52}, {-10, 48}, {-10, 48}}, color = {0, 0, 255}));
        connect(onePhaILoad2.n, onePhaILoad3.p) annotation(Line(points = {{12, 10}, {24, 10}, {24, -4}, {-18, -4}, {-18, -28}, {-8, -28}, {-8, -28}, {-8, -28}}, color = {0, 0, 255}));
        connect(onePhaILoad1.n, onePhaILoad2.p) annotation(Line(points = {{10, 48}, {26, 48}, {26, 30}, {-16, 30}, {-16, 10}, {-8, 10}, {-8, 10}}, color = {0, 0, 255}));
        connect(pin, onePhaILoad1.p) annotation(Line(points = {{-88, 46}, {-10, 46}, {-10, 48}, {-10, 48}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {-11, 11}, extent = {{-47, 33}, {47, -33}}), Text(origin = {-14, 11}, extent = {{-20, 13}, {20, -13}}, textString = "DI", fontSize = 100)}));
      end D_ILoad;

      model Y_ILoad
        parameter SI.ActivePower P1 = 0.1 "Active Power";
        parameter SI.ReactivePower Q1 = 0.1 "Reactive Power";
        parameter SI.ActivePower P2 = 0.1 "Active Power";
        parameter SI.ReactivePower Q2 = 0.1 "Reactive Power";
        parameter SI.ActivePower P3 = 0.1 "Active Power";
        parameter SI.ReactivePower Q3 = 0.1 "Reactive Power";
        OnePhaILoad onePhaILoad1(P = P1, Q = Q1) annotation(Placement(visible = true, transformation(origin = {14, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaILoad onePhaILoad2(P = P2, Q = Q2) annotation(Placement(visible = true, transformation(origin = {20, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        ADN_Modelica.Basic.OnePhaILoad onePhaILoad3(P = P3, Q = Q3) annotation(Placement(visible = true, transformation(origin = {22, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin annotation(Placement(visible = true, transformation(origin = {-82, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-80, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-82, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-82, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground1 annotation(Placement(visible = true, transformation(origin = {76, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground2 annotation(Placement(visible = true, transformation(origin = {70, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
        Ground ground3 annotation(Placement(visible = true, transformation(origin = {72, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      equation
        connect(pin2, onePhaILoad3.p) annotation(Line(points = {{-82, -18}, {12, -18}, {12, -16}}, color = {0, 0, 255}));
        connect(onePhaILoad3.n, ground3.p) annotation(Line(points = {{32, -16}, {56, -16}, {56, -10}, {72, -10}}, color = {0, 0, 255}));
        connect(pin1, onePhaILoad2.p) annotation(Line(points = {{-80, 16}, {10, 16}}, color = {0, 0, 255}));
        connect(onePhaILoad2.n, ground2.p) annotation(Line(points = {{30, 16}, {54, 16}, {54, 24}, {70, 24}}, color = {0, 0, 255}));
        connect(onePhaILoad1.n, ground1.p) annotation(Line(points = {{24, 52}, {48, 52}, {48, 60}, {76, 60}, {76, 60}}, color = {0, 0, 255}));
        connect(pin, onePhaILoad1.p) annotation(Line(points = {{-82, 52}, {4, 52}, {4, 52}, {4, 52}}, color = {0, 0, 255}));
        annotation(Icon(graphics = {Rectangle(origin = {6, 14}, extent = {{-46, 32}, {46, -32}}), Text(origin = {3, 12}, extent = {{-23, 16}, {23, -16}}, textString = "YI", fontSize = 100), Text(origin = {-62, 66}, extent = {{-10, 12}, {10, -12}}, textString = "A", fontSize = 50)}));
      end Y_ILoad;
    end ThreePhaseZorILoad;

    model ThreePhaseShuntPerMile
      extends Interfaces.ThreePhaseBranch;
      parameter Real Length = 1 "Foot";
      parameter Real UG11 = 1 "G11";
      parameter Real UG12 = 1;
      parameter Real UG13 = 1;
      parameter Real UG21 = 1;
      parameter Real UG22 = 1;
      parameter Real UG23 = 1;
      parameter Real UG31 = 1;
      parameter Real UG32 = 1;
      parameter Real UG33 = 1;
      parameter Real UB11 = 1 "G11";
      parameter Real UB12 = 1;
      parameter Real UB13 = 1;
      parameter Real UB21 = 1;
      parameter Real UB22 = 1;
      parameter Real UB23 = 1;
      parameter Real UB31 = 1;
      parameter Real UB32 = 1;
      parameter Real UB33 = 1;
      SI.Resistance G11;
      SI.Resistance G12;
      SI.Resistance G13;
      SI.Resistance G21;
      SI.Resistance G22;
      SI.Resistance G23;
      SI.Resistance G31;
      SI.Resistance G32;
      SI.Resistance G33;
      SI.Resistance B11;
      SI.Resistance B12;
      SI.Resistance B13;
      SI.Resistance B21;
      SI.Resistance B22;
      SI.Resistance B23;
      SI.Resistance B31;
      SI.Resistance B32;
      SI.Resistance B33;
    equation
      G11 = UG11 * Length * Constants.foot2mile;
      G12 = UG12 * Length * Constants.foot2mile;
      G13 = UG13 * Length * Constants.foot2mile;
      G21 = UG21 * Length * Constants.foot2mile;
      G22 = UG22 * Length * Constants.foot2mile;
      G23 = UG23 * Length * Constants.foot2mile;
      G31 = UG31 * Length * Constants.foot2mile;
      G32 = UG32 * Length * Constants.foot2mile;
      G33 = UG33 * Length * Constants.foot2mile;
      B11 = UB11 * Length * Constants.foot2mile;
      B12 = UB12 * Length * Constants.foot2mile;
      B13 = UB13 * Length * Constants.foot2mile;
      B21 = UB21 * Length * Constants.foot2mile;
      B22 = UB22 * Length * Constants.foot2mile;
      B23 = UB23 * Length * Constants.foot2mile;
      B31 = UB31 * Length * Constants.foot2mile;
      B32 = UB32 * Length * Constants.foot2mile;
      B33 = UB33 * Length * Constants.foot2mile;
      i1Re = G11 * v1Re + G12 * v2Re + G13 * v3Re - B11 * v1Im - B12 * v2Im - B13 * v3Im;
      i2Re = G21 * v1Re + G22 * v2Re + G23 * v3Re - B21 * v1Im - B22 * v2Im - B23 * v3Im;
      i3Re = G31 * v1Re + G32 * v2Re + G33 * v3Re - B31 * v1Im - B32 * v2Im - B33 * v3Im;
      i1Im = B11 * v1Re + B12 * v2Re + B13 * v3Re + G11 * v1Im + G12 * v2Im + G13 * v3Im;
      i2Im = B21 * v1Re + B22 * v2Re + B23 * v3Re + G21 * v1Im + G22 * v2Im + G23 * v3Im;
      i3Im = B31 * v1Re + B32 * v2Re + B33 * v3Re + G31 * v1Im + G32 * v2Im + G33 * v3Im;
      annotation(Icon(graphics = {Polygon(origin = {-85.0097, -3.34916}, points = {{-4.99029, 25.3492}, {-4.99029, -24.6508}, {3.00971, -20.6508}, {-4.99029, 25.3492}, {5.00971, -24.6508}, {-4.99029, 25.3492}}), Polygon(origin = {2.57103, -2.40055}, points = {{-4.57103, 28.4006}, {-6.57103, -27.5994}, {7.42897, -25.5994}, {5.42897, -25.5994}, {5.42897, -23.5994}, {-4.57103, 28.4006}}), Polygon(origin = {91.9976, -3.44855}, points = {{-1.99764, 29.4486}, {-3.99764, -28.5514}, {4.00236, -28.5514}, {-1.99764, 29.4486}})}, coordinateSystem(initialScale = 0.1)));
    end ThreePhaseShuntPerMile;

    model ThreePhase_pi_LinePerMile
      parameter Real Lengtha = 1 "Foot";
      parameter SI.Resistance UR11a = 1 "Ohm/Mile";
      parameter SI.Resistance UR12a = 0 "UR12";
      parameter SI.Resistance UR13a = 0 "UR13";
      parameter SI.Resistance UR21a = 0 "R21";
      parameter SI.Resistance UR22a = 1 "R22";
      parameter SI.Resistance UR23a = 0 "R23";
      parameter SI.Resistance UR31a = 0 "R31";
      parameter SI.Resistance UR32a = 0 "R32";
      parameter SI.Resistance UR33a = 1 "R33";
      parameter SI.Reactance UX11a = 1 "Ohm/km";
      parameter SI.Reactance UX12a = 0 "X12";
      parameter SI.Reactance UX13a = 0 "X13";
      parameter SI.Reactance UX21a = 0 "X21";
      parameter SI.Reactance UX22a = 1 "X22";
      parameter SI.Reactance UX23a = 0 "X23";
      parameter SI.Reactance UX31a = 0 "X31";
      parameter SI.Reactance UX32a = 0 "X32";
      parameter SI.Reactance UX33a = 1 "X33";
      parameter Real UG11a = 1 "G11";
      parameter Real UG12a = 1;
      parameter Real UG13a = 1;
      parameter Real UG21a = 1;
      parameter Real UG22a = 1;
      parameter Real UG23a = 1;
      parameter Real UG31a = 1;
      parameter Real UG32a = 1;
      parameter Real UG33a = 1;
      parameter Real UB11a = 1 "G11";
      parameter Real UB12a = 1;
      parameter Real UB13a = 1;
      parameter Real UB21a = 1;
      parameter Real UB22a = 1;
      parameter Real UB23a = 1;
      parameter Real UB31a = 1;
      parameter Real UB32a = 1;
      parameter Real UB33a = 1;
      ThreePhaseShuntPerMile threePhaseShuntPerMile1(Length = Lengtha, UB11 = UB11a, UB12 = UB12a, UB13 = UB13a, UB21 = UB21a, UB22 = UB22a, UB23 = UB23a, UB31 = UB31a, UB32 = UB32a, UB33 = UB33a, UG11 = UG11a, UG12 = UG12a, UG13 = UG13a, UG21 = UG21a, UG22 = UG22a, UG23 = UG23a, UG31 = UG31a, UG32 = UG32a, UG33 = UG33a) annotation(Placement(visible = true, transformation(origin = {28, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseShuntPerMile threePhaseShuntPerMile2(Length = Lengtha, UB11 = UB11a, UB12 = UB12a, UB13 = UB13a, UB21 = UB21a, UB22 = UB22a, UB23 = UB23a, UB31 = UB31a, UB32 = UB32a, UB33 = UB33a, UG11 = UG11a, UG12 = UG12a, UG13 = UG13a, UG21 = UG21a, UG22 = UG22a, UG23 = UG23a, UG31 = UG31a, UG32 = UG32a, UG33 = UG33a) annotation(Placement(visible = true, transformation(origin = {-36, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = Lengtha, UR11 = UR11a, UR12 = UR12a, UR13 = UR13a, UR21 = UR21a, UR22 = UR22a, UR23 = UR23a, UR31 = UR31a, UR32 = UR32a, UR33 = UR33a, UX11 = UX11a, UX12 = UX12a, UX13 = UX13a, UX21 = UX21a, UX22 = UX22a, UX23 = UX23a, UX31 = UX31a, UX32 = UX32a, UX33 = UX33a) annotation(Placement(visible = true, transformation(origin = {-7, 35}, extent = {{11, -11}, {-11, 11}}, rotation = 90)));
      ADN_Modelica.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-36, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {30, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Interfaces.FRNode pin annotation(Placement(visible = true, transformation(origin = {-70, 44}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {-89, 57}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-70, 35}, extent = {{-8, -7}, {8, 7}}, rotation = 0), iconTransformation(origin = {-89, 23}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      ADN_Modelica.Interfaces.FRNode pin2 annotation(Placement(visible = true, transformation(origin = {-70, 25}, extent = {{-8, -7}, {8, 7}}, rotation = 0), iconTransformation(origin = {-87, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      ADN_Modelica.Interfaces.TONode pin_n annotation(Placement(visible = true, transformation(origin = {66, 45}, extent = {{-8, -7}, {8, 7}}, rotation = 0), iconTransformation(origin = {85, 53}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      ADN_Modelica.Interfaces.TONode pin_n1 annotation(Placement(visible = true, transformation(origin = {66, 34}, extent = {{-8, -8}, {8, 8}}, rotation = 0), iconTransformation(origin = {85, 21}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      ADN_Modelica.Interfaces.TONode pin_n2 annotation(Placement(visible = true, transformation(origin = {66, 23}, extent = {{-8, -7}, {8, 7}}, rotation = 0), iconTransformation(origin = {85, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
    equation
      connect(threePhaseShuntPerMile1.n1, ground2.p) annotation(Line(points = {{18, 0}, {18, -16}, {30, -16}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile1.n2, ground2.p) annotation(Line(points = {{28, 0}, {28, -8}, {30, -8}, {30, -16}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile1.n3, ground2.p) annotation(Line(points = {{38, 0}, {38, -16}, {30, -16}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile2.n3, ground1.p) annotation(Line(points = {{-26, 0}, {-26, 0}, {-26, -16}, {-36, -16}, {-36, -16}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile2.n2, ground1.p) annotation(Line(points = {{-36, 0}, {-36, 0}, {-36, -16}, {-36, -16}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile2.n1, ground1.p) annotation(Line(points = {{-46, 0}, {-46, 0}, {-46, -16}, {-36, -16}, {-36, -16}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile1.p3, threePhaImpedancePerMile1.n3) annotation(Line(points = {{38, 12}, {38, 12}, {38, 32}, {-2, 32}, {-2, 26}, {-2, 26}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile1.p2, threePhaImpedancePerMile1.n2) annotation(Line(points = {{28, 12}, {28, 12}, {28, 42}, {-2, 42}, {-2, 36}, {-2, 36}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile1.p1, threePhaImpedancePerMile1.n1) annotation(Line(points = {{18, 12}, {18, 12}, {18, 52}, {-2, 52}, {-2, 46}, {-2, 46}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile2.p3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-26, 12}, {-24, 12}, {-24, 30}, {-12, 30}, {-12, 24}, {-12, 24}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile2.p2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-36, 12}, {-36, 12}, {-36, 40}, {-12, 40}, {-12, 36}, {-12, 36}}, color = {0, 0, 255}));
      connect(threePhaseShuntPerMile2.p1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-46, 11}, {-46, 52}, {-12, 52}, {-12, 46}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, pin_n2) annotation(Line(points = {{-2, 26}, {60, 26}, {60, 24}, {66, 24}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, pin_n1) annotation(Line(points = {{-2, 36}, {64, 36}, {64, 34}, {66, 34}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, pin_n) annotation(Line(points = {{-2, 46}, {66, 46}, {66, 46}, {66, 46}}, color = {0, 0, 255}));
      connect(pin2, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-70, 26}, {-13, 26}, {-13, 25}}, color = {0, 0, 255}));
      connect(pin1, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-70, 36}, {-39, 36}, {-39, 35}, {-13, 35}}, color = {0, 0, 255}));
      connect(pin, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-70, 44}, {-13, 44}, {-13, 46}}, color = {0, 0, 255}));
      annotation(Icon(graphics = {Rectangle(origin = {-5, 32}, extent = {{-31, 12}, {47, -26}}), Text(origin = {-72, 55}, extent = {{-6, 9}, {6, -9}}, textString = "A", fontSize = 50), Text(origin = {-70, 23}, extent = {{-6, 9}, {6, -9}}, textString = "B", fontSize = 50), Text(origin = {70, 55}, extent = {{-6, 9}, {6, -9}}, textString = "A", fontSize = 50), Text(origin = {70, 21}, extent = {{-6, 9}, {6, -9}}, textString = "B", fontSize = 50), Text(origin = {2, 26}, extent = {{-22, 8}, {22, -8}}, textString = "Pi", fontSize = 76), Text(origin = {-70, -17}, extent = {{-6, 9}, {6, -9}}, textString = "C", fontSize = 50), Text(origin = {70, -15}, extent = {{-6, 9}, {6, -9}}, textString = "C", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
    end ThreePhase_pi_LinePerMile;

    model ThreePhaseImpedance2
      extends Interfaces.SixPort;
      // extends Interfaces.ThreePhaseBranch;
      parameter SI.Resistance R11 = 1 "R11";
      parameter SI.Reactance X11 = 1 "X11";
      parameter SI.Resistance R12 = 0 "R12";
      parameter SI.Reactance X12 = 0 "X12";
      parameter SI.Resistance R13 = 0 "R13";
      parameter SI.Reactance X13 = 0 "X13";
      parameter SI.Resistance R21 = 0 "R21";
      parameter SI.Reactance X21 = 0 "X21";
      parameter SI.Resistance R22 = 1 "R22";
      parameter SI.Reactance X22 = 1 "X22";
      parameter SI.Resistance R23 = 0 "R23";
      parameter SI.Reactance X23 = 0 "X23";
      parameter SI.Resistance R31 = 0 "R31";
      parameter SI.Reactance X31 = 0 "X31";
      parameter SI.Resistance R32 = 0 "R32";
      parameter SI.Reactance X32 = 0 "X32";
      parameter SI.Resistance R33 = 1 "R33";
      parameter SI.Reactance X33 = 1 "X33";
      Real v1Re;
      Real v2Re;
      Real v3Re;
      Real v1Im;
      Real v2Im;
      Real v3Im;
      Real i1Re;
      Real i2Re;
      Real i3Re;
      Real i1Im;
      Real i2Im;
      Real i3Im;
    equation
      v1Re = pa.vRe - na.vRe;
      v1Im = pa.vIm - na.vIm;
      v2Re = pb.vRe - nb.vRe;
      v2Im = pb.vIm - nb.vIm;
      v3Re = pc.vRe - nc.vRe;
      v3Im = pc.vIm - nc.vIm;
      0 = pa.iRe + na.iRe;
      0 = pa.iIm + na.iIm;
      0 = pb.iRe + nb.iRe;
      0 = pb.iIm + nb.iIm;
      0 = pc.iRe + nc.iRe;
      0 = pc.iIm + nc.iIm;
      i1Re = pa.iRe;
      i1Im = pa.iIm;
      i2Re = pb.iRe;
      i2Im = pb.iIm;
      i3Re = pc.iRe;
      i3Im = pc.iIm;
      v1Re = R11 * i1Re + R12 * i2Re + R13 * i3Re - X11 * i1Im - X12 * i2Im - X13 * i3Im;
      v2Re = R21 * i1Re + R22 * i2Re + R23 * i3Re - X21 * i1Im - X22 * i2Im - X23 * i3Im;
      v3Re = R31 * i1Re + R32 * i2Re + R33 * i3Re - X31 * i1Im - X32 * i2Im - X33 * i3Im;
      v1Im = X11 * i1Re + X12 * i2Re + X13 * i3Re + R11 * i1Im + R12 * i2Im + R13 * i3Im;
      v2Im = X21 * i1Re + X22 * i2Re + X23 * i3Re + R21 * i1Im + R22 * i2Im + R23 * i3Im;
      v3Im = X31 * i1Re + X32 * i2Re + X33 * i3Re + R31 * i1Im + R32 * i2Im + R33 * i3Im;
      annotation(Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {-68, 48}, extent = {{-6, 16}, {6, -16}}, textString = "A", fontSize = 50)}));
    end ThreePhaseImpedance2;

    model ThreePhaImpedancePerMile_2
      extends Interfaces.SixPort;
      parameter Real Length = 1 "Foot";
      parameter SI.Resistance UR11 = 1 "Ohm/Mile";
      parameter SI.Resistance UR12 = 0 "UR12";
      parameter SI.Resistance UR13 = 0 "UR13";
      parameter SI.Resistance UR21 = 0 "R21";
      parameter SI.Resistance UR22 = 1 "R22";
      parameter SI.Resistance UR23 = 0 "R23";
      parameter SI.Resistance UR31 = 0 "R31";
      parameter SI.Resistance UR32 = 0 "R32";
      parameter SI.Resistance UR33 = 1 "R33";
      parameter SI.Reactance UX11 = 1 "Ohm/km";
      parameter SI.Reactance UX12 = 0 "X12";
      parameter SI.Reactance UX13 = 0 "X13";
      parameter SI.Reactance UX21 = 0 "X21";
      parameter SI.Reactance UX22 = 1 "X22";
      parameter SI.Reactance UX23 = 0 "X23";
      parameter SI.Reactance UX31 = 0 "X31";
      parameter SI.Reactance UX32 = 0 "X32";
      parameter SI.Reactance UX33 = 1 "X33";
      SI.Resistance R11 "R11";
      SI.Reactance X11 "X11";
      SI.Resistance R12 "R11";
      SI.Reactance X12 "X11";
      SI.Resistance R13 "R11";
      SI.Reactance X13 "X11";
      SI.Resistance R21 "R11";
      SI.Reactance X21 "X11";
      SI.Resistance R22 "R11";
      SI.Reactance X22 "X11";
      SI.Resistance R23 "R11";
      SI.Reactance X23 "X11";
      SI.Resistance R31 "R11";
      SI.Reactance X31 "X11";
      SI.Resistance R32 "R11";
      SI.Reactance X32 "X11";
      SI.Resistance R33 "R11";
      SI.Reactance X33 "X11";
      Real v1Re;
      Real v2Re;
      Real v3Re;
      Real v1Im;
      Real v2Im;
      Real v3Im;
      Real i1Re;
      Real i2Re;
      Real i3Re;
      Real i1Im;
      Real i2Im;
      Real i3Im;
    equation
      v1Re = pa.vRe - na.vRe;
//
      v1Im = pa.vIm - na.vIm;
      v2Re = pb.vRe - nb.vRe;
      v2Im = pb.vIm - nb.vIm;
      v3Re = pc.vRe - nc.vRe;
      v3Im = pc.vIm - nc.vIm;
      0 = pa.iRe + na.iRe;
      0 = pa.iIm + na.iIm;
      0 = pb.iRe + nb.iRe;
      0 = pb.iIm + nb.iIm;
      0 = pc.iRe + nc.iRe;
      0 = pc.iIm + nc.iIm;
      i1Re = pa.iRe;
      i1Im = pa.iIm;
      i2Re = pb.iRe;
      i2Im = pb.iIm;
      i3Re = pc.iRe;
      i3Im = pc.iIm;
//
      R11 = UR11 * Length * Constants.foot2mile;
      R12 = UR12 * Length * Constants.foot2mile;
      R13 = UR13 * Length * Constants.foot2mile;
      R21 = UR21 * Length * Constants.foot2mile;
      R22 = UR22 * Length * Constants.foot2mile;
      R23 = UR23 * Length * Constants.foot2mile;
      R31 = UR31 * Length * Constants.foot2mile;
      R32 = UR32 * Length * Constants.foot2mile;
      R33 = UR33 * Length * Constants.foot2mile;
      X11 = UX11 * Length * Constants.foot2mile;
      X12 = UX12 * Length * Constants.foot2mile;
      X13 = UX13 * Length * Constants.foot2mile;
      X21 = UX21 * Length * Constants.foot2mile;
      X22 = UX22 * Length * Constants.foot2mile;
      X23 = UX23 * Length * Constants.foot2mile;
      X31 = UX31 * Length * Constants.foot2mile;
      X32 = UX32 * Length * Constants.foot2mile;
      X33 = UX33 * Length * Constants.foot2mile;
      v1Re = R11 * i1Re + R12 * i2Re + R13 * i3Re - X11 * i1Im - X12 * i2Im - X13 * i3Im;
      v2Re = R21 * i1Re + R22 * i2Re + R23 * i3Re - X21 * i1Im - X22 * i2Im - X23 * i3Im;
      v3Re = R31 * i1Re + R32 * i2Re + R33 * i3Re - X31 * i1Im - X32 * i2Im - X33 * i3Im;
      v1Im = X11 * i1Re + X12 * i2Re + X13 * i3Re + R11 * i1Im + R12 * i2Im + R13 * i3Im;
      v2Im = X21 * i1Re + X22 * i2Re + X23 * i3Re + R21 * i1Im + R22 * i2Im + R23 * i3Im;
      v3Im = X31 * i1Re + X32 * i2Re + X33 * i3Re + R31 * i1Im + R32 * i2Im + R33 * i3Im;
      annotation(Diagram(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {0, 53}, extent = {{-18, 5}, {18, -5}}), Rectangle(origin = {-2, -4}, extent = {{-20, 6}, {20, -6}}), Rectangle(origin = {-1, -53}, extent = {{-21, 5}, {21, -5}}), Line(origin = {-49, 52}, points = {{-31, 0}, {31, 0}, {31, 0}}), Line(origin = {44.5, 54}, points = {{-26.5, 0}, {27.5, 0}, {25.5, 0}}), Line(origin = {-50, -4}, points = {{-28, 0}, {28, 0}}), Line(origin = {47, -4}, points = {{-27, 0}, {27, 0}}), Line(origin = {-50, -54}, points = {{-28, 0}, {28, 0}}), Line(origin = {48, -52}, points = {{-26, 0}, {26, 0}}), Line(origin = {2, 28}, points = {{-40, -22}, {40, 22}, {40, 22}}), Line(origin = {5, 28}, points = {{-43, 18}, {43, -18}, {43, -18}, {43, -18}}), Line(origin = {-1, -29}, points = {{-37, 13}, {37, -13}}), Line(origin = {-2.46703, -29.1456}, points = {{-33.533, -12.8544}, {34.467, 13.1456}, {32.467, 13.1456}})}), Icon(graphics = {Rectangle(origin = {-3, 50}, extent = {{-41, 8}, {41, -8}}), Rectangle(origin = {-3, -6}, extent = {{-41, 8}, {41, -8}}), Rectangle(origin = {0, -58}, extent = {{-38, 8}, {38, -8}}), Text(origin = {-66, 51}, extent = {{-8, 17}, {8, -17}}, textString = "A", fontSize = 50)}));
    end ThreePhaImpedancePerMile_2;

    model OnePhaseBreaker
      extends Interfaces.OnePhaseBranch;
      parameter Boolean bopen = true;
    equation
      if bopen then
        iRe = 0;
        iIm = 0;
      else
        vRe = 0;
        vIm = 0;
      end if;
    end OnePhaseBreaker;

    model ThreePhaseBreaker
      extends Interfaces.ThreePhaseBranch;
      parameter Boolean bopen = true;
    equation
      if bopen then
        i1Re = 0;
        i1Im = 0;
        i2Re = 0;
        i2Im = 0;
        i3Re = 0;
        i3Im = 0;
      else
        v1Re = 0;
        v1Im = 0;
        v2Re = 0;
        v2Im = 0;
        v3Re = 0;
        v3Im = 0;
      end if;
    annotation(Icon(graphics = {Line(origin = {-98, 25}, points = {{0, 15}, {0, -15}}), Line(origin = {-90.814, -8.81401}, points = {{-9.18599, -31.186}, {-9.18599, 0.814006}, {8.81401, 30.814}}), Line(origin = {-4, 26}, points = {{0, 14}, {0, -14}}), Line(origin = {7.18092, -7.81908}, points = {{-9.18092, -32.1809}, {-9.18092, -0.180918}, {8.81908, 31.8191}, {8.81908, 31.8191}})}));end ThreePhaseBreaker;

    model TwoPhaImpedancePerMile
      extends Interfaces.TwoPhaseBranch;
      parameter Real Length = 1 "Foot";
      parameter SI.Resistance UR11 = 1 "R11";
      parameter SI.Reactance UX11 = 1 "X11";
      parameter SI.Resistance UR12 = 1 "R12";
      parameter SI.Reactance UX12 = 1 "X12";
      parameter SI.Resistance UR21 = 1 "R21";
      parameter SI.Reactance UX21 = 1 "X21";
      parameter SI.Resistance UR22 = 1 "R22";
      parameter SI.Reactance UX22 = 1 "X22";
      SI.Resistance R11 "R11";
      SI.Reactance X11 "X11";
      SI.Resistance R12 "R11";
      SI.Reactance X12 "X11";
      SI.Resistance R21 "R11";
      SI.Reactance X21 "X11";
      SI.Resistance R22 "R11";
      SI.Reactance X22 "X11";
    equation
      R11 = UR11 * Length * Constants.foot2mile;
      R12 = UR12 * Length * Constants.foot2mile;
      R21 = UR21 * Length * Constants.foot2mile;
      R22 = UR22 * Length * Constants.foot2mile;
      X11 = UX11 * Length * Constants.foot2mile;
      X12 = UX12 * Length * Constants.foot2mile;
      X21 = UX21 * Length * Constants.foot2mile;
      X22 = UX22 * Length * Constants.foot2mile;
      v1Re = R11 * i1Re + R12 * i2Re - X11 * i1Im - X12 * i2Im;
      v2Re = R21 * i1Re + R22 * i2Re - X21 * i1Im - X22 * i2Im;
      v1Im = X11 * i1Re + X12 * i2Re + R11 * i1Im + R12 * i2Im;
      v2Im = X21 * i1Re + X22 * i2Re + R12 * i1Im + R22 * i2Im;
      annotation(Diagram(graphics = {Line(origin = {-18, -3}, points = {{-44, 37}})}, coordinateSystem(initialScale = 0.1)), Icon(graphics = {Line(origin = {-98, -3}, points = {{0, 51}, {0, -51}}), Line(origin = {58, -4}, points = {{0, 52}}), Line(origin = {100, -3}, points = {{0, 49}, {0, -49}}), Line(origin = {3, 1}, points = {{-55, -37}}), Line(origin = {-40, 6}, points = {{-58, -46}, {140, 34}}), Line(origin = {-36, -7}, points = {{-62, 47}, {136, -33}}), Text(origin = {-77, 54}, extent = {{7, 2}, {-7, -2}}, textString = "A", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
    end TwoPhaImpedancePerMile;

    model TwoPhaseShuntPerMile
      extends Interfaces.TwoPhaseBranch;
      parameter Real Length = 1 "Foot";
      parameter Real UG11 = 1 "G11";
      parameter Real UG12 = 1;
      parameter Real UG21 = 1;
      parameter Real UG22 = 1;
      parameter Real UB11 = 1 "G11";
      parameter Real UB12 = 1;
      parameter Real UB21 = 1;
      parameter Real UB22 = 1;
      SI.Resistance G11;
      SI.Resistance G12;
      SI.Resistance G21;
      SI.Resistance G22;
      SI.Resistance B11;
      SI.Resistance B12;
      SI.Resistance B21;
      SI.Resistance B22;
    equation
      G11 = UG11 * Length * Constants.foot2mile;
      G12 = UG12 * Length * Constants.foot2mile;
      G21 = UG21 * Length * Constants.foot2mile;
      G22 = UG22 * Length * Constants.foot2mile;
      B11 = UB11 * Length * Constants.foot2mile;
      B12 = UB12 * Length * Constants.foot2mile;
      B21 = UB21 * Length * Constants.foot2mile;
      B22 = UB22 * Length * Constants.foot2mile;
      i1Re = G11 * v1Re + G12 * v2Re - B11 * v1Im - B12 * v2Im;
      i2Re = G21 * v1Re + G22 * v2Re - B21 * v1Im - B22 * v2Im;
      i1Im = B11 * v1Re + B12 * v2Re + G11 * v1Im + G12 * v2Im;
      i2Im = B21 * v1Re + B22 * v2Re + G21 * v1Im + G22 * v2Im;
      annotation(Icon(graphics = {Polygon(origin = {-85.0097, -3.34916}, points = {{-4.99029, 25.3492}, {-4.99029, -24.6508}, {3.00971, -20.6508}, {-4.99029, 25.3492}, {5.00971, -24.6508}, {-4.99029, 25.3492}}), Polygon(origin = {91.9976, -3.44855}, points = {{-1.99764, 29.4486}, {-3.99764, -28.5514}, {4.00236, -28.5514}, {-1.99764, 29.4486}}), Text(origin = {-75, 52}, extent = {{-7, 14}, {7, -14}}, textString = "A", fontSize = 50)}, coordinateSystem(initialScale = 0.1)));
    end TwoPhaseShuntPerMile;

    model TwoPhase_pi_LinePerMile
      parameter Real Lengtha = 1 "Foot";
      parameter SI.Resistance UR11a = 1 "Ohm/Mile";
      parameter SI.Resistance UR12a = 0 "UR12";
      parameter SI.Resistance UR21a = 0 "R21";
      parameter SI.Resistance UR22a = 1 "R22";
      parameter SI.Reactance UX11a = 1 "Ohm/km";
      parameter SI.Reactance UX12a = 0 "X12";
      parameter SI.Reactance UX21a = 0 "X21";
      parameter SI.Reactance UX22a = 1 "X22";
      parameter Real UG11a = 1 "G11";
      parameter Real UG12a = 1;
      parameter Real UG21a = 1;
      parameter Real UG22a = 1;
      parameter Real UB11a = 1 "G11";
      parameter Real UB12a = 1;
      parameter Real UB21a = 1;
      parameter Real UB22a = 1;
      TwoPhaseShuntPerMile twoPhaseShuntPerMile1(Length = Lengtha, UB11 = UB11a, UB12 = UB12a, UB21 = UB21a, UB22 = UB22a, UG11 = UG11a, UG12 = UG12a, UG21 = UG21a, UG22 = UG22a) annotation(Placement(visible = true, transformation(origin = {-42, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      TwoPhaseShuntPerMile twoPhaseShuntPerMile2(Length = Lengtha, UB11 = UB11a, UB12 = UB12a, UB21 = UB21a, UB22 = UB22a, UG11 = UG11a, UG12 = UG12a, UG21 = UG21a, UG22 = UG22a) annotation(Placement(visible = true, transformation(origin = {24, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.TwoPhaImpedancePerMile twoPhaImpedancePerMile1(Length = Lengtha, UR11 = UR11a, UR12 = UR12a, UR21 = UR21a, UR22 = UR22a, UX11 = UX11a, UX12 = UX12a, UX21 = UX21a, UX22 = UX22a) annotation(Placement(visible = true, transformation(origin = {-3, 33}, extent = {{13, -13}, {-13, 13}}, rotation = 90)));
      ADN_Modelica.Interfaces.FRNode pin annotation(Placement(visible = true, transformation(origin = {-68, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Interfaces.FRNode pin1 annotation(Placement(visible = true, transformation(origin = {-68, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Interfaces.TONode pin_n annotation(Placement(visible = true, transformation(origin = {56, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {58, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Interfaces.TONode pin_n1 annotation(Placement(visible = true, transformation(origin = {56, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Ground ground1 annotation(Placement(visible = true, transformation(origin = {-42, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Ground ground2 annotation(Placement(visible = true, transformation(origin = {26, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(twoPhaseShuntPerMile2.n2, ground2.p) annotation(Line(points = {{34, -6}, {34, -6}, {34, -22}, {26, -22}, {26, -22}}, color = {0, 0, 255}));
      connect(twoPhaseShuntPerMile2.n1, ground2.p) annotation(Line(points = {{14, -6}, {14, -6}, {14, -22}, {26, -22}, {26, -22}}, color = {0, 0, 255}));
      connect(twoPhaseShuntPerMile1.n2, ground1.p) annotation(Line(points = {{-32, -6}, {-32, -6}, {-32, -24}, {-42, -24}, {-42, -24}}, color = {0, 0, 255}));
      connect(twoPhaseShuntPerMile1.n1, ground1.p) annotation(Line(points = {{-52, -6}, {-52, -6}, {-52, -24}, {-42, -24}, {-42, -24}}, color = {0, 0, 255}));
      connect(twoPhaseShuntPerMile2.p2, twoPhaImpedancePerMile1.n2) annotation(Line(points = {{34, 4}, {34, 4}, {34, 28}, {4, 28}, {4, 20}, {4, 20}}, color = {0, 0, 255}));
      connect(twoPhaseShuntPerMile2.p1, twoPhaImpedancePerMile1.n1) annotation(Line(points = {{14, 4}, {14, 4}, {14, 54}, {4, 54}, {4, 46}, {4, 46}}, color = {0, 0, 255}));
      connect(twoPhaseShuntPerMile1.p1, twoPhaImpedancePerMile1.p1) annotation(Line(points = {{-52, 4}, {-50, 4}, {-50, 52}, {-10, 52}, {-10, 46}, {-10, 46}}, color = {0, 0, 255}));
      connect(twoPhaseShuntPerMile1.p2, twoPhaImpedancePerMile1.p2) annotation(Line(points = {{-32, 4}, {-32, 4}, {-32, 26}, {-10, 26}, {-10, 20}, {-10, 20}}, color = {0, 0, 255}));
      connect(twoPhaImpedancePerMile1.n2, pin_n1) annotation(Line(points = {{4, 20}, {54, 20}, {54, 20}, {56, 20}}, color = {0, 0, 255}));
      connect(twoPhaImpedancePerMile1.n1, pin_n) annotation(Line(points = {{3.5, 46}, {56, 46}}, color = {0, 0, 255}));
      connect(pin1, twoPhaImpedancePerMile1.p2) annotation(Line(points = {{-68, 20}, {-9.5, 20}}, color = {0, 0, 255}));
      connect(pin, twoPhaImpedancePerMile1.p1) annotation(Line(points = {{-68, 46}, {-9.5, 46}}, color = {0, 0, 255}));
      annotation(Icon(graphics = {Text(origin = {-78, 71}, extent = {{-10, 13}, {10, -13}}, textString = "A", fontSize = 50), Rectangle(origin = {-11, 29}, extent = {{-35, 17}, {35, -17}}), Text(origin = {-15, 28}, extent = {{-19, 8}, {19, -8}}, textString = "Pi", fontSize = 100)}));
    end TwoPhase_pi_LinePerMile;

    model OnePhaseShuntPerMile
      extends Interfaces.OnePhaseBranch;
      parameter Real Length = 1 "Foot";
      parameter Real UG11 = 1 "G11";
      // parameter Real UG12 = 1;
      // parameter Real UG21 = 1;
      // parameter Real UG22 = 1;
      parameter Real UB11 = 1 "G11";
      // parameter Real UB12 = 1;
      // parameter Real UB21 = 1;
      // parameter Real UB22 = 1;
      SI.Resistance G11;
      //  SI.Resistance G12;
      // SI.Resistance G21;
      // SI.Resistance G22;
      SI.Resistance B11;
      // SI.Resistance B12;
      // SI.Resistance B21;
      // SI.Resistance B22;
    equation
      G11 = UG11 * Length * Constants.foot2mile;
// G12 = UG12 * Length * Constants.foot2mile;
// G21 = UG21 * Length * Constants.foot2mile;
// G22 = UG22 * Length * Constants.foot2mile;
      B11 = UB11 * Length * Constants.foot2mile;
// B12 = UB12 * Length * Constants.foot2mile;
// B21 = UB21 * Length * Constants.foot2mile;
// B22 = UB22 * Length * Constants.foot2mile;
      iRe = G11 * vRe - B11 * vIm;
// i2Re = G21 * v1Re + G22 * v2Re - B21 * v1Im - B22 * v2Im;
      iIm = B11 * vRe + G11 * vIm;
// i2Im = B21 * v1Re + B22 * v2Re + G21 * v1Im + G22 * v2Im;
      annotation(Icon(graphics = {Text(origin = {-91, 28}, extent = {{-7, 14}, {7, -14}}, textString = "A", fontSize = 50), Rectangle(origin = {3, -2}, extent = {{-55, 20}, {55, -20}}), Text(origin = {1, -1}, extent = {{-39, 13}, {39, -13}}, textString = "G+jB", fontSize = 80)}, coordinateSystem(initialScale = 0.1)));
    end OnePhaseShuntPerMile;

    model OnePhaImpedancePerMile
      extends Interfaces.OnePhaseBranch;
      parameter Real Length = 1 "Foot";
      parameter SI.Resistance UR11 = 1 "R11";
      parameter SI.Reactance UX11 = 1 "X11";
      SI.Resistance R11 "R11";
      SI.Reactance X11 "X11";
    equation
      R11 = UR11 * Length * Constants.foot2mile;
      X11 = UX11 * Length * Constants.foot2mile;
      vRe = R11 * iRe - X11 * iIm;
      vIm = X11 * iRe + R11 * iIm;
      annotation(Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-4, -7}, extent = {{-68, 27}, {68, -27}}), Text(origin = {-11, -7}, extent = {{-45, 17}, {45, -17}}, textString = "R+jX", fontSize = 80)}));
    end OnePhaImpedancePerMile;

    model OnePhase_pi_LinePerMile
      parameter Real Lengtha = 1 "Foot";
      parameter SI.Resistance UR11a = 1 "Ohm/Mile";
      parameter SI.Reactance UX11a = 1 "Ohm/km";
      parameter Real UG11a = 1 "G11";
      parameter Real UB11a = 1 "G11";
      OnePhaImpedancePerMile onePhaImpedancePerMile1(Length = Lengtha, UR11 = UR11a, UX11 = UX11a) annotation(Placement(visible = true, transformation(origin = {-6, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.OnePhaseShuntPerMile onePhaseShuntPerMile1(Length = Lengtha, UB11 = UB11a, UG11 = UG11a) annotation(Placement(visible = true, transformation(origin = {-38, -14}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      ADN_Modelica.Basic.OnePhaseShuntPerMile onePhaseShuntPerMile2(Length = Lengtha, UB11 = UB11a, UG11 = UG11a) annotation(Placement(visible = true, transformation(origin = {22, -16}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Ground ground1 annotation(Placement(visible = true, transformation(origin = {-38, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Ground ground2 annotation(Placement(visible = true, transformation(origin = {24, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.FRNode pin annotation(Placement(visible = true, transformation(origin = {-78, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-78, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Interfaces.TONode pin_n annotation(Placement(visible = true, transformation(origin = {66, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {66, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(onePhaseShuntPerMile2.n, ground2.p) annotation(Line(points = {{22, -26}, {24, -26}, {24, -42}, {24, -42}}, color = {0, 0, 255}));
      connect(onePhaseShuntPerMile1.n, ground1.p) annotation(Line(points = {{-38, -24}, {-38, -24}, {-38, -40}, {-38, -40}}, color = {0, 0, 255}));
      connect(onePhaseShuntPerMile2.p, onePhaImpedancePerMile1.n) annotation(Line(points = {{22, -6}, {4, -6}, {4, 18}, {4, 18}}, color = {0, 0, 255}));
      connect(onePhaseShuntPerMile1.p, onePhaImpedancePerMile1.p) annotation(Line(points = {{-38, -4}, {-16, -4}, {-16, 18}, {-16, 18}}, color = {0, 0, 255}));
      connect(onePhaImpedancePerMile1.n, pin_n) annotation(Line(points = {{4, 18}, {66, 18}, {66, 18}, {66, 18}}, color = {0, 0, 255}));
      connect(pin, onePhaImpedancePerMile1.p) annotation(Line(points = {{-78, 18}, {-16, 18}, {-16, 18}, {-16, 18}}, color = {0, 0, 255}));
      annotation(Icon(graphics = {Rectangle(origin = {-10, 18}, extent = {{-34, 12}, {34, -12}}), Text(origin = {-14, 17}, extent = {{-20, 7}, {20, -7}}, textString = "Pi", fontSize = 60)}, coordinateSystem(initialScale = 0.1)));
    end OnePhase_pi_LinePerMile;

    model OnePhaseRegulator
      extends Interfaces.TwoPhaseBranch;
    parameter SI.Voltage bandwidth=2.0;
    parameter Real PTRatio=20;
    parameter Real PrimaryCTRating=700;
    parameter Real RSetting=3;
    parameter Real XSetting=9;
    parameter SI.Voltage voltagelevel=122;
    Real k;
    Real tap;
    parameter Real tap0=0;
    SI.Voltage VregRe;
    SI.Voltage VregIm;
    SI.Current IcompRe;
    SI.Current IcompIm;
    SI.Voltage VRelayRe;
    SI.Voltage VRelayIm;
    SI.Resistance Rcomp;
    SI.Reactance Xcomp;
    SI.Voltage Vmax;
    SI.Voltage Vmin;
    SI.Voltage Vrelaymag;
    equation
    if time==0 then
      v1Re = k * v2Re;
      v1Im = k * v2Im;
      i2Re = -k * i1Re;
      i2Im = -k * i1Im;
      k=1-0.00625*tap;
      tap=0;
     VregRe=120;
     VregIm=0;
     IcompRe=0;
     IcompIm=0;
     VRelayRe=120;
     VRelayIm=0;
     Rcomp=1e-6;
     Xcomp=1e-6;
     Vmax=120;
     Vmin=120;
     Vrelaymag=120;
     //tap0=tap;
     
    else
      v1Re = k * v2Re;
      v1Im = k * v2Im;
      i2Re = -k * i1Re;
      i2Im = -k * i1Im;
    
      VregRe=v2Re/PTRatio;
      VregIm=v2Im/PTRatio;
      IcompRe=-i2Re/PrimaryCTRating;
      IcompIm=-i2Im/PrimaryCTRating;
      VRelayRe=VregRe-Rcomp*IcompRe+Xcomp*IcompIm;
      VRelayIm=VregIm-Rcomp*IcompIm-Xcomp*IcompRe;
      Rcomp=RSetting/PrimaryCTRating;//
      Xcomp=XSetting/PrimaryCTRating;
      Vmax=voltagelevel+bandwidth/2;
      Vmin=voltagelevel-bandwidth/2;
      Vrelaymag=sqrt(VRelayRe^2+VRelayIm^2);
      
      if Vrelaymag>Vmax and (Vrelaymag-Vmax)/0.75<16 then
      //tap=-1;
      tap=-((Vrelaymag-Vmax)/0.75);
      elseif Vrelaymag>Vmax and (Vrelaymag-Vmax)/0.75>16 then
      tap=-16;
      elseif Vrelaymag<Vmin and (Vmin-Vrelaymag)/0.75<16 then
      //tap=+1;
      tap=((Vmin-Vrelaymag)/0.75);
      elseif Vrelaymag<Vmin and (Vmin-Vrelaymag)/0.75>16 then
      tap=16;
      else
      tap=0.0; 
      end if;
      
      k=1-0.00625*tap;       
    end if;  
    end OnePhaseRegulator;
  end Basic;

  model SystemSettings
    parameter SI.Frequency frequency = 60;
    annotation(Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {140, 100}}), graphics = {Rectangle(extent = {{-100, 100}, {140, -100}}, lineColor = {28, 108, 200}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-80, -20}, {120, -60}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Left, textString = "Frequency: %frequency Hz"), Text(extent = {{-80, 100}, {120, 60}}, lineColor = {28, 108, 200}, horizontalAlignment = TextAlignment.Center, textString = "System Settings")}), defaultComponentName = "SysData", defaultAttributes = "inner", Diagram(coordinateSystem(extent = {{-100, -100}, {140, 100}})));
  end SystemSettings;

  package Example
    model TestVoltageSourceExample
      Basic.VoltageSource voltageSource1 annotation(Placement(visible = true, transformation(origin = {4, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-26, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Basic.OnePhaseBreaker onePhaseBreaker1 annotation(Placement(visible = true, transformation(origin = {40, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(voltageSource1.n, onePhaseBreaker1.p) annotation(Line(points = {{14, 20}, {22, 20}, {22, 18}, {30, 18}, {30, 18}}, color = {0, 0, 255}));
      connect(voltageSource1.p, ground1.p) annotation(Line(points = {{-6, 20}, {-26, 20}, {-26, -4}, {-26, -4}, {-26, -4}}, color = {0, 0, 255}));
    end TestVoltageSourceExample;

    model TestOnePhaseImpedance
      Basic.VoltageSource voltageSource1 annotation(Placement(visible = true, transformation(origin = {-20, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-36, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.OnePhaseImpedance onePhaseImpedance1 annotation(Placement(visible = true, transformation(origin = {22, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(onePhaseImpedance1.n, ground1.p) annotation(Line(points = {{32, 22}, {32, -12}, {-36, -12}}, color = {0, 0, 255}));
      connect(onePhaseImpedance1.p, voltageSource1.n) annotation(Line(points = {{12, 22}, {-10, 22}}, color = {0, 0, 255}));
      connect(ground1.p, voltageSource1.p) annotation(Line(points = {{-36, -12}, {-38, -12}, {-38, 22}, {-30, 22}, {-30, 22}}, color = {0, 0, 255}));
    end TestOnePhaseImpedance;

    model TestY0ThreePhaVSource
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1(displayUnit = "rad"), Vangle2(displayUnit = "rad"), Vangle3(displayUnit = "rad")) annotation(Placement(visible = true, transformation(origin = {-74, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile1 annotation(Placement(visible = true, transformation(origin = {-32, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.Y0Load y0Load1 annotation(Placement(visible = true, transformation(origin = {0, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(y0ThreePhaVSource1.pin1, threePhase_pi_LinePerMile1.pin) annotation(Line(points = {{-65, 50}, {-57, 50}, {-57, 46}, {-41, 46}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhase_pi_LinePerMile1.pin1) annotation(Line(points = {{-65, 43}, {-46, 43}, {-46, 42}, {-41, 42}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhase_pi_LinePerMile1.pin2) annotation(Line(points = {{-65, 36}, {-53, 36}, {-53, 38}, {-41, 38}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n2, y0Load1.pin3) annotation(Line(points = {{-24, 38}, {-9, 38}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n1, y0Load1.pin2) annotation(Line(points = {{-23, 42}, {-9, 42}, {-9, 43}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n, y0Load1.pin1) annotation(Line(points = {{-23, 45}, {-13, 45}, {-13, 47}, {-9, 47}}, color = {0, 0, 255}));
    end TestY0ThreePhaVSource;

    model TestThreePhaImpedancePerKm
      Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1(displayUnit = "rad"), Vangle2(displayUnit = "rad"), Vangle3(displayUnit = "rad")) annotation(Placement(visible = true, transformation(origin = {-48, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaImpedancePerKm threePhaImpedancePerKm1 annotation(Placement(visible = true, transformation(origin = {-6, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    equation
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerKm1.p1) annotation(Line(points = {{-38, 4}, {-28, 4}, {-28, 0}, {-12, 0}, {-12, 0}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerKm1.p3) annotation(Line(points = {{-38, 10}, {-26, 10}, {-26, 10}, {-12, 10}, {-12, 10}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerKm1.p2) annotation(Line(points = {{-38, 18}, {-22, 18}, {-22, 20}, {-12, 20}, {-12, 20}}, color = {0, 0, 255}));
    end TestThreePhaImpedancePerKm;

    model test
      EMECTP_Modelica.Basic.ThreePhaseShunt threePhaseShunt1(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi, G11 = 0, G12 = 0, G13 = 0, G21 = 0, G22 = 0, G23 = 0, G31 = 0, G32 = 0, G33 = 0) annotation(Placement(visible = true, transformation(origin = {12, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      EMECTP_Modelica.Basic.ThreePhaseShunt threePhaseShunt2(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi, G11 = 0, G12 = 0, G13 = 0, G21 = 0, G22 = 0, G23 = 0, G31 = 0, G32 = 0, G33 = 0) annotation(Placement(visible = true, transformation(origin = {-36, -4}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Basic.ThreePhaImpedancePerKm2 threePhaImpedancePerKm21(Length = 0.1524, UL11 = 0.0019, UL12 = 0.0007, UL13 = 0.0008, UL21 = 0.0007, UL22 = 0.0020, UL23 = 0.0006, UL31 = 0.0008, UL32 = 0.0007, UL33 = 0.0020, UR11 = 0.4676, UR12 = 0.0982, UR13 = 0.0969, UR21 = 0.0982, UR22 = 0.4645, UR23 = 0.0954, UR31 = 0.0969, UR32 = 0.0954, UR33 = 0.4621) annotation(Placement(visible = true, transformation(origin = {-12, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1 = -2.49 / 180 * Modelica.Constants.pi, Vangle2 = -121.72 / 180 * Modelica.Constants.pi, Vangle3 = 117.83 / 180 * Modelica.Constants.pi, Vmag1 = 1.021 * 2401.78, Vmag2 = 1.042 * 2401.78, Vmag3 = 1.0174 * 2401.78) annotation(Placement(visible = true, transformation(origin = {-68, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {44, 44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {45, 26}, extent = {{-7, -6}, {7, 6}}, rotation = 0)));
      Basic.Ground ground3 annotation(Placement(visible = true, transformation(origin = {45, 7}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      Basic.Ground ground4 annotation(Placement(visible = true, transformation(origin = {-36, -31}, extent = {{-8, -9}, {8, 9}}, rotation = 0)));
      Basic.Ground ground5 annotation(Placement(visible = true, transformation(origin = {12, -30}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
      connect(threePhaseShunt1.n2, ground5.p) annotation(Line(points = {{20, -8}, {20, -8}, {20, -22}, {12, -22}, {12, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n1, ground5.p) annotation(Line(points = {{4, -8}, {4, -8}, {4, -22}, {12, -22}, {12, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n3, ground5.p) annotation(Line(points = {{12, -8}, {12, -8}, {12, -22}, {12, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n3, ground4.p) annotation(Line(points = {{-36, -8}, {-36, -8}, {-36, -22}, {-36, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n2, ground4.p) annotation(Line(points = {{-28, -8}, {-28, -8}, {-28, -22}, {-36, -22}, {-36, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n1, ground4.p) annotation(Line(points = {{-44, -8}, {-44, -22}, {-36, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p2, threePhaImpedancePerKm21.n3) annotation(Line(points = {{20, 0}, {18, 0}, {18, 24}, {-6, 24}, {-6, 20}, {-6, 20}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p3, threePhaImpedancePerKm21.n2) annotation(Line(points = {{12, 0}, {10, 0}, {10, 34}, {-6, 34}, {-6, 30}, {-6, 30}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p1, threePhaImpedancePerKm21.n1) annotation(Line(points = {{4, 0}, {4, 0}, {4, 46}, {-6, 46}, {-6, 40}, {-6, 40}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p2, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-28, 0}, {-28, 0}, {-28, 24}, {-16, 24}, {-16, 20}, {-18, 20}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p3, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-36, 0}, {-34, 0}, {-34, 34}, {-16, 34}, {-16, 30}, {-18, 30}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-44, 0}, {-44, 0}, {-44, 46}, {-16, 46}, {-16, 40}, {-18, 40}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n3, ground3.p) annotation(Line(points = {{-6, 20}, {34, 20}, {34, 14}, {46, 14}, {46, 14}, {46, 14}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n2, ground2.p) annotation(Line(points = {{-6, 30}, {34, 30}, {34, 32}, {46, 32}, {46, 32}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n1, ground1.p) annotation(Line(points = {{-6, 40}, {32, 40}, {32, 50}, {44, 50}, {44, 50}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-58, 26}, {-54, 26}, {-54, 20}, {-18, 20}, {-18, 20}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-58, 32}, {-22, 32}, {-22, 30}, {-18, 30}, {-18, 30}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-58, 40}, {-16, 40}, {-16, 40}, {-18, 40}}, color = {0, 0, 255}));
    end test;

    model TestTwoPhaseImpedancePerKm
      Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1 = -2.49 / 180 * Modelica.Constants.pi, Vangle2 = -121.72 / 180 * Modelica.Constants.pi, Vmag1 = 1.021 * 2401.78, Vmag2 = 1.042 * 2401.78, Vmag3 = 0) annotation(Placement(visible = true, transformation(origin = {-102, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.TwoPhaseImpedancePerKm twoPhaseImpedancePerKm1(Length = 0.1524, UL11 = 0.0022, UL12 = 0.0008, UL21 = 0.0008, UL22 = 0.0022, UR11 = 0.8261, UR12 = 0.1284, UR21 = 0.1284, UR22 = 0.8226) annotation(Placement(visible = true, transformation(origin = {-56, 16}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {4, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {4, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(twoPhaseImpedancePerKm1.n2, ground2.p) annotation(Line(points = {{-50, 6}, {-10, 6}, {-10, -4}, {4, -4}, {4, -4}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, twoPhaseImpedancePerKm1.p2) annotation(Line(points = {{-92, 16}, {-68, 16}, {-68, 6}, {-62, 6}, {-62, 6}, {-62, 6}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, twoPhaseImpedancePerKm1.p1) annotation(Line(points = {{-93, 24}, {-66, 24}, {-66, 26}, {-62, 26}}, color = {0, 0, 255}));
      connect(twoPhaseImpedancePerKm1.n1, ground1.p) annotation(Line(points = {{-50, 26}, {-4, 26}, {-4, 28}, {4, 28}, {4, 28}}, color = {0, 0, 255}));
    end TestTwoPhaseImpedancePerKm;

    model testThreePhasePQ
      ADN_Modelica.Basic.ThreePhaImpedancePerKm2 threePhaImpedancePerKm21(Length = 0.1524, UL11 = 0.0019, UL12 = 0.0007, UL13 = 0.0008, UL21 = 0.0007, UL22 = 0.0020, UL23 = 0.0006, UL31 = 0.0008, UL32 = 0.0007, UL33 = 0.0020, UR11 = 0.4676, UR12 = 0.0982, UR13 = 0.0969, UR21 = 0.0982, UR22 = 0.4645, UR23 = 0.0954, UR31 = 0.0969, UR32 = 0.0954, UR33 = 0.4621) annotation(Placement(visible = true, transformation(origin = {-16, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1 = -2.49 / 180 * Modelica.Constants.pi, Vangle2 = -121.72 / 180 * Modelica.Constants.pi, Vangle3 = 117.83 / 180 * Modelica.Constants.pi, Vmag1 = 1.021 * 2401.78 * sqrt(2), Vmag2 = 1.042 * 2401.78 * sqrt(2), Vmag3 = 1.0174 * 2401.78 * sqrt(2)) annotation(Placement(visible = true, transformation(origin = {-76, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseShunt threePhaseShunt1(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi, G11 = 0, G12 = 0, G13 = 0, G21 = 0, G22 = 0, G23 = 0, G31 = 0, G32 = 0, G33 = 0) annotation(Placement(visible = true, transformation(origin = {-36, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Basic.Ground ground4 annotation(Placement(visible = true, transformation(origin = {-36, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.Ground ground5 annotation(Placement(visible = true, transformation(origin = {12, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.Y0Load y01(P1 = 17 * 1e3 / 2 * 2, P2 = 66 * 1e3 / 2 * 2, P3 = 117 * 1e3 / 2 * 2, Q1 = 10 * 1e3 / 2 * 2, Q2 = 38 * 1e3 / 2 * 2, Q3 = 68 * 1e3 / 2 * 2) annotation(Placement(visible = true, transformation(origin = {58, 30}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Basic.ThreePhaseShunt threePhaseShunt2(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi, G11 = 0, G12 = 0, G13 = 0, G21 = 0, G22 = 0, G23 = 0, G31 = 0, G32 = 0, G33 = 0) annotation(Placement(visible = true, transformation(origin = {6, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerKm21.n3, y01.pin3) annotation(Line(points = {{-10, 22}, {44, 22}, {44, 24}, {46, 24}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p3, threePhaImpedancePerKm21.n3) annotation(Line(points = {{16, 6}, {14, 6}, {14, 20}, {-10, 20}, {-10, 22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n3, ground5.p) annotation(Line(points = {{15, -5}, {20, -5}, {20, -22}, {12, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n2, ground5.p) annotation(Line(points = {{6, -5}, {6, -15.5}, {12, -15.5}, {12, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n1, ground5.p) annotation(Line(points = {{-4, -5}, {-4, -22}, {12, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p2, threePhaImpedancePerKm21.n2) annotation(Line(points = {{6, 5}, {6, 34}, {-10, 34}, {-10, 30}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p1, threePhaImpedancePerKm21.n1) annotation(Line(points = {{-4, 5}, {-4, 46}, {-10, 46}, {-10, 40}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-67, 26}, {-54, 26}, {-54, 21}, {-21, 21}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-67, 33}, {-39.5, 33}, {-39.5, 30}, {-21, 30}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-67, 40}, {-21, 40}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n2, y01.pin2) annotation(Line(points = {{-10, 30}, {46, 30}, {46, 32}, {46, 32}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n1, y01.pin1) annotation(Line(points = {{-10, 40}, {44, 40}, {44, 38}, {46, 38}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-44, 2}, {-44, 46}, {-18, 46}, {-18, 40}, {-21, 40}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-36, 2}, {-34, 2}, {-34, 34}, {-21, 34}, {-21, 30}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-29, 2}, {-28, 2}, {-28, 24}, {-21, 24}, {-21, 21}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n3, ground4.p) annotation(Line(points = {{-28, -6}, {-30, -6}, {-30, -18}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n2, ground4.p) annotation(Line(points = {{-36, -6}, {-36, -6}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n1, ground4.p) annotation(Line(points = {{-44, -6}, {-44, -6}, {-44, -18}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
    end testThreePhasePQ;

    model TestThreePhaShunt
      Basic.ThreePhaImpedancePerKm2 threePhaImpedancePerKm21(Length = 0.1524, UL11 = 0.0019, UL12 = 0.0007, UL13 = 0.0008, UL21 = 0.0007, UL22 = 0.0020, UL23 = 0.0006, UL31 = 0.0008, UL32 = 0.0007, UL33 = 0.0020, UR11 = 0.4676, UR12 = 0.0982, UR13 = 0.0969, UR21 = 0.0982, UR22 = 0.4645, UR23 = 0.0954, UR31 = 0.0969, UR32 = 0.0954, UR33 = 0.4621) annotation(Placement(visible = true, transformation(origin = {-12, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1 = -2.49 / 180 * Modelica.Constants.pi, Vangle2 = -121.72 / 180 * Modelica.Constants.pi, Vangle3 = 117.83 / 180 * Modelica.Constants.pi, Vmag1 = 1.021 * 2401.78, Vmag2 = 1.042 * 2401.78, Vmag3 = 1.0174 * 2401.78) annotation(Placement(visible = true, transformation(origin = {-68, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {44, 44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
      Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {45, 26}, extent = {{-7, -6}, {7, 6}}, rotation = 0)));
      Basic.Ground ground3 annotation(Placement(visible = true, transformation(origin = {45, 7}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
      Basic.ThreePhaseShunt threePhaseShunt1(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi) annotation(Placement(visible = true, transformation(origin = {-36, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Basic.ThreePhaseShunt threePhaseShunt2(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi) annotation(Placement(visible = true, transformation(origin = {6, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground4 annotation(Placement(visible = true, transformation(origin = {-36, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground5 annotation(Placement(visible = true, transformation(origin = {4, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaseShunt2.p1, threePhaImpedancePerKm21.n1) annotation(Line(points = {{-4, 3}, {-4, 22.5}, {-7, 22.5}, {-7, 40}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p2, threePhaImpedancePerKm21.n2) annotation(Line(points = {{6, 3}, {6, 34}, {-7, 34}, {-7, 30}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p3, threePhaImpedancePerKm21.n3) annotation(Line(points = {{15, 3}, {14, 3}, {14, 24}, {-7, 24}, {-7, 21}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n3, ground5.p) annotation(Line(points = {{15, -7}, {14, -7}, {14, -22}, {4, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n2, ground5.p) annotation(Line(points = {{6, -7}, {6, -13.5}, {4, -13.5}, {4, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n1, ground5.p) annotation(Line(points = {{-4, -7}, {-4, -14.5}, {4, -14.5}, {4, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n3, ground4.p) annotation(Line(points = {{-28, -6}, {-30, -6}, {-30, -18}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n2, ground4.p) annotation(Line(points = {{-36, -6}, {-36, -6}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n1, ground4.p) annotation(Line(points = {{-44, -6}, {-44, -6}, {-44, -18}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-29, 2}, {-28, 2}, {-28, 24}, {-18, 24}, {-18, 20}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-36, 2}, {-34, 2}, {-34, 34}, {-18, 34}, {-18, 30}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-44, 2}, {-44, 46}, {-18, 46}, {-18, 40}, {-16, 40}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n3, ground3.p) annotation(Line(points = {{-6, 20}, {34, 20}, {34, 14}, {46, 14}, {46, 14}, {46, 14}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n2, ground2.p) annotation(Line(points = {{-6, 30}, {34, 30}, {34, 32}, {46, 32}, {46, 32}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n1, ground1.p) annotation(Line(points = {{-6, 40}, {32, 40}, {32, 50}, {44, 50}, {44, 50}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-58, 26}, {-54, 26}, {-54, 20}, {-18, 20}, {-18, 20}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-58, 32}, {-22, 32}, {-22, 30}, {-18, 30}, {-18, 30}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-58, 40}, {-16, 40}, {-16, 40}, {-18, 40}}, color = {0, 0, 255}));
    end TestThreePhaShunt;

    model testPQ
      ADN_Modelica.Basic.ThreePhaImpedancePerKm2 threePhaImpedancePerKm21(Length = 0.1524, UL11 = 0.0019, UL12 = 0.0007, UL13 = 0.0008, UL21 = 0.0007, UL22 = 0.0020, UL23 = 0.0006, UL31 = 0.0008, UL32 = 0.0007, UL33 = 0.0020, UR11 = 0.4676, UR12 = 0.0982, UR13 = 0.0969, UR21 = 0.0982, UR22 = 0.4645, UR23 = 0.0954, UR31 = 0.0969, UR32 = 0.0954, UR33 = 0.4621) annotation(Placement(visible = true, transformation(origin = {-16, 50}, extent = {{6, -6}, {-6, 6}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1 = -2.49 / 180 * Modelica.Constants.pi, Vangle2 = -121.72 / 180 * Modelica.Constants.pi, Vangle3 = 117.83 / 180 * Modelica.Constants.pi, Vmag1 = 1.021 * 2401.78, Vmag2 = 1.042 * 2401.78, Vmag3 = 1.0174 * 2401.78) annotation(Placement(visible = true, transformation(origin = {-70, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseShunt threePhaseShunt1(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi) annotation(Placement(visible = true, transformation(origin = {-36, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseShunt threePhaseShunt2(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi) annotation(Placement(visible = true, transformation(origin = {4, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground4 annotation(Placement(visible = true, transformation(origin = {-36, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground5 annotation(Placement(visible = true, transformation(origin = {4, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.YO_2 yO_21 annotation(Placement(visible = true, transformation(origin = {52, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaseShunt2.p3, threePhaImpedancePerKm21.n3) annotation(Line(points = {{14, 10}, {12, 10}, {12, 40}, {-12, 40}, {-12, 44}, {-12, 44}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p2, threePhaImpedancePerKm21.n2) annotation(Line(points = {{4, 10}, {2, 10}, {2, 52}, {-12, 52}, {-12, 50}, {-12, 50}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p1, threePhaImpedancePerKm21.n1) annotation(Line(points = {{-6, 10}, {-6, 10}, {-6, 60}, {-12, 60}, {-12, 56}, {-12, 56}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n1, ground5.p) annotation(Line(points = {{-6, -1}, {-6, -14.5}, {4, -14.5}, {4, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n2, ground5.p) annotation(Line(points = {{4, -1}, {4, -22}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n3, ground5.p) annotation(Line(points = {{13, -1}, {14, -1}, {14, -22}, {4, -22}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-61, 56}, {-19, 56}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-61, 49}, {-39.5, 49}, {-39.5, 50}, {-19, 50}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-61, 42}, {-40, 42}, {-40, 44}, {-19, 44}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-44, 2}, {-44, 56}, {-19, 56}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-36, 2}, {-34, 2}, {-34, 50}, {-19, 50}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-29, 2}, {-28, 2}, {-28, 44}, {-19, 44}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n3, ground4.p) annotation(Line(points = {{-28, -6}, {-30, -6}, {-30, -18}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n2, ground4.p) annotation(Line(points = {{-36, -6}, {-36, -6}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n1, ground4.p) annotation(Line(points = {{-44, -6}, {-44, -6}, {-44, -18}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
    end testPQ;

    model testPQnoCap
      Basic.ThreePhaImpedancePerKm2 threePhaImpedancePerKm21(Length = 0.1524, UL11 = 0.0019, UL12 = 0.0007, UL13 = 0.0008, UL21 = 0.0007, UL22 = 0.0020, UL23 = 0.0006, UL31 = 0.0008, UL32 = 0.0007, UL33 = 0.0020, UR11 = 0.4676, UR12 = 0.0982, UR13 = 0.0969, UR21 = 0.0982, UR22 = 0.4645, UR23 = 0.0954, UR31 = 0.0969, UR32 = 0.0954, UR33 = 0.4621) annotation(Placement(visible = true, transformation(origin = {-12, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1 = -2.49 / 180 * Modelica.Constants.pi, Vangle2 = -121.72 / 180 * Modelica.Constants.pi, Vangle3 = 117.83 / 180 * Modelica.Constants.pi, Vmag1 = 1.021 * 2401.78 * sqrt(2), Vmag2 = 1.042 * 2401.78 * sqrt(2), Vmag3 = 1.0174 * 2401.78 * sqrt(2)) annotation(Placement(visible = true, transformation(origin = {-74, 30}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaPQLoad.Y0Load y01(P1 = 17 * 1e3 / 2 * 2, P2 = 66 * 1e3 / 2 * 2, P3 = 117 * 1e3 / 2 * 2, Q1 = 10 * 1e3 / 2 * 2, Q2 = 38 * 1e3 / 2 * 2, Q3 = 68 * 1e3 / 2 * 2) annotation(Placement(visible = true, transformation(origin = {62, 30}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
    equation
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-63, 39}, {-38.5, 39}, {-38.5, 40}, {-18, 40}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-63, 31}, {-22, 31}, {-22, 30}, {-18, 30}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-63, 22}, {-54, 22}, {-54, 20}, {-18, 20}}, color = {0, 0, 255}));
      connect(y01.pin2, threePhaImpedancePerKm21.n2) annotation(Line(points = {{47, 32}, {19.5, 32}, {19.5, 30}, {-6, 30}}, color = {0, 0, 255}));
      connect(y01.pin3, threePhaImpedancePerKm21.n3) annotation(Line(points = {{47, 24}, {19.5, 24}, {19.5, 22}, {-6, 22}}, color = {0, 0, 255}));
      connect(y01.pin1, threePhaImpedancePerKm21.n1) annotation(Line(points = {{47, 38}, {20.5, 38}, {20.5, 40}, {-6, 40}}, color = {0, 0, 255}));
    end testPQnoCap;

    model testPQ2
      ADN_Modelica.Basic.ThreePhaImpedancePerKm2 threePhaImpedancePerKm21(Length = 0.1524, UL11 = 0.0019, UL12 = 0.0007, UL13 = 0.0008, UL21 = 0.0007, UL22 = 0.0020, UL23 = 0.0006, UL31 = 0.0008, UL32 = 0.0007, UL33 = 0.0020, UR11 = 0.4676, UR12 = 0.0982, UR13 = 0.0969, UR21 = 0.0982, UR22 = 0.4645, UR23 = 0.0954, UR31 = 0.0969, UR32 = 0.0954, UR33 = 0.4621) annotation(Placement(visible = true, transformation(origin = {-14, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle1 = -2.49 / 180 * Modelica.Constants.pi, Vangle2 = -121.72 / 180 * Modelica.Constants.pi, Vangle3 = 117.83 / 180 * Modelica.Constants.pi, Vmag1 = 1.021 * 2401.78 * sqrt(2), Vmag2 = 1.042 * 2401.78 * sqrt(2), Vmag3 = 1.0174 * 2401.78 * sqrt(2)) annotation(Placement(visible = true, transformation(origin = {-68, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseShunt threePhaseShunt1(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi, G11 = 0, G12 = 0, G13 = 0, G21 = 0, G22 = 0, G23 = 0, G31 = 0, G32 = 0, G33 = 0) annotation(Placement(visible = true, transformation(origin = {-36, -2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseShunt threePhaseShunt2(B11 = 1e-06 * 0.1718 * Modelica.Constants.pi, B12 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B13 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B21 = 1e-06 * (-0.0326) * Modelica.Constants.pi, B22 = 1e-06 * 0.1561 * Modelica.Constants.pi, B23 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B31 = 1e-06 * (-0.0510) * Modelica.Constants.pi, B32 = 1e-06 * (-0.0199) * Modelica.Constants.pi, B33 = 1e-06 * 0.1635 * Modelica.Constants.pi, G11 = 0, G12 = 0, G13 = 0, G21 = 0, G22 = 0, G23 = 0, G31 = 0, G32 = 0, G33 = 0) annotation(Placement(visible = true, transformation(origin = {6, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground4 annotation(Placement(visible = true, transformation(origin = {-36, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.Ground ground5 annotation(Placement(visible = true, transformation(origin = {4, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.Y0Load y0Load1 annotation(Placement(visible = true, transformation(origin = {38, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerKm21.n3, y0Load1.pin3) annotation(Line(points = {{-8, 24}, {-8, 24}, {-8, 28}, {28, 28}, {28, 30}, {28, 30}, {28, 30}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n2, y0Load1.pin2) annotation(Line(points = {{-8, 32}, {-10, 32}, {-10, 36}, {24, 36}, {24, 34}, {28, 34}, {28, 36}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n1, y0Load1.pin1) annotation(Line(points = {{-8, 42}, {-8, 42}, {-8, 56}, {28, 56}, {28, 40}, {28, 40}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p1, threePhaImpedancePerKm21.n1) annotation(Line(points = {{-4, 8}, {-2, 8}, {-2, 42}, {-8, 42}, {-8, 42}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n1, ground5.p) annotation(Line(points = {{-4, -3}, {-4, -14.5}, {4, -14.5}, {4, -36}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n2, ground5.p) annotation(Line(points = {{6, -3}, {6, -13.5}, {4, -13.5}, {4, -36}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.n3, ground5.p) annotation(Line(points = {{15, -3}, {14, -3}, {14, -36}, {4, -36}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-44, 2}, {-46, 2}, {-46, 54}, {-18, 54}, {-18, 42}, {-18, 42}}, color = {0, 0, 255}));
      connect(threePhaseShunt2.p3, threePhaImpedancePerKm21.n3) annotation(Line(points = {{15, 7}, {15, 22}, {-8, 22}, {-8, 24}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerKm21.n2, threePhaseShunt2.p2) annotation(Line(points = {{-8, 32}, {6, 32}, {6, 7}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerKm21.p1) annotation(Line(points = {{-58, 40}, {-38, 40}, {-38, 42}, {-19, 42}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-58, 32}, {-19, 32}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-58, 26}, {-54, 26}, {-54, 23}, {-19, 23}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p2, threePhaImpedancePerKm21.p2) annotation(Line(points = {{-36, 2}, {-34, 2}, {-34, 32}, {-19, 32}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.p3, threePhaImpedancePerKm21.p3) annotation(Line(points = {{-29, 2}, {-28, 2}, {-28, 24}, {-19, 24}, {-19, 23}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n3, ground4.p) annotation(Line(points = {{-28, -6}, {-30, -6}, {-30, -18}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n2, ground4.p) annotation(Line(points = {{-36, -6}, {-36, -6}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
      connect(threePhaseShunt1.n1, ground4.p) annotation(Line(points = {{-44, -6}, {-44, -6}, {-44, -18}, {-36, -18}, {-36, -18}}, color = {0, 0, 255}));
    end testPQ2;

    model testThreePhaTrfmYy0
      Basic.ThreePhaseTransformer.GrYGrY yy01(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-10, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-72, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(y0ThreePhaVSource1.pin3, yy01.pin2) annotation(Line(points = {{-62, 8}, {-62, 8}, {-62, -2}, {-18, -2}, {-18, 6}, {-18, 6}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, yy01.pin1) annotation(Line(points = {{-62, 14}, {-38, 14}, {-38, 12}, {-18, 12}, {-18, 12}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, yy01.pin) annotation(Line(points = {{-62, 22}, {-56, 22}, {-56, 34}, {-20, 34}, {-20, 18}, {-18, 18}}, color = {0, 0, 255}));
    end testThreePhaTrfmYy0;

    model testThreePha4node
      Basic.ThreePhaseTransformer.GrYGrY yy01(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {7, 21}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-34, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {46, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-68, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.Y0LoadP_FactorLag y0LoadP_Factor1(P1 = 1275 * 1000, P2 = 1800 * 1000, P3 = 2375 * 1000, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {76, 22}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile2.n1, y0LoadP_Factor1.pin3) annotation(Line(points = {{52, 12}, {64, 12}, {64, 18}, {64, 18}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, y0LoadP_Factor1.pin2) annotation(Line(points = {{52, 22}, {66, 22}, {66, 24}, {64, 24}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n3, y0LoadP_Factor1.pin1) annotation(Line(points = {{52, 32}, {64, 32}, {64, 28}, {64, 28}}, color = {0, 0, 255}));
      connect(yy01.pin_n2, threePhaImpedancePerMile2.p1) annotation(Line(points = {{22, 12}, {42, 12}, {42, 12}, {40, 12}}, color = {0, 0, 255}));
      connect(yy01.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{22, 22}, {42, 22}, {42, 22}, {40, 22}}, color = {0, 0, 255}));
      connect(yy01.pin_n, threePhaImpedancePerMile2.p3) annotation(Line(points = {{22, 30}, {42, 30}, {42, 32}, {40, 32}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, yy01.pin2) annotation(Line(points = {{-28, 10}, {-6, 10}, {-6, 12}, {-6, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, yy01.pin1) annotation(Line(points = {{-28, 20}, {-6, 20}, {-6, 22}, {-6, 22}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, yy01.pin) annotation(Line(points = {{-28, 30}, {-6, 30}, {-6, 30}, {-6, 30}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-58, 14}, {-46, 14}, {-46, 10}, {-40, 10}, {-40, 10}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-58, 20}, {-40, 20}, {-40, 20}, {-40, 20}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-58, 28}, {-44, 28}, {-44, 30}, {-40, 30}, {-40, 30}}, color = {0, 0, 255}));
    end testThreePha4node;

    model TestGrYDTrfm
      Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vmag1 = 7120, Vmag2 = 7120, Vmag3 = 7120) annotation(Placement(visible = true, transformation(origin = {-30, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD1 grYD11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {6, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(y0ThreePhaVSource1.pin3, grYD11.pinC) annotation(Line(points = {{-20, -4}, {-4, -4}, {-4, -2}, {-4, -2}, {-4, -2}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, grYD11.pinB) annotation(Line(points = {{-20, 2}, {-4, 2}, {-4, 2}, {-4, 2}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, grYD11.pinA) annotation(Line(points = {{-20, 10}, {-8, 10}, {-8, 6}, {-4, 6}, {-4, 6}}, color = {0, 0, 255}));
      annotation(Diagram(graphics = {Text(origin = {-4, 18}, extent = {{-2, 0}, {2, 0}}, textString = "GrY")}));
    end TestGrYDTrfm;

    model testThreePha4nodegrYD
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-32, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {50, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseTransformer.GrYD grYD1(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {4, 16}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoad_7150V dLoad_7150V1 annotation(Placement(visible = true, transformation(origin = {87, 11}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile2.n1, dLoad_7150V1.pin3) annotation(Line(points = {{56, 2}, {74, 2}, {74, 4}, {74, 4}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, dLoad_7150V1.pin2) annotation(Line(points = {{56, 12}, {72, 12}, {72, 12}, {74, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n3, dLoad_7150V1.pin1) annotation(Line(points = {{56, 22}, {72, 22}, {72, 18}, {74, 18}}, color = {0, 0, 255}));
      connect(grYD1.pin_n, threePhaImpedancePerMile2.p3) annotation(Line(points = {{17, 24}, {42, 24}, {42, 21}, {45, 21}}, color = {0, 0, 255}));
      connect(grYD1.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{17, 16}, {31, 16}, {31, 12}, {45, 12}}, color = {0, 0, 255}));
      connect(grYD1.pin_n2, threePhaImpedancePerMile2.p1) annotation(Line(points = {{17, 7}, {26.5, 7}, {26.5, 2}, {45, 2}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-59, 24}, {-44, 24}, {-44, 27}, {-37, 27}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-59, 17}, {-49, 17}, {-49, 18}, {-37, 18}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-59, 10}, {-49.5, 10}, {-49.5, 8}, {-37, 8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYD1.pin) annotation(Line(points = {{-27, 27}, {-19.5, 27}, {-19.5, 24}, {-9, 24}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYD1.pin1) annotation(Line(points = {{-27, 18}, {-19.5, 18}, {-19.5, 16}, {-9, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, grYD1.pin2) annotation(Line(points = {{-27, 8}, {-9, 8}}, color = {0, 0, 255}));
    end testThreePha4nodegrYD;

    model testDload
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3) annotation(Placement(visible = true, transformation(origin = {-72, 2}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoad dLoad1 annotation(Placement(visible = true, transformation(origin = {-12, 2}, extent = {{-16, -16}, {16, 16}}, rotation = 0)));
    equation
      connect(y0ThreePhaVSource1.pin3, dLoad1.pin3) annotation(Line(points = {{-58, -6}, {-26, -6}, {-26, -4}, {-26, -4}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, dLoad1.pin2) annotation(Line(points = {{-60, 2}, {-40, 2}, {-40, 2}, {-26, 2}, {-26, 4}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, dLoad1.pin1) annotation(Line(points = {{-58, 12}, {-48, 12}, {-48, 10}, {-26, 10}, {-26, 10}}, color = {0, 0, 255}));
    end testDload;

    model testDload2
      Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 1) annotation(Placement(visible = true, transformation(origin = {-95, 11}, extent = {{-23, -23}, {23, 23}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad1(vIm(start = sqrt(3) / 2), vRe(start = 1.5)) annotation(Placement(visible = true, transformation(origin = {26, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad2(vIm(start = -sqrt(3)), vRe(start = 0)) annotation(Placement(visible = true, transformation(origin = {42, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad3(vIm(start = sqrt(3) / 2), vRe(start = -1.5)) annotation(Placement(visible = true, transformation(origin = {32, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(y0ThreePhaVSource1.pin3, onePhaPQLoad3.p) annotation(Line(points = {{-74, -4}, {-36, -4}, {-36, -30}, {22, -30}, {22, -14}, {22, -14}}, color = {0, 0, 255}));
      connect(onePhaPQLoad2.p, y0ThreePhaVSource1.pin2) annotation(Line(points = {{32, 14}, {24, 14}, {24, 12}, {-54, 12}, {-54, 6}, {-74, 6}, {-74, 12}, {-74, 12}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.p, y0ThreePhaVSource1.pin1) annotation(Line(points = {{16, 54}, {12, 54}, {12, 78}, {-74, 78}, {-74, 28}, {-74, 28}}, color = {0, 0, 255}));
      connect(onePhaPQLoad3.n, onePhaPQLoad1.p) annotation(Line(points = {{42, -14}, {64, -14}, {64, -40}, {-6, -40}, {-6, 36}, {-4, 36}, {-4, 54}, {16, 54}, {16, 54}}, color = {0, 0, 255}));
      connect(onePhaPQLoad2.n, onePhaPQLoad3.p) annotation(Line(points = {{52, 14}, {66, 14}, {66, -2}, {14, -2}, {14, -14}, {22, -14}, {22, -14}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.n, onePhaPQLoad2.p) annotation(Line(points = {{36, 54}, {46, 54}, {46, 28}, {16, 28}, {16, 14}, {32, 14}, {32, 14}}, color = {0, 0, 255}));
    end testDload2;

    model testYDload
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-32, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {50, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseTransformer.GrYD grYD1(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {4, 16}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    equation
      connect(grYD1.pin_n, threePhaImpedancePerMile2.p3) annotation(Line(points = {{17, 24}, {42, 24}, {42, 21}, {45, 21}}, color = {0, 0, 255}));
      connect(grYD1.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{17, 16}, {31, 16}, {31, 12}, {45, 12}}, color = {0, 0, 255}));
      connect(grYD1.pin_n2, threePhaImpedancePerMile2.p1) annotation(Line(points = {{17, 7}, {26.5, 7}, {26.5, 2}, {45, 2}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-59, 24}, {-44, 24}, {-44, 27}, {-37, 27}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-59, 17}, {-49, 17}, {-49, 18}, {-37, 18}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-59, 10}, {-49.5, 10}, {-49.5, 8}, {-37, 8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYD1.pin) annotation(Line(points = {{-27, 27}, {-19.5, 27}, {-19.5, 24}, {-9, 24}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYD1.pin1) annotation(Line(points = {{-27, 18}, {-19.5, 18}, {-19.5, 16}, {-9, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, grYD1.pin2) annotation(Line(points = {{-27, 8}, {-9, 8}}, color = {0, 0, 255}));
    end testYDload;

    model testIEEE4GrYD
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-30, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {46, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseTransformer.GrYD grYD1(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {4, 16}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoad_2400VFactor_Lag dLoad_2400VFactor_Lag1(PAB = 1275, PBC = 1800, PCA = 2375, Power_FactorAB = 0.85, Power_FactorBC = 0.9, Power_FactorCA = 0.95) annotation(Placement(visible = true, transformation(origin = {80, 18}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile2.n3, dLoad_2400VFactor_Lag1.pin3) annotation(Line(points = {{52, 10}, {66, 10}, {66, 12}, {68, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, dLoad_2400VFactor_Lag1.pin2) annotation(Line(points = {{51, 18}, {68, 18}, {68, 20}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n1, dLoad_2400VFactor_Lag1.pin1) annotation(Line(points = {{51, 28}, {68, 28}, {68, 26}}, color = {0, 0, 255}));
      connect(grYD1.pin_n2, threePhaImpedancePerMile2.p3) annotation(Line(points = {{18, 8}, {38, 8}, {38, 9}, {41, 9}}, color = {0, 0, 255}));
      connect(grYD1.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{18, 16}, {28.5, 16}, {28.5, 18}, {41, 18}}, color = {0, 0, 255}));
      connect(grYD1.pin_n, threePhaImpedancePerMile2.p1) annotation(Line(points = {{18, 24}, {36, 24}, {36, 28}, {41, 28}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYD1.pin2) annotation(Line(points = {{-24, 6}, {-8, 6}, {-8, 8}, {-8, 8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYD1.pin1) annotation(Line(points = {{-25, 16}, {-8, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, grYD1.pin) annotation(Line(points = {{-25, 26}, {-10, 26}, {-10, 24}, {-8, 24}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-58, 10}, {-46, 10}, {-46, 7}, {-35, 7}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-58, 16}, {-35, 16}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-58, 24}, {-46, 24}, {-46, 26}, {-35, 26}}, color = {0, 0, 255}));
    end testIEEE4GrYD;

    model testGrYD
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-30, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {46, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseTransformer.GrYD grYD1(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {4, 16}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad1(P = 1275, Q = 790, vIm(start = -1200), vRe(start = 2080)) annotation(Placement(visible = true, transformation(origin = {66, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(onePhaPQLoad1.n, threePhaImpedancePerMile2.n2) annotation(Line(points = {{76, 26}, {82, 26}, {82, 18}, {52, 18}, {52, 18}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.p, threePhaImpedancePerMile2.n1) annotation(Line(points = {{56, 26}, {52, 26}, {52, 28}, {52, 28}}, color = {0, 0, 255}));
      connect(grYD1.pin_n2, threePhaImpedancePerMile2.p3) annotation(Line(points = {{18, 8}, {38, 8}, {38, 9}, {41, 9}}, color = {0, 0, 255}));
      connect(grYD1.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{18, 16}, {28.5, 16}, {28.5, 18}, {41, 18}}, color = {0, 0, 255}));
      connect(grYD1.pin_n, threePhaImpedancePerMile2.p1) annotation(Line(points = {{18, 24}, {36, 24}, {36, 28}, {41, 28}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYD1.pin2) annotation(Line(points = {{-24, 6}, {-8, 6}, {-8, 8}, {-8, 8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYD1.pin1) annotation(Line(points = {{-25, 16}, {-8, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, grYD1.pin) annotation(Line(points = {{-25, 26}, {-10, 26}, {-10, 24}, {-8, 24}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-58, 10}, {-46, 10}, {-46, 7}, {-35, 7}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-58, 16}, {-35, 16}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-58, 24}, {-46, 24}, {-46, 26}, {-35, 26}}, color = {0, 0, 255}));
    end testGrYD;

    model testIEEE4GrYDCur
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-30, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {46, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseTransformer.GrYD grYD1(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {4, 16}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoad_2400VFactor_Lag dLoad_2400VFactor_Lag1(PAB = 1275, PBC = 1800, PCA = 2375, Power_FactorAB = 0.85, Power_FactorBC = 0.9, Power_FactorCA = 0.95) annotation(Placement(visible = true, transformation(origin = {84, 18}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile2.n3, dLoad_2400VFactor_Lag1.pin3) annotation(Line(points = {{52, 10}, {70, 10}, {70, 12}, {72, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, dLoad_2400VFactor_Lag1.pin2) annotation(Line(points = {{52, 18}, {72, 18}, {72, 20}, {72, 20}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n1, dLoad_2400VFactor_Lag1.pin1) annotation(Line(points = {{52, 28}, {72, 28}, {72, 26}, {72, 26}}, color = {0, 0, 255}));
      connect(grYD1.pin_n2, threePhaImpedancePerMile2.p3) annotation(Line(points = {{18, 8}, {38, 8}, {38, 9}, {41, 9}}, color = {0, 0, 255}));
      connect(grYD1.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{18, 16}, {28.5, 16}, {28.5, 18}, {41, 18}}, color = {0, 0, 255}));
      connect(grYD1.pin_n, threePhaImpedancePerMile2.p1) annotation(Line(points = {{18, 24}, {36, 24}, {36, 28}, {41, 28}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYD1.pin2) annotation(Line(points = {{-24, 6}, {-8, 6}, {-8, 8}, {-8, 8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYD1.pin1) annotation(Line(points = {{-25, 16}, {-8, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, grYD1.pin) annotation(Line(points = {{-25, 26}, {-10, 26}, {-10, 24}, {-8, 24}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-58, 10}, {-46, 10}, {-46, 7}, {-35, 7}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-58, 16}, {-35, 16}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-58, 24}, {-46, 24}, {-46, 26}, {-35, 26}}, color = {0, 0, 255}));
    end testIEEE4GrYDCur;

    model testOnePhasePQ
      Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vmag1 = 7200) annotation(Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad1 annotation(Placement(visible = true, transformation(origin = {24, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {34, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(ground1.p, onePhaPQLoad1.n) annotation(Line(points = {{34, 22}, {60, 22}, {60, 44}, {34, 44}, {34, 44}, {34, 44}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, onePhaPQLoad1.p) annotation(Line(points = {{-40, 48}, {2, 48}, {2, 38}, {14, 38}, {14, 44}, {14, 44}}, color = {0, 0, 255}));
    end testOnePhasePQ;

    model TestVoltageSourceExample1
      Basic.VoltageSource voltageSource1(Vangle(displayUnit = "rad"), vIm(start = 1), vRe(start = 0)) annotation(Placement(visible = true, transformation(origin = {4, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-26, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    initial equation
      voltageSource1.p.vRe = 0;
      voltageSource1.n.vIm = 0;
    equation
      connect(voltageSource1.p, ground1.p) annotation(Line(points = {{-6, 20}, {-26, 20}, {-26, -4}, {-26, -4}, {-26, -4}}, color = {0, 0, 255}));
    end TestVoltageSourceExample1;

    model testIEEE4GrYDCur1
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-30, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {54, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseTransformer.GrYD grYD1(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {4, 16}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoad_2400VFactor_Lag dLoad_2400VFactor_Lag1(PAB = 1275, PBC = 1800, PCA = 2375, Power_FactorAB = 0.85, Power_FactorBC = 0.9, Power_FactorCA = 0.95) annotation(Placement(visible = true, transformation(origin = {84, 20}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
      //initial equation
      //  threePhaImpedancePerMile1.p1.vRe = 7200;
      //  threePhaImpedancePerMile1.p1.vIm = 0;
      //  threePhaImpedancePerMile1.p2.vRe = -3600;
      //  threePhaImpedancePerMile1.p2.vIm = -6235;
      //  threePhaImpedancePerMile1.p3.vRe = -3600;
      //  threePhaImpedancePerMile1.p3.vIm = 6235;
      //  threePhaImpedancePerMile1.n1.vRe = 7200;
      //  threePhaImpedancePerMile1.n1.vIm = 0;
      //  threePhaImpedancePerMile1.n2.vRe = -3600;
      //  threePhaImpedancePerMile1.n2.vIm = -6235;
      //  threePhaImpedancePerMile1.n3.vRe = -3600;
      //  threePhaImpedancePerMile1.n3.vIm = 6235;
      //  threePhaImpedancePerMile2.p1.vRe = 1200;
      //  threePhaImpedancePerMile2.p1.vIm = 2080;
      //  threePhaImpedancePerMile2.p2.vRe = 0;
      //  threePhaImpedancePerMile2.p2.vIm = 0;
      //  threePhaImpedancePerMile2.p3.vRe = -1200;
      //  threePhaImpedancePerMile2.p3.vIm = 2080;
      //  threePhaImpedancePerMile2.n1.vRe = 1200;
      //  threePhaImpedancePerMile2.n1.vIm = 2080;
      //  threePhaImpedancePerMile2.n2.vRe = 0;
      //  threePhaImpedancePerMile2.n2.vIm = 0;
      //  threePhaImpedancePerMile2.n3.vRe = -1200;
      //  threePhaImpedancePerMile2.n3.vIm = 2080;
      //  y0ThreePhaVSource1.voltageSource1.p.vRe = 7200;
      //  y0ThreePhaVSource1.voltageSource1.p.vIm = 0;
      //   y0ThreePhaVSource1.voltageSource1.n.vRe = 0;
      //  y0ThreePhaVSource1.voltageSource1.n.vIm = 0;
      //  y0ThreePhaVSource1.voltageSource2.p.vRe = -3600;
      //  y0ThreePhaVSource1.voltageSource2.p.vIm = -6235;
      //   y0ThreePhaVSource1.voltageSource2.n.vRe = 0;
      //  y0ThreePhaVSource1.voltageSource2.n.vIm = 0;
      //  y0ThreePhaVSource1.voltageSource3.p.vRe = -3600;
      //  y0ThreePhaVSource1.voltageSource3.p.vIm = 6235;
      //   y0ThreePhaVSource1.voltageSource3.n.vRe = 0;
      //   y0ThreePhaVSource1.voltageSource3.n.vIm = 0;
      //   y0ThreePhaVSource1.pin1.vRe = 7200;
      //   y0ThreePhaVSource1.pin1.vIm = 0;
      //   y0ThreePhaVSource1.pin2.vRe = -3600;
      //   y0ThreePhaVSource1.pin2.vIm = -6235;
      //   y0ThreePhaVSource1.pin3.vRe = -3600;
      //   y0ThreePhaVSource1.pin3.vIm = 6235;
      //grYD1.pin.vRe = 7200;
      // grYD1.pin.vIm = 0;
      // grYD1.pin1.vRe = -3600;
      //grYD1.pin1.vIm = -6235;
      // grYD1.pin2.vRe = -3600;
      // grYD1.pin2.vIm = 6235;
      // grYD1.pin_n.vRe = 1200;
      // grYD1.pin_n.vIm = 2080;
      // grYD1.pin_n1.vRe = 0;
      // grYD1.pin_n1.vIm = 0;
      // grYD1.pin_n2.vRe = -1200;
      // grYD1.pin_n2.vIm = 2080;
      // dLoad_2400VFactor_Lag1.pin1.vRe = 3405;
      // dLoad_2400VFactor_Lag1.pin1.vIm = -466.4544;
      // dLoad_2400VFactor_Lag1.pin2.vRe = 0;
      // dLoad_2400VFactor_Lag1.pin2.vIm = 0;
      // dLoad_2400VFactor_Lag1.pin3.vRe = 0;
      // dLoad_2400VFactor_Lag1.pin3.vIm = 0;
    equation
      connect(threePhaImpedancePerMile2.n3, dLoad_2400VFactor_Lag1.pin3) annotation(Line(points = {{60, 12}, {70, 12}, {70, 14}, {72, 14}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, dLoad_2400VFactor_Lag1.pin2) annotation(Line(points = {{59, 20}, {70, 20}, {70, 22}, {72, 22}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n1, dLoad_2400VFactor_Lag1.pin1) annotation(Line(points = {{59, 30}, {62, 30}, {62, 28}, {72, 28}}, color = {0, 0, 255}));
      connect(grYD1.pin_n, threePhaImpedancePerMile2.p1) annotation(Line(points = {{18, 24}, {36, 24}, {36, 30}, {49, 30}}, color = {0, 0, 255}));
      connect(grYD1.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{18, 16}, {28.5, 16}, {28.5, 20}, {49, 20}}, color = {0, 0, 255}));
      connect(grYD1.pin_n2, threePhaImpedancePerMile2.p3) annotation(Line(points = {{18, 8}, {38, 8}, {38, 11}, {49, 11}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYD1.pin2) annotation(Line(points = {{-24, 6}, {-8, 6}, {-8, 8}, {-8, 8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYD1.pin1) annotation(Line(points = {{-25, 16}, {-8, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, grYD1.pin) annotation(Line(points = {{-25, 26}, {-10, 26}, {-10, 24}, {-8, 24}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-58, 10}, {-46, 10}, {-46, 7}, {-35, 7}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-58, 16}, {-35, 16}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-58, 24}, {-46, 24}, {-46, 26}, {-35, 26}}, color = {0, 0, 255}));
    end testIEEE4GrYDCur1;

    model testIEEE4GrYDCur2
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-30, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576 / 0.1113, UR12 = 0.1559 / 0.1113, UR13 = 0.1535 / 0.1113, UR21 = 0.1559 / 0.1113, UR22 = 0.4666 / 0.1113, UR23 = 0.158 / 0.1113, UR31 = 0.1535 / 0.1113, UR32 = 0.158 / 0.1113, UR33 = 0.4615 / 0.1113, UX11 = 1.078 / 0.1113, UX12 = 0.5017 / 0.1113, UX13 = 0.3849 / 0.1113, UX21 = 0.5017 / 0.1113, UX22 = 1.0482 / 0.1113, UX23 = 0.4236 / 0.1113, UX31 = 0.3849 / 0.1113, UX32 = 0.4236 / 0.1113, UX33 = 1.0651 / 0.1113) annotation(Placement(visible = true, transformation(origin = {42, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3) / 10000, Vmag2 = 12470 / sqrt(3) / 10000, Vmag3 = 12470 / sqrt(3) / 10000) annotation(Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseTransformer.GrYD grYD1(N1 = 12.47, N2 = 4.16, Rp = 0.01 / 0.1113, Sb = 6000 / 100, Vb = 4.16 / 3.336, Xp = 0.06 / 0.1113) annotation(Placement(visible = true, transformation(origin = {7, 19}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      //initial equation
      //  threePhaImpedancePerMile1.p1.vRe = 7200;
      //  threePhaImpedancePerMile1.p1.vIm = 0;
      //  threePhaImpedancePerMile1.p2.vRe = -3600;
      //  threePhaImpedancePerMile1.p2.vIm = -6235;
      //  threePhaImpedancePerMile1.p3.vRe = -3600;
      //  threePhaImpedancePerMile1.p3.vIm = 6235;
      //  threePhaImpedancePerMile1.n1.vRe = 7200;
      //  threePhaImpedancePerMile1.n1.vIm = 0;
      //  threePhaImpedancePerMile1.n2.vRe = -3600;
      //  threePhaImpedancePerMile1.n2.vIm = -6235;
      //  threePhaImpedancePerMile1.n3.vRe = -3600;
      //  threePhaImpedancePerMile1.n3.vIm = 6235;
      //  threePhaImpedancePerMile2.p1.vRe = 1077;
      ////1200;
      //  threePhaImpedancePerMile2.p1.vIm = 1658;
      ////2080;
      //  threePhaImpedancePerMile2.p2.vRe = 0;
      //  threePhaImpedancePerMile2.p2.vIm = 0;
      //  threePhaImpedancePerMile2.p3.vRe = -1263;
      ////-1200;
      //  threePhaImpedancePerMile2.p3.vIm = 1866;
      ////2080;
      //  threePhaImpedancePerMile2.n1.vRe = 543;
      ////1200;
      //  threePhaImpedancePerMile2.n1.vIm = 806;
      ////2080;
      //  threePhaImpedancePerMile2.n2.vRe = 543;
      ////0;
      //  threePhaImpedancePerMile2.n2.vIm = 806;
      ////0
      //  threePhaImpedancePerMile2.n3.vRe = -1251;
      ////-1200;
      //  threePhaImpedancePerMile2.n3.vIm = 1925;
      ////2080;
      //  y0ThreePhaVSource1.voltageSource1.p.vRe = 7200;
      //  y0ThreePhaVSource1.voltageSource1.p.vIm = 0;
      //  y0ThreePhaVSource1.voltageSource1.n.vRe = 0;
      //  y0ThreePhaVSource1.voltageSource1.n.vIm = 0;
      //  y0ThreePhaVSource1.voltageSource2.p.vRe = -3600;
      //  y0ThreePhaVSource1.voltageSource2.p.vIm = -6235;
      //  y0ThreePhaVSource1.voltageSource2.n.vRe = 0;
      //  y0ThreePhaVSource1.voltageSource2.n.vIm = 0;
      //  y0ThreePhaVSource1.voltageSource3.p.vRe = -3600;
      //  y0ThreePhaVSource1.voltageSource3.p.vIm = 6235;
      //  y0ThreePhaVSource1.voltageSource3.n.vRe = 0;
      //  y0ThreePhaVSource1.voltageSource3.n.vIm = 0;
      //  y0ThreePhaVSource1.pin1.vRe = 7200;
      //  y0ThreePhaVSource1.pin1.vIm = 0;
      //  y0ThreePhaVSource1.pin2.vRe = -3600;
      //  y0ThreePhaVSource1.pin2.vIm = -6235;
      //  y0ThreePhaVSource1.pin3.vRe = -3600;
      //  y0ThreePhaVSource1.pin3.vIm = 6235;
      //  grYD1.pin.vRe = 7200;
      //  grYD1.pin.vIm = 0;
      //  grYD1.pin1.vRe = -3600;
      //  grYD1.pin1.vIm = -6235;
      //  grYD1.pin2.vRe = -3600;
      //  grYD1.pin2.vIm = 6235;
      //  grYD1.pin_n.vRe = 1200;
      //  grYD1.pin_n.vIm = 2080;
      //  grYD1.pin_n1.vRe = 0;
      //  grYD1.pin_n1.vIm = 0;
      //  grYD1.pin_n2.vRe = -1200;
      //  grYD1.pin_n2.vIm = 2080;
      //  dLoad_2400VFactor_Lag1.pin1.vRe = 543;
      //  dLoad_2400VFactor_Lag1.pin1.vIm = 806;
      //  dLoad_2400VFactor_Lag1.pin2.vRe = 543;
      //  dLoad_2400VFactor_Lag1.pin2.vIm = 806;
      //  dLoad_2400VFactor_Lag1.pin3.vRe = -1251;
      //  dLoad_2400VFactor_Lag1.pin3.vIm = 1925;
      //// onePhaPQLoad_AB.vRe=543;
      //// onePhaPQLoad_AB.vIm=805;
      ////onePhaPQLoad_BC.vRe=543;
      //// onePhaPQLoad_BC.vIm=805;
      ////onePhaPQLoad_CA.vRe=-1796;
      ////  onePhaPQLoad_CA.vIm=1120;
      // // onePhaPQLoad_AB.n.vRe = 543;
      ////onePhaPQLoad_AB.n.vIm=805;
      //// onePhaPQLoad_BC.n.vRe=-1251;
      ////onePhaPQLoad_BC.n.vIm=1925;
      ////onePhaPQLoad_CA.n.vRe=-1251;
      //// onePhaPQLoad_CA.n.vIm=1925;
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {74, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {76, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground3 annotation(Placement(visible = true, transformation(origin = {54, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile2.n3, ground3.p) annotation(Line(points = {{48, 12}, {54, 12}, {54, -14}, {54, -14}, {54, -14}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, ground2.p) annotation(Line(points = {{48, 20}, {76, 20}, {76, 8}, {76, 8}, {76, 8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n1, ground1.p) annotation(Line(points = {{48, 30}, {48, 30}, {48, 40}, {74, 40}, {74, 40}}, color = {0, 0, 255}));
      connect(grYD1.pin_n, threePhaImpedancePerMile2.p1) annotation(Line(points = {{21, 28}, {36, 28}, {36, 30}, {37, 30}}, color = {0, 0, 255}));
      connect(grYD1.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{21, 19}, {28.5, 19}, {28.5, 20}, {37, 20}}, color = {0, 0, 255}));
      connect(grYD1.pin_n2, threePhaImpedancePerMile2.p3) annotation(Line(points = {{21, 10}, {38, 10}, {38, 11}, {37, 11}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, grYD1.pin) annotation(Line(points = {{-25, 26}, {-10, 26}, {-10, 28}, {-7, 28}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYD1.pin1) annotation(Line(points = {{-25, 16}, {-16.5, 16}, {-16.5, 19}, {-7, 19}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYD1.pin2) annotation(Line(points = {{-24, 6}, {-17.5, 6}, {-17.5, 10}, {-7, 10}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-58, 10}, {-46, 10}, {-46, 7}, {-35, 7}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-58, 16}, {-35, 16}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-58, 24}, {-46, 24}, {-46, 26}, {-35, 26}}, color = {0, 0, 255}));
    end testIEEE4GrYDCur2;

    model test_Iloaad
      Basic.VoltageSource voltageSource1(Vangle = 30, Vmag = 12, iIm(start = 12), iRe(start = 11)) annotation(Placement(visible = true, transformation(origin = {-26, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-46, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {54, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.OnePhaILoad onePhaILoad1 annotation(Placement(visible = true, transformation(origin = {22, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(onePhaILoad1.n, ground2.p) annotation(Line(points = {{32, 38}, {56, 38}, {56, 22}, {54, 22}, {54, 22}}, color = {0, 0, 255}));
      connect(voltageSource1.n, onePhaILoad1.p) annotation(Line(points = {{-16, 38}, {12, 38}, {12, 38}, {12, 38}}, color = {0, 0, 255}));
      connect(ground1.p, voltageSource1.p) annotation(Line(points = {{-46, -6}, {-44, -6}, {-44, 38}, {-36, 38}, {-36, 38}}, color = {0, 0, 255}));
    end test_Iloaad;

    model ds
      ADN_Modelica.Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 10, Vmag2 = 10, Vmag3 = 10, i2Im(start = 0)) annotation(Placement(visible = true, transformation(origin = {-44, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaPQLoad.Y0Load2 y0Load21(P = 20, Q = 30) annotation(Placement(visible = true, transformation(origin = {6, 32}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      //initial equation
      //threePhaseVoltageSource21.pA.vRe = 0.1;
      //threePhaseVoltageSource21.pA.vIm = 0.1;
      //threePhaseVoltageSource21.pB.vRe = 0.1;
      //threePhaseVoltageSource21.pB.vIm = 0.1;
      // threePhaseVoltageSource21.pC.vRe = 0.1;
      // threePhaseVoltageSource21.pC.iIm = 0.1;
    equation
      connect(threePhaseVoltageSource21.pC, y0Load21.pC) annotation(Line(points = {{-36, 30}, {-20, 30}, {-20, 28}, {-2, 28}, {-2, 28}, {-2, 28}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, y0Load21.pB) annotation(Line(points = {{-36, 36}, {-18, 36}, {-18, 34}, {-2, 34}, {-2, 34}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, y0Load21.pA) annotation(Line(points = {{-34, 40}, {-14, 40}, {-14, 38}, {-4, 38}, {-4, 38}}, color = {0, 0, 255}));
    end ds;

    model node13
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-6, 82}, extent = {{-12, 12}, {12, -12}}, rotation = -90)));
      Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.3465, UR12 = 0.1560, UR13 = 0.1580, UR21 = 0.1560, UR22 = 0.3375, UR23 = 0.1535, UR31 = 0.1580, UR32 = 0.1535, UR33 = 0.3414, UX11 = 1.0179, UX12 = 0.5017, UX13 = 0.4236, UX21 = 0.5017, UX22 = 1.4078, UX23 = 0.3849, UX31 = 0.4236, UX32 = 0.3849, UX33 = 1.0348) annotation(Placement(visible = true, transformation(origin = {-5, 57}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
      Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 500, UR11 = 0, UR12 = 0, UR13 = 0, UR22 = 1.3294, UR23 = 0.2066, UR32 = 0.2066, UR33 = 1.3238, UX11 = 0, UX22 = 1.3471, UX23 = 0.4591, UX32 = 0.4591, UX33 = 1.3569) annotation(Placement(visible = true, transformation(origin = {-32, 42}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
      Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile4(Length = 300, UR11 = 0, UR22 = 1.3294, UR23 = 0.2066, UR32 = 0.2066, UR33 = 1.3238, UX11 = 0, UX22 = 1.3471, UX23 = 0.4591, UX32 = 0.4591, UX33 = 1.3569) annotation(Placement(visible = true, transformation(origin = {-66, 42}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
      Basic.ThreePhaseZorILoad.D_ZLoad d_ZLoad1(PAB = 0, PBC = 230, PCA = 0, QAB = 0, QBC = 132, QCA = 0) annotation(Placement(visible = true, transformation(origin = {-84, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Basic.ThreePhaPQLoad.Y0Load y0Load1(P1 = 0, P2 = 170, P3 = 0, Q1 = 0, Q2 = 125, Q3 = 0) annotation(Placement(visible = true, transformation(origin = {-48, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    equation
      connect(y0Load1.pin3, threePhaImpedancePerMile2.n3) annotation(Line(points = {{-52, 30}, {-52, 30}, {-52, 38}, {-36, 38}, {-36, 34}, {-36, 34}}, color = {0, 0, 255}));
      connect(y0Load1.pin2, threePhaImpedancePerMile2.n2) annotation(Line(points = {{-46, 30}, {-48, 30}, {-48, 46}, {-36, 46}, {-36, 42}, {-36, 42}}, color = {0, 0, 255}));
      connect(y0Load1.pin1, threePhaImpedancePerMile2.n1) annotation(Line(points = {{-42, 30}, {-44, 30}, {-44, 54}, {-36, 54}, {-36, 50}, {-36, 50}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile4.n3, d_ZLoad1.pin3) annotation(Line(points = {{-70, 34}, {-88, 34}, {-88, 30}, {-88, 30}, {-88, 30}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile4.n2, d_ZLoad1.pin2) annotation(Line(points = {{-70, 42}, {-84, 42}, {-84, 28}, {-82, 28}, {-82, 30}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile4.n1, d_ZLoad1.pin1) annotation(Line(points = {{-70, 50}, {-78, 50}, {-78, 30}, {-78, 30}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n3, threePhaImpedancePerMile4.p3) annotation(Line(points = {{-36, 34}, {-62, 34}, {-62, 34}, {-62, 34}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, threePhaImpedancePerMile4.p2) annotation(Line(points = {{-36, 42}, {-62, 42}, {-62, 42}, {-62, 42}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n1, threePhaImpedancePerMile4.p1) annotation(Line(points = {{-36, 50}, {-64, 50}, {-64, 50}, {-62, 50}, {-62, 50}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, threePhaImpedancePerMile2.p3) annotation(Line(points = {{4, 52}, {4, 52}, {4, 34}, {-28, 34}, {-28, 34}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, threePhaImpedancePerMile2.p2) annotation(Line(points = {{-4, 52}, {-6, 52}, {-6, 42}, {-28, 42}, {-28, 42}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, threePhaImpedancePerMile2.p1) annotation(Line(points = {{-14, 52}, {-28, 52}, {-28, 50}, {-28, 50}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{2, 70}, {4, 70}, {4, 62}, {4, 62}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-6, 70}, {-6, 70}, {-6, 62}, {-6, 62}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-16, 70}, {-14, 70}, {-14, 62}, {-14, 62}}, color = {0, 0, 255}));
    end node13;

    model node13_2
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-8, 84}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      ADN_Modelica.Basic.ThreePhaseZorILoad.D_ZLoad d_ZLoad1(PAB = 0, PBC = 230, PCA = 0, QAB = 0, QBC = 132, QCA = 0) annotation(Placement(visible = true, transformation(origin = {-84, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Basic.ThreePhaPQLoad.Y0Load y0Load1(P1 = 0, P2 = 170, P3 = 0, Q1 = 0, Q2 = 125, Q3 = 0) annotation(Placement(visible = true, transformation(origin = {-48, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile1(Length = 300) annotation(Placement(visible = true, transformation(origin = {-68, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile2(Length = 500) annotation(Placement(visible = true, transformation(origin = {-30, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile3(Length = 2000, UB11 = 6.2998, UB12 = -1.9958, UB13 = -1.2595, UB21 = -1.9958, UB22 = 5.9597, UB23 = -0.7417, UB31 = -1.2595, UB32 = -0.7417, UB33 = 5.6386, UG11 = 0, UG12 = 0, UG13 = 0, UG21 = 0, UG22 = 0, UG23 = 0, UG31 = 0, UG32 = 0, UG33 = 0, UR11 = 0.3465, UR12 = 0.1560, UR13 = 0.1580, UR21 = 0.1560, UR22 = 0.3375, UR23 = 0.1535, UR31 = 0.1580, UR32 = 0.1535, UR33 = 0.3414, UX11 = 1.0179, UX12 = 0.5017, UX13 = 0.4236, UX21 = 0.5017, UX22 = 1.4078, UX23 = 0.3849, UX31 = 0.4236, UX32 = 0.3849, UX33 = 1.0348) annotation(Placement(visible = true, transformation(origin = {-5, 59}, extent = {{-11, 11}, {11, -11}}, rotation = -90)));
    equation
      connect(y0Load1.pin1, threePhase_pi_LinePerMile2.pin_n2) annotation(Line(points = {{-42, 30}, {-42, 30}, {-42, 42}, {-38, 42}, {-38, 40}, {-38, 40}}, color = {0, 0, 255}));
      connect(y0Load1.pin2, threePhase_pi_LinePerMile2.pin_n1) annotation(Line(points = {{-46, 30}, {-46, 30}, {-46, 46}, {-38, 46}, {-38, 44}, {-38, 44}}, color = {0, 0, 255}));
      connect(y0Load1.pin3, threePhase_pi_LinePerMile2.pin_n) annotation(Line(points = {{-52, 30}, {-52, 30}, {-52, 52}, {-38, 52}, {-38, 48}, {-38, 48}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n2, d_ZLoad1.pin1) annotation(Line(points = {{-76, 40}, {-78, 40}, {-78, 30}, {-78, 30}, {-78, 30}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n1, d_ZLoad1.pin2) annotation(Line(points = {{-76, 44}, {-84, 44}, {-84, 30}, {-82, 30}, {-82, 30}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n, d_ZLoad1.pin3) annotation(Line(points = {{-76, 48}, {-90, 48}, {-90, 30}, {-88, 30}, {-88, 30}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n2, threePhase_pi_LinePerMile1.pin2) annotation(Line(points = {{-38, 40}, {-60, 40}, {-60, 40}, {-60, 40}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n1, threePhase_pi_LinePerMile1.pin1) annotation(Line(points = {{-38, 44}, {-60, 44}, {-60, 44}, {-60, 44}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n, threePhase_pi_LinePerMile1.pin) annotation(Line(points = {{-38, 48}, {-58, 48}, {-58, 48}, {-60, 48}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, threePhase_pi_LinePerMile2.pin2) annotation(Line(points = {{-4, 50}, {-4, 50}, {-4, 40}, {-22, 40}, {-22, 40}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, threePhase_pi_LinePerMile2.pin1) annotation(Line(points = {{-8, 50}, {-8, 50}, {-8, 44}, {-22, 44}, {-22, 44}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n, threePhase_pi_LinePerMile2.pin) annotation(Line(points = {{-10, 50}, {-22, 50}, {-22, 48}, {-22, 48}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhase_pi_LinePerMile3.pin2) annotation(Line(points = {{-2, 74}, {-2, 74}, {-2, 68}, {-4, 68}, {-4, 68}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhase_pi_LinePerMile3.pin1) annotation(Line(points = {{-9, 75}, {-8, 75}, {-8, 68}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhase_pi_LinePerMile3.pin) annotation(Line(points = {{-16, 75}, {-16, 68}, {-12, 68}}, color = {0, 0, 255}));
      annotation(Diagram(graphics = {Text(origin = {-85, 53}, extent = {{-3, 3}, {3, -3}}, textString = "646", fontSize = 12), Text(origin = {-48, 56}, extent = {{-4, 2}, {4, -2}}, textString = "645", fontSize = 12), Text(origin = {-17, 54}, extent = {{-3, 2}, {3, -2}}, textString = "632", fontSize = 12), Text(origin = {-23, 70}, extent = {{-3, 4}, {3, -4}}, textString = "650", fontSize = 12)}));
    end node13_2;

    model testIEEE4GrYDCur_PU
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-30, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {42, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      ADN_Modelica.Basic.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-68, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaseTransformer.GrYD grYD1(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {7, 19}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
      //initial equation
      //  threePhaImpedancePerMile1.p1.vRe = 7200;
      //  threePhaImpedancePerMile1.p1.vIm = 0;
      //  threePhaImpedancePerMile1.p2.vRe = -3600;
      //  threePhaImpedancePerMile1.p2.vIm = -6235;
      //  threePhaImpedancePerMile1.p3.vRe = -3600;
      //  threePhaImpedancePerMile1.p3.vIm = 6235;
      //  threePhaImpedancePerMile1.n1.vRe = 7200;
      //  threePhaImpedancePerMile1.n1.vIm = 0;
      //  threePhaImpedancePerMile1.n2.vRe = -3600;
      //  threePhaImpedancePerMile1.n2.vIm = -6235;
      //  threePhaImpedancePerMile1.n3.vRe = -3600;
      //  threePhaImpedancePerMile1.n3.vIm = 6235;
      //  threePhaImpedancePerMile2.p1.vRe = 1077;
      ////1200;
      //  threePhaImpedancePerMile2.p1.vIm = 1658;
      ////2080;
      //  threePhaImpedancePerMile2.p2.vRe = 0;
      //  threePhaImpedancePerMile2.p2.vIm = 0;
      //  threePhaImpedancePerMile2.p3.vRe = -1263;
      ////-1200;
      //  threePhaImpedancePerMile2.p3.vIm = 1866;
      ////2080;
      //  threePhaImpedancePerMile2.n1.vRe = 543;
      ////1200;
      //  threePhaImpedancePerMile2.n1.vIm = 806;
      ////2080;
      //  threePhaImpedancePerMile2.n2.vRe = 543;
      ////0;
      //  threePhaImpedancePerMile2.n2.vIm = 806;
      ////0
      //  threePhaImpedancePerMile2.n3.vRe = -1251;
      ////-1200;
      //  threePhaImpedancePerMile2.n3.vIm = 1925;
      ////2080;
      //  y0ThreePhaVSource1.voltageSource1.p.vRe = 7200;
      //  y0ThreePhaVSource1.voltageSource1.p.vIm = 0;
      //  y0ThreePhaVSource1.voltageSource1.n.vRe = 0;
      //  y0ThreePhaVSource1.voltageSource1.n.vIm = 0;
      //  y0ThreePhaVSource1.voltageSource2.p.vRe = -3600;
      //  y0ThreePhaVSource1.voltageSource2.p.vIm = -6235;
      //  y0ThreePhaVSource1.voltageSource2.n.vRe = 0;
      //  y0ThreePhaVSource1.voltageSource2.n.vIm = 0;
      //  y0ThreePhaVSource1.voltageSource3.p.vRe = -3600;
      //  y0ThreePhaVSource1.voltageSource3.p.vIm = 6235;
      //  y0ThreePhaVSource1.voltageSource3.n.vRe = 0;
      //  y0ThreePhaVSource1.voltageSource3.n.vIm = 0;
      //  y0ThreePhaVSource1.pin1.vRe = 7200;
      //  y0ThreePhaVSource1.pin1.vIm = 0;
      //  y0ThreePhaVSource1.pin2.vRe = -3600;
      //  y0ThreePhaVSource1.pin2.vIm = -6235;
      //  y0ThreePhaVSource1.pin3.vRe = -3600;
      //  y0ThreePhaVSource1.pin3.vIm = 6235;
      //  grYD1.pin.vRe = 7200;
      //  grYD1.pin.vIm = 0;
      //  grYD1.pin1.vRe = -3600;
      //  grYD1.pin1.vIm = -6235;
      //  grYD1.pin2.vRe = -3600;
      //  grYD1.pin2.vIm = 6235;
      //  grYD1.pin_n.vRe = 1200;
      //  grYD1.pin_n.vIm = 2080;
      //  grYD1.pin_n1.vRe = 0;
      //  grYD1.pin_n1.vIm = 0;
      //  grYD1.pin_n2.vRe = -1200;
      //  grYD1.pin_n2.vIm = 2080;
      //  dLoad_2400VFactor_Lag1.pin1.vRe = 543;
      //  dLoad_2400VFactor_Lag1.pin1.vIm = 806;
      //  dLoad_2400VFactor_Lag1.pin2.vRe = 543;
      //  dLoad_2400VFactor_Lag1.pin2.vIm = 806;
      //  dLoad_2400VFactor_Lag1.pin3.vRe = -1251;
      //  dLoad_2400VFactor_Lag1.pin3.vIm = 1925;
      //// onePhaPQLoad_AB.vRe=543;
      //// onePhaPQLoad_AB.vIm=805;
      ////onePhaPQLoad_BC.vRe=543;
      //// onePhaPQLoad_BC.vIm=805;
      ////onePhaPQLoad_CA.vRe=-1796;
      ////  onePhaPQLoad_CA.vIm=1120;
      // // onePhaPQLoad_AB.n.vRe = 543;
      ////onePhaPQLoad_AB.n.vIm=805;
      //// onePhaPQLoad_BC.n.vRe=-1251;
      ////onePhaPQLoad_BC.n.vIm=1925;
      ////onePhaPQLoad_CA.n.vRe=-1251;
      //// onePhaPQLoad_CA.n.vIm=1925;
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {74, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {76, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground3 annotation(Placement(visible = true, transformation(origin = {54, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile2.n3, ground3.p) annotation(Line(points = {{48, 12}, {54, 12}, {54, -14}, {54, -14}, {54, -14}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, ground2.p) annotation(Line(points = {{48, 20}, {76, 20}, {76, 8}, {76, 8}, {76, 8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n1, ground1.p) annotation(Line(points = {{48, 30}, {48, 30}, {48, 40}, {74, 40}, {74, 40}}, color = {0, 0, 255}));
      connect(grYD1.pin_n, threePhaImpedancePerMile2.p1) annotation(Line(points = {{21, 28}, {36, 28}, {36, 30}, {37, 30}}, color = {0, 0, 255}));
      connect(grYD1.pin_n1, threePhaImpedancePerMile2.p2) annotation(Line(points = {{21, 19}, {28.5, 19}, {28.5, 20}, {37, 20}}, color = {0, 0, 255}));
      connect(grYD1.pin_n2, threePhaImpedancePerMile2.p3) annotation(Line(points = {{21, 10}, {38, 10}, {38, 11}, {37, 11}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, grYD1.pin) annotation(Line(points = {{-25, 26}, {-10, 26}, {-10, 28}, {-7, 28}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYD1.pin1) annotation(Line(points = {{-25, 16}, {-16.5, 16}, {-16.5, 19}, {-7, 19}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYD1.pin2) annotation(Line(points = {{-24, 6}, {-17.5, 6}, {-17.5, 10}, {-7, 10}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-58, 10}, {-46, 10}, {-46, 7}, {-35, 7}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-58, 16}, {-35, 16}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-58, 24}, {-46, 24}, {-46, 26}, {-35, 26}}, color = {0, 0, 255}));
    end testIEEE4GrYDCur_PU;

    model testGrYGrY2
      Basic.ThreePhaseTransformer.GrYGrY2 grYGrY21 annotation(Placement(visible = true, transformation(origin = {6, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.VoltageSource voltageSource1 annotation(Placement(visible = true, transformation(origin = {-60, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.VoltageSource voltageSource2 annotation(Placement(visible = true, transformation(origin = {-58, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.VoltageSource voltageSource3 annotation(Placement(visible = true, transformation(origin = {-58, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-84, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(voltageSource1.p, ground1.p) annotation(Line(points = {{-70, 38}, {-94, 38}, {-94, -8}, {-84, -8}, {-84, -8}, {-84, -8}}, color = {0, 0, 255}));
      connect(voltageSource2.p, ground1.p) annotation(Line(points = {{-68, 18}, {-86, 18}, {-86, -8}, {-84, -8}, {-84, -8}}, color = {0, 0, 255}));
      connect(ground1.p, voltageSource3.p) annotation(Line(points = {{-84, -8}, {-84, -8}, {-84, 0}, {-68, 0}, {-68, 0}}, color = {0, 0, 255}));
      connect(voltageSource3.n, grYGrY21.pc) annotation(Line(points = {{-48, 0}, {-22, 0}, {-22, 20}, {-4, 20}, {-4, 20}}, color = {0, 0, 255}));
      connect(voltageSource2.n, grYGrY21.pb) annotation(Line(points = {{-48, 18}, {-30, 18}, {-30, 26}, {-4, 26}, {-4, 26}}, color = {0, 0, 255}));
      connect(voltageSource1.n, grYGrY21.pa) annotation(Line(points = {{-50, 38}, {-4, 38}, {-4, 32}}, color = {0, 0, 255}));
    end testGrYGrY2;

    model testThreePh
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vmag2 = 1) annotation(Placement(visible = true, transformation(origin = {-58, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2 grYD21 annotation(Placement(visible = true, transformation(origin = {-6, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      /*initial equation
                                    threePhaseVoltageSource21.pA.vRe = 1;
                                    threePhaseVoltageSource21.pA.vIm = 0;
                                    threePhaseVoltageSource21.pB.vRe = 1;
                                    threePhaseVoltageSource21.pB.vIm = 0;
                                    threePhaseVoltageSource21.pC.vRe = 1;
                                    threePhaseVoltageSource21.pC.vIm = 0;
                                    threePhaseVoltageSource21.pA.iRe = 0.1;
                                    threePhaseVoltageSource21.pA.iIm = 0.1;
                                    threePhaseVoltageSource21.pB.iRe = 0.1;
                                    threePhaseVoltageSource21.pB.iIm = 0.1;
                                    threePhaseVoltageSource21.pC.iRe = 0.1;
                                    threePhaseVoltageSource21.pC.iIm = 0.1;
                                    threePhaseVoltageSource21.i1Re = 0.1;
                                    threePhaseVoltageSource21.i2Re = 0.1;
                                    threePhaseVoltageSource21.i3Re = 0.1;
                                    threePhaseVoltageSource21.i1Im = 0.1;
                                    threePhaseVoltageSource21.i2Im = 0.1;
                                    threePhaseVoltageSource21.i3Im = 0.1;
                                    grYD21.vaRe = 0.1;
                                    grYD21.vbRe = 0.1;
                                    grYD21.vcRe = 0.1;
                                    grYD21.vaIm = 0.1;
                                    grYD21.vbIm = 0.1;
                                    grYD21.vcIm = 0.1;
                                    grYD21.vnodeaRe = 0.1;
                                    grYD21.vnodebRe = 0.1;
                                    grYD21.vnodecRe = 0.1;
                                    grYD21.vnodeaIm = 0.1;
                                    grYD21.vnodebIm = 0.1;
                                    grYD21.vnodecIm = 0.1;
                                    grYD21.vARe = 0.1;
                              //right side branch voltage
                                    grYD21.vBRe = 0.1;
                                    grYD21.vCRe = 0.1;
                                    grYD21.vAIm = 0.1;
                                    grYD21.vBIm = 0.1;
                                    grYD21.vCIm = 0.1;
                                    grYD21.iaRe = 0.1;
                                    grYD21.ibRe = 0.1;
                                    grYD21.icRe = 0.1;
                                    grYD21.iaIm = 0.1;
                                    grYD21.ibIm = 0.1;
                                    grYD21.icIm = 0.1;
                                    grYD21.iARe = 0.1;
                                    grYD21.iBRe = 0.1;
                                    grYD21.iCRe = 0.1;
                                    grYD21.iAIm = 0.1;
                                    grYD21.iBIm = 0.1;
                                    grYD21.iCIm = 0.1;
                                    
                                    grYD21.UZRea = 0.1;
                                    grYD21.UZReb = 0.1;
                                    grYD21.UZRec = 0.1;
                                    grYD21.UZIma = 0.1;
                                    grYD21.UZImb = 0.1;
                              //Zbranch voltage
                                    grYD21.UZImc = 0.1;
                              //Zbranch voltage
                                    grYD21.igroundaRe = 0;
                                    grYD21.igroundaIm = 0;
                                    grYD21.na.vRe = 0;
                                    grYD21.nb.vRe = 0;
                                    grYD21.nc.vRe = 0;
                                    grYD21.na.vIm = 0;
                                    grYD21.nb.vIm = 0;
                                    grYD21.nc.vIm = 0;
                                    grYD21.pa.vRe = 0;
                                    grYD21.pb.vRe = 0;
                                    grYD21.pc.vRe = 0;
                                    grYD21.pa.vIm = 0;
                                    grYD21.pb.vIm = 0;
                                    grYD21.pc.vIm = 0;
                                    grYD21.na.iRe = 0;
                                    grYD21.nb.iRe = 0;
                                    grYD21.nc.iRe = 0;
                                    grYD21.na.iIm = 0;
                                    grYD21.nb.iIm = 0;
                                    grYD21.nc.iIm = 0;
                                    grYD21.pa.iRe = 0;
                                    grYD21.pb.iRe = 0;
                                    grYD21.pc.iRe = 0;
                                    grYD21.pa.iIm = 0;
                                    grYD21.pb.iIm = 0;
                                    grYD21.pc.iIm = 0;*/
    equation
      connect(threePhaseVoltageSource21.pC, grYD21.pc) annotation(Line(points = {{-50, 18}, {-16, 18}, {-16, 18}, {-16, 18}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, grYD21.pb) annotation(Line(points = {{-50, 24}, {-34, 24}, {-34, 24}, {-16, 24}, {-16, 24}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, grYD21.pa) annotation(Line(points = {{-49, 28}, {-30, 28}, {-30, 26}, {-15, 26}, {-15, 29}}, color = {0, 0, 255}));
    end testThreePh;

    model testThreePha4node11
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-28, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile2(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.0651) annotation(Placement(visible = true, transformation(origin = {46, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Basic.ThreePhaPQLoad.Y0LoadP_FactorLag y0LoadP_Factor1(P1 = 1275 * 1000, P2 = 1800 * 1000, P3 = 2375 * 1000, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {76, 22}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-74, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYGrY2_1 grYGrY2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {14, 20}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile1.n1, grYGrY2_11.pc) annotation(Line(points = {{-22, 8}, {2, 8}, {2, 12}, {2, 12}, {2, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, grYGrY2_11.pb) annotation(Line(points = {{-23, 18}, {-23, 19}, {1, 19}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n3, grYGrY2_11.pa) annotation(Line(points = {{-23, 27}, {1, 27}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-64, 26}, {-50, 26}, {-50, 27}, {-33, 27}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-66, 22}, {-50.5, 22}, {-50.5, 18}, {-33, 18}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-66, 16}, {-58, 16}, {-58, 8}, {-33, 8}}, color = {0, 0, 255}));
      connect(grYGrY2_11.nc, threePhaImpedancePerMile2.p1) annotation(Line(points = {{26, 12}, {40, 12}, {40, 12}, {42, 12}}, color = {0, 0, 255}));
      connect(grYGrY2_11.nb, threePhaImpedancePerMile2.p2) annotation(Line(points = {{26, 20}, {40, 20}, {40, 22}, {40, 22}}, color = {0, 0, 255}));
      connect(grYGrY2_11.na, threePhaImpedancePerMile2.p3) annotation(Line(points = {{25, 28}, {32, 28}, {32, 32}, {40, 32}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n1, y0LoadP_Factor1.pin3) annotation(Line(points = {{52, 12}, {64, 12}, {64, 18}, {64, 18}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n2, y0LoadP_Factor1.pin2) annotation(Line(points = {{52, 22}, {66, 22}, {66, 24}, {64, 24}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile2.n3, y0LoadP_Factor1.pin1) annotation(Line(points = {{52, 32}, {64, 32}, {64, 28}, {64, 28}}, color = {0, 0, 255}));
    end testThreePha4node11;

    model testY0Load2
      ADN_Modelica.Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle1 = 0, Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 100, Vmag2 = 100, Vmag3 = 100) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoad2 dLoad21(P = 200, Q = 300) annotation(Placement(visible = true, transformation(origin = {-28, 14}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.ThreePhaseImpedance threePhaseImpedance1(R12 = 0.5, R13 = 0.5, R21 = 0.5, R22 = 1, R23 = 0.5, R31 = 0.5, R32 = 0.5, X11 = 1, X12 = 0.5, X13 = 0.5, X21 = 0.5, X22 = 1, X23 = 0.5, X31 = 0.5, X32 = 0.5) annotation(Placement(visible = true, transformation(origin = {-53, 15}, extent = {{7, -7}, {-7, 7}}, rotation = 90)));
    equation
      connect(threePhaseImpedance1.n3, dLoad21.pC) annotation(Line(points = {{-50, 8}, {-36, 8}, {-36, 10}, {-36, 10}, {-36, 10}}, color = {0, 0, 255}));
      connect(threePhaseImpedance1.n2, dLoad21.pB) annotation(Line(points = {{-50, 16}, {-42, 16}, {-42, 16}, {-36, 16}, {-36, 16}}, color = {0, 0, 255}));
      connect(threePhaseImpedance1.n1, dLoad21.pA) annotation(Line(points = {{-50, 22}, {-42, 22}, {-42, 20}, {-36, 20}, {-36, 20}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaseImpedance1.p3) annotation(Line(points = {{-70, 10}, {-62, 10}, {-62, 8}, {-56, 8}, {-56, 8}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaseImpedance1.p2) annotation(Line(points = {{-69, 15}, {-64, 15}, {-64, 16}, {-56, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaseImpedance1.p1) annotation(Line(points = {{-69, 20}, {-60, 20}, {-60, 22}, {-56, 22}}, color = {0, 0, 255}));
    end testY0Load2;

    model testY0Load22
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-46, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYGrY2_1 grYGrY2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {14, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.Y0LoadP_FactorLag2 y0LoadP_FactorLag21(P1 = 1275 * 1000, P2 = 1800 * 1000, P3 = 2375 * 1000, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {42, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      /*  initial equation
                               
                              threePhaseVoltageSource21.i1Im=17386.9;
                              threePhaseVoltageSource21.i2Im=-912;
                              threePhaseVoltageSource21.i3Im=-17210;
                              threePhaseVoltageSource21.i1Re=-8776;
                              threePhaseVoltageSource21.i2Re =17470;
                              threePhaseVoltageSource21.i3Re =-8830;

                              threePhaseVoltageSource21.pA.iIm=17386;
                              threePhaseVoltageSource21.pA.iRe=-8776;
                              threePhaseVoltageSource21.pA.vIm=0;
                              threePhaseVoltageSource21.pA.vRe=7200;

                              threePhaseVoltageSource21.pB.iIm=-912;
                              threePhaseVoltageSource21.pB.iRe=17470;
                              threePhaseVoltageSource21.pB.vIm=-6235;
                              threePhaseVoltageSource21.pB.vRe=-3600;

                              threePhaseVoltageSource21.pC.iIm=-17210;
                              threePhaseVoltageSource21.pC.iRe=-8830;
                              threePhaseVoltageSource21.pC.vIm=6235;
                              threePhaseVoltageSource21.pC.vRe=-3600;

                              threePhaImpedancePerMile_21. i1Im=-17387;
                              threePhaImpedancePerMile_21. i1Re=8776;
                              threePhaImpedancePerMile_21. i2Im=912;
                              threePhaImpedancePerMile_21. i2Re=-17470;
                              threePhaImpedancePerMile_21. i3Im=17210;
                              threePhaImpedancePerMile_21. i3Re=8830;
                              threePhaImpedancePerMile_21. v1Im=-407;
                              threePhaImpedancePerMile_21. v1Re=5408;
                              threePhaImpedancePerMile_21. v2Im=-3680;
                              threePhaImpedancePerMile_21. v2Re=-1856;
                              threePhaImpedancePerMile_21. v3Im=4082;
                              threePhaImpedancePerMile_21. v3Re=-3538;

                              threePhaImpedancePerMile_21.na.iIm=17387;
                              threePhaImpedancePerMile_21.na.iRe=-8776;
                              threePhaImpedancePerMile_21.na.vIm=407;
                              threePhaImpedancePerMile_21.na.vRe=1790;

                              threePhaImpedancePerMile_21.nb.iIm=-912;
                              threePhaImpedancePerMile_21.nb.iRe=17470;
                              threePhaImpedancePerMile_21.nb.vIm=-2555;
                              threePhaImpedancePerMile_21.nb.vRe=-1743;

                              threePhaImpedancePerMile_21.nc.iIm=-17210;
                              threePhaImpedancePerMile_21.nc.iRe=-8830;
                              threePhaImpedancePerMile_21.nc.vIm=2152;
                              threePhaImpedancePerMile_21.nc.vRe=-61;

                              threePhaImpedancePerMile_21.pa.iIm=-17387;
                              threePhaImpedancePerMile_21.pa.iRe=8776;
                              threePhaImpedancePerMile_21.pa.vIm=0;
                              threePhaImpedancePerMile_21.pa.vRe=7200;

                              threePhaImpedancePerMile_21.pb.iIm=912;
                              threePhaImpedancePerMile_21.pb.iRe=-17470;
                              threePhaImpedancePerMile_21.pb.vIm=-6235;
                              threePhaImpedancePerMile_21.pb.vRe=-3600;

                              threePhaImpedancePerMile_21.pc.iIm=17210;
                              threePhaImpedancePerMile_21.pc.iRe=8830;
                              threePhaImpedancePerMile_21.pc.vIm=6235;
                              threePhaImpedancePerMile_21.pc.vRe=-407;


                              threePhaImpedancePerMile_22. i1Im=-4232;
                              threePhaImpedancePerMile_22. i1Re=1120;
                              threePhaImpedancePerMile_22. i2Im=6100;
                              threePhaImpedancePerMile_22. i2Re=-8756;
                              threePhaImpedancePerMile_22. i3Im=5437;
                              threePhaImpedancePerMile_22. i3Re=8774;

                              threePhaImpedancePerMile_22. v1Im=0;
                              threePhaImpedancePerMile_22. v1Re=0;
                              threePhaImpedancePerMile_22. v2Im=-881;
                              threePhaImpedancePerMile_22. v2Re=-4280;
                              threePhaImpedancePerMile_22. v3Im=5778;
                              threePhaImpedancePerMile_22. v3Re=725;

                              threePhaImpedancePerMile_22.na.iIm=4323;
                              threePhaImpedancePerMile_22.na.iRe=-1120;
                              threePhaImpedancePerMile_22.na.vIm=0.00001;
                              threePhaImpedancePerMile_22.na.vRe=0.00001;

                              threePhaImpedancePerMile_22.nb.iIm=-6104;
                              threePhaImpedancePerMile_22.nb.iRe=8756;
                              threePhaImpedancePerMile_22.nb.vIm=0.00001;
                              threePhaImpedancePerMile_22.nb.vRe=0.00001;

                              threePhaImpedancePerMile_22.nc.iIm=-5437;
                              threePhaImpedancePerMile_22.nc.iRe=-8773;
                              threePhaImpedancePerMile_22.nc.vIm=0;
                              threePhaImpedancePerMile_22.nc.vRe=0;

                              threePhaImpedancePerMile_22.pa.iIm=-4323;
                              threePhaImpedancePerMile_22.pa.iRe=1120;
                              threePhaImpedancePerMile_22.pa.vIm=0.00001;
                              threePhaImpedancePerMile_22.pa.vRe=0.00001;

                              threePhaImpedancePerMile_22.pb.iIm=6104;
                              threePhaImpedancePerMile_22.pb.iRe=-8756;
                              threePhaImpedancePerMile_22.pb.vIm=-881;
                              threePhaImpedancePerMile_22.pb.vRe=-4280;

                              threePhaImpedancePerMile_22.pc.iIm=5437;
                              threePhaImpedancePerMile_22.pc.iRe=8773;
                              threePhaImpedancePerMile_22.pc.vIm=5778;
                              threePhaImpedancePerMile_22.pc.vRe=725;





                              y0LoadP_FactorLag21.iAIm=-4323;
                              y0LoadP_FactorLag21.iARe=1120;
                              y0LoadP_FactorLag21.iBIm=6104;
                              y0LoadP_FactorLag21.iBRe=-8756;
                              y0LoadP_FactorLag21.iCIm=5437;
                              y0LoadP_FactorLag21.iCRe=8774;

                              y0LoadP_FactorLag21.vAIm=0;
                              y0LoadP_FactorLag21.vARe=0;
                              y0LoadP_FactorLag21.vBIm=0;
                              y0LoadP_FactorLag21.vBRe=0;
                              y0LoadP_FactorLag21.vCIm=0;
                              y0LoadP_FactorLag21.vCRe=0;

                              y0LoadP_FactorLag21.pA.iIm=-4232;
                              y0LoadP_FactorLag21.pA.iRe=1120;
                              y0LoadP_FactorLag21.pA.vIm=0;
                              y0LoadP_FactorLag21.pA.vRe=0;

                              y0LoadP_FactorLag21.pB.iIm=6104;
                              y0LoadP_FactorLag21.pB.iRe=-8756;
                              y0LoadP_FactorLag21.pB.vIm=0;
                              y0LoadP_FactorLag21.pB.vRe=0;

                              y0LoadP_FactorLag21.pC.iIm=5437;
                              y0LoadP_FactorLag21.pC.iRe=8773;
                              y0LoadP_FactorLag21.pC.vIm=0;
                              y0LoadP_FactorLag21.pC.vRe=0;


                              grYD2_11.na.iIm=4232;
                              grYD2_11.na.iRe=-1120;
                              grYD2_11.na.vIm=0;
                              grYD2_11.na.vRe=0;

                              grYD2_11.nb.iIm=-6104;
                              grYD2_11.nb.iRe=8756;
                              grYD2_11.nb.vIm=-881;
                              grYD2_11.nb.vRe=-4280;
                              grYD2_11.nc.iIm=-5437;
                              grYD2_11.nc.iRe=-8774;
                              grYD2_11.nc.vIm=5778;
                              grYD2_11.nc.vRe=725;

                                */
    equation
      connect(threePhaImpedancePerMile_22.nc, y0LoadP_FactorLag21.pC) annotation(Line(points = {{22, 10}, {34, 10}, {34, 12}, {34, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nb, y0LoadP_FactorLag21.pB) annotation(Line(points = {{22, 15}, {32, 15}, {32, 18}, {34, 18}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.na, y0LoadP_FactorLag21.pA) annotation(Line(points = {{22, 21}, {27, 21}, {27, 22}, {34, 22}}, color = {0, 0, 255}));
      connect(grYGrY2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {5, 10}}, color = {0, 0, 255}));
      connect(grYGrY2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {5, 16}}, color = {0, 0, 255}));
      connect(grYGrY2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {-4, 22}, {-4, 21}, {5, 21}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYGrY2_11.pc) annotation(Line(points = {{-38, 10}, {-28, 10}, {-28, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYGrY2_11.pb) annotation(Line(points = {{-38, 15}, {-38, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYGrY2_11.pa) annotation(Line(points = {{-38, 21}, {-38, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-55, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-55, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-55, 20}, {-55, 21}}, color = {0, 0, 255}));
    end testY0Load22;

    model testY0Load23
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-46, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {14, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.Y0LoadP_FactorLag2 y0LoadP_FactorLag21(P1 = 0, P2 = 0, P3 = 0, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {42, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(grYD2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {4, 10}, {4, 10}, {4, 10}}, color = {0, 0, 255}));
      connect(grYD2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {4, 16}, {4, 16}, {4, 16}}, color = {0, 0, 255}));
      connect(grYD2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {4, 22}, {4, 22}, {4, 22}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-38, 10}, {-28, 10}, {-28, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-38, 16}, {-28, 16}, {-28, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-38, 22}, {-28, 22}, {-28, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nc, y0LoadP_FactorLag21.pC) annotation(Line(points = {{22, 10}, {34, 10}, {34, 12}, {34, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nb, y0LoadP_FactorLag21.pB) annotation(Line(points = {{22, 15}, {32, 15}, {32, 18}, {34, 18}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.na, y0LoadP_FactorLag21.pA) annotation(Line(points = {{22, 21}, {27, 21}, {27, 22}, {34, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-55, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-55, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-55, 20}, {-55, 21}}, color = {0, 0, 255}));
    end testY0Load23;

    model sff
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-48, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-40, 10}, {-26, 10}, {-26, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-40, 16}, {-28, 16}, {-28, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-40, 22}, {-28, 22}, {-28, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-58, 10}, {-58, 10}, {-58, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-56, 16}, {-56, 16}, {-58, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-58, 20}, {-58, 22}, {-58, 22}}, color = {0, 0, 255}));
    end sff;

    model testY0Load24
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-48, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {14, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.Y0LoadP_FactorLag2 y0LoadP_FactorLag21(P1 = 1275, P2 = 1800, P3 = 2375, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {42, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(grYD2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {4, 10}, {4, 10}, {4, 10}}, color = {0, 0, 255}));
      connect(grYD2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {4, 16}, {4, 16}, {4, 16}}, color = {0, 0, 255}));
      connect(grYD2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {6, 22}, {6, 22}, {4, 22}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-40, 10}, {-28, 10}, {-28, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-40, 15}, {-33, 15}, {-33, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-40, 21}, {-33, 21}, {-33, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-57, 20}, {-57, 21}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-57, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-57, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nc, y0LoadP_FactorLag21.pC) annotation(Line(points = {{22, 10}, {34, 10}, {34, 12}, {34, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nb, y0LoadP_FactorLag21.pB) annotation(Line(points = {{22, 15}, {32, 15}, {32, 18}, {34, 18}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.na, y0LoadP_FactorLag21.pA) annotation(Line(points = {{22, 21}, {27, 21}, {27, 22}, {34, 22}}, color = {0, 0, 255}));
    end testY0Load24;

    model testDLoad25
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-48, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {10, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47 / sqrt(3), N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoadP_FactorLag2 dLoadP_FactorLag21(P1 = 1275 * 1000, P2 = 1800 * 1000, P3 = 2375 * 1000, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {46, 18}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      /*initial equation
                              grYD2_11.na.vIm = 0;
                              grYD2_11.na.vRe = 0;
                              grYD2_11.nb.vIm = 0;
                              grYD2_11.nb.vRe = -2402;
                              grYD2_11.nc.vIm = 2080;
                              grYD2_11.nc.vRe = -1200;
                              grYD2_11.vAIm = 0;
                              grYD2_11.vARe = 2402;
                              grYD2_11.vBIm = -2080;
                              grYD2_11.vBRe = -1200;
                              grYD2_11.vCIm = 2080;
                              grYD2_11.vCRe = -1200;
                              grYD2_11.vaIm = 0;
                              grYD2_11.vaRe = 7200;
                              grYD2_11.vbIm = -6235;
                              grYD2_11.vbRe = -3600;
                              grYD2_11.vcIm = 3600;
                              grYD2_11.vcRe = -3600;
                              grYD2_11.vnodebIm = 0;
                              grYD2_11.vnodebRe = -2402;
                              threePhaImpedancePerMile_21.v1Im = 0;
                              threePhaImpedancePerMile_21.v1Re = 0;
                              threePhaImpedancePerMile_21.v2Im = 0;
                              threePhaImpedancePerMile_21.v2Re = 0;
                              threePhaImpedancePerMile_21.v3Im = 0;
                              threePhaImpedancePerMile_21.v3Re = 0;
                              threePhaImpedancePerMile_22.v1Im = 0;
                              threePhaImpedancePerMile_22.v1Re = 0;
                              threePhaImpedancePerMile_22.v2Im = 0;
                              threePhaImpedancePerMile_22.v2Re = 0;
                              threePhaImpedancePerMile_22.v3Im = 0;
                              threePhaImpedancePerMile_22.v3Re = 0;
                              threePhaseVoltageSource21.pA.vIm = 0;
                              threePhaseVoltageSource21.pA.vRe = 7200;
                              threePhaseVoltageSource21.pB.vIm = -6235;
                              threePhaseVoltageSource21.pB.vRe = -3600;
                              threePhaseVoltageSource21.pC.vIm = 6235;
                              threePhaseVoltageSource21.pC.vRe = -3600;
                              grYD2_11.pa.vIm = 0;
                              grYD2_11.pa.vRe = 7200;
                              grYD2_11.pb.vIm = -6235;
                              grYD2_11.pb.vRe = -3600;
                              grYD2_11.pc.vIm = 6235;
                              grYD2_11.pc.vRe = -3600;
                              grYD2_11.vnodeaIm = 0;
                              grYD2_11.vnodeaRe = 0;
                              grYD2_11.vnodecIm = 2080;
                              grYD2_11.vnodecRe = -1200;
                              threePhaImpedancePerMile_21.na.vIm = 0;
                              threePhaImpedancePerMile_21.na.vRe = 7200;
                              threePhaImpedancePerMile_21.nb.vIm = 6235;
                              threePhaImpedancePerMile_21.nb.vRe = -3600;
                        // threePhaImpedancePerMile_21.nc.vIm=6235;
                              threePhaImpedancePerMile_21.nc.vRe = -3600;
                              threePhaImpedancePerMile_21.pa.vIm = 0;
                              threePhaImpedancePerMile_21.pa.vRe = 7200;
                              threePhaImpedancePerMile_21.pb.vIm = -6235;
                              threePhaImpedancePerMile_21.pb.vRe = -3600;
                              threePhaImpedancePerMile_21.pc.vIm = 6235;
                              threePhaImpedancePerMile_21.pc.vRe = -3600;
                              threePhaImpedancePerMile_22.na.vIm = 0;
                              threePhaImpedancePerMile_22.na.vRe = 0;
                              threePhaImpedancePerMile_22.nb.vIm = 0;
                              threePhaImpedancePerMile_22.nb.vRe = -2401;
                              threePhaImpedancePerMile_22.nc.vIm = 2080;
                              threePhaImpedancePerMile_22.nc.vRe = -1200;
                              threePhaImpedancePerMile_22.pa.vIm = 0;
                              threePhaImpedancePerMile_22.pa.vRe = 0;
                        //threePhaImpedancePerMile_22.pb.vIm=0;//0
                        //threePhaImpedancePerMile_22.pb.vRe=-2401;
                        // threePhaImpedancePerMile_22.pc.vIm=2080;
                        //threePhaImpedancePerMile_22.pc.vRe=-1200;*/
    equation
      connect(threePhaImpedancePerMile_22.nc, dLoadP_FactorLag21.pC) annotation(Line(points = {{18, 12}, {38, 12}, {38, 14}, {38, 14}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nb, dLoadP_FactorLag21.pB) annotation(Line(points = {{18, 18}, {36, 18}, {36, 20}, {38, 20}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.na, dLoadP_FactorLag21.pA) annotation(Line(points = {{18, 23}, {28, 23}, {28, 24}, {36, 24}}, color = {0, 0, 255}));
      connect(grYD2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {1, 22}, {1, 23}}, color = {0, 0, 255}));
      connect(grYD2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {4, 16}, {4, 18}, {1, 18}}, color = {0, 0, 255}));
      connect(grYD2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {1, 10}, {1, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-40, 10}, {-26, 10}, {-26, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-40, 16}, {-28, 16}, {-28, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-40, 22}, {-28, 22}, {-28, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-58, 10}, {-58, 10}, {-58, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-56, 16}, {-56, 16}, {-58, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-58, 20}, {-58, 22}, {-58, 22}}, color = {0, 0, 255}));
    end testDLoad25;

    model testY0Load26
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-48, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {14, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.Y0LoadP_FactorLag2 y0LoadP_FactorLag21 annotation(Placement(visible = true, transformation(origin = {46, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    equation
      connect(grYD2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {-3, 22}, {-3, 21}, {5, 21}}, color = {0, 0, 255}));
      connect(grYD2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {5, 16}}, color = {0, 0, 255}));
      connect(grYD2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {5, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-40, 10}, {-28, 10}, {-28, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-40, 15}, {-33, 15}, {-33, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-40, 21}, {-33, 21}, {-33, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-57, 20}, {-57, 21}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-57, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-57, 10}}, color = {0, 0, 255}));
    end testY0Load26;

    model testY0Load27
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-48, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {16, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad1(P = 1275 * 1000, Q = 790 * 1000) annotation(Placement(visible = true, transformation(origin = {48, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad2(P = 1800 * 1000, Q = 871 * 1000) annotation(Placement(visible = true, transformation(origin = {48, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad3(P = 2375 * 1000, Q = 780 * 1000) annotation(Placement(visible = true, transformation(origin = {48, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile_22.nc, onePhaPQLoad3.p) annotation(Line(points = {{24, 12}, {26, 12}, {26, -8}, {38, -8}, {38, -8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nb, onePhaPQLoad2.p) annotation(Line(points = {{24, 18}, {30, 18}, {30, 14}, {38, 14}, {38, 14}}, color = {0, 0, 255}));
      connect(onePhaPQLoad3.n, onePhaPQLoad1.p) annotation(Line(points = {{58, -8}, {70, -8}, {70, -18}, {34, -18}, {34, 32}, {38, 32}, {38, 36}, {38, 36}}, color = {0, 0, 255}));
      connect(onePhaPQLoad2.n, onePhaPQLoad3.p) annotation(Line(points = {{58, 14}, {68, 14}, {68, 4}, {38, 4}, {38, -8}, {38, -8}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.n, onePhaPQLoad2.p) annotation(Line(points = {{58, 36}, {70, 36}, {70, 22}, {38, 22}, {38, 14}, {38, 14}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.na, onePhaPQLoad1.p) annotation(Line(points = {{24, 24}, {31, 24}, {31, 36}, {38, 36}}, color = {0, 0, 255}));
      connect(grYD2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {7, 10}, {7, 12}}, color = {0, 0, 255}));
      connect(grYD2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {4, 16}, {4, 18}, {7, 18}}, color = {0, 0, 255}));
      connect(grYD2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {7, 22}, {7, 23}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-40, 10}, {-26, 10}, {-26, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-40, 16}, {-28, 16}, {-28, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-40, 22}, {-28, 22}, {-28, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-58, 10}, {-58, 10}, {-58, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-56, 16}, {-56, 16}, {-58, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-58, 20}, {-58, 22}, {-58, 22}}, color = {0, 0, 255}));
    end testY0Load27;

    model testGrYD2_1
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21 annotation(Placement(visible = true, transformation(origin = {-40, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 10, N2 = 1) annotation(Placement(visible = true, transformation(origin = {24, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaseVoltageSource21.pC, grYD2_11.pc) annotation(Line(points = {{-32, 16}, {-24, 16}, {-24, 4}, {14, 4}, {14, 4}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, grYD2_11.pb) annotation(Line(points = {{-32, 22}, {-18, 22}, {-18, 10}, {14, 10}, {14, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, grYD2_11.pa) annotation(Line(points = {{-30, 26}, {-6, 26}, {-6, 16}, {14, 16}, {14, 16}, {14, 16}}, color = {0, 0, 255}));
    end testGrYD2_1;

    model test1
      Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vmag1 = 10, Vmag2 = 10, Vmag3 = 10) annotation(Placement(visible = true, transformation(origin = {-84, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile threePhaImpedancePerMile1 annotation(Placement(visible = true, transformation(origin = {-20, 26}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
      Basic.ThreePhaPQLoad.DLoad_2400VFactor_Lag dLoad_2400VFactor_Lag1(PAB = 1200, PBC = 1800, PCA = 2375, Power_FactorAB = 0.8, Power_FactorBC = 0.9, Power_FactorCA = 0.95) annotation(Placement(visible = true, transformation(origin = {22, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile1.n3, dLoad_2400VFactor_Lag1.pin3) annotation(Line(points = {{-14, 18}, {8, 18}, {8, 22}, {12, 22}, {12, 22}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n2, dLoad_2400VFactor_Lag1.pin2) annotation(Line(points = {{-14, 26}, {12, 26}, {12, 28}, {12, 28}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile1.n1, dLoad_2400VFactor_Lag1.pin1) annotation(Line(points = {{-15, 36}, {4, 36}, {4, 32}, {12, 32}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, threePhaImpedancePerMile1.p1) annotation(Line(points = {{-74, 34}, {-25, 34}, {-25, 36}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, threePhaImpedancePerMile1.p2) annotation(Line(points = {{-74, 26}, {-25, 26}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, threePhaImpedancePerMile1.p3) annotation(Line(points = {{-74, 20}, {-46, 20}, {-46, 17}, {-25, 17}}, color = {0, 0, 255}));
    end test1;

    model dwsws1
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-48, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4013, UR12 = 0.0953, UR13 = 0.0953, UR21 = 0.0953, UR22 = 0.4013, UR23 = 0.0953, UR31 = 0.0953, UR32 = 0.0953, UR33 = 0.4013, UX11 = 1.4133, UX12 = 0.8515, UX13 = 0.7266, UX21 = 0.8515, UX22 = 1.4133, UX23 = 0.7802, UX31 = 0.7266, UX32 = 0.7802, UX33 = 1.4133) annotation(Placement(visible = true, transformation(origin = {24, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoadP_FactorLag2 dLoadP_FactorLag21(P1 = 1275, P2 = 1800, P3 = 2375, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {60, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    equation
      connect(threePhaImpedancePerMile_22.nc, dLoadP_FactorLag21.pC) annotation(Line(points = {{32, 12}, {42, 12}, {42, 16}, {64, 16}, {64, 10}, {64, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nb, dLoadP_FactorLag21.pB) annotation(Line(points = {{32, 18}, {58, 18}, {58, 10}, {58, 10}, {58, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.na, dLoadP_FactorLag21.pA) annotation(Line(points = {{32, 24}, {54, 24}, {54, 12}, {54, 12}, {54, 12}}, color = {0, 0, 255}));
      connect(grYD2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {15, 22}, {15, 23}}, color = {0, 0, 255}));
      connect(grYD2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {4, 16}, {4, 18}, {15, 18}}, color = {0, 0, 255}));
      connect(grYD2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {15, 10}, {15, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-40, 10}, {-26, 10}, {-26, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-40, 16}, {-28, 16}, {-28, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-40, 22}, {-28, 22}, {-28, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-58, 10}, {-58, 10}, {-58, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-56, 16}, {-56, 16}, {-58, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-58, 20}, {-58, 22}, {-58, 22}}, color = {0, 0, 255}));
    end dwsws1;

    model dwsws
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-48, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4013, UR12 = 0.0953, UR13 = 0.0953, UR21 = 0.0953, UR22 = 0.4013, UR23 = 0.0953, UR31 = 0.0953, UR32 = 0.0953, UR33 = 0.4013, UX11 = 1.4133, UX12 = 0.8515, UX13 = 0.7266, UX21 = 0.8515, UX22 = 1.4133, UX23 = 0.7802, UX31 = 0.7266, UX32 = 0.7802, UX33 = 1.4133) annotation(Placement(visible = true, transformation(origin = {24, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47, N2 = 4.16 * sqrt(3), Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoadP_FactorLag2 dLoadP_FactorLag21(P1 = 1275 * 1000, P2 = 1800 * 1000, P3 = 2375 * 1000, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {60, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      //initial equation
      /*grYD2_11.na.vIm = 0;
                              grYD2_11.na.vRe = 0;
                              grYD2_11.nb.vIm = 0;
                              grYD2_11.nb.vRe = -2402;
                              grYD2_11.nc.vIm = 2080;
                              grYD2_11.nc.vRe = -1200;
                              grYD2_11.pa.vIm = 0;
                              grYD2_11.pa.vRe = 7200;
                              grYD2_11.pb.vIm = -6235;
                              grYD2_11.pb.vRe = -3600;
                              grYD2_11.pc.vIm = 6235;
                              grYD2_11.pc.vRe = -3600;*/
      /*grYD2_11.vAIm = 0;
                              grYD2_11.vARe = 2402;
                              grYD2_11.vBIm = -2080;
                              grYD2_11.vBRe = -1200;
                              grYD2_11.vCIm = 2080;
                              grYD2_11.vCRe = -1200;*/
      //grYD2_11.vaIm = 0;
      //grYD2_11.vaRe = 7200;
      //grYD2_11.vbIm = -6235;
      //grYD2_11.vbRe = -3600;
      //grYD2_11.vcIm = 6235;
      //grYD2_11.vcRe = -3600;
      //grYD2_11.vnodeaIm = 0;
      //grYD2_11.vnodeaRe = 0;
      /*grYD2_11.vnodecIm = 2080;
                              grYD2_11.vnodecRe = -1200;
                              grYD2_11.vnodebIm = 0;
                              grYD2_11.vnodebRe = -2402;*/
      /*threePhaImpedancePerMile_21.v1Im = 0;
                              threePhaImpedancePerMile_21.v1Re = 0;
                              threePhaImpedancePerMile_21.v2Im = 0;
                              threePhaImpedancePerMile_21.v2Re = 0;
                              threePhaImpedancePerMile_21.v3Im = 0;
                              threePhaImpedancePerMile_21.v3Re = 0;
                              threePhaImpedancePerMile_22.v1Im = 0;
                              threePhaImpedancePerMile_22.v1Re = 0;
                              threePhaImpedancePerMile_22.v2Im = 0;
                              threePhaImpedancePerMile_22.v2Re = 0;
                              threePhaImpedancePerMile_22.v3Im = 0;
                              threePhaImpedancePerMile_22.v3Re = 0;*/
      /*  threePhaseVoltageSource21.pA.vIm = 0;
                              threePhaseVoltageSource21.pA.vRe = 7200;
                              threePhaseVoltageSource21.pB.vIm = -6235;
                              threePhaseVoltageSource21.pB.vRe = -3600;
                              threePhaseVoltageSource21.pC.vIm = 6235;
                              threePhaseVoltageSource21.pC.vRe = -3600;
                              
                             
                              threePhaImpedancePerMile_21.na.vIm = 0;
                              threePhaImpedancePerMile_21.na.vRe = 7200;
                              threePhaImpedancePerMile_21.nb.vIm = -6235;
                              threePhaImpedancePerMile_21.nb.vRe = -3600;
                              threePhaImpedancePerMile_21.nc.vIm=6235;
                              threePhaImpedancePerMile_21.nc.vRe = -3600;
                              threePhaImpedancePerMile_21.pa.vIm = 0;
                              threePhaImpedancePerMile_21.pa.vRe = 7200;
                              threePhaImpedancePerMile_21.pb.vIm = -6235;
                              threePhaImpedancePerMile_21.pb.vRe = -3600;
                              threePhaImpedancePerMile_21.pc.vIm = 6235;
                              threePhaImpedancePerMile_21.pc.vRe = -3600;
                            
                              threePhaImpedancePerMile_22.na.vIm = 0;
                              threePhaImpedancePerMile_22.na.vRe = 0;
                              threePhaImpedancePerMile_22.nb.vIm = 0;
                              threePhaImpedancePerMile_22.nb.vRe = -2401;
                              threePhaImpedancePerMile_22.nc.vIm = 2080;
                              threePhaImpedancePerMile_22.nc.vRe = -1200;*/
      //  threePhaImpedancePerMile_22.pa.vIm = 0;
      //  threePhaImpedancePerMile_22.pa.vRe = 0;
      //threePhaImpedancePerMile_22.pb.vIm=0;//0
      //threePhaImpedancePerMile_22.pb.vRe=-2401;
      // threePhaImpedancePerMile_22.pc.vIm=2080;
      //threePhaImpedancePerMile_22.pc.vRe=-1200;
      //dLoadP_FactorLag21.
    equation
      connect(threePhaImpedancePerMile_22.nc, dLoadP_FactorLag21.pC) annotation(Line(points = {{32, 12}, {42, 12}, {42, 16}, {64, 16}, {64, 10}, {64, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nb, dLoadP_FactorLag21.pB) annotation(Line(points = {{32, 18}, {58, 18}, {58, 10}, {58, 10}, {58, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.na, dLoadP_FactorLag21.pA) annotation(Line(points = {{32, 24}, {54, 24}, {54, 12}, {54, 12}, {54, 12}}, color = {0, 0, 255}));
      connect(grYD2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {15, 22}, {15, 23}}, color = {0, 0, 255}));
      connect(grYD2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {4, 16}, {4, 18}, {15, 18}}, color = {0, 0, 255}));
      connect(grYD2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {15, 10}, {15, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-40, 10}, {-26, 10}, {-26, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-40, 16}, {-28, 16}, {-28, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-40, 22}, {-28, 22}, {-28, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-58, 10}, {-58, 10}, {-58, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-56, 16}, {-56, 16}, {-58, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-58, 20}, {-58, 22}, {-58, 22}}, color = {0, 0, 255}));
    end dwsws;

    model dasff
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-78, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21(Length = 2000, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {-48, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_22(Length = 2500, UR11 = 0.4576, UR12 = 0.1559, UR13 = 0.1535, UR21 = 0.1559, UR22 = 0.4666, UR23 = 0.158, UR31 = 0.1535, UR32 = 0.158, UR33 = 0.4615, UX11 = 1.078, UX12 = 0.5017, UX13 = 0.3849, UX21 = 0.5017, UX22 = 1.0482, UX23 = 0.4236, UX31 = 0.3849, UX32 = 0.4236, UX33 = 1.065) annotation(Placement(visible = true, transformation(origin = {24, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.GrYD2_1 grYD2_11(N1 = 12.47, N2 = 4.16, Rp = 0.01, Sb = 6000, Vb = 4.16, Xp = 0.06) annotation(Placement(visible = true, transformation(origin = {-18, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoadP_FactorLag2 dLoadP_FactorLag21(P1 = 1275, P2 = 1800, P3 = 2375, Power_Factor1 = 0.85, Power_Factor2 = 0.9, Power_Factor3 = 0.95) annotation(Placement(visible = true, transformation(origin = {56, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    equation
      connect(threePhaImpedancePerMile_22.nc, dLoadP_FactorLag21.pC) annotation(Line(points = {{32, 12}, {44, 12}, {44, 16}, {60, 16}, {60, 10}, {60, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.nb, dLoadP_FactorLag21.pB) annotation(Line(points = {{32, 18}, {56, 18}, {56, 10}, {54, 10}, {54, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_22.na, dLoadP_FactorLag21.pA) annotation(Line(points = {{32, 24}, {50, 24}, {50, 12}, {50, 12}, {50, 12}}, color = {0, 0, 255}));
      connect(grYD2_11.na, threePhaImpedancePerMile_22.pa) annotation(Line(points = {{-10, 22}, {15, 22}, {15, 23}}, color = {0, 0, 255}));
      connect(grYD2_11.nb, threePhaImpedancePerMile_22.pb) annotation(Line(points = {{-10, 16}, {4, 16}, {4, 18}, {15, 18}}, color = {0, 0, 255}));
      connect(grYD2_11.nc, threePhaImpedancePerMile_22.pc) annotation(Line(points = {{-10, 10}, {15, 10}, {15, 12}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nc, grYD2_11.pc) annotation(Line(points = {{-40, 10}, {-26, 10}, {-26, 10}, {-28, 10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, grYD2_11.pb) annotation(Line(points = {{-40, 16}, {-28, 16}, {-28, 16}, {-28, 16}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, grYD2_11.pa) annotation(Line(points = {{-40, 22}, {-28, 22}, {-28, 22}, {-28, 22}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-70, 10}, {-58, 10}, {-58, 10}, {-58, 10}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-70, 16}, {-56, 16}, {-56, 16}, {-58, 16}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-68, 20}, {-58, 20}, {-58, 22}, {-58, 22}}, color = {0, 0, 255}));
    end dasff;

    model test2
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470, Vmag2 = 12470, Vmag3 = 12470) annotation(Placement(visible = true, transformation(origin = {-80, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.D_GrY d_GrY1(N1 = 115, N2 = 4.16, Rp = 0.01, Sb = 5000, Vb = 4.16, Xp = 0.08) annotation(Placement(visible = true, transformation(origin = {-52, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21 annotation(Placement(visible = true, transformation(origin = {-18, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseZorILoad.Y_ZLoad y_ZLoad1(PAB = 2000000, QAB = 3000) annotation(Placement(visible = true, transformation(origin = {16, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile_21.nc, y_ZLoad1.pin3) annotation(Line(points = {{-10, -12}, {6, -12}, {6, -10}, {6, -10}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, y_ZLoad1.pin2) annotation(Line(points = {{-10, -6}, {6, -6}, {6, -4}, {6, -4}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.na, y_ZLoad1.pin1) annotation(Line(points = {{-10, 0}, {6, 0}, {6, 0}, {6, 0}}, color = {0, 0, 255}));
      connect(d_GrY1.nc, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-44, -12}, {-27, -12}}, color = {0, 0, 255}));
      connect(d_GrY1.nb, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-44, -6}, {-27, -6}}, color = {0, 0, 255}));
      connect(d_GrY1.na, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-44, 0}, {-39, 0}, {-39, -1}, {-27, -1}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, d_GrY1.pc) annotation(Line(points = {{-72, -10}, {-62, -10}, {-62, -12}, {-62, -12}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, d_GrY1.pb) annotation(Line(points = {{-72, -4}, {-62, -4}, {-62, -6}, {-62, -6}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, d_GrY1.pa) annotation(Line(points = {{-70, 0}, {-62, 0}, {-62, 0}, {-62, 0}}, color = {0, 0, 255}));
    end test2;

    model test_DILoad
      Basic.ThreePhaseVoltageSource.ThreePhaseVoltageSource2 threePhaseVoltageSource21(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470, Vmag2 = 12470, Vmag3 = 12470) annotation(Placement(visible = true, transformation(origin = {-80, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseTransformer.D_GrY d_GrY1(N1 = 115, N2 = 4.16, Rp = 0.01, Sb = 5000, Vb = 4.16, Xp = 0.08) annotation(Placement(visible = true, transformation(origin = {-52, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaImpedancePerMile_2 threePhaImpedancePerMile_21 annotation(Placement(visible = true, transformation(origin = {-18, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.ThreePhaseZorILoad.D_ILoad d_ILoad1 annotation(Placement(visible = true, transformation(origin = {24, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(threePhaImpedancePerMile_21.nc, d_ILoad1.pin2) annotation(Line(points = {{-10, -12}, {16, -12}, {16, -10}, {16, -10}, {16, -8}}, color = {0, 0, 255}));
      connect(threePhaImpedancePerMile_21.nb, d_ILoad1.pin1) annotation(Line(points = {{-10, -6}, {16, -6}, {16, -4}, {14, -4}}, color = {0, 0, 255}));
      connect(d_ILoad1.pin, threePhaImpedancePerMile_21.na) annotation(Line(points = {{16, -2}, {-10, -2}, {-10, 0}, {-10, 0}}, color = {0, 0, 255}));
      connect(d_GrY1.nc, threePhaImpedancePerMile_21.pc) annotation(Line(points = {{-44, -12}, {-27, -12}}, color = {0, 0, 255}));
      connect(d_GrY1.nb, threePhaImpedancePerMile_21.pb) annotation(Line(points = {{-44, -6}, {-27, -6}}, color = {0, 0, 255}));
      connect(d_GrY1.na, threePhaImpedancePerMile_21.pa) annotation(Line(points = {{-44, 0}, {-39, 0}, {-39, -1}, {-27, -1}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pC, d_GrY1.pc) annotation(Line(points = {{-72, -10}, {-62, -10}, {-62, -12}, {-62, -12}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pB, d_GrY1.pb) annotation(Line(points = {{-72, -4}, {-62, -4}, {-62, -6}, {-62, -6}}, color = {0, 0, 255}));
      connect(threePhaseVoltageSource21.pA, d_GrY1.pa) annotation(Line(points = {{-70, 0}, {-62, 0}, {-62, 0}, {-62, 0}}, color = {0, 0, 255}));
    end test_DILoad;

    model testNode13_
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-47, 81}, extent = {{7, 7}, {-7, -7}}, rotation = 180)));
      ADN_Modelica.Basic.ThreePhaseZorILoad.D_ZLoad d_ZLoad1(PAB = 0.001, PBC = 230 * 1000, PCA = 0.001, QAB = 0.001, QBC = 132 * 1000, QCA = 0.001) annotation(Placement(visible = true, transformation(origin = {-84, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Basic.ThreePhaPQLoad.Y0Load y0Load1(P1 = 0, P2 = 170, P3 = 0, Q1 = 0, Q2 = 125, Q3 = 0) annotation(Placement(visible = true, transformation(origin = {-48, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile1(Lengtha = 300, UB11a = 0, UB12a = 0, UB13a = 0, UB21a = 0, UB22a = 4.7097 * e - 6, UB23a = (-0.8999 * e) - 6, UB31a = 0, UB32a = (-0.8999 * e) - 6, UB33a = 4.6658 * e - 6, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0, UR12a = 0, UR13a = 0, UR21a = 0, UR22a = 1.3294, UR23a = 0.2066, UR31a = 0, UR32a = 0.2066, UR33a = 1.3238, UX11a = 0, UX22a = 1.3471, UX23a = 0.4591, UX32a = 0.4591, UX33a = 1.3569) annotation(Placement(visible = true, transformation(origin = {-68, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile2(Lengtha = 500, UB11a = 0, UB12a = 0, UB13a = 0, UB21a = 0, UB22a = 4.7097 * e - 6, UB23a = (-0.8999 * e) - 6, UB31a = 0, UB32a = (-0.8999 * e) - 6, UB33a = 4.6658 * e - 6, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0, UR22a = 1.3294, UR23a = 0.2066, UR32a = 0.2066, UR33a = 1.3238, UX11a = 0, UX22a = 1.3471, UX23a = 0.4591, UX32a = 0.4591, UX33a = 1.3569) annotation(Placement(visible = true, transformation(origin = {-30, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile3(Lengtha = 2000, UB11a = 6.2998 * e - 6, UB12a = (-1.9958 * e) - 6, UB13a = (-1.2595 * e) - 6, UB21a = (-1.9958 * e) - 6, UB22a = 5.9597 * e - 6, UB23a = (-0.7417 * e) - 6, UB31a = (-1.2595 * e) - 6, UB32a = (-0.7417 * e) - 6, UB33a = 5.6386 * e - 6, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.3465, UR12a = 0.1560, UR13a = 0.1580, UR21a = 0.1580, UR22a = 0.3375, UR23a = 0.1535, UR31a = 0.1580, UR32a = 0.1535, UR33a = 0.3414, UX11a = 1.0179, UX12a = 0.5017, UX13a = 0.4236, UX21a = 0.5017, UX22a = 1.0478, UX23a = 0.3849, UX31a = 0.4236, UX32a = 0.3849, UX33a = 1.0348) annotation(Placement(visible = true, transformation(origin = {-5, 57}, extent = {{-11, 11}, {11, -11}}, rotation = -90)));
      Basic.ThreePhaseTransformer.D_GrY d_GrY1(N1 = 115, N2 = 4.16 / sqrt(3), Rp = 0.01, Sb = 5000, Vb = 4.16, Xp = 0.08) annotation(Placement(visible = true, transformation(origin = {-22, 82}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
    equation
      connect(d_GrY1.nc, threePhase_pi_LinePerMile3.pin2) annotation(Line(points = {{-16, 78}, {-4, 78}, {-4, 66}, {-4, 66}, {-4, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.nb, threePhase_pi_LinePerMile3.pin1) annotation(Line(points = {{-16, 82}, {-8, 82}, {-8, 66}, {-8, 66}, {-8, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.na, threePhase_pi_LinePerMile3.pin) annotation(Line(points = {{-16, 86}, {-12, 86}, {-12, 66}, {-12, 66}, {-12, 66}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, d_GrY1.pc) annotation(Line(points = {{-40, 76}, {-30, 76}, {-30, 78}, {-30, 78}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, d_GrY1.pb) annotation(Line(points = {{-40, 82}, {-30, 82}, {-30, 82}, {-30, 82}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, d_GrY1.pa) annotation(Line(points = {{-40, 86}, {-30, 86}, {-30, 86}, {-30, 86}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n, threePhase_pi_LinePerMile2.pin) annotation(Line(points = {{-11, 48}, {-22, 48}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, threePhase_pi_LinePerMile2.pin1) annotation(Line(points = {{-7, 48}, {-7, 44}, {-22, 44}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, threePhase_pi_LinePerMile2.pin2) annotation(Line(points = {{-3, 48}, {-3, 40}, {-22, 40}}, color = {0, 0, 255}));
      connect(y0Load1.pin1, threePhase_pi_LinePerMile2.pin_n2) annotation(Line(points = {{-42, 30}, {-42, 30}, {-42, 42}, {-38, 42}, {-38, 40}, {-38, 40}}, color = {0, 0, 255}));
      connect(y0Load1.pin2, threePhase_pi_LinePerMile2.pin_n1) annotation(Line(points = {{-46, 30}, {-46, 30}, {-46, 46}, {-38, 46}, {-38, 44}, {-38, 44}}, color = {0, 0, 255}));
      connect(y0Load1.pin3, threePhase_pi_LinePerMile2.pin_n) annotation(Line(points = {{-52, 30}, {-52, 30}, {-52, 52}, {-38, 52}, {-38, 48}, {-38, 48}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n2, d_ZLoad1.pin1) annotation(Line(points = {{-76, 40}, {-78, 40}, {-78, 30}, {-78, 30}, {-78, 30}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n1, d_ZLoad1.pin2) annotation(Line(points = {{-76, 44}, {-84, 44}, {-84, 30}, {-82, 30}, {-82, 30}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n, d_ZLoad1.pin3) annotation(Line(points = {{-76, 48}, {-90, 48}, {-90, 30}, {-88, 30}, {-88, 30}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n2, threePhase_pi_LinePerMile1.pin2) annotation(Line(points = {{-38, 40}, {-60, 40}, {-60, 40}, {-60, 40}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n1, threePhase_pi_LinePerMile1.pin1) annotation(Line(points = {{-38, 44}, {-60, 44}, {-60, 44}, {-60, 44}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n, threePhase_pi_LinePerMile1.pin) annotation(Line(points = {{-38, 48}, {-58, 48}, {-58, 48}, {-60, 48}}, color = {0, 0, 255}));
      annotation(Diagram(graphics = {Text(origin = {-85, 53}, extent = {{-3, 3}, {3, -3}}, textString = "646", fontSize = 12), Text(origin = {-48, 56}, extent = {{-4, 2}, {4, -2}}, textString = "645", fontSize = 12), Text(origin = {-17, 54}, extent = {{-3, 2}, {3, -2}}, textString = "632", fontSize = 12), Text(origin = {9, 72}, extent = {{-3, 4}, {3, -4}}, textString = "650", fontSize = 12)}, coordinateSystem(initialScale = 0.1)));
    end testNode13_;

    model testNode13_1
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-47, 81}, extent = {{7, 7}, {-7, -7}}, rotation = 180)));
      Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile1(Lengtha = 300, UB11a = 0, UB12a = 0, UB13a = 0, UB21a = 0, UB22a = 4.7097, UB23a = -0.8999, UB31a = 0, UB32a = -0.8999, UB33a = 4.6658, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0, UR12a = 0, UR13a = 0, UR21a = 0, UR22a = 1.3294, UR23a = 0.2066, UR31a = 0, UR32a = 0.2066, UR33a = 1.3238, UX11a = 0, UX22a = 1.3471, UX23a = 0.4591, UX32a = 0.4591, UX33a = 1.3569) annotation(Placement(visible = true, transformation(origin = {-68, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile2(Lengtha = 500, UB11a = 0, UB12a = 0, UB13a = 0, UB21a = 0, UB22a = 4.7097, UB23a = -0.8999, UB31a = 0, UB32a = -0.8999, UB33a = 4.6658, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0, UR22a = 1.3294, UR23a = 0.2066, UR32a = 0.2066, UR33a = 1.3238, UX11a = 0, UX22a = 1.3471, UX23a = 0.4591, UX32a = 0.4591, UX33a = 1.3569) annotation(Placement(visible = true, transformation(origin = {-30, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile3(Lengtha = 2000, UB11a = 6.2998, UB12a = -1.9958, UB13a = -1.2595, UB21a = -1.9958, UB22a = 5.9597, UB23a = -0.7417, UB31a = -1.2595, UB32a = -0.7417, UB33a = 5.6386, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.3465, UR12a = 0.1560, UR13a = 0.1580, UR21a = 0.1580, UR22a = 0.3375, UR23a = 0.1535, UR31a = 0.1580, UR32a = 0.1535, UR33a = 0.3414, UX11a = 1.0179, UX12a = 0.5017, UX13a = 0.4236, UX21a = 0.5017, UX22a = 1.0478, UX23a = 0.3849, UX31a = 0.4236, UX32a = 0.3849, UX33a = 1.0348) annotation(Placement(visible = true, transformation(origin = {-5, 57}, extent = {{-11, 11}, {11, -11}}, rotation = -90)));
      Basic.ThreePhaseTransformer.D_GrY d_GrY1(N1 = 115, N2 = 4.16 / sqrt(3), Rp = 0.01, Sb = 5000, Vb = 4.16, Xp = 0.08) annotation(Placement(visible = true, transformation(origin = {-22, 82}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile4(Lengtha = 2000, UB11a = 6.2998, UB12a = -1.9958, UB13a = -1.2595, UB21a = -1.9958, UB22a = 5.9597, UB23a = -0.7417, UB31a = -1.2595, UB32a = -0.7417, UB33a = 5.6386, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.3465, UR12a = 0.1560, UR13a = 0.1580, UR21a = 0.1560, UR22a = 0.3375, UR23a = 0.1535, UR31a = 0.1580, UR32a = 0.1535, UR33a = 0.3414, UX11a = 1.0179, UX12a = 0.5017, UX13a = 0.4236, UX21a = 0.5017, UX22a = 1.0478, UX23a = 0.3849, UX31a = 0.4236, UX32a = 0.3849, UX33a = 1.0348) annotation(Placement(visible = true, transformation(origin = {-4, 24}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
      ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile5(Lengtha = 300, UR11a = 1.3238, UR13a = 0.2066, UR22a = 0, UR31a = 0.2066, UR33a = 1.3294, UX11a = 1.3569, UX13a = 0.4591, UX22a = 0, UX31a = 0.4591, UX33a = 1.3471) annotation(Placement(visible = true, transformation(origin = {-26, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile6(Lengtha = 300, UB11a = 0, UB12a = 0, UB13a = 0, UB21a = 0, UB22a = 0, UB23a = 0, UB31a = 0, UB32a = 0, UB33a = 4.5193, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0, UR22a = 0, UR33a = 1.3292, UX11a = 0, UX22a = 0, UX33a = 1.3475) annotation(Placement(visible = true, transformation(origin = {-58, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad1(P = 170, Q = 125) annotation(Placement(visible = true, transformation(origin = {-54, 33}, extent = {{-5, -6}, {5, 6}}, rotation = -90)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-43, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      Basic.OnePhaZLoad onePhaZLoad1(P = 230 * 1000, Q = 132 * 1000) annotation(Placement(visible = true, transformation(origin = {-85, 32}, extent = {{-5, -6}, {5, 6}}, rotation = 0)));
      Basic.OnePhaILoad onePhaILoad1 annotation(Placement(visible = true, transformation(origin = {-80, 5}, extent = {{4, -5}, {-4, 5}}, rotation = 0)));
      Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {-90, -1}, extent = {{-4, -5}, {4, 5}}, rotation = 0)));
      Basic.ThreePhaPQLoad.DLoad dLoad1(PAB = 385, PBC = 385, PCA = 385, QAB = 220, QBC = 220, QCA = 220) annotation(Placement(visible = true, transformation(origin = {13, 3}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
    equation
      connect(threePhase_pi_LinePerMile4.pin_n2, dLoad1.pin3) annotation(Line(points = {{-2, 16}, {0, 16}, {0, -2}, {4, -2}, {4, -2}, {4, -2}, {4, 0}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile4.pin_n1, dLoad1.pin2) annotation(Line(points = {{-6, 16}, {-4, 16}, {-4, 6}, {4, 6}, {4, 4}, {4, 4}, {4, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile4.pin_n, dLoad1.pin1) annotation(Line(points = {{-10, 16}, {-8, 16}, {-8, 10}, {4, 10}, {4, 8}, {4, 8}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile4.pin_n2, threePhase_pi_LinePerMile5.pin2) annotation(Line(points = {{-2, 16}, {-2, 16}, {-2, 4}, {-18, 4}, {-18, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile4.pin_n1, threePhase_pi_LinePerMile5.pin1) annotation(Line(points = {{-6, 16}, {-6, 16}, {-6, 8}, {-18, 8}, {-18, 8}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile4.pin_n, threePhase_pi_LinePerMile5.pin) annotation(Line(points = {{-10, 16}, {-10, 16}, {-10, 12}, {-18, 12}, {-18, 12}}, color = {0, 0, 255}));
      connect(onePhaILoad1.p, threePhase_pi_LinePerMile6.pin_n2) annotation(Line(points = {{-76, 6}, {-66, 6}, {-66, 4}, {-66, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile6.pin2, threePhase_pi_LinePerMile5.pin_n2) annotation(Line(points = {{-50, 4}, {-34, 4}, {-34, 4}, {-34, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile6.pin1, threePhase_pi_LinePerMile5.pin_n1) annotation(Line(points = {{-50, 8}, {-34, 8}, {-34, 8}, {-34, 8}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile6.pin, threePhase_pi_LinePerMile5.pin_n) annotation(Line(points = {{-50, 12}, {-34, 12}, {-34, 12}, {-34, 12}}, color = {0, 0, 255}));
      connect(onePhaILoad1.n, ground2.p) annotation(Line(points = {{-84, 6}, {-90, 6}, {-90, 4}, {-90, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, threePhase_pi_LinePerMile4.pin2) annotation(Line(points = {{-4, 48}, {0, 48}, {0, 32}, {-2, 32}, {-2, 32}}, color = {0, 0, 255}));
      connect(onePhaZLoad1.n, threePhase_pi_LinePerMile1.pin_n2) annotation(Line(points = {{-80, 32}, {-76, 32}, {-76, 40}, {-76, 40}}, color = {0, 0, 255}));
      connect(onePhaZLoad1.p, threePhase_pi_LinePerMile1.pin_n1) annotation(Line(points = {{-90, 32}, {-94, 32}, {-94, 42}, {-76, 42}, {-76, 44}, {-76, 44}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.n, ground1.p) annotation(Line(points = {{-54, 28}, {-46, 28}, {-46, 30}, {-42, 30}, {-42, 30}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.p, threePhase_pi_LinePerMile2.pin_n1) annotation(Line(points = {{-54, 38}, {-52, 38}, {-52, 46}, {-38, 46}, {-38, 44}, {-38, 44}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, threePhase_pi_LinePerMile4.pin1) annotation(Line(points = {{-8, 48}, {-6, 48}, {-6, 32}, {-6, 32}, {-6, 32}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n, threePhase_pi_LinePerMile4.pin) annotation(Line(points = {{-10, 48}, {-10, 48}, {-10, 32}, {-10, 32}}, color = {0, 0, 255}));
      connect(d_GrY1.nc, threePhase_pi_LinePerMile3.pin2) annotation(Line(points = {{-16, 78}, {-4, 78}, {-4, 66}, {-4, 66}, {-4, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.nb, threePhase_pi_LinePerMile3.pin1) annotation(Line(points = {{-16, 82}, {-8, 82}, {-8, 66}, {-8, 66}, {-8, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.na, threePhase_pi_LinePerMile3.pin) annotation(Line(points = {{-16, 86}, {-12, 86}, {-12, 66}, {-12, 66}, {-12, 66}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, d_GrY1.pc) annotation(Line(points = {{-40, 76}, {-30, 76}, {-30, 78}, {-30, 78}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, d_GrY1.pb) annotation(Line(points = {{-40, 82}, {-30, 82}, {-30, 82}, {-30, 82}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, d_GrY1.pa) annotation(Line(points = {{-40, 86}, {-30, 86}, {-30, 86}, {-30, 86}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n, threePhase_pi_LinePerMile2.pin) annotation(Line(points = {{-11, 48}, {-22, 48}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, threePhase_pi_LinePerMile2.pin1) annotation(Line(points = {{-7, 48}, {-7, 44}, {-22, 44}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, threePhase_pi_LinePerMile2.pin2) annotation(Line(points = {{-3, 48}, {-3, 40}, {-22, 40}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n2, threePhase_pi_LinePerMile1.pin2) annotation(Line(points = {{-38, 40}, {-60, 40}, {-60, 40}, {-60, 40}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n1, threePhase_pi_LinePerMile1.pin1) annotation(Line(points = {{-38, 44}, {-60, 44}, {-60, 44}, {-60, 44}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n, threePhase_pi_LinePerMile1.pin) annotation(Line(points = {{-38, 48}, {-58, 48}, {-58, 48}, {-60, 48}}, color = {0, 0, 255}));
      annotation(Diagram(graphics = {Text(origin = {-85, 53}, extent = {{-3, 3}, {3, -3}}, textString = "646", fontSize = 12), Text(origin = {-48, 56}, extent = {{-4, 2}, {4, -2}}, textString = "645", fontSize = 12), Text(origin = {-17, 54}, extent = {{-3, 2}, {3, -2}}, textString = "632", fontSize = 12), Text(origin = {9, 72}, extent = {{-3, 4}, {3, -4}}, textString = "650", fontSize = 12), Text(origin = {7, 12}, extent = {{-5, 6}, {5, -6}}, textString = "671", fontSize = 12), Text(origin = {-46, 15}, extent = {{-4, 3}, {4, -3}}, textString = "684", fontSize = 12), Text(origin = {-73, 16}, extent = {{-3, 4}, {3, -4}}, textString = "611", fontSize = 12)}, coordinateSystem(initialScale = 0.1)));
    end testNode13_1;

    model test13_2
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 115 * 1000 / sqrt(3), Vmag2 = 115 * 1000 / sqrt(3), Vmag3 = 115 * 1000 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-47, 81}, extent = {{7, 7}, {-7, -7}}, rotation = 180)));
      ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile3(Lengtha = 2000, UB11a = 6.2998 * 0.000001, UB12a = -1.9958 * 0.000001, UB13a = -1.2595 * 0.000001, UB21a = -1.9958 * 0.000001, UB22a = 5.9597 * 0.000001, UB23a = -0.7417 * 0.000001, UB31a = -1.2595 * 0.000001, UB32a = -0.7417 * 0.000001, UB33a = 5.6386 * 0.000001, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.3465, UR12a = 0.1560, UR13a = 0.1580, UR21a = 0.1580, UR22a = 0.3375, UR23a = 0.1535, UR31a = 0.1580, UR32a = 0.1535, UR33a = 0.3414, UX11a = 1.0179, UX12a = 0.5017, UX13a = 0.4236, UX21a = 0.5017, UX22a = 1.0478, UX23a = 0.3849, UX31a = 0.4236, UX32a = 0.3849, UX33a = 1.0348) annotation(Placement(visible = true, transformation(origin = {-5, 57}, extent = {{-11, 11}, {11, -11}}, rotation = -90)));
      Basic.ThreePhaseTransformer.D_GrY d_GrY1(N1 = 115, N2 = 4.16 / sqrt(3), Rp = 0.01, Sb = 5000, Vb = 4.16, Xp = 0.08) annotation(Placement(visible = true, transformation(origin = {-22, 82}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      Basic.OnePhaPQLoad onePhaPQLoad1(P = 170 * 1000, Q = 125 * 1000, vRe(start = 0.1)) annotation(Placement(visible = true, transformation(origin = {-54, 33}, extent = {{-5, -6}, {5, 6}}, rotation = -90)));
  ADN_Modelica.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-43, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
      ADN_Modelica.Basic.OnePhaZLoad onePhaZLoad1(P = 230 * 1000, Q = 132 * 1000, Vn = 4.16 * 1000, vRe(start = 0.1)) annotation(Placement(visible = true, transformation(origin = {-88, 39}, extent = {{-4, -5}, {4, 5}}, rotation = -90)));
      ADN_Modelica.Basic.TwoPhase_pi_LinePerMile twoPhase_pi_LinePerMile1(Lengtha = 500, UB11a = 4.7097 * 0.000001, UB12a = -0.8999 * 0.000001, UB21a = -0.8999 * 0.000001, UB22a = 4.6658 * 0.000001, UG11a = 0, UG12a = 0, UG21a = 0, UG22a = 0, UR11a = 1.3294, UR12a = 0.2066, UR21a = 0.2066, UR22a = 1.3238, UX11a = 1.3471, UX12a = 0.4591, UX21a = 0.4591, UX22a = 1.3569)  annotation(Placement(visible = true, transformation(origin = {-32, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.TwoPhase_pi_LinePerMile twoPhase_pi_LinePerMile2(Lengtha = 300, UB11a = 4.7097 * 0.000001, UB12a = -0.8999 * 0.000001, UB21a = -0.8999 * 0.000001, UB22a = 4.6658 * 0.000001, UG11a = 0, UG12a = 0, UG21a = 0, UG22a = 0, UR11a = 1.3294, UR12a = 0.2066, UR21a = 0.2066, UR22a = 1.3238, UX11a = 1.3471, UX12a = 0.4591, UX21a = 0.4591, UX22a = 1.3569)  annotation(Placement(visible = true, transformation(origin = {-70, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
    equation
      connect(onePhaPQLoad1.n, ground1.p) annotation(Line(points = {{-54, 28}, {-46, 28}, {-46, 30}, {-43, 30}}, color = {0, 0, 255}));
      connect(onePhaZLoad1.p, twoPhase_pi_LinePerMile2.pin_n) annotation(Line(points = {{-88, 44}, {-88, 44}, {-88, 46}, {-76, 46}, {-76, 46}}, color = {0, 0, 255}));
      connect(onePhaZLoad1.n, twoPhase_pi_LinePerMile2.pin_n1) annotation(Line(points = {{-88, 36}, {-88, 36}, {-88, 34}, {-76, 34}, {-76, 42}, {-76, 42}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.p, twoPhase_pi_LinePerMile1.pin_n) annotation(Line(points = {{-54, 38}, {-54, 38}, {-54, 50}, {-38, 50}, {-38, 46}, {-38, 46}}, color = {0, 0, 255}));
      connect(twoPhase_pi_LinePerMile1.pin_n1, twoPhase_pi_LinePerMile2.pin1) annotation(Line(points = {{-38, 42}, {-62, 42}, {-62, 42}, {-62, 42}}, color = {0, 0, 255}));
      connect(twoPhase_pi_LinePerMile1.pin_n, twoPhase_pi_LinePerMile2.pin) annotation(Line(points = {{-38, 46}, {-62, 46}, {-62, 46}, {-62, 46}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, twoPhase_pi_LinePerMile1.pin1) annotation(Line(points = {{-4, 48}, {-4, 48}, {-4, 42}, {-24, 42}, {-24, 42}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, twoPhase_pi_LinePerMile1.pin) annotation(Line(points = {{-8, 48}, {-8, 48}, {-8, 46}, {-24, 46}, {-24, 46}}, color = {0, 0, 255}));
      connect(d_GrY1.nc, threePhase_pi_LinePerMile3.pin2) annotation(Line(points = {{-16, 78}, {-4, 78}, {-4, 66}, {-4, 66}, {-4, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.nb, threePhase_pi_LinePerMile3.pin1) annotation(Line(points = {{-16, 82}, {-8, 82}, {-8, 66}, {-8, 66}, {-8, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.na, threePhase_pi_LinePerMile3.pin) annotation(Line(points = {{-16, 86}, {-12, 86}, {-12, 66}, {-12, 66}, {-12, 66}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, d_GrY1.pc) annotation(Line(points = {{-40, 76}, {-30, 76}, {-30, 78}, {-30, 78}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, d_GrY1.pb) annotation(Line(points = {{-40, 82}, {-30, 82}, {-30, 82}, {-30, 82}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, d_GrY1.pa) annotation(Line(points = {{-40, 86}, {-30, 86}, {-30, 86}, {-30, 86}}, color = {0, 0, 255}));
      annotation(Diagram(graphics = {Text(origin = {-85, 53}, extent = {{-3, 3}, {3, -3}}, textString = "646", fontSize = 12), Text(origin = {-48, 56}, extent = {{-4, 2}, {4, -2}}, textString = "645", fontSize = 12), Text(origin = {-17, 54}, extent = {{-3, 2}, {3, -2}}, textString = "632", fontSize = 12), Text(origin = {9, 72}, extent = {{-3, 4}, {3, -4}}, textString = "650", fontSize = 12)}, coordinateSystem(initialScale = 0.1)));
    end test13_2;

    model sqss
    
    
    
      ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 12470 / sqrt(3), Vmag2 = 12470 / sqrt(3), Vmag3 = 12470 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-47, 81}, extent = {{7, 7}, {-7, -7}}, rotation = 180)));
      ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile3(Lengtha = 2000, UB11a = 6.2998 * 0.000001, UB12a = -1.9958 * 0.000001, UB13a = -1.2595 * 0.000001, UB21a = -1.9958 * 0.000001, UB22a = 5.9597 * 0.000001, UB23a = -0.7417 * 0.000001, UB31a = -1.2595 * 0.000001, UB32a = -0.7417 * 0.000001, UB33a = 5.6386 * 0.000001, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.3465, UR12a = 0.1560, UR13a = 0.1580, UR21a = 0.1580, UR22a = 0.3375, UR23a = 0.1535, UR31a = 0.1580, UR32a = 0.1535, UR33a = 0.3414, UX11a = 1.0179, UX12a = 0.5017, UX13a = 0.4236, UX21a = 0.5017, UX22a = 1.0478, UX23a = 0.3849, UX31a = 0.4236, UX32a = 0.3849, UX33a = 1.0348) annotation(Placement(visible = true, transformation(origin = {-5, 57}, extent = {{-11, 11}, {11, -11}}, rotation = -90)));
      Basic.ThreePhaseTransformer.D_GrY d_GrY1(N1 = 115, N2 = 4.16 / sqrt(3), Rp = 0.01, Sb = 5000, Vb = 4.16, Xp = 0.08) annotation(Placement(visible = true, transformation(origin = {-22, 82}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
      ADN_Modelica.Basic.OnePhaZLoad onePhaZLoad1(P = 230 * 1000, Q = 132 * 1000, Vn = 10e3, vRe(start = 0.1)) annotation(Placement(visible = true, transformation(origin = {-88, 39}, extent = {{-4, -5}, {4, 5}}, rotation = -90)));
      ADN_Modelica.Basic.TwoPhase_pi_LinePerMile twoPhase_pi_LinePerMile1(Lengtha = 500, UB11a = 4.7097 * 0.000001, UB12a = -0.8999 * 0.000001, UB21a = -0.8999 * 0.000001, UB22a = 4.6658 * 0.000001, UG11a = 0, UG12a = 0, UG21a = 0, UG22a = 0, UR11a = 1.3294, UR12a = 0.2066, UR21a = 0.2066, UR22a = 1.3238, UX11a = 1.3471, UX12a = 0.4591, UX21a = 0.4591, UX22a = 1.3569)  annotation(Placement(visible = true, transformation(origin = {-32, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Basic.TwoPhase_pi_LinePerMile twoPhase_pi_LinePerMile2(Lengtha = 300, UB11a = 4.7097 * 0.000001, UB12a = -0.8999 * 0.000001, UB21a = -0.8999 * 0.000001, UB22a = 4.6658 * 0.000001, UG11a = 0, UG12a = 0, UG21a = 0, UG22a = 0, UR11a = 1.3294, UR12a = 0.2066, UR21a = 0.2066, UR22a = 1.3238, UX11a = 1.3471, UX12a = 0.4591, UX21a = 0.4591, UX22a = 1.3569)  annotation(Placement(visible = true, transformation(origin = {-70, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Basic.OnePhaPQLoad onePhaPQLoad1(P = 123000, Q = 145000)  annotation(Placement(visible = true, transformation(origin = {-34, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-10, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(ground1.p, onePhaPQLoad1.n) annotation(Line(points = {{-10, 18}, {-24, 18}, {-24, 18}, {-24, 18}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.p, twoPhase_pi_LinePerMile1.pin_n) annotation(Line(points = {{-44, 18}, {-52, 18}, {-52, 54}, {-38, 54}, {-38, 46}, {-38, 46}}, color = {0, 0, 255}));
      connect(onePhaZLoad1.p, twoPhase_pi_LinePerMile2.pin_n) annotation(Line(points = {{-88, 44}, {-88, 44}, {-88, 46}, {-76, 46}, {-76, 46}}, color = {0, 0, 255}));
      connect(onePhaZLoad1.n, twoPhase_pi_LinePerMile2.pin_n1) annotation(Line(points = {{-88, 36}, {-88, 36}, {-88, 34}, {-76, 34}, {-76, 42}, {-76, 42}}, color = {0, 0, 255}));
      connect(twoPhase_pi_LinePerMile1.pin_n1, twoPhase_pi_LinePerMile2.pin1) annotation(Line(points = {{-38, 42}, {-62, 42}, {-62, 42}, {-62, 42}}, color = {0, 0, 255}));
      connect(twoPhase_pi_LinePerMile1.pin_n, twoPhase_pi_LinePerMile2.pin) annotation(Line(points = {{-38, 46}, {-62, 46}, {-62, 46}, {-62, 46}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, twoPhase_pi_LinePerMile1.pin1) annotation(Line(points = {{-4, 48}, {-4, 48}, {-4, 42}, {-24, 42}, {-24, 42}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, twoPhase_pi_LinePerMile1.pin) annotation(Line(points = {{-8, 48}, {-8, 48}, {-8, 46}, {-24, 46}, {-24, 46}}, color = {0, 0, 255}));
      connect(d_GrY1.nc, threePhase_pi_LinePerMile3.pin2) annotation(Line(points = {{-16, 78}, {-4, 78}, {-4, 66}, {-4, 66}, {-4, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.nb, threePhase_pi_LinePerMile3.pin1) annotation(Line(points = {{-16, 82}, {-8, 82}, {-8, 66}, {-8, 66}, {-8, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.na, threePhase_pi_LinePerMile3.pin) annotation(Line(points = {{-16, 86}, {-12, 86}, {-12, 66}, {-12, 66}, {-12, 66}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, d_GrY1.pc) annotation(Line(points = {{-40, 76}, {-30, 76}, {-30, 78}, {-30, 78}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, d_GrY1.pb) annotation(Line(points = {{-40, 82}, {-30, 82}, {-30, 82}, {-30, 82}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, d_GrY1.pa) annotation(Line(points = {{-40, 86}, {-30, 86}, {-30, 86}, {-30, 86}}, color = {0, 0, 255}));
      annotation(Diagram(graphics = {Text(origin = {-85, 53}, extent = {{-3, 3}, {3, -3}}, textString = "646", fontSize = 12), Text(origin = {-48, 56}, extent = {{-4, 2}, {4, -2}}, textString = "645", fontSize = 12), Text(origin = {-17, 54}, extent = {{-3, 2}, {3, -2}}, textString = "632", fontSize = 12), Text(origin = {9, 72}, extent = {{-3, 4}, {3, -4}}, textString = "650", fontSize = 12)}, coordinateSystem(initialScale = 0.1)));
    end sqss;

model test13_3
  ADN_Modelica.Basic.ThreePhaseVoltageSource.Y0ThreePhaVSource y0ThreePhaVSource1(Vangle2 = -2 * Modelica.Constants.pi / 3, Vangle3 = 2 * Modelica.Constants.pi / 3, Vmag1 = 115 * 1000 / sqrt(3), Vmag2 = 115 * 1000 / sqrt(3), Vmag3 = 115 * 1000 / sqrt(3)) annotation(Placement(visible = true, transformation(origin = {-47, 81}, extent = {{7, 7}, {-7, -7}}, rotation = 180)));
  ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile3(Lengtha = 2000, UB11a = 6.2998 * 0.000001, UB12a = -1.9958 * 0.000001, UB13a = -1.2595 * 0.000001, UB21a = -1.9958 * 0.000001, UB22a = 5.9597 * 0.000001, UB23a = -0.7417 * 0.000001, UB31a = -1.2595 * 0.000001, UB32a = -0.7417 * 0.000001, UB33a = 5.6386 * 0.000001, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.3465, UR12a = 0.1560, UR13a = 0.1580, UR21a = 0.1580, UR22a = 0.3375, UR23a = 0.1535, UR31a = 0.1580, UR32a = 0.1535, UR33a = 0.3414, UX11a = 1.0179, UX12a = 0.5017, UX13a = 0.4236, UX21a = 0.5017, UX22a = 1.0478, UX23a = 0.3849, UX31a = 0.4236, UX32a = 0.3849, UX33a = 1.0348) annotation(Placement(visible = true, transformation(origin = {-5, 57}, extent = {{-11, 11}, {11, -11}}, rotation = -90)));
  Basic.ThreePhaseTransformer.D_GrY d_GrY1(N1 = 115, N2 = 4.16 / sqrt(3), Rp = 0.01, Sb = 5000, Vb = 4.16, Xp = 0.08) annotation(Placement(visible = true, transformation(origin = {-22, 82}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Basic.OnePhaPQLoad onePhaPQLoad1(P = 170 * 1000, Q = 125 * 1000, vRe(start = 0.1)) annotation(Placement(visible = true, transformation(origin = {-54, 33}, extent = {{-5, -6}, {5, 6}}, rotation = -90)));
ADN_Modelica.Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-43, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  ADN_Modelica.Basic.OnePhaZLoad onePhaZLoad1(P = 230 * 1000, Q = 132 * 1000, Vn = 4.16 * 1000, vRe(start = 0.1)) annotation(Placement(visible = true, transformation(origin = {-88, 39}, extent = {{-4, -5}, {4, 5}}, rotation = -90)));
  ADN_Modelica.Basic.TwoPhase_pi_LinePerMile twoPhase_pi_LinePerMile1(Lengtha = 500, UB11a = 4.7097 * 0.000001, UB12a = -0.8999 * 0.000001, UB21a = -0.8999 * 0.000001, UB22a = 4.6658 * 0.000001, UG11a = 0, UG12a = 0, UG21a = 0, UG22a = 0, UR11a = 1.3294, UR12a = 0.2066, UR21a = 0.2066, UR22a = 1.3238, UX11a = 1.3471, UX12a = 0.4591, UX21a = 0.4591, UX22a = 1.3569)  annotation(Placement(visible = true, transformation(origin = {-32, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Basic.TwoPhase_pi_LinePerMile twoPhase_pi_LinePerMile2(Lengtha = 300, UB11a = 4.7097 * 0.000001, UB12a = -0.8999 * 0.000001, UB21a = -0.8999 * 0.000001, UB22a = 4.6658 * 0.000001, UG11a = 0, UG12a = 0, UG21a = 0, UG22a = 0, UR11a = 1.3294, UR12a = 0.2066, UR21a = 0.2066, UR22a = 1.3238, UX11a = 1.3471, UX12a = 0.4591, UX21a = 0.4591, UX22a = 1.3569)  annotation(Placement(visible = true, transformation(origin = {-70, 42}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile1(Lengtha = 500, UB11a = 5.699 * 0.000001, UB12a = -1.0817 * 0.000001, UB13a = -1.6905 * 0.000001, UB21a = -1.0817 * 0.000001, UB22a = 5.1795 * 0.000001, UB23a = -0.6588 * 0.000001, UB31a = -1.6905 * 0.000001, UB32a = -0.6588 * 0.000001, UB33a = 5.4246 * 0.000001, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.7526, UR12a = 0.1580, UR13a = 0.1560, UR21a = 0.1580, UR22a = 0.7475, UR23a = 0.1535, UR31a = 0.1560, UR32a = 0.1535, UR33a = 0.7436, UX11a = 1.1814, UX12a = 0.4236, UX13a = 0.5017, UX21a = 0.4236, UX22a = 1.1983, UX23a = 0.3849, UX31a = 0.5017, UX32a = 0.3849, UX33a = 1.2112)  annotation(Placement(visible = true, transformation(origin = {24, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  ADN_Modelica.Basic.ThreePhaseTransformer.GrYGrY grYGrY1(N1 = 4.16, N2 = 0.48, Rp = 0.011, Sb = 500, Vb = 0.48, Xp = 0.02) annotation(Placement(visible = true, transformation(origin = {51, 47}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  ADN_Modelica.Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile2(Lengtha = 2000, UB11a = 6.2998 * 0.000001, UB12a = -1.9958 * 0.000001, UB13a = -1.2595 * 0.000001, UB21a = -1.9958 * 0.000001, UB22a = 5.9597 * 0.000001, UB23a = -0.7417 * 0.000001, UB31a = -1.2595 * 0.000001, UB32a = -0.7417 * 0.000001, UB33a = 5.6386 * 0.000001, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.3465, UR12a = 0.1560, UR13a = 0.1580, UR21a = 0.1560, UR22a = 0.3375, UR23a = 0.1535, UR31a = 0.1580, UR32a = 0.1535, UR33a = 0.3414, UX11a = 1.0179, UX12a = 0.5017, UX13a = 0.4236, UX21a = 0.5017, UX22a = 1.0478, UX23a = 0.3849, UX31a = 0.4236, UX32a = 0.3849, UX33a = 1.0348) annotation(Placement(visible = true, transformation(origin = {-4, 18}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Basic.TwoPhase_pi_LinePerMile twoPhase_pi_LinePerMile3(Lengtha = 300, UB11a = 4.6658 * 0.000001, UB12a = -0.8999 * 0.000001, UB21a = -0.8999 * 0.000001, UB22a = 4.7097 * 0.000001, UG11a = 0, UG12a = 0, UG21a = 0, UG22a = 0, UR11a = 1.3238, UR12a = 0.2066, UR21a = 0.2066, UR22a = 1.3294, UX11a = 1.3569, UX12a = 0.4591, UX21a = 0.4591, UX22a = 1.3471)  annotation(Placement(visible = true, transformation(origin = {-32, 4}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  ADN_Modelica.Basic.OnePhase_pi_LinePerMile onePhase_pi_LinePerMile1(Lengtha = 300, UB11a = 4.5193 * 0.000001, UG11a = 0, UR11a = 1.3292, UX11a = 1.3475)  annotation(Placement(visible = true, transformation(origin = {-66, 2}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Basic.ThreePhaPQLoad.DLoad dLoad1(PAB = 385 * 1000, PBC = 385 * 1000, PCA = 385 * 1000, QAB = 220 * 1000, QBC = 220 * 1000, QCA = 220 * 1000)  annotation(Placement(visible = true, transformation(origin = {20, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Basic.OnePhaILoad onePhaILoad1(P = 170 * 1000, Q = 80 * 1000, Vn = 4.16 * 1000)  annotation(Placement(visible = true, transformation(origin = {-83, -2}, extent = {{-6, -7}, {6, 7}}, rotation = -90)));
  Basic.Ground ground2 annotation(Placement(visible = true, transformation(origin = {-71, -15}, extent = {{-7, -7}, {7, 7}}, rotation = 0)));
  Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile4(Lengtha = 1000, UB11a = 6.2998 * 0.000001, UB12a = -1.9958 * 0.000001, UB13a = -1.2595 * 0.000001, UB21a = -1.9958 * 0.000001, UB22a = 5.9597 * 0.000001, UB23a = -0.7417 * 0.000001, UB31a = -1.2595 * 0.000001, UB32a = -0.7417 * 0.000001, UB33a = 5.6386 * 0.000001, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.3465, UR12a = 0.1560, UR13a = 0.1580, UR21a = 0.1560, UR22a = 0.3375, UR23a = 0.1535, UR31a = 0.1580, UR32a = 0.1535, UR33a = 0.3414, UX11a = 1.0179, UX12a = 0.5017, UX13a = 0.4236, UX21a = 0.5017, UX22a = 1.0478, UX23a = 0.3849, UX31a = 0.4236, UX32a = 0.3849, UX33a = 1.0348)  annotation(Placement(visible = true, transformation(origin = {-2, -34}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  ADN_Modelica.Basic.OnePhase_pi_LinePerMile onePhase_pi_LinePerMile2(Lengtha = 800, UB11a = 88.9912 * 0.000001, UG11a = 0, UR11a = 1.3425, UX11a = 0.5124) annotation(Placement(visible = true, transformation(origin = {-50, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  ADN_Modelica.Basic.OnePhaZLoad onePhaZLoad2(P = 128 * 1000, Q = 86 * 1000, Vn = 4.16 * 1000)  annotation(Placement(visible = true, transformation(origin = {-69, -32}, extent = {{-5, -6}, {5, 6}}, rotation = -90)));
  Basic.Ground ground3 annotation(Placement(visible = true, transformation(origin = {-56, -44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  ADN_Modelica.Basic.ThreePhaseBreaker threePhaseBreaker1(bopen = false) annotation(Placement(visible = true, transformation(origin = {28, 8}, extent = {{4, -4}, {-4, 4}}, rotation = 90)));
  Basic.ThreePhase_pi_LinePerMile threePhase_pi_LinePerMile5(Lengtha = 500, UB11a = 96.8897 * 0.000001, UB12a = 0, UB13a = 0, UB21a = 0, UB22a = 96.8897 * 0.000001, UB23a = 0, UB31a = 0, UB32a = 0, UB33a = 96.8897 * 0.000001, UG11a = 0, UG12a = 0, UG13a = 0, UG21a = 0, UG22a = 0, UG23a = 0, UG31a = 0, UG32a = 0, UG33a = 0, UR11a = 0.7982, UR12a = 0.3192, UR13a = 0.2849, UR21a = 0.3192, UR22a = 0.7891, UR23a = 0.3192, UR31a = 0.2849, UR32a = 0.3192, UR33a = 0.7982, UX11a = 0.4463, UX12a = 0.0328, UX13a = -0.0143, UX21a = 0.0328, UX22a = 0.4041, UX23a = 0.0328, UX31a = -0.0143, UX32a = 0.0328, UX33a = 0.4463)  annotation(Placement(visible = true, transformation(origin = {58, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Basic.OnePhaILoad onePhaILoad2(P = 170 * 1000, Q = 151 * 1000, Vn = 4.16 * 1000)  annotation(Placement(visible = true, transformation(origin = {38, -5}, extent = {{-4, -5}, {4, 5}}, rotation = -90)));
  Basic.ThreePhaPQLoad.Y0Load y0Load1(P1 = 485 * 1000, P2 = 68 * 1000, P3 = 290 * 1000, Q1 = 190 * 1000, Q2 = 60 * 1000, Q3 = 212 * 1000)  annotation(Placement(visible = true, transformation(origin = {82, 8}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));

equation
      connect(threePhase_pi_LinePerMile5.pin_n2, y0Load1.pin3) annotation(Line(points = {{66, 4}, {74, 4}, {74, 4}, {74, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile5.pin_n1, y0Load1.pin2) annotation(Line(points = {{66, 8}, {74, 8}, {74, 8}, {74, 8}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile5.pin_n, y0Load1.pin1) annotation(Line(points = {{66, 12}, {74, 12}, {74, 12}, {74, 12}}, color = {0, 0, 255}));
      connect(threePhaseBreaker1.n1, onePhaILoad2.n) annotation(Line(points = {{30, 12}, {30, 12}, {30, 14}, {32, 14}, {32, -10}, {38, -10}, {38, -8}}, color = {0, 0, 255}));
      connect(threePhaseBreaker1.n3, onePhaILoad2.p) annotation(Line(points = {{30, 4}, {30, 4}, {30, 0}, {38, 0}, {38, 0}}, color = {0, 0, 255}));
      connect(threePhaseBreaker1.n3, threePhase_pi_LinePerMile5.pin2) annotation(Line(points = {{30, 4}, {50, 4}, {50, 4}, {50, 4}}, color = {0, 0, 255}));
      connect(threePhaseBreaker1.n2, threePhase_pi_LinePerMile5.pin1) annotation(Line(points = {{30, 8}, {50, 8}, {50, 8}, {50, 8}}, color = {0, 0, 255}));
      connect(threePhaseBreaker1.n1, threePhase_pi_LinePerMile5.pin) annotation(Line(points = {{30, 12}, {50, 12}, {50, 12}, {50, 12}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n, threePhaseBreaker1.p1) annotation(Line(points = {{-10, 10}, {-10, 14}, {26, 14}, {26, 12}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n1, threePhaseBreaker1.p2) annotation(Line(points = {{-6, 10}, {26, 10}, {26, 8}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n2, threePhaseBreaker1.p3) annotation(Line(points = {{-2, 10}, {-2, 12}, {16, 12}, {16, 4}, {26, 4}}, color = {0, 0, 255}));
      connect(onePhaZLoad2.n, ground3.p) annotation(Line(points = {{-69, -37}, {-56, -37}, {-56, -38}}, color = {0, 0, 255}));
      connect(onePhase_pi_LinePerMile2.pin_n, onePhaZLoad2.p) annotation(Line(points = {{-56, -26}, {-61, -26}, {-61, -27}, {-69, -27}}, color = {0, 0, 255}));
      connect(twoPhase_pi_LinePerMile3.pin_n, onePhase_pi_LinePerMile2.pin) annotation(Line(points = {{-38, 8}, {-42, 8}, {-42, -26}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n2, threePhase_pi_LinePerMile4.pin2) annotation(Line(points = {{-2, 10}, {0, 10}, {0, -26}, {0, -26}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n1, threePhase_pi_LinePerMile4.pin1) annotation(Line(points = {{-6, 10}, {-6, 10}, {-6, 12}, {-12, 12}, {-12, -22}, {-4, -22}, {-4, -26}, {-4, -26}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n, threePhase_pi_LinePerMile4.pin) annotation(Line(points = {{-10, 10}, {-8, 10}, {-8, -26}, {-8, -26}}, color = {0, 0, 255}));
      connect(onePhaILoad1.n, ground2.p) annotation(Line(points = {{-82, -8}, {-72, -8}, {-72, -8}, {-70, -8}}, color = {0, 0, 255}));
      connect(onePhase_pi_LinePerMile1.pin_n, onePhaILoad1.p) annotation(Line(points = {{-72, 4}, {-82, 4}, {-82, 4}, {-82, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n2, dLoad1.pin3) annotation(Line(points = {{-2, 10}, {-4, 10}, {-4, -10}, {10, -10}, {10, -10}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n1, dLoad1.pin2) annotation(Line(points = {{-6, 10}, {-6, 10}, {-6, -6}, {10, -6}, {10, -4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n, dLoad1.pin1) annotation(Line(points = {{-10, 10}, {-10, 10}, {-10, 0}, {10, 0}, {10, 0}}, color = {0, 0, 255}));
      connect(twoPhase_pi_LinePerMile3.pin_n1, onePhase_pi_LinePerMile1.pin) annotation(Line(points = {{-38, 4}, {-58, 4}, {-58, 4}, {-58, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n2, twoPhase_pi_LinePerMile3.pin1) annotation(Line(points = {{-2, 10}, {-2, 10}, {-2, 4}, {-24, 4}, {-24, 4}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile2.pin_n, twoPhase_pi_LinePerMile3.pin) annotation(Line(points = {{-9, 9.5}, {-24, 9.5}, {-24, 8}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, threePhase_pi_LinePerMile2.pin2) annotation(Line(points = {{-4, 48}, {-4, 50}, {0, 50}, {0, 27}, {-2.5, 27}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, threePhase_pi_LinePerMile2.pin1) annotation(Line(points = {{-8, 48}, {-8, 28}, {-6, 28}, {-6, 27}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n, threePhase_pi_LinePerMile2.pin) annotation(Line(points = {{-10, 48}, {-10, 27}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n2, grYGrY1.pin2) annotation(Line(points = {{32, 42}, {44, 42}, {44, 42}, {44, 42}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n1, grYGrY1.pin1) annotation(Line(points = {{32, 46}, {44, 46}, {44, 48}, {44, 48}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile1.pin_n, grYGrY1.pin) annotation(Line(points = {{32, 50}, {44, 50}, {44, 52}, {44, 52}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, threePhase_pi_LinePerMile1.pin2) annotation(Line(points = {{-4, 48}, {-2, 48}, {-2, 36}, {6, 36}, {6, 42}, {16, 42}, {16, 42}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, threePhase_pi_LinePerMile1.pin1) annotation(Line(points = {{-8, 48}, {-6, 48}, {-6, 38}, {4, 38}, {4, 46}, {16, 46}, {16, 46}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n, threePhase_pi_LinePerMile1.pin) annotation(Line(points = {{-10, 48}, {-12, 48}, {-12, 40}, {2, 40}, {2, 50}, {16, 50}, {16, 50}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.n, ground1.p) annotation(Line(points = {{-54, 28}, {-46, 28}, {-46, 30}, {-43, 30}}, color = {0, 0, 255}));
      connect(onePhaZLoad1.p, twoPhase_pi_LinePerMile2.pin_n) annotation(Line(points = {{-88, 44}, {-88, 44}, {-88, 46}, {-76, 46}, {-76, 46}}, color = {0, 0, 255}));
      connect(onePhaZLoad1.n, twoPhase_pi_LinePerMile2.pin_n1) annotation(Line(points = {{-88, 36}, {-88, 36}, {-88, 34}, {-76, 34}, {-76, 42}, {-76, 42}}, color = {0, 0, 255}));
      connect(onePhaPQLoad1.p, twoPhase_pi_LinePerMile1.pin_n) annotation(Line(points = {{-54, 38}, {-54, 38}, {-54, 50}, {-38, 50}, {-38, 46}, {-38, 46}}, color = {0, 0, 255}));
      connect(twoPhase_pi_LinePerMile1.pin_n1, twoPhase_pi_LinePerMile2.pin1) annotation(Line(points = {{-38, 42}, {-62, 42}, {-62, 42}, {-62, 42}}, color = {0, 0, 255}));
      connect(twoPhase_pi_LinePerMile1.pin_n, twoPhase_pi_LinePerMile2.pin) annotation(Line(points = {{-38, 46}, {-62, 46}, {-62, 46}, {-62, 46}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n2, twoPhase_pi_LinePerMile1.pin1) annotation(Line(points = {{-4, 48}, {-4, 48}, {-4, 42}, {-24, 42}, {-24, 42}}, color = {0, 0, 255}));
      connect(threePhase_pi_LinePerMile3.pin_n1, twoPhase_pi_LinePerMile1.pin) annotation(Line(points = {{-8, 48}, {-8, 48}, {-8, 46}, {-24, 46}, {-24, 46}}, color = {0, 0, 255}));
      connect(d_GrY1.nc, threePhase_pi_LinePerMile3.pin2) annotation(Line(points = {{-16, 78}, {-4, 78}, {-4, 66}, {-4, 66}, {-4, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.nb, threePhase_pi_LinePerMile3.pin1) annotation(Line(points = {{-16, 82}, {-8, 82}, {-8, 66}, {-8, 66}, {-8, 66}}, color = {0, 0, 255}));
      connect(d_GrY1.na, threePhase_pi_LinePerMile3.pin) annotation(Line(points = {{-16, 86}, {-12, 86}, {-12, 66}, {-12, 66}, {-12, 66}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin3, d_GrY1.pc) annotation(Line(points = {{-40, 76}, {-30, 76}, {-30, 78}, {-30, 78}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin2, d_GrY1.pb) annotation(Line(points = {{-40, 82}, {-30, 82}, {-30, 82}, {-30, 82}}, color = {0, 0, 255}));
      connect(y0ThreePhaVSource1.pin1, d_GrY1.pa) annotation(Line(points = {{-40, 86}, {-30, 86}, {-30, 86}, {-30, 86}}, color = {0, 0, 255}));
      annotation(Diagram(graphics = {Text(origin = {-85, 53}, extent = {{-3, 3}, {3, -3}}, textString = "646", fontSize = 12), Text(origin = {-48, 56}, extent = {{-4, 2}, {4, -2}}, textString = "645", fontSize = 12), Text(origin = {-17, 54}, extent = {{-3, 2}, {3, -2}}, textString = "632", fontSize = 12), Text(origin = {9, 72}, extent = {{-3, 4}, {3, -4}}, textString = "650", fontSize = 12), Text(origin = {38, 55}, extent = {{-4, 3}, {4, -3}}, textString = "633", fontSize = 12), Text(origin = {66, 57}, extent = {{-4, 3}, {4, -3}}, textString = "634", fontSize = 12), Text(origin = {-20, 19}, extent = {{-4, 3}, {4, -3}}, textString = "671", fontSize = 12), Text(origin = {-45, 17}, extent = {{-3, 3}, {3, -3}}, textString = "684", fontSize = 12), Text(origin = {-77, 17}, extent = {{-3, 3}, {3, -3}}, textString = "611", fontSize = 12), Text(origin = {-18, -20}, extent = {{-4, 4}, {4, -4}}, textString = "680", fontSize = 12), Text(origin = {-58, -20}, extent = {{-4, 4}, {4, -4}}, textString = "652", fontSize = 12), Text(origin = {30, 22}, extent = {{-6, 6}, {6, -6}}, textString = "692", fontSize = 12), Text(origin = {75, 19}, extent = {{-5, 7}, {5, -7}}, textString = "675", fontSize = 12)}, coordinateSystem(initialScale = 0.1)));
end test13_3;

    model testOnePhaseBreaker
    
      Basic.OnePhaseBreaker onePhaseBreaker1(bopen = false)  annotation(Placement(visible = true, transformation(origin = {36, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-52, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
      connect(ground1.p, onePhaseBreaker1.p) annotation(Line(points = {{-52, -38}, {-52, -38}, {-52, -18}, {26, -18}, {26, -18}}, color = {0, 0, 255}));
    end testOnePhaseBreaker;

    model testOnePhaseReg
    
      Basic.Ground ground1 annotation(Placement(visible = true, transformation(origin = {-58, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Basic.VoltageSource voltageSource1(Vmag = 2400)  annotation(Placement(visible = true, transformation(origin = {-32, 16}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Basic.OnePhaseImpedance onePhaseImpedance1(R = 1, X = 1)  annotation(Placement(visible = true, transformation(origin = {20, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Basic.OnePhaseRegulator onePhaseRegulator1 annotation(Placement(visible = true, transformation(origin = {-12, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
      connect(onePhaseRegulator1.n2, ground1.p) annotation(Line(points = {{-2, -20}, {12, -20}, {12, -42}, {-86, -42}, {-86, -20}, {-58, -20}, {-58, -22}, {-58, -22}}, color = {0, 0, 255}));
      connect(onePhaseRegulator1.n1, ground1.p) annotation(Line(points = {{-22, -20}, {-40, -20}, {-40, -10}, {-58, -10}, {-58, -22}, {-58, -22}}, color = {0, 0, 255}));
      connect(onePhaseImpedance1.n, ground1.p) annotation(Line(points = {{30, 12}, {34, 12}, {34, -34}, {-44, -34}, {-44, -22}, {-58, -22}, {-58, -22}}, color = {0, 0, 255}));
      connect(onePhaseRegulator1.p2, onePhaseImpedance1.p) annotation(Line(points = {{-2, -10}, {4, -10}, {4, 12}, {10, 12}, {10, 12}}, color = {0, 0, 255}));
      connect(onePhaseRegulator1.p1, voltageSource1.p) annotation(Line(points = {{-22, -10}, {-14, -10}, {-14, 16}, {-22, 16}, {-22, 16}}, color = {0, 0, 255}));
      connect(ground1.p, voltageSource1.n) annotation(Line(points = {{-58, -22}, {-60, -22}, {-60, 16}, {-42, 16}, {-42, 16}}, color = {0, 0, 255}));
    end testOnePhaseReg;
  end Example;

  model ThreePhaImpedancePerKm3
    extends Interfaces.ThreePhaseBranch;
    parameter Real Length = 1 "km";
    parameter SI.Resistance UR11 = 1 "Ohm/km";
    parameter SI.Resistance UR12 = 0 "R12";
    parameter SI.Resistance UR13 = 0 "R13";
    parameter SI.Resistance UR21 = 0 "R21";
    parameter SI.Resistance UR22 = 1 "R22";
    parameter SI.Resistance UR23 = 0 "R23";
    parameter SI.Resistance UR31 = 0 "R31";
    parameter SI.Resistance UR32 = 0 "R32";
    parameter SI.Resistance UR33 = 1 "R33";
    parameter SI.Inductance UL11 = 1 "H/km";
    parameter SI.Inductance UL12 = 0 "X12";
    parameter SI.Inductance UL13 = 0 "X13";
    parameter SI.Inductance UL21 = 0 "X21";
    parameter SI.Inductance UL22 = 1 "X22";
    parameter SI.Inductance UL23 = 0 "X23";
    parameter SI.Inductance UL31 = 0 "X31";
    parameter SI.Inductance UL32 = 0 "X32";
    parameter SI.Inductance UL33 = 1 "X33";
    SI.Resistance R11 = 1 "R11";
    SI.Reactance X11 = 1 "X11";
    SI.Resistance R12 = 1 "R11";
    SI.Reactance X12 = 1 "X11";
    SI.Resistance R13 = 1 "R11";
    SI.Reactance X13 = 1 "X11";
    SI.Resistance R21 = 1 "R11";
    SI.Reactance X21 = 1 "X11";
    SI.Resistance R22 = 1 "R11";
    SI.Reactance X22 = 1 "X11";
    SI.Resistance R23 = 1 "R11";
    SI.Reactance X23 = 1 "X11";
    SI.Resistance R31 = 1 "R11";
    SI.Reactance X31 = 1 "X11";
    SI.Resistance R32 = 1 "R11";
    SI.Reactance X32 = 1 "X11";
    SI.Resistance R33 = 1 "R11";
    SI.Reactance X33 = 1 "X11";
  equation
    R11 = UR11 * Length;
    R12 = UR12 * Length;
    R13 = UR13 * Length;
    R21 = UR21 * Length;
    R22 = UR22 * Length;
    R23 = UR23 * Length;
    R31 = UR31 * Length;
    R32 = UR32 * Length;
    R33 = UR33 * Length;
    X11 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL11 * Length;
    X12 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL12 * Length;
    X13 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL13 * Length;
    X21 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL21 * Length;
    X22 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL22 * Length;
    X23 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL23 * Length;
    X31 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL31 * Length;
    X32 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL32 * Length;
    X33 = 2 * Modelica.Constants.pi * SystemSettings.frequency * UL33 * Length;
    v1Re = R11 * i1Re + R12 * i2Re + R13 * i3Re - X11 * i1Im - X12 * i2Im - X13 * i3Im;
    v2Re = R21 * i1Re + R22 * i2Re + R23 * i3Re - X21 * i1Im - X22 * i2Im - X23 * i3Im;
    v3Re = R31 * i1Re + R32 * i2Re + R33 * i3Re - X31 * i1Im - X32 * i2Im - X33 * i3Im;
    v1Im = X11 * i1Re + X12 * i2Re + X13 * i3Re + R11 * i1Im + R12 * i2Im + R13 * i3Im;
    v2Im = X21 * i1Re + X22 * i2Re + X23 * i3Re + R21 * i1Im + R22 * i2Im + R23 * i3Im;
    v3Im = X31 * i1Re + X32 * i2Re + X33 * i3Re + R31 * i1Im + R32 * i2Im + R33 * i3Im;
    annotation(Diagram(graphics = {Rectangle(origin = {-68, -2}, extent = {{-2, 40}, {2, -40}}), Rectangle(origin = {34, -2}, extent = {{-2, 40}, {2, -40}}), Line(origin = {-82, 44}, points = {{-14, 6}, {14, 6}, {14, -6}, {14, -6}}), Line(origin = {-31.9048, -8.79848}, points = {{-62.0952, -41.2015}, {-54.0952, -43.2015}, {-36.0952, -43.2015}, {-36.0952, -33.2015}, {-36.0952, -33.2015}, {61.9048, 42.7985}}), Line(origin = {-18, -3}, points = {{-44, 37}}), Line(origin = {-19, -1}, points = {{-43, 37}, {43, -37}}), Line(origin = {66.0154, 44.9998}, points = {{31.9846, 5.00024}, {-32.0154, 7.00024}, {-32.0154, -6.99976}}), Line(origin = {66.04, -48}, points = {{31.9568, -4}, {9.95679, -6}, {-32.0432, -6}, {-32.0432, 6}}), Line(origin = {66.8017, -0.585706}, points = {{-24.8017, 36.5857}, {25.1983, -37.4143}}), Line(origin = {68, 4}, points = {{-20, -22}})}, coordinateSystem(initialScale = 0.1)), Icon(graphics = {Line(origin = {-98, -1}, points = {{0, 51}, {0, -51}}), Line(origin = {58, -4}, points = {{0, 52}}), Line(origin = {100, -7}, points = {{0, 49}, {0, -49}}), Line(origin = {3, 1}, points = {{-55, -37}}), Line(origin = {0, -2}, points = {{0, 42}, {0, -40}}), Bitmap(origin = {-69, 19}, extent = {{-39, 23}, {177, -55}})}, coordinateSystem(initialScale = 0.1)));
  end ThreePhaImpedancePerKm3;

  model Constants
    constant Real foot2mile = 0.000189;
  end Constants;
end ADN_Modelica;
