
The clas12Tags are a series of clas12 specific tags of the GEMC source code and geometry, installed in /group/clas12/gemc.

![Alt CLAS12](clas12.png?raw=true "The CLAS12 detector in the simulation. The electron beam is going from left to right.")
###### The CLAS12 detector in the simulation. The electron beam is going from left to right.

<br>

For Q/A on CLAS12 simulations you can use the [CLAS12 Discourse](https://clas12.discourse.group).




<br>

### Current PRODUCTION version: **4.4.0**, compatible with **COATJAVA 6.5.6.1** and above.

This points GEMC_DATA_DIR (geometry location) to /group/clas12/gemc/4.4.0

<hr>

To load production tag 4.4.0:

```source /group/clas12/packages/setup.csh```

```module load clas12/2.4```



<br>

To run GEMC you can select one of the gcards in /group/clas12/gemc/gcards. For example:

```gemc /group/clas12/gemc/gcards/rga-fall2018.gcard -N=nevents -USE_GUI=0 ```

<hr>


Feedback
========

Please use CLAS12 discourse for feedback on anything clas12tags related:

https://clas12.discourse.group

<br>
<hr>
<br>

GCARDS related to CLAS12 experiments
====================================

You can find here a collaction of gcards and YAML file for various CLAS12 experiments.
The Run Configurations are also detailed on this page:

<a href="https://github.com/gemc/clas12Tags/tree/master/gcards"> gcards and experiments</a>.

<br>
Starting with clas12tags 4.4.0 the configuration files are located in the tag folder in the "config" directory.
<br>
<hr>
<br>

Portal to Off-site farms CLAS12 Simulations
===========================================

Check the off-site farms status, and submits simulations jobs.

<a href="https://gemc.jlab.org/web_interface/index.php"> CLAS12 Simulation Submission Portal</a>.

<br>
<hr>
<br>




Magnetic Fields
---------------

You can scale magnetic fields using the SCALE_FIELD option. To do that copy the gcard somewhere first, then modify it. The gcard can work from any location.
Example on how to run at 80% torus field (inbending) and 60% solenoid field:

```
 <option name="SCALE_FIELD" value="TorusSymmetric, -0.8"/>
 <option name="SCALE_FIELD" value="clas12-newSolenoid, 0.6"/>
```

<br>
<hr>
<br>


Hydrogen, Deuterium or empty target
-----------------------------------

By default the target cell is filled with liquid hydrogen by specifying the "lh2" target variation.
To use liquid deuterium instead use the variation "lD2" instead.

To use an empty target instead, use the SWITCH_MATERIALTO option.
```
 <option name="SWITCH_MATERIALTO" value="G4_lH2, G4_Galactic"/>
```

<br>
<hr>
<br>


Removing a detector or a volume
-------------------------------

You can remove/comment out the ```<detector>``` tag in the gcard to remove a whole system.
To remove individual elements, use the existance tag in the gcard. For example, to remove the forward micromegas:

```
       <detector name="FMT">
                <existence exist="no" />
        </detector>
```

<br>
<hr>
<br>

Docker 
------

GEMC is distributed using docker, see some <a href="https://gemc.jlab.org/gemc/html/docker.html"> examples of using docker with gemc</a>.
The <a href="https://hub.docker.com/repository/docker/jeffersonlab/clas12software/tags?page=1"> jefferson lab docker hub </a> stores the current and archived images.

<br>

Use this container with the clas12tags:

```jeffersonlab/clas12tags:4.4.0```

<hr>
<br>


Detector Sources
----------------

The GEMC detector api is located on the <a href="https:// github.com/gemc/api"> git repository</a>.

The CLAS12 systems are kept in the <a href="https://github.com/gemc/detectors"> detector git repository</a>.

<br>
<hr>
<br>


Geometry Services
-----------------

The CLAS12 geometry services are kept in the <a href="https://github.com/JeffersonLab/clas12-offline-software/blob/development/common-tools/clas-jcsg/src/main/java/org/jlab/detector/geant4/v2/"> java geant4 factory git repository</a>.

<br>
<hr>
<br>

How to get and compile the clas12Tags
-------------------------------------

The clas12tags can be installed on top of an existing [jlab installation.
For 4.4.0 it's JLAB_VERSION 2.4](https://www.jlab.org/12gev_phys/packages/sources/ceInstall/2.4_install.html):

1. clone https://github.com/gemc/clas12Tags
2. cd to the tag you want to use
3. type `<scons -j4 OPT=1>`

This will compile a gemc executable in that directory. Remember to use the full path to that executable when running gemc,
otherwise the OS will pick up the default from the $GEMC env variable.


<br>
<hr>
<br>



Software, Geometry Tags
=======================

<br>
	
Production:
-----------

<br>


- 4.4.1:

	- z tracking limit changed to 9m from 8m in the gcards :white_check_mark:

To load production tag 4.4.1:

```source /group/clas12/packages/setup.csh```

```module load clas12/2.4.1```

<br>


In development:
---------------



<br>

Numbering scheme changes: hipo4 breaks backward compatibility. So this release is "major".
Also, from now on we go to two numbers only.

- 5.0:

   	- Hipo 4 output  :soon:
   	- Added star "\*" to INTEGRATEDRAW option: -INTEGRATEDRAW="\*" will activate the true info for all sensitive detectors
	- pcal and ec hitprocesses merged into one: ecal
	
	  - production threshold for both set to 1mm (was 1mm for pcal, 5mm for ec)
	  - hit process routine is now "ecal" for both

<br>

<br>
		
- Other TODOs:

	- Rich sector 4 digitization :soon:
	- BMT digitization with global coordinates instead of locals :soon:
	- Time propagation in DC digitization :soon:

<br>




Previous Tags:
--------------



From 4.3.2 and on the module is used for the environment.

<br>


- 4.4.0:

	- geant4 10.6 support :white_check_mark:
	- conform all detectors to read RUNNO and DIGITIZATION_VARIATIONS in the digitization :white_check_mark:
	- add time offsets for: LTCC :white_check_mark:
	- add time offsets for: EC, PCAL :white_check_mark:
	- HTCC mc_gain implementation :white_check_mark:
	- conform all detectors to read DIGITIZATION_TIMESTAMP in the digitization :white_check_mark:
	- dc, ec, htcc resolution matching :white_check_mark:
	- gcards, yaml files from 4.4.0 and on in a dedicated “config” subdir :white_check_mark:

To load production tag 4.4.0:

```source /group/clas12/packages/setup.csh```

```module load clas12/2.4```

<br>


- 4.3.2 (paired with Coatjava version 6.5.3)

	- FILTER_HADRONS option to write out events that have hit from specific hadrons in them
	- Rich sector 4 passive materials
	- FMT use "rgf_spring2020" variation with 3 layers and in retrieving Z0 in the digitization
	- RTPC geometry and digitization for the Bonus experiment
	- Target geometry for the Bonus experiment
	- GUI background color changed to white
	- Neutrals particles color changed to blue
	- Double radius for hits above thresholds
	- allow two sequential rotations in the detector definition
	- TOFs resolutions pars from CCDB
	- Move LUND vertex based on gcard entry
	- Detector time signal shift to match data: FTOF and DC

To load production tag 4.3.2:

```source /group/clas12/packages/setup.csh```

```module load clas12/2.0```

<br>


- 4.3.1:

	- FTOF Time resolution updated based on data
	- Option  <a href="https://gemc.jlab.org/gemc/html/documentation/rerunEvents.html">SAVE_SELECTED, RERUN_SELECTED</a> to save RNG state for certain particles, detector
	- Option  <a href="https://gemc.jlab.org/gemc/html/documentation/ancestry.html"> SAVE_ALL_ANCESTORS </a> to save complete particles hierarchy in output (evio2root also updated)
	- gcards for rg-a different run-periods
	- gcards for rg-b different run-periods
	- ec, pcal digitization removed obsolete constants
	- moved ftof shield in the correct position
	- Option written in JSON format
	- rga_fall2018 variations for: FTOF, EC, PCAL, CTOF geometry services
	- default variation for DC geometry service
	- ltcc variarions for different run periods
	- added Geometry variation as a gcard option: DIGITIZATION_VARIATION, to be used by digitization routines.
	- target position added to BMT, CTOF digitization position shift, read from CCDB using DIGITIZATION_VARIATION
	- beam background merging is extended to all detectors
	- FTOF and CTOF resolutions matched to data
	- option RECORD_MIRRORS renamed RECORD_OPTICALPHOTONS

<br>


- 4.3.0: **COATJAVA: 5.7.4**, **JLAB_VERSION: 2.3**:

	- Updated DC geometry using latest survey (May 18 Entry in DB) 
	- Fixed bug that prevented material name from being displayed in the GUI
	- 3d cartesian field map support
	- new geant4 version: 10.4.p02
	- 51 micron tungsten shield (for bst) surrounding the target
	- calorimeters: reading ecal effective velocity from CCDB
	- change htcc time offset table to use the same used in reconstruction
	- Tony Forest: Added polarized target geometry/material and cad volume.

<br>


- 4a.2.4: **COATJAVA: 5b.6.1**, **JLAB_VERSION: 2.2**:

	- Use new torus field map
	- FMT shift by 8mm
	- use run number 11 as default in the gcard
	- FMT background hits
	- production cut set for individual volumes in the options
	- new geant4 version
	- env variable "GEMC_DATA_DIR" as a base path in the gcard (gcard is now portable to other systems)
	- bst tungsten and heat shield
	- LTCC Nose CAD model
	- magnetic field map displacements and rotations with command line options
	- FAST MC mode 10, 20 output fixed
	- new solenoid field map used by default (scaled by -1)

<br>


- 4a.2.3 (compatible with COATJAVA 5b.3.3): Same as 4a.2.2 with in addition:

	- ctof, ftof banks: 1 ADC output / pmt instead of ADCL/ADCR for a single paddle)
	- CTOF, FTOF Paddle to PMT digitization for FADC
	- background merging algorithm framework
	- background merging algorithm implementation in digitization: DC, BST and MM.
	- Correct field geant4-caching
	- Solenoid integration method: G4ClassicalRK4 to fix some geant4 navigation issues in the field. Slower but more reliable (should have less crashes)
	- SYNRAD option to activate synchrotone radiation in vacuum (SYNRAD=1) or any material (SYNRAD=2)
	- dc gas material changed to 90% Ar, 10% G4_CARBON_DIOXIDE.
	- RF shift from target center: added option RFSTART: Radio-frequency time model. Available values are:
	  - "eventVertex, 0, 0, 0" (default): the RF time is the event start time + the light time-distance of the first particle from the point (0,0,0)
	  - "eventTime".....................: the RF time is identical to the event start time


<br>

- 4a.2.2: Same as 4a.2.1 with in addition:

	- target from CAD
	- htcc wc invisible
	- no transparency in MM
	- threshold mechanism
	- rotate LUND bank to flat
	- final beamline configuration
	- LTCC sector 4 removed
	- LTCC sector 1 removed
	- DC: Removed unused lines and calculation of smeared doca
	- generator user information are now in two dedicate banks: user header (TAG 11), and user particle infos (TAG 22)
	- MM overlaps with target fixed
	- New numbering scheme for CTOF, CND

<br>

- 4a.2.1: Same as 4a.2.0 with in addition:

	- fixes to CAD modeling of both the beamline and the torus
	- forward carriage volume fixed to accomodate beamline and shielding
	- fixed CND / CTOF overlaps
	- updated latest micromegas geometry
	- MM: Adjust transverse diffusion and ionization potential
	- updated latest BST
	- 3 + 3 configuration BST + MM
	- new vacuum pipe
	- new shield downsttream of the torus
	- LTCC box hierarchy fixed
	- LTCC frame is CAD + copies
	- corrected mini-stagger values for DC
	- Added TDC calibration constants to ec,pcal hitprocess
	- FADC mode 1 (still tuning it to make it exactly like Serguei DAQ)
	- reading tdc_conv for ctof from database
	- fixed an issue with the header bank where the LUND info index was not correct

- 4a.2.0: Same as 4a.1.0 with in addition:
 
  - use JLAB_VERSION 2.1, with new mlibrary
  - Micromegas: updated  geometry and digitization
  - DC: realistic time to distance function, reading constants from CCDB
  - DC: ministagger for DC region 3: "even closer" layers 1,3,5: +300um, SL 2,4,6: -300um
  - LTCC: Reading CCDB SPE calibration constants
  - LTCC: Smearing ADC based on calibration constants
  - CTOF javacad instead of cad (should be indentical)
  - Fixed smeared infor in generated summary for FASTMC mode
  - improved/fixed CND digitization routine
  - updated RF timing (mlibrary) 
  - BST+MM: using 3+3 configurations (no FMT)
  

- 4a.1.0: Same as 4a.0.2 with in addition:

  - fixed a bug that affect output file size 
  - fixed bug that affected multiple cad imports
  - added micromegas geometry and hit processes
  - RF output correct frequency in the clas12 gcard
  - updated FT geometry and hit process
  - updated ftof geometry
  - added reading of FTOF reading of tdc conversion constants from the database
  - check if strip_id is not empty in bmt_ and fmt_strip.cc, otherwise fill it.


- 4a.0.2: Same as 4a.0.1 with in addition: 
  
  - full (box, mirrors, pmts shields and WC) LTCC geometry 
  - LTCC hit process routine.

- 4a.0.1: Same as 4a.0.0 with in addition: 

  - FTOF geometry fix

- 4a.0.0: KPP configuration: 

  - Fixes in source and hit process for FTOF
  - added EC gains. 
  - Java geometry uses now coatjava 3. 
  - Database fixed for DC geometry. 
  - Linear time-to-distance for DC.
  - CTOF in the KPP position configuration in the new kpp.gcard.
  
- 3a.1.0: same as 3a.0.2 with in addition:

  - DC time-to-distance implementation.
  
- 3a.0.2: same as 3a.0.1 with  in addition: 

  - CND fix.
 
- 3a.0.1: same as 3a.0.0 with  in addition:

  - ctof has status working.
  
- 3a.0.0: git commit d3a5dc1, Dec 2 2016. Includes:

  - FTOF and CTOF paddle delays from CCDB
  - CTOF center off-set.

<br>

Other notes
===========

<br>

FTOn, FTOff configurations
--------------------------

The default configuration for the first experiment is with "FTOn" (Figure 1, Left): complete forward tagger is fully operational.
The other available configuration is "FTOff" (Figure 1, Right): the Forward Tagger tracker is replaced with shielding, and the tungsten cone is moved upstream.

The simulations in preparation of the first experiment should use the default version FTOn.
FTOff will be used only by experts for special studies in preparation for the engineering run.

<a href="url"><img src="https://github.com/gemc/clas12Tags/blob/master/ftOn.png" align="left" width="400" ></a>
<a href="url"><img src="https://github.com/gemc/clas12Tags/blob/master/ftOff.png" align="left" width="400" ></a>

<br><br>
<br><br>
<br><br>
<br><br>
<br><br>
<br>


###### Figure 1. Left: FT On configuration: Full, OperationalForward Tagger. Right: FT Off configuration: FT Tracker replaced by shielding, Tungsten Cone moved upstream, FT if turned off.

<br>

To change configuration from FTOn to FTOff, replace the keywords and variations from:


```
<detector name="ft" factory="TEXT" variation="FTOn"/>
<detector name="beamline" factory="TEXT" variation="FTOn"/>
<detector name="cadBeamline/" factory="CAD"/>
```

to:


```
<detector name="ft" factory="TEXT" variation="FTOff"/>
<detector name="beamline" factory="TEXT" variation="FTOff"/>
<detector name="cadBeamlineFTOFF/" factory="CAD"/>
```


<br>

Different tag environment
-------------------------

You can specific a different tag in the environment command line:

```source /group/clas12/gemc/environment.csh <tag>  ```





<br>


To produce:
-----------

1. create new tag dir
2. cp experiments and gcard form old tag to keep track of new changes
3. make links from ../gcards
4. change environment.csh to point to the new tag
5. copy $GEMC to source and clean up. From the tag:

	- cd $GEMC
	- scons -c
	- cd -
	- cp -r $GEMC source ; cd source ; rm -rf .git* ; rm .sconsign.dblite
	- find ./  -type f  -name .DS_Store  -exec rm -f {} \;
	- rm -rf api ; cp -r /opt/projects/gemc/api . ; cd api ;  rm -rf .git*

5. change gemc.cc tag to new tag
