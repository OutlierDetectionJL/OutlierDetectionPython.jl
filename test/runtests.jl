using OutlierDetectionPython
using OutlierDetectionTest

models = eval.(OutlierDetectionPython.MODELS)

# Test the metadata of all exported detectors
test_meta.(models)

data = TestData()
run_test(detector) = test_detector(detector, data)

# Test all models with default parameters
run_test.([model() for model in models])
