"""    ABODDetector(n_neighbors = 5,
                    method = "fast")
$(make_docs_link("abod"))
"""
@pymodel mutable struct ABODDetector <: UnsupervisedDetector
    n_neighbors::Integer = 5::(_ > 0)
    method::String = "fast"::(_ in ("default", "fast"))
end

"""    CBLOFDetector(n_clusters = 8,
                     alpha = 0.9,
                     beta = 5,
                     use_weights = false,
                     random_state = nothing,
                     n_jobs = 1)
$(make_docs_link("cblof"))
"""
@pymodel mutable struct CBLOFDetector <: UnsupervisedDetector
    n_clusters::Integer = 8::(_ > 1)
    alpha::Real = 0.9::(0.5 < _ < 1)
    beta::Real = 5::(_ > 1)
    use_weights::Bool = false
    random_state::Union{Nothing,Integer} = nothing
    n_jobs::Integer = 1::(_ >= -1)
end

"""    COFDetector(n_neighbors = 5,
                   method="fast")
$(make_docs_link("cof"))
"""
@pymodel mutable struct COFDetector <: UnsupervisedDetector
    n_neighbors::Integer = 20::(_ > 0)
    method::String = "fast"::(_ in ("fast", "memory"))
end

"""    COPODDetector(n_jobs = 1)
$(make_docs_link("copod"))
"""
@pymodel mutable struct COPODDetector <: UnsupervisedDetector
    n_jobs::Integer = 1::(_ >= -1)
end

"""    HBOSDetector(n_bins = 10,
                    alpha = 0.1,
                    tol = 0.5)
$(make_docs_link("hbos"))
"""
@pymodel mutable struct HBOSDetector <: UnsupervisedDetector
    n_bins::Integer = 10::(_ > 1)
    alpha::Real = 0.1::(0 < _ < 1)
    tol::Real = 0.5::(0 < _ < 1)
end

"""    IForestDetector(n_estimators = 100,
                       max_samples = "auto",
                       max_features = 1.0
                       bootstrap = false,
                       random_state = nothing,
                       verbose = 0,
                       n_jobs = 1)
$(make_docs_link("iforest"))
"""
@pymodel mutable struct IForestDetector <: UnsupervisedDetector
    n_estimators::Integer = 100::(_ > 0)
    max_samples::Union{String,Real} = "auto"
    max_features::Real = 1.0
    bootstrap::Bool = false
    random_state::Union{Nothing,Integer} = nothing
    verbose::Integer = 0::(0 <= _ <= 2)
    n_jobs::Integer = 1::(_ >= -1)
end

"""    KNNDetector(n_neighbors = 5,
                   method = "largest",
                   radius = 1.0,
                   algorithm = "auto",
                   leaf_size = 30,
                   metric = "minkowski",
                   p = 2,
                   metric_params = nothing,
                   n_jobs = 1)
$(make_docs_link("knn"))
"""
@pymodel mutable struct KNNDetector <: UnsupervisedDetector
    n_neighbors::Integer = 5::(_ > 0)
    method::String = "largest"::(_ in ("largest", "mean", "median"))
    radius::Real = 1.0
    algorithm::String = "auto"::(_ in ("auto", "ball_tree", "kd_tree", "brute"))
    leaf_size::Integer = 30::(_ > 0)
    metric::String = "minkowski"::(_ in ("cityblock", "cosine", "euclidean", "l1", "l2", "manhatten", "braycurtis", "canberra", "chebyshev", "correlation", "dice", "hamming", "jaccard", "kulsinski", "mahalanobis", "matching", "minkowski", "rogerstanimoto", "russellrao", "seuclidean", "sokalmichener", "sokalsneath", "sqeuclidean", "yule"))
    p::Union{Nothing,Integer} = 2
    metric_params::Union{Nothing,Any} = nothing
    n_jobs::Integer = 1::(_ >= -1)
end

"""    LMDDDetector(n_iter = 50,
                    dis_measure = "aad",
                    random_state = nothing)
$(make_docs_link("lmdd"))
"""
@pymodel mutable struct LMDDDetector <: UnsupervisedDetector
    n_iter::Integer = 50::(_ > 0)
    dis_measure::String = "aad"::(_ in ("aad", "var", "iqr"))
    random_state::Union{Nothing,Integer} = nothing
end

"""    LODADetector(n_bins = 10,
                    n_random_cuts = 100)
$(make_docs_link("loda"))
"""
@pymodel mutable struct LODADetector <: UnsupervisedDetector
    n_bins::Integer = 10::(_ > 1)
    n_random_cuts::Integer = 100::(_ > 0)
end

"""    LOFDetector(n_neighbors = 5,
                   algorithm = "auto",
                   leaf_size = 30,
                   metric = "minkowski",
                   p = 2,
                   metric_params = nothing,
                   n_jobs = 1,
                   novelty = true)
$(make_docs_link("lof"))
"""
@pymodel mutable struct LOFDetector <: UnsupervisedDetector
    n_neighbors::Integer = 5::(_ > 0)
    algorithm::String = "auto"::(_ in ("auto", "ball_tree", "kd_tree", "brute"))
    leaf_size::Integer = 30::(_ > 0)
    metric::String = "minkowski"::(_ in ("cityblock", "cosine", "euclidean", "l1", "l2", "manhatten", "braycurtis", "canberra", "chebyshev", "correlation", "dice", "hamming", "jaccard", "kulsinski", "mahalanobis", "matching", "minkowski", "rogerstanimoto", "russellrao", "seuclidean", "sokalmichener", "sokalsneath", "sqeuclidean", "yule"))
    p::Union{Nothing,Integer} = 2
    metric_params::Union{Nothing,Any} = nothing
    n_jobs::Integer = 1::(_ >= -1)
    novelty::Bool = true
end

"""    LOCIDetector(alpha = 0.5,
                    k = 3)
$(make_docs_link("loci"))
"""
@pymodel mutable struct LOCIDetector <: UnsupervisedDetector
    alpha::Real = 0.5::(0 < _ < 1)
    k::Real = 3::(_ > 0)
end

"""    MCDDetector(store_precision = true,
                   assume_centered = false,
                   support_fraction = nothing,
                   random_state = nothing)
$(make_docs_link("mcd"))
"""
@pymodel mutable struct MCDDetector <: UnsupervisedDetector
    store_precision::Bool = true
    assume_centered::Bool = false
    support_fraction::Union{Nothing,Real} = nothing
    random_state::Union{Nothing,Integer} = nothing
end

"""    OCSVMDetector(kernel = "rbf",
                     degree = 3,
                     gamma = "auto",
                     coef0 = 0.0,
                     tol = 0.001,
                     nu = 0.5,
                     shrinking = true,
                     cache_size = 200,
                     verbose = false,
                     max_iter = -1)
$(make_docs_link("ocsvm"))
"""
@pymodel mutable struct OCSVMDetector <: UnsupervisedDetector
    kernel::String = "rbf"::(_ in ("linear", "poly", "rbf", "sigmoid", "precomputed"))
    degree::Integer = 3::(_ > 1)
    gamma::Union{String,Real} = "auto"
    coef0::Real = 0.0
    tol::Real = 0.001
    nu::Real = 0.5::(0 < _ <= 1)
    shrinking::Bool = true
    cache_size::Integer = 200::(_ > 0)
    verbose::Bool = false
    max_iter::Integer = -1
end

"""    PCADetector(n_components = nothing,
                   n_selected_components = nothing,
                   copy = true,
                   whiten = false,
                   svd_solver = "auto",
                   tol = 0.0
                   iterated_power = "auto",
                   standardization = true,
                   weighted = true,
                   random_state = nothing)
$(make_docs_link("pca"))
"""
@pymodel mutable struct PCADetector <: UnsupervisedDetector
    n_components::Union{Nothing,Real} = nothing
    n_selected_components::Union{Nothing,Integer} = nothing
    copy::Bool = true
    whiten::Bool = false
    svd_solver::String = "auto"::(_ in ("auto", "full", "arpack", "randomized"))
    tol::Real = 0.0
    iterated_power::Union{String,Integer} = "auto"
    standardization::Bool = true
    weighted::Bool = true
    random_state::Union{Nothing,Integer} = nothing
end

"""    RODDetector(parallel_execution = false)
$(make_docs_link("rod"))
"""
@pymodel mutable struct RODDetector <: UnsupervisedDetector
    parallel_execution::Bool = false
end

"""    SODDetector(n_neighbors = 5,
                   ref_set = 10,
                   alpha = 0.8)
$(make_docs_link("sod"))
"""
@pymodel mutable struct SODDetector <: UnsupervisedDetector
    n_neighbors::Integer = 20::(_ > 0)
    ref_set::Integer = 10::(_ > 0)
    alpha::Real = 0.8::(0 < _ < 1)
end

"""    SOSDetector(perplexity = 4.5,
                   metric = "minkowski",
                   eps = 1e-5)
$(make_docs_link("sos"))
"""
@pymodel mutable struct SOSDetector <: UnsupervisedDetector
    perplexity::Real = 4.5::(_ > 0)
    metric::String = "minkowski"::(_ in ("cityblock", "cosine", "euclidean", "l1", "l2", "manhatten", "braycurtis", "canberra", "chebyshev", "correlation", "dice", "hamming", "jaccard", "kulsinski", "mahalanobis", "matching", "minkowski", "rogerstanimoto", "russellrao", "seuclidean", "sokalmichener", "sokalsneath", "sqeuclidean", "yule"))
    eps::Real = 1e-5::(_ > 0)
end
