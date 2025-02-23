// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/**
* Default comparison function for numbers.
*
* @param {real} a  The first value.
* @param {real} b  The second value.
* @return {real}   Returns a - b.
*/
function default_compare(a, b) {
    return a - b;
}



/**
* Performs a binary search on a sorted array to find the first index where the element is strictly greater than the target.
*
* @param {array} arr The sorted array to search.
* @param {any} target The target value to compare against.
* @param {function} compare_func (optional) A function that takes two arguments (element, target) and returns:
*         - A positive number if element > target,
*         - 0 if element == target,
*         - A negative number if element < target.
*         If omitted, the default_compare function is used.
* @return {real} The index of the first element greater than target, or array_length(arr) if no such element exists.
*/
function find_first_gt(arr, target, compare_func = default_compare) {
    var low = 0;
    var high = array_length(arr) - 1;
    var result = array_length(arr);
    while (low <= high) {
        var mid = (low + high) div 2;
        if (compare_func(arr[mid], target) > 0) {
            result = mid;
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }
    return result;
}


/**
* Performs a binary search on a sorted array to find the first index where the element is greater than or equal to the target.
*
* @param {array} arr The sorted array to search.
* @param {any} target The target value to compare against.
* @param {function} compare_func (optional) A function that takes two arguments (element, target) and returns:
*         - A positive number if element > target,
*         - 0 if element == target,
*         - A negative number if element < target.
*         If omitted, the default_compare function is used.
* @return {real} The index of the first element greater than or equal to target, or array_length(arr) if no such element exists.
*/
function find_first_ge(arr, target, compare_func = default_compare) {
    var low = 0;
    var high = array_length(arr) - 1;
    var result = array_length(arr);
    while (low <= high) {
        var mid = (low + high) div 2;
        if (compare_func(arr[mid], target) >= 0) {
            result = mid;
            high = mid - 1;
        } else {
            low = mid + 1;
        }
    }
    return result;
}

/**
* Computes the prefix sum of the given array.
*
* @param {Array<real>} arr The input array of numbers.
* @returns {Array<real>} An array of the same length where each element at index i
*                  is the sum of all elements from index 0 to i of the input array.
*/
function prefix_sum(arr) {
    var n = array_length(arr);
    var psum = array_create(n);
    
    if (n > 0) {
        psum[0] = arr[0];
        for (var i = 1; i < n; i++) {
            psum[i] = psum[i - 1] + arr[i];
        }
    }
    
    return psum;
}


