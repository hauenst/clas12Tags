//============================================================
// This script prints volumes for Low-Mass URWELL detector
//============================================================
import org.jlab.geom.base.*;
import org.jlab.clasrec.utils.*;
import org.jlab.detector.geant4.v2.LMU.*;
import org.jlab.detector.base.*;

import GeoArgParse
def variation = GeoArgParse.getVariation(args);
def runNumber = GeoArgParse.getRunNumber(args);

ConstantProvider cp = GeometryFactory.getConstants(DetectorType.DC,runNumber,"default");
//cp.show();

LMUGeant4Factory factory = new LMUGeant4Factory(cp);

def outFile = new File("lmu__volumes_"+variation+".txt");
outFile.newWriter().withWriter { w ->
	w<<factory;
}

