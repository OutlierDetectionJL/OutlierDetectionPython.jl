module OutlierDetectionPython
    using OutlierDetectionInterface
    const OD = OutlierDetectionInterface
    
    include("utils.jl")
    include("models.jl")

    UUID = "2449c660-d36c-460e-a68b-92ab3c865b3e"
    MODELS = [:ABODDetector,
              :CBLOFDetector,
              :COFDetector,
              :COPODDetector,
              :HBOSDetector,
              :IForestDetector,
              :KNNDetector,
              :LMDDDetector,
              :LODADetector,
              :LOFDetector,
              :LOCIDetector,
              :MCDDetector,
              :OCSVMDetector,
              :PCADetector,
              :RODDetector,
              :SODDetector,
              :SOSDetector]

    for model in MODELS
        @eval begin
            OD.metadata_pkg($model, package_name=string(@__MODULE__), package_uuid=$UUID,
                            package_url="https://github.com/OutlierDetectionJL/$(@__MODULE__).jl",
                            is_pure_julia=false, package_license="MIT", is_wrapper=false)
            OD.load_path(::Type{$model}) = string($model)
            export $model
        end
    end
end
