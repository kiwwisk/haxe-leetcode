package;

import Problems;

function test_leetcode_permutations_II() {
	var results:Array<String> = [];

	switch leetcode_permutations_II([1, 1, 2]) {
		case [[1, 1, 2], [1, 2, 1], [2, 1, 1]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_permutations_II([1, 2, 3]) {
		case [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Permutations II : ' + results.join(', '));
}

function test_leetcode_permutations() {
	var results:Array<String> = [];

	switch leetcode_permutations([1, 2, 3]) {
		case [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_permutations([0, 1]) {
		case [[0, 1], [1, 0]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_permutations([1]) {
		case [[1]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Permutations : ' + results.join(', '));
}

function test_leetcode_jump_game_ii() {
	var results:Array<String> = [];

	switch leetcode_jump_game_ii([2, 3, 1, 1, 4]) {
		case 2:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_jump_game_ii([2, 3, 0, 1, 4]) {
		case 2:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_jump_game_ii([3, 2, 1]) {
		case 1:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Jump Game II : ' + results.join(', '));
}

function test_leetcode_wildcard_matching() {
	var results:Array<String> = [];

	switch leetcode_wildcard_matching("mississippi", "m??*ss*?i*pi") {
		case false:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_wildcard_matching("abcabczzzde", "*abc???de*") {
		case true:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_wildcard_matching("abbabaaabbabbaababbabbbbbabbbabbbabaaaaababababbbabababaabbababaabbbbbbaaaabababbbaabbbbaabbbbababababbaabbaababaabbbababababbbbaaabbbbbabaaaabbababbbbaababaabbababbbbbababbbabaaaaaaaabbbbbaabaaababaaaabb",
		"**aa*****ba*a*bb**aa*ab****a*aaaaaa***a*aaaa**bbabb*b*b**aaaaaaaaa*a********ba*bbb***a*ba*bb*bb**a*b*bb") {
		case false:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Wildcard Matching : ' + results.join(', '));
}

function test_leetcode_multiply_strings() {
	var results:Array<String> = [];

	switch leetcode_multiply_strings("2", "3") {
		case "6":
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_multiply_strings("123", "456") {
		case "56088":
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Multiply Strings : ' + results.join(', '));
}

function test_leetcode_trapping_rain_water() {
	var results:Array<String> = [];

	switch leetcode_trapping_rain_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) {
		case 6:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_trapping_rain_water([4, 2, 0, 3, 2, 5]) {
		case 9:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Trapping Rain Water : ' + results.join(', '));
}

function test_leetcode_first_missing_positive() {
	var results:Array<String> = [];

	switch leetcode_first_missing_positive([1, 2, 0]) {
		case 3:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_first_missing_positive([3, 4, -1, 1]) {
		case 2:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_first_missing_positive([7, 8, 9, 11, 12]) {
		case 1:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing First Missing Positive : ' + results.join(', '));
}

function test_leetcode_combination_sum_ii() {
	var results:Array<String> = [];

	switch leetcode_combination_sum_ii([10, 1, 2, 7, 6, 1, 5], 8) {
		case [[1, 1, 6], [1, 2, 5], [1, 7], [2, 6]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_combination_sum_ii([1, 1], 1) {
		case [[1]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_combination_sum_ii([2, 5, 2, 1, 2], 5) {
		case [[1, 2, 2], [5]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Combination Sum II : ' + results.join(', '));
}

function test_leetcode_combination_sum() {
	var results:Array<String> = [];

	switch leetcode_combination_sum([2], 1) {
		case []:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_combination_sum([2, 3, 5], 8) {
		case [[2, 2, 2, 2], [2, 3, 3], [3, 5]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_combination_sum([2, 3, 6, 7], 7) {
		case [[2, 2, 3], [7]]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Combination Sum : ' + results.join(', '));
}

function test_leetcode_count_and_say() {
	var results:Array<String> = [];

	switch leetcode_count_and_say(1) {
		case "1":
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_count_and_say(2) {
		case "11":
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_count_and_say(12) {
		case "3113112221232112111312211312113211":
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Count And Say : ' + results.join(', '));
}

function test_leetcode_sudoku_solver() {
	var results:Array<String> = [];

	final board = [
		["5", "3", ".", ".", "7", ".", ".", ".", "."],
		["6", ".", ".", "1", "9", "5", ".", ".", "."],
		[".", "9", "8", ".", ".", ".", ".", "6", "."],
		["8", ".", ".", ".", "6", ".", ".", ".", "3"],
		["4", ".", ".", "8", ".", "3", ".", ".", "1"],
		["7", ".", ".", ".", "2", ".", ".", ".", "6"],
		[".", "6", ".", ".", ".", ".", "2", "8", "."],
		[".", ".", ".", "4", "1", "9", ".", ".", "5"],
		[".", ".", ".", ".", "8", ".", ".", "7", "9"]
	];

	final solution = [
		["5", "3", "4", "6", "7", "8", "9", "1", "2"],
		["6", "7", "2", "1", "9", "5", "3", "4", "8"],
		["1", "9", "8", "3", "4", "2", "5", "6", "7"],
		["8", "5", "9", "7", "6", "1", "4", "2", "3"],
		["4", "2", "6", "8", "5", "3", "7", "9", "1"],
		["7", "1", "3", "9", "2", "4", "8", "5", "6"],
		["9", "6", "1", "5", "3", "7", "2", "8", "4"],
		["2", "8", "7", "4", "1", "9", "6", "3", "5"],
		["3", "4", "5", "2", "8", "6", "1", "7", "9"]
	];

	leetcode_sudoku_solver(board);

	function _compare(b1, b2) {
		for (i in 0...9)
			for (j in 0...9)
				if (b1[i][j] != b2[i][j])
					return false;
		return true;
	}

	switch _compare(board, solution) {
		case true:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Sudoku Solver : ' + results.join(', '));
}

function test_leetcode_valid_sudoku() {
	var results:Array<String> = [];

	final valid_board = [
		["5", "3", ".", ".", "7", ".", ".", ".", "."],
		["6", ".", ".", "1", "9", "5", ".", ".", "."],
		[".", "9", "8", ".", ".", ".", ".", "6", "."],
		["8", ".", ".", ".", "6", ".", ".", ".", "3"],
		["4", ".", ".", "8", ".", "3", ".", ".", "1"],
		["7", ".", ".", ".", "2", ".", ".", ".", "6"],
		[".", "6", ".", ".", ".", ".", "2", "8", "."],
		[".", ".", ".", "4", "1", "9", ".", ".", "5"],
		[".", ".", ".", ".", "8", ".", ".", "7", "9"]
	];

	final invalid_board = [
		["8", "3", ".", ".", "7", ".", ".", ".", "."],
		["6", ".", ".", "1", "9", "5", ".", ".", "."],
		[".", "9", "8", ".", ".", ".", ".", "6", "."],
		["8", ".", ".", ".", "6", ".", ".", ".", "3"],
		["4", ".", ".", "8", ".", "3", ".", ".", "1"],
		["7", ".", ".", ".", "2", ".", ".", ".", "6"],
		[".", "6", ".", ".", ".", ".", "2", "8", "."],
		[".", ".", ".", "4", "1", "9", ".", ".", "5"],
		[".", ".", ".", ".", "8", ".", ".", "7", "9"]
	];

	switch leetcode_valid_sudoku(valid_board) {
		case true:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_valid_sudoku(invalid_board) {
		case false:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Valid Sudoku : ' + results.join(', '));
}

function test_leetcode_search_insert_position() {
	var results:Array<String> = [];

	switch leetcode_search_insert_position([1, 3, 5, 6], 5) {
		case 2:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_search_insert_position([1, 3, 5, 6], 2) {
		case 1:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_search_insert_position([1, 3, 5, 6], 7) {
		case 4:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_search_insert_position([1, 3, 5, 6], 1) {
		case 0:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Search Insert Position : ' + results.join(', '));
}

function test_leetcode_find_first_and_last_position_of_element_in_sorted_array() {
	var results:Array<String> = [];

	switch leetcode_find_first_and_last_position_of_element_in_sorted_array([5, 7, 7, 8, 8, 10], 8) {
		case [3, 4]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_find_first_and_last_position_of_element_in_sorted_array([5, 7, 7, 8, 8, 10], 6) {
		case [-1, -1]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_find_first_and_last_position_of_element_in_sorted_array([], 6) {
		case [-1, -1]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Find First and Last Position of Element in Sorted Array : ' + results.join(', '));
}

function test_leetcode_search_in_rotated_sorted_array() {
	var results:Array<String> = [];

	switch leetcode_search_in_rotated_sorted_array([4, 5, 6, 7, 0, 1, 2], 0) {
		case 4:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_search_in_rotated_sorted_array([4, 5, 6, 7, 0, 1, 2], 3) {
		case -1:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_search_in_rotated_sorted_array([1], 0) {
		case -1:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_search_in_rotated_sorted_array([4, 5, 6, 7, 8, 1, 2, 3], 8) {
		case 4:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Search in Rotated Sorted Array : ' + results.join(', '));
}

function test_leetcode_longest_valid_parentheses() {
	var results:Array<String> = [];

	switch leetcode_longest_valid_parentheses("(()") {
		case 2:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_longest_valid_parentheses(")()())") {
		case 4:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_longest_valid_parentheses("") {
		case 0:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_longest_valid_parentheses("))((") {
		case 0:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Longest Valid Parentheses : ' + results.join(', '));
}

function test_leetcode_next_permutation() {
	var results:Array<String> = [];

	var tmp = [1, 2, 3];
	leetcode_next_permutation(tmp);
	switch tmp {
		case [1, 3, 2]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	tmp = [2, 3, 1];
	leetcode_next_permutation(tmp);
	switch tmp {
		case [3, 1, 2]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	tmp = [3, 2, 1];
	leetcode_next_permutation(tmp);
	switch tmp {
		case [1, 2, 3]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	tmp = [4, 2, 0, 2, 3, 2, 0];
	leetcode_next_permutation(tmp);
	switch tmp {
		case [4, 2, 0, 3, 0, 2, 2]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Next Permutation : ' + results.join(', '));
}

function test_leetcode_substring_with_concatenation_of_all_words() {
	var results:Array<String> = [];

	switch leetcode_substring_with_concatenation_of_all_words("lingmindraboofooowingdingbarrwingmonkeypoundcake", ["fooo", "barr", "wing", "ding", "wing"]) {
		case [13]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_substring_with_concatenation_of_all_words("aaaaaaaaaaaaaa", ["aa", "aa"]) {
		case [0, 4, 8, 1, 5, 9, 2, 6, 10, 3, 7]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_substring_with_concatenation_of_all_words("ababababab", ["ababa", "babab"]) {
		case [0]:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Divide Two Integers : ' + results.join(', '));
}

function test_leetcode_divide_two_integers() {
	var results:Array<String> = [];

	switch leetcode_divide_two_integers(10, 3) {
		case 3:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_divide_two_integers(7, -3) {
		case -2:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_divide_two_integers(1, -2) {
		case 0:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Divide Two Integers : ' + results.join(', '));
}

function test_leetcode_implement_strstr() {
	var results:Array<String> = [];

	switch leetcode_implement_strstr("hello", "ll") {
		case 2:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_implement_strstr("aaaaa", "bba") {
		case -1:
			results.push('OK');
		case _:
			results.push('Error');
	}

	switch leetcode_implement_strstr("a", "a") {
		case 0:
			results.push('OK');
		case _:
			results.push('Error');
	}

	trace('Testing Implement strStr() : ' + results.join(', '));
}

function test_leetcode_remove_element() {
	var results:Array<String> = [];

	var tmp = [3, 2, 2, 3];

	switch leetcode_remove_element(tmp, 3) {
		case 2:
			if (tmp.slice(0, 2).join(',') == '2,2')
				results.push('OK');
			else
				results.push('Error');
		case _:
			results.push('Error');
	}

	tmp = [0, 1, 2, 2, 3, 0, 4, 2];

	switch leetcode_remove_element(tmp, 2) {
		case 5:
			if (tmp.slice(0, 5).join(',') == '0,1,3,0,4')
				results.push('OK');
			else
				results.push('Error');
		case _:
			results.push('Error');
	}

	trace('Testing Remove Element : ' + results.join(', '));
}

function test_leetcode_remove_duplicates_from_sorted_array() {
	var results:Array<String> = [];

	var tmp = [-1, 0, 0, 0, 0, 3, 3];

	switch leetcode_remove_duplicates_from_sorted_array(tmp) {
		case 3:
			if (tmp.slice(0, 3).join(',') == '-1,0,3')
				results.push('OK');
			else
				results.push('Error');
		case _:
			results.push('Error');
	}

	tmp = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4];

	switch leetcode_remove_duplicates_from_sorted_array(tmp) {
		case 5:
			if (tmp.slice(0, 5).join(',') == '0,1,2,3,4')
				results.push('OK');
			else
				results.push('Error');
		case _:
			results.push('Error');
	}

	trace('Testing Remove Duplicates from Sorted Array : ' + results.join(', '));
}

function test_leetcode_reverse_nodes_in_k_group() {
	var results:Array<String> = [];

	switch ([
		for (v in leetcode_reverse_nodes_in_k_group(ListNode.from_int_array([1, 2, 3, 4, 5]), 2))
			v.val
	]) {
		case [2, 1, 4, 3, 5]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch ([
		for (v in leetcode_reverse_nodes_in_k_group(ListNode.from_int_array([1, 2, 3, 4, 5]), 3))
			v.val
	]) {
		case [3, 2, 1, 4, 5]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch leetcode_reverse_nodes_in_k_group(null, 3) {
		case null:
			results.push('OK');
		case _:
			results.push('Error');
	};

	trace('Testing Reverse Nodes in k-Group : ' + results.join(', '));
}

function test_leetcode_swap_nodes_in_pairs() {
	var results:Array<String> = [];

	switch ([
		for (v in leetcode_swap_nodes_in_pairs(ListNode.from_int_array([1, 2, 3, 4])))
			v.val
	]) {
		case [2, 1, 4, 3]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch ([
		for (v in leetcode_swap_nodes_in_pairs(ListNode.from_int_array([1, 2, 3, 4, 5])))
			v.val
	]) {
		case [2, 1, 4, 3, 5]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch ([
		for (v in leetcode_swap_nodes_in_pairs(ListNode.from_int_array([1])))
			v.val
	]) {
		case [1]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch (leetcode_swap_nodes_in_pairs(null)) {
		case null:
			results.push('OK');
		case _:
			results.push('Error');
	};

	trace('Testing Swap Nodes in Pairs : ' + results.join(', '));
}

function test_leetcode_merge_k_sorted_lists() {
	var results:Array<String> = [];

	final tmp1:Array<ListNode> = [
		ListNode.from_int_array([1, 4, 5]),
		ListNode.from_int_array([1, 3, 4]),
		ListNode.from_int_array([2, 6])
	];

	switch ([for (v in leetcode_merge_k_sorted_lists(tmp1)) v.val]) {
		case [1, 1, 2, 3, 4, 4, 5, 6]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch (leetcode_merge_k_sorted_lists(null)) {
		case null:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch (leetcode_merge_k_sorted_lists([null])) {
		case null:
			results.push('OK');
		case _:
			results.push('Error');
	};

	trace('Testing Merge k Sorted Lists : ' + results.join(', '));
}

function test_leetcode_generate_parentheses() {
	var results:Array<String> = [];

	switch (leetcode_generate_parentheses(3)) {
		case ['((()))', '(()())', '(())()', '()(())', '()()()']:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_generate_parentheses(1)) {
		case ['()']:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Generate Parentheses : ' + results.join(', '));
}

function test_leetcode_merge_two_sorted_lists() {
	var results:Array<String> = [];

	switch ([
		for (v in leetcode_merge_two_sorted_lists(ListNode.from_int_array([1, 2, 4]), ListNode.from_int_array([1, 3, 4])))
			v.val
	]) {
		case [1, 1, 2, 3, 4, 4]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch (leetcode_merge_two_sorted_lists(null, null)) {
		case null:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch ([
		for (v in leetcode_merge_two_sorted_lists(null, ListNode.from_int_array([0])))
			v.val
	]) {
		case [0]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	trace('Testing Merge Two Sorted Lists : ' + results.join(', '));
}

function test_leetcode_valid_parentheses() {
	var results:Array<String> = [];

	switch (leetcode_valid_parentheses("()")) {
		case true:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_valid_parentheses("(]")) {
		case false:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_valid_parentheses("(")) {
		case false:
			results.push("OK");
		case _:
			results.push("Error");
	}

	switch (leetcode_valid_parentheses("(([])){}")) {
		case true:
			results.push("OK");
		case _:
			results.push("Error");
	}

	trace('Testing Valid Parentheses : ' + results.join(', '));
}

function test_leetcode_remove_nth_node_from_end_of_list() {
	var results:Array<String> = [];

	switch ([
		for (v in leetcode_remove_nth_node_from_end_of_list(ListNode.from_int_array([1, 2]), 1))
			v.val
	]) {
		case [1]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch ([
		for (v in leetcode_remove_nth_node_from_end_of_list(ListNode.from_int_array([1, 2]), 2))
			v.val
	]) {
		case [2]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch ([
		for (v in leetcode_remove_nth_node_from_end_of_list(ListNode.from_int_array([1, 2, 3, 4, 5]), 2))
			v.val
	]) {
		case [1, 2, 3, 5]:
			results.push('OK');
		case _:
			results.push('Error');
	};

	switch (leetcode_remove_nth_node_from_end_of_list(ListNode.from_int_array([1]), 1)) {
		case null:
			results.push('OK');
		case _:
			results.push('Error');
	};

	trace('Testing Remove Nth Node From End of List : ' + results.join(', '));
}

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
