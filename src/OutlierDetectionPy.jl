module OutlierDetectionPy
    using OutlierDetectionInterface
    const OD = OutlierDetectionInterface

    include("utils.jl")
    include("models.jl")

    MODELS = (PyABODDetector,
              PyCBLOFDetector,
              PyCOFDetector,
              PyCOPODDetector,
              PyHBOSDetector,
              PyIForestDetector,
              PyKNNDetector,
              PyLMDDDetector,
              PyLODADetector,
              PyLOFDetector,
              PyLOCIDetector,
              PyMCDDetector,
              PyOCSVMDetector,
              PyPCADetector,
              PyRODDetector,
              PySODDetector,
              PySOSDetector)

    ORG = "OutlierDetectionJL"
    UUID = "51249a0a-cb36-4849-8e04-30c7f8d311bb"
    for model in MODELS
        @eval(export $model)
        OD.metadata_pkg(model, package_name=@__MODULE__, package_uuid=UUID,
                            package_url="https://github.com/$ORG/$(@__MODULE__).jl",
                            is_pure_julia=true, package_license="MIT", is_wrapper=false)
        OD.load_path(::Type{model}) = "$(@__MODULE__).$model"
    end
end
