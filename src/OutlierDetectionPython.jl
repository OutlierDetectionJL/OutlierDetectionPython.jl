module OutlierDetectionPython
    using OutlierDetectionInterface
    const OD = OutlierDetectionInterface
    using PythonCall
    const numpy = PythonCall.pynew()
    const sklearn = PythonCall.pynew()

    function __init__()
        PythonCall.pycopy!(numpy, pyimport("numpy"))
        PythonCall.pycopy!(sklearn, pyimport("sklearn"))
    end

    include("utils.jl")
    include("models.jl")

    UUID = "2449c660-d36c-460e-a68b-92ab3c865b3e"
    MODELS = [:ABODDetector,
              :CBLOFDetector,
              :CDDetector,
              :COFDetector,
              :COPODDetector,
              :ECODDetector,
              :GMMDetector,
              :HBOSDetector,
              :IForestDetector,
              :INNEDetector,
              :KDEDetector,
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
            OD.@default_frontend $model
            OD.metadata_pkg($model, package_name=string(@__MODULE__), package_uuid=$UUID,
                            package_url="https://github.com/OutlierDetectionJL/$(@__MODULE__).jl",
                            is_pure_julia=false, package_license="MIT", is_wrapper=false)
            OD.load_path(::Type{$model}) = string($model)
            export $model
        end
    end
end
