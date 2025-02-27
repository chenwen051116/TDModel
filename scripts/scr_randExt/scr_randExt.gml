/**
* Constructor for a probability–element struct.
*
* This constructor creates a struct with two fields:
*   - percentage: A probability value in the range [0, 1].
*   - element:    The element associated with this probability.
*
* @param {real} _percentage   The probability (0 to 1).
* @param {any} _element         The associated element.
* @return {struct}              A struct with fields "percentage" and "element".
*/
function ProbabilityElement(_percentage, _element) constructor {
    // Validate the probability is in [0,1]
    assert(_percentage >= 0 && _percentage <= 1, "percentage must be between 0 and 1");
    percentage = _percentage;
    element = _element;
}

/**
* Selects elements from the given element array based on their corresponding selection probabilities,
* using a weighted random selection algorithm that employs binary search.
*
* The function first computes a cumulative frequency array from the provided percentage_array.
* Then, for each selection, it:
*   1. Generates a random number between 0 (inclusive) and the total frequency (exclusive).
*   2. Uses binary_search_first_greater_or_equal() to find the first index where the cumulative value is ≥ the random number.
*   3. Selects the element at that index.
*
* @param {array} element_array      The array of elements to choose from.
* @param {array} percentage_array   An array containing the selection probabilities (0 to 1) for each element.
*                                   Must be parallel to element_array and sum to 1.
* @param {real} n                 The number of weighted selections to perform.
* @return {Array<Any*>}                   An array (of length n) containing the selected elements.
*/
function select_elements_from_arrays(element_array, percentage_array, n) {
    var count = array_length(element_array);
    // Assert that both arrays have the same length.
    assert(array_length(percentage_array) == count, "Element array and percentage array must have the same length.");
    
    // Build cumulative frequency array.
    var cumulative = array_create(count);
    var total = 0;
    for (var i = 0; i < count; i++) {
        var prob = percentage_array[i];
        assert(prob >= 0 && prob <= 1, "Each probability must be between 0 and 1.");
        total += prob;
        cumulative[i] = total;
    }
    // Ensure the probabilities sum to 1 (within a small tolerance).
    assert(abs(total - 1) < 0.0001, "Total probabilities must sum to 1.");
    
    // Pre-create the samples array with known size.
    var samples = array_create(n);
    
    // Perform weighted random selection n times.
    for (var s = 0; s < n; s++) {
        // Generate a random number between 0 (inclusive) and total (exclusive).
        var rnd = random(total);
        // Use binary search to find the first index with cumulative value >= rnd.
        var selected_index = find_first_ge(cumulative, rnd);
        // Assign the selected element.
        samples[s] = element_array[selected_index];
    }
    return samples;
}

/**
* Selects elements from an array of probability–element structs using weighted random selection,
* and repeats the process n times.
*
* Each struct in the input array must have the following fields:
*   - percentage: The selection probability (0 to 1) for the element.
*   - element:    The element to be considered for selection.
*
* This function converts the struct array into separate element and percentage arrays and then
* calls select_elements_from_arrays() to perform the weighted selection.
*
* @param {array} struct_array   An array of probability–element structs.
* @param {real} n             The number of weighted selections to perform.
* @return {Array<real>}               An array of selected elements.
*/
function select_elements_from_structs(struct_array, n) {
    var count = array_length(struct_array);
    var element_array = array_create(count);
    var percentage_array = array_create(count);
    
    for (var i = 0; i < count; i++) {
        var item = struct_array[i];
        element_array[i] = item.element;
        percentage_array[i] = item.percentage;
    }
    
    return select_elements_from_arrays(element_array, percentage_array, n);
}


// ---------------------------------------------------------------------
// Sampling Function from a PDF using the Simpson Integration Array
// ---------------------------------------------------------------------

/// @function sample_from_pdf
/// @desc Samples numbers from a given probability density function (PDF) over the interval [a, b].
///       It uses Simpson's rule (via simpson_integration_array) to approximate the CDF.
///       For each sample:
///         1. A random number is drawn between 0 and the total integrated area.
///         2. Binary search finds the segment where the random value falls.
///         3. A second random value uniformly samples within that segment (using linear interpolation).
/// @param {integer} num_subintervals The number of subintervals for integration (must be even).
/// @param {function} pdf The PDF function (accepts a single real argument, returns a real).
/// @param {integer} num_samples The number of samples to generate.
/// @param {real} a The lower bound of the domain.
/// @param {real} b The upper bound of the domain.
/// @returns {Array<real>} An array of sampled x_ values.
function sample_from_pdf(num_subintervals, pdf, num_samples, a, b) {
    // Compute the cumulative integration array (an approximation of the CDF).
    var simpson_result = simpson_integration_array(pdf, a, b, num_subintervals);
    var cum = simpson_result.cum;
    var points = simpson_result.points;
    var num_points = array_length(cum);
    var total_area = cum[num_points - 1];
    
    // Pre-create the output samples array.
    var samples = array_create(num_samples);
    
    // For each sample...
    for (var s = 0; s < num_samples; s++) {
        // Generate a random number between 0 (inclusive) and total_area (exclusive).
        var r = random(total_area);
        // Use binary search to find the first index where the cumulative value is >= r.
        var index = find_first_ge(cum, r);
        
        // Get the cumulative value at the previous index (or 0 if index is 0).
        var cum_lower = (index > 0) ? cum[index - 1] : 0;
        // Corresponding endpoints from the points array.
        var x_lower = (index > 0) ? points[index - 1] : points[0];
        var x_upper = points[index];
        
        // Compute the fraction within the segment.
        var denom = (cum[index] - cum_lower);
        var fraction = (denom > 0) ? (r - cum_lower) / denom : 0;
        // Interpolate linearly within the segment.
        var x_sample = x_lower + fraction * (x_upper - x_lower);
        samples[s] = x_sample;
    }
    array_sort(samples, true);
    return samples;
}

function rand_rg(a, b){
    assert(b >= a, "the upperbound b have to be greater or equal to the lower bound a")
    return a + random(b - a);
}

