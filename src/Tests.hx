package;

import Problems;

function test_leetcode_median_of_two_sorted_arrays() {
	var results:Array<String> = [];

	switch (leetcode_median_of_two_sorted_arrays([1, 3], [2])) {
		case 2.0:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch (leetcode_median_of_two_sorted_arrays([1, 2], [3, 4])) {
		case 2.5:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Leetcode Median of two sorted arrays : ' + results.join(', '));
}

function test_leetcode_longest_substring_without_repeating_characters():Void {
	var results:Array<String> = [];

	switch (leetcode_longest_substring_without_repeating_characters("au")) {
		case 2:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch (leetcode_longest_substring_without_repeating_characters(" ")) {
		case 1:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch (leetcode_longest_substring_without_repeating_characters("abcabcbb")) {
		case 3:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch (leetcode_longest_substring_without_repeating_characters("pwwkew")) {
		case 3:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch (leetcode_longest_substring_without_repeating_characters("bbbbb")) {
		case 1:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Leetcode Substring without repeating characters : ' + results.join(', '));
}

function test_leetcode_two_sum():Void {
	var results:Array<String> = [];

	switch (leetcode_two_sum([3, 2, 4], 6)) {
		case [1, 2]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch (leetcode_two_sum([3, 3], 6)) {
		case [0, 1]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Leetcode Two Sums : ' + results.join(', '));
}

function test_add_two_numbers() {
	var n1 = ListNode.from_int_array([2, 4, 3]);
	var n2 = ListNode.from_int_array([5, 6, 4]);
	var results:Array<String> = [];

	switch ([for (v in leetcode_add_two_numbers(n1, n2)) v.val]) {
		case [7, 0, 8]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	trace('Testing Leetcode Add Two Numbers : ' + results.join(', '));
}
