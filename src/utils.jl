using PyCall:PyObject, PyReverseDims, pyimport_conda

struct PyModel <: DetectorModel
    pyobject::PyObject
end

# lazily import a python model
pyod_import(name::String) = () -> begin
    raw_name = name[1:end-length("Detector")] # name without Detector ending
    module_name = lowercase(raw_name)
    # names are not consistently uppercased
    model_name = raw_name == "IForest" ? raw_name : uppercase(raw_name)
    getproperty(pyimport_conda("pyod.models.$(module_name)", "pyod", "conda-forge"), model_name)
end
pyod_import(name::Symbol) = pyod_import(String(name))

make_docs_link(name::String) =
    "<https://pyod.readthedocs.io/en/latest/pyod.models.html#module-pyod.models.$(lowercase(name))>"

# Implements the `fit` method for an underlying PyOD model.
function pyod_fit(modelname, params)
    pymodelname = String(modelname)
    quote
        function OD.fit(model::$modelname, X::Data; verbosity)::Fit
            Xt = PyReverseDims(X) # from column-major to row-major
            # load the underlying python model with key-word arguments
            detector = pyod_import($pymodelname)()($((Expr(:kw, p, :(model.$p)) for p in params)...))
            detector.fit(Xt)
            # the underlying python model is out model
            return PyModel(detector), detector.decision_scores_
        end
    end
end

# Implements the `score` method for an underlying PyOD model.
function pyod_score(modelname)
    quote
        function OD.transform(_::$modelname, model::DetectorModel, X::Data)::Scores
            Xt = PyReverseDims(X) # change from column-major to row-major
            scores_test = model.pyobject.decision_function(Xt)
            return scores_test
        end
    end
end

# Extracts the relevant information from the expr and build the expression corresponding to the model constructor.
function py_constructor(ex)
    # similar to @detector
    ex, modelname, params, defaults, constraints = OD._process_model_def(@__MODULE__, ex)

    # keyword constructor
    const_ex = OD._model_constructor(modelname, params, defaults)

    # associate the constructor with the definition of the struct
    push!(ex.args[3].args, const_ex)

    # cleaner
    clean_ex = OD._model_cleaner(modelname, defaults, constraints)

    # return
    return modelname, params, clean_ex, ex
end

macro pymodel(ex)
    modelname, params, clean_ex, ex = py_constructor(ex)
    expr = quote
        Base.@__doc__($ex)
        $clean_ex
        $(pyod_fit(modelname, params))
        $(pyod_score(modelname))
    end
    esc(expr)
end
