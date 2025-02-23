// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information



/// @function simpson_integration
/// @desc Approximates the integral of a given function f over the interval [a, b] using Simpson's rule.
///       Simpson's rule approximates the area under the curve by using quadratic polynomials.
/// @param f Function The function to integrate. It must accept a single real argument and return a real value.
/// @param a Real The lower bound of the integration interval.
/// @param b Real The upper bound of the integration interval.
/// @param n Integer The number of sub-intervals (must be an even integer) to divide the integration range.
/// @returns Real The approximate value of the integral over [a, b].
function simpson_integration(f, a, b, n) {
    assert (n mod 2 != 0, "n must be even for Simpson's rule")
    
    var h = (b - a) / n;
    var s = f(a) + f(b);
    
    for (var i = 1; i < n; i++) {
        var x_ = a + i * h;
        if (i mod 2 == 0) {
            s += 2 * f(x_);
        } else {
            s += 4 * f(x_);
        }
    }
    
    return s * h / 3;
}



// ---------------------------------------------------------------------
// Simpson Integration Function (returns cumulative data)
// ---------------------------------------------------------------------

/// @function simpson_integration_array
/// @desc Approximates the cumulative integral of a function f over [a, b] using Simpson's rule.
///       Returns a struct containing two arrays:
///         - cum: the cumulative integral values at each partition point.
///         - points: the x-coordinates for each partition point (variable x_ is used).
/// @param {function} f The function (PDF) to integrate.
/// @param {real} a The lower bound.
/// @param {real} b The upper bound.
/// @param {integer} n The number of subintervals (must be even).
/// @returns {struct} A struct with fields "cum" (array) and "points" (array).
function simpson_integration_array(f, a, b, n) {
    // Ensure n is even.
    assert(n mod 2 == 0, "n must be even for Simpson's rule");
    
    var num_points = n + 1;  // There are n+1 points.
    var h = (b - a) / n;
    var cum = array_create(num_points);
    var x_ = array_create(num_points);
    var fx = array_create(num_points);
    
    // Precompute the x_ coordinates and function values.
    for (var i = 0; i < num_points; i++) {
        x_[i] = a + i * h;
        fx[i] = f(x_[i]);
    }
    
    // The cumulative integral at the starting point is zero.
    cum[0] = 0;
    // Process two subintervals at a time.
    for (var i = 2; i < num_points; i += 2) {
        // Simpson's rule over [x_[i-2], x_[i]]:
        var I_pair = (h / 3) * (fx[i - 2] + 4 * fx[i - 1] + fx[i]);
        cum[i] = cum[i - 2] + I_pair;
        // For the intermediate point, use half the increment.
        cum[i - 1] = cum[i - 2] + 0.5 * I_pair;
    }
    
    return { cum: cum, points: x_ };
}
