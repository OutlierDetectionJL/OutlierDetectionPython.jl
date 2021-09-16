using OutlierDetectionPython
using OutlierDetectionTest

data = TestData()
run_test(detector) = test_detector(detector, data)

# ABOD
run_test(PyABODDetector())

# CBLOF
run_test(PyCBLOFDetector(random_state=0))

# COF
run_test(PyCOFDetector())

# COPOD
run_test(PyCOPODDetector())

# HBOS
run_test(PyHBOSDetector())

# IForest
run_test(PyIForestDetector(random_state=0))

# KNN
run_test(PyKNNDetector())

# LMDD
run_test(PyLMDDDetector(random_state=0))

# LOD
run_test(PyLODADetector())

# LOF
run_test(PyLOFDetector())

# LOCI
run_test(PyLOCIDetector())

# MCD
run_test(PyMCDDetector(random_state=0))

# SVM
run_test(PyOCSVMDetector())

# PCA
run_test(PyPCADetector(random_state=0))

# ROD
run_test(PyRODDetector())

# SOD
run_test(PySODDetector())

# SOS
run_test(PySOSDetector())
