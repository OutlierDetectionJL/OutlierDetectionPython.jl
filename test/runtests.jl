using OutlierDetectionPython
using OutlierDetectionTest

data = TestData()
run_test(detector) = test_detector(detector, data)

# ABOD
run_test(ABODDetector())

# CBLOF
run_test(CBLOFDetector(random_state=0))

# COF
run_test(COFDetector())

# COPOD
run_test(COPODDetector())

# HBOS
run_test(HBOSDetector())

# IForest
run_test(IForestDetector(random_state=0))

# KNN
run_test(KNNDetector())

# LMDD
run_test(LMDDDetector(random_state=0))

# LOD
run_test(LODADetector())

# LOF
run_test(LOFDetector())

# LOCI
run_test(LOCIDetector())

# MCD
run_test(MCDDetector(random_state=0))

# SVM
run_test(OCSVMDetector())

# PCA
run_test(PCADetector(random_state=0))

# ROD
run_test(RODDetector())

# SOD
run_test(SODDetector())

# SOS
run_test(SOSDetector())
