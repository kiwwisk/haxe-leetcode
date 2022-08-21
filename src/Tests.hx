package;

import Problems;

function test_leetcode_longest_common_prefix() {
	var results:Array<String> = [];

	switch (leetcode_longest_common_prefix(["flower", "flow", "flight"])) {
		case "fl":
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_longest_common_prefix(["dog", "racecar", "car"])) {
		case "":
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_longest_common_prefix(["ab", "a"])) {
		case "a":
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_longest_common_prefix(["a"])) {
		case "a":
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Longest common prefix : ' + results.join(', '));
}

function test_leetcode_roman_to_integer() {
	var results:Array<String> = [];

	switch (leetcode_roman_to_integer("MCMXCIV")) {
		case 1994:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_roman_to_integer("LVIII")) {
		case 58:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_roman_to_integer("III")) {
		case 3:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Roman to integer : ' + results.join(', '));
}

function test_leetcode_integer_to_roman() {
	var results:Array<String> = [];

	switch (leetcode_integer_to_roman(1994)) {
		case "MCMXCIV":
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_integer_to_roman(58)) {
		case "LVIII":
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_integer_to_roman(3)) {
		case "III":
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_integer_to_roman(2022)) {
		case "MMXXII":
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_integer_to_roman(3504)) {
		case "MMMDIV":
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Integer to Roman : ' + results.join(', '));
}

function test_leetcode_container_with_most_water() {
	var results:Array<String> = [];

	switch (leetcode_container_with_most_water([1, 8, 6, 2, 5, 4, 8, 3, 7])) {
		case 49:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_container_with_most_water([1, 2, 4, 3])) {
		case 4:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Container with most water : ' + results.join(', '));
}

function test_leetcode_regular_expression_matching() {
	var results:Array<String> = [];

	switch (leetcode_regular_expression_matching("aa", "a")) {
		case false:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_regular_expression_matching("aa", "a*")) {
		case true:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_regular_expression_matching("ab", ".*")) {
		case true:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Regular expression matching : ' + results.join(', '));
}

function test_leetcode_palindrome_number() {
	var results:Array<String> = [];

	switch (leetcode_palindrome_number(121)) {
		case true:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_palindrome_number(-121)) {
		case false:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_palindrome_number(10)) {
		case false:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Palindrome number : ' + results.join(', '));
}

function test_leetcode_string_to_integer_atoi() {
	var results:Array<String> = [];

	switch (leetcode_string_to_integer_atoi("    -42")) {
		case -42:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_string_to_integer_atoi("4193 with words")) {
		case 4193:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing String to integer (atoi) : ' + results.join(', '));
}

function test_leetcode_reverse_integer() {
	var results:Array<String> = [];

	switch (leetcode_reverse_integer(123)) {
		case 321:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_reverse_integer(-123)) {
		case -321:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_reverse_integer(120)) {
		case 21:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Leetcode reverse integer : ' + results.join(', '));
}

function test_leetcode_zigzag_conversion() {
	var results:Array<String> = [];

	switch (leetcode_zigzag_conversion("PAYPALISHIRING", 3)) {
		case "PAHNAPLSIIGYIR":
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_zigzag_conversion("PAYPALISHIRING", 4)) {
		case "PINALSIGYAHRPI":
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Leetcode zigzag conversion : ' + results.join(', '));
}

function test_leetcode_longest_palindromic_substring() {
	var results:Array<String> = [];

	switch (leetcode_longest_palindromic_substring("babad")) {
		case "bab" | "aba":
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch (leetcode_longest_palindromic_substring("cbbd")) {
		case "bb":
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch (leetcode_longest_palindromic_substring("axxxbbccxxxx")) {
		case "xxxx":
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Leetcode longest palindromic substring : ' + results.join(', '));
}

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
