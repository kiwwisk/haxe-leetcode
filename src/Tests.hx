package;

import Problems;

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
