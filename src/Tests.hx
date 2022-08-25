package;

import Problems;

function test_leetcode_4sum() {
	var results:Array<String> = [];

	switch (leetcode_4sum([1, 0, -1, 0, -2, 2], 0)) {
		case ['-2|0|0|2', '-1|0|0|1', '-2|-1|1|2']:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_4sum([2, 2, 2, 2, 2], 8)) {
		case ['2|2|2|2']:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing 4Sum : ' + results.join(', '));
}

function test_leetcode_letter_combinations_of_a_phone_number() {
	var results:Array<String> = [];

	switch (leetcode_letter_combinations_of_a_phone_number("23")) {
		case ['ad', 'bd', 'cd', 'ae', 'be', 'ce', 'af', 'bf', 'cf']:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_letter_combinations_of_a_phone_number("")) {
		case []:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_letter_combinations_of_a_phone_number("2")) {
		case ["a", "b", "c"]:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Letter Combinations of a Phone Number : ' + results.join(', '));
}

function test_leetcode_3sum_closest() {
	var results:Array<String> = [];

	final tmp = [
		40, -53, 36, 89, -38, -51, 80, 11, -10, 76, -30, 46, -39, -15, 4, 72, 83, -25, 33, -69, -73, -100, -23, -37, -13, -62, -26, -54, 36, -84, -65, -51,
		11, 98, -21, 49, 51, 78, -58, -40, 95, -81, 41, -17, -70, 83, -88, -14, -75, -10, -44, -21, 6, 68, -81, -1, 41, -61, -82, -24, 45, 19, 6, -98, 11, 9,
		-66, 50, -97, -2, 58, 17, 51, -13, 88, -16, -77, 31, 35, 98, -2, 0, -70, 6, -34, -8, 78, 22, -1, -93, -39, -88, -77, -65, 80, 91, 35, -15, 7, -37,
		-96, 65, 3, 33, -22, 60, 1, 76, -32, 22
	];

	switch (leetcode_3sum_closest(tmp, 292)) {
		case 291:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_3sum_closest([-1, 2, 1, -4], 1)) {
		case 2:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_3sum_closest([0, 0, 0], 1)) {
		case 0:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing 3Sum closest : ' + results.join(', '));
}

function test_leetcode_3sum() {
	var results:Array<String> = [];

	switch (leetcode_3sum([-1, 0, 1, 2, -1, -4])) {
		case ['-1,0,1', '-1,-1,2']:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_3sum([-4, -2, -2, -2, 0, 1, 2, 2, 2, 3, 3, 4, 4, 6, 6])) {
		case ['-2,-2,4', '-4,-2,6', '-2,0,2', '-4,2,2', '-4,1,3', '-4,0,4']:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing 3Sum : ' + results.join(', '));
}

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
