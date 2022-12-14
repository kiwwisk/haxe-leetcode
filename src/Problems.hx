package;

import haxe.ds.Vector;
import haxe.Exception;

using StringTools;

// https://code.haxe.org/category/data-structures/step-iterator.html
private class StepIterator {
	var end:Int;
	var step:Int;
	var index:Int;

	public inline function new(start:Int, end:Int, step:Int) {
		this.index = start;
		this.end = end;
		this.step = step;
	}

	public inline function hasNext()
		return index < end;

	public inline function next()
		return (index += step) - step;
}

private class ListNodeIterator {
	var l:ListNode;

	public function new(l:ListNode) {
		this.l = l;
	}

	public function hasNext() {
		return this.l != null;
	}

	public function next() {
		var r = this.l;
		this.l = this.l.next;
		return r;
	}
}

class ListNode {
	public var val:Int = 0;
	public var next:ListNode = null;

	public inline function new(val:Int = 0, ?next:ListNode) {
		this.val = val;
		this.next = next;
	}

	public function iterator() {
		return new ListNodeIterator(this);
	}

	public static function from_int_array(a:Array<Int>):ListNode {
		var rv = [for (val in a) new ListNode(val)];
		for (i in 0...rv.length - 1) {
			rv[i].next = rv[i + 1];
		}
		return rv[0];
	}
}

function leetcode_combination_sum_ii(candidates:Array<Int>, target:Int):Array<Array<Int>> {
	// https://leetcode.com/problems/combination-sum-ii/

	candidates.sort((i1, i2) -> i1 - i2);

	final rv:Array<Array<Int>> = [];
	final current:Array<Int> = [];

	final skips:Map<Int, Bool> = [];
	final seen:Map<String, Bool> = [];

	function get_sum(start_index = 0, cur_sum = 0) {
		if (start_index >= candidates.length) {
			skips[current[0]] = true;
			return;
		}

		for (i in start_index...candidates.length) {
			if (skips.exists(candidates[i]))
				continue;

			current.push(candidates[i]);
			final new_sum = cur_sum + candidates[i];

			if (new_sum == target) {
				final s = current.join(',');
				if (!seen.exists(s)) {
					seen[s] = true;
					rv.push(current.copy());
				}
				current.pop();
				break;
			} else if (new_sum < target) {
				get_sum(i + 1, new_sum);
				current.pop();
			} else {
				current.pop();
				break;
			}
		}
	}

	get_sum();
	return rv;
}

function leetcode_permutations_II(nums:Array<Int>):Array<Array<Int>> {
	// https://leetcode.com/problems/permutations-ii/

	final rv:Array<Array<Int>> = [];
	final cnt:Map<Int, Int> = [];

	for (n in nums)
		cnt[n] = cnt.exists(n) ? cnt[n] + 1 : 1;

	// if (cnt.exists(n))
	// 	cnt[n] += 1;
	// else
	// 	cnt[n] = 1;

	function permute(n:Array<Int>) {
		if (n.length == nums.length) {
			rv.push(n);
			return;
		}

		for (k in cnt.keys())
			if (cnt[k] > 0) {
				cnt[k] -= 1;
				permute(n.concat([k]));
				cnt[k] += 1;
			}
	}

	permute([]);
	return rv;
};

function leetcode_permutations(nums:Array<Int>):Array<Array<Int>> {
	// https://leetcode.com/problems/permutations/

	final rv:Array<Array<Int>> = [];

	function _permute(idxs:Array<Int>) {
		if (idxs.length == nums.length) {
			rv.push([for (i in idxs) nums[i]]);
			return;
		}
		for (i in 0...nums.length)
			if (idxs.indexOf(i) == -1)
				_permute(idxs.concat([i]));
	}

	_permute([]);
	return rv;
}

function leetcode_jump_game_ii(nums:Array<Int>):Int {
	// https://leetcode.com/problems/jump-game-ii/

	if (nums.length == 1)
		return 0;

	function _try(idx, steps = 0) {
		if (nums[idx] + idx >= nums.length - 1)
			return steps + 1;

		final slice = nums.slice(idx + 1, idx + 1 + nums[idx]);
		var max_i = 0;
		var max_s = 0;
		for (i in 0...slice.length) {
			final s = slice[i] + idx + 1 + i;
			if (s > max_s) {
				max_s = s;
				max_i = idx + 1 + i;
			}
		}
		return _try(max_i, steps + 1);
	}

	return _try(0);
}

function leetcode_wildcard_matching(s:String, p:String):Bool {
	// https://leetcode.com/problems/wildcard-matching/

	p = ~/\*{2,}/g.replace(p, "*");
	p = p.replace("?", ".") + "$";

	final pats:Array<String> = [];
	final ereg = ~/\*?[^*]+/;
	while (ereg.match(p)) {
		pats.push(ereg.matched(0).replace("*", ".*?"));
		p = ereg.matchedRight();
	}

	var idx = 0;
	for (p in pats) {
		final e = new EReg(p, '');
		if (e.match(s = s.substr(idx)))
			idx += e.matched(0).length;
		else
			return false;
	}

	return true;
}

function leetcode_multiply_strings(num1:String, num2:String):String {
	// https://leetcode.com/problems/multiply-strings/

	final ord_0 = '0'.charCodeAt(0);

	function convert(s:String):Int {
		var val = 0;
		var n = 0;

		var i = s.length;
		while (i-- > 0)
			val += (s.charCodeAt(i) - ord_0) * Std.int(Math.pow(10, n++));

		return val;
	}

	return '${convert(num1) * convert(num2)}';
}

function leetcode_trapping_rain_water(height:Array<Int>):Int {
	// https://leetcode.com/problems/trapping-rain-water/

	var volume = 0;
	var max_left = height[0];
	var max_right = 0;

	var current_max = 0;
	final max_right_heights = new Vector<Int>(height.length);

	var i = height.length;
	while (i-- > 0) {
		if (height[i] > current_max)
			current_max = height[i];
		max_right_heights[i] = current_max;
	}

	for (i in 1...height.length - 1) {
		if (height[i] > max_left)
			max_left = height[i];
		max_right = max_right_heights[i];

		volume += (max_left < max_right ? max_left : max_right) - height[i];
	}

	return volume;
}

function leetcode_first_missing_positive(nums:Array<Int>):Int {
	// https://leetcode.com/problems/first-missing-positive/

	for (i in 0...nums.length)
		if (nums[i] < 0)
			nums[i] = 0;

	// mark [0...len(nums)] with `-` sign that the number is present
	for (i in 0...nums.length) {
		final val = nums[i] < 0 ? -nums[i] : nums[i];

		if ((val >= 1) && (val <= nums.length)) {
			if (nums[val - 1] > 0)
				nums[val - 1] *= -1; // mark it
			else if (nums[val - 1] == 0)
				nums[val - 1] = -(nums.length + 1);
		}
	}

	for (i in 0...nums.length)
		if (nums[i] >= 0)
			return i + 1;

	return nums.length + 1;
}

function leetcode_combination_sum(candidates:Array<Int>, target:Int):Array<Array<Int>> {
	// https://leetcode.com/problems/combination-sum/

	final rv:Array<Array<Int>> = [];
	final current:Array<Int> = [];

	function get_sum(start_index = 0, cur_sum = 0) {
		for (i in start_index...candidates.length) {
			current.push(candidates[i]);

			final new_sum = cur_sum + candidates[i];
			if (new_sum == target)
				rv.push(current.copy());
			else if (new_sum < target)
				get_sum(i, new_sum);

			current.pop();
		}
	}

	get_sum();
	return rv;
}

function leetcode_count_and_say(n:Int):String {
	// https://leetcode.com/problems/count-and-say/

	function get_string(s:String):String {
		if (s.length == 1)
			return '1${s}';

		var out:String = "";
		var start = 0;

		for (i in 1...s.length)
			if (s.charAt(i) != s.charAt(i - 1)) {
				out = '${out}${i - start}${s.charAt(i - 1)}';
				start = i;
			}

		return '${out}${s.length - start}${s.charAt(s.length - 1)}';
	}

	function say(steps:Int, current:String = "1"):String {
		if (steps == 1)
			return current;

		return say(steps - 1, get_string(current));
	}

	return say(n);
}

function leetcode_sudoku_solver(board:Array<Array<String>>):Void {
	// https://leetcode.com/problems/sudoku-solver/

	final numbers = "123456789".split("");

	function _possible(row, column, number) {
		for (i in 0...9)
			if (board[row][i] == number)
				return false;

		for (i in 0...9)
			if (board[i][column] == number)
				return false;

		final r_start = Std.int(row / 3) * 3;
		final c_start = Std.int(column / 3) * 3;

		for (i in r_start...r_start + 3)
			for (j in c_start...c_start + 3)
				if (board[i][j] == number)
					return false;

		return true;
	}

	function _solve() {
		for (row in 0...9)
			for (column in 0...9) {
				if (board[row][column] != ".")
					continue;

				for (number in numbers)
					if (_possible(row, column, number)) {
						board[row][column] = number;
						_solve();
						board[row][column] = ".";
					}
				return; // dead-end
			}

		// all cells are filled, hence solution is found
		throw new Exception('Solution Found');
	}

	try {
		_solve();
	} catch (e) {
		return;
	}
}

function leetcode_valid_sudoku(board:Array<Array<String>>):Bool {
	// https://leetcode.com/problems/valid-sudoku/

	final pat = ~/(\d).*\1/;

	// check rows:
	for (row in board)
		if (pat.match(row.join('')))
			return false;

	// check columns:
	for (c in 0...9)
		if (pat.match([for (r in 0...9) board[r][c]].join('')))
			return false;

	// check 3x3-blocks:
	for (x in new StepIterator(0, 9, 3))
		for (y in new StepIterator(0, 9, 3))
			if (pat.match([for (x1 in x...x + 3) for (y1 in y...y + 3) board[x1][y1]].join('')))
				return false;

	// all ok, return True
	return true;
}

function leetcode_search_insert_position(nums:Array<Int>, target:Int):Int {
	// https://leetcode.com/problems/search-insert-position/

	var left = 0;
	var right = nums.length - 1;

	while (left <= right) {
		final mid = Std.int((left + right) / 2);

		if (nums[mid] == target)
			return mid;

		if (nums[mid] < target)
			left = mid + 1;
		else
			right = mid - 1;
	}

	return left;
}

function leetcode_find_first_and_last_position_of_element_in_sorted_array(nums:Array<Int>, target:Int):Array<Int> {
	// https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

	if (nums.length == 0)
		return [-1, -1];

	// find right
	var left = 0;
	var right = nums.length - 1;

	while (left <= right) {
		final mid = Std.int((left + right) / 2);

		if (target >= nums[mid])
			left = mid + 1;
		else
			right = mid - 1;
	}

	var r_right = left - 1;

	if ((r_right < 0) || (nums[r_right] != target))
		return [-1, -1];

	// find left
	left = 0;
	right = r_right - 1;

	while (left <= right) {
		final mid = Std.int((left + right) / 2);

		if (target > nums[mid])
			left = mid + 1;
		else
			right = mid - 1;
	}

	return [right + 1, r_right];
}

function leetcode_search_in_rotated_sorted_array(nums:Array<Int>, target:Int):Int {
	// https://leetcode.com/problems/search-in-rotated-sorted-array/

	if (nums.length == 1)
		return nums[0] == target ? 0 : -1;

	var left = 0;
	var right = nums.length - 1;

	while (left <= right) {
		final mid = Std.int((left + right) / 2);

		final n_mid = nums[mid];
		final n_left = nums[left];
		final n_right = nums[right];

		if (n_mid == target)
			return mid;
		else if (n_left == target)
			return left;
		else if (n_right == target)
			return right;

		if (n_left > n_right) {
			if (n_mid > n_left) {
				if ((n_left < target) && (target < n_mid))
					right = mid - 1;
				else
					left = mid + 1;
			} else {
				if ((n_mid < target) && (target < n_left))
					left = mid + 1;
				else
					right = mid - 1;
			}
		} else {
			// standard binary search:
			if (n_mid < target)
				left = mid + 1;
			else
				right = mid - 1;
		}
	}

	return -1;
}

function leetcode_longest_valid_parentheses(s:String):Int {
	// https://leetcode.com/problems/longest-valid-parentheses/

	final r1 = ~/\((X*)\)/g;
	final r2 = ~/X+/;

	if (s.length < 2)
		return 0;

	var old_s = s;
	while (true) {
		s = r1.replace(s, 'X$1X');
		if (s == old_s)
			break;
		old_s = s;
	}

	var max = 0;
	while (r2.match(s)) {
		if (r2.matched(0).length > max)
			max = r2.matched(0).length;
		s = r2.matchedRight();
	}
	return max;
}

function leetcode_next_permutation(nums:Array<Int>):Void {
	// https://leetcode.com/problems/next-permutation/

	if (nums.length == 1)
		return;

	var idx = nums.length;
	while (--idx > 0) {
		if (nums[idx - 1] < nums[idx]) {
			var idx2 = nums.length;
			while (--idx2 >= 0)
				if (nums[idx2] > nums[idx - 1])
					break;

			final tmp = nums[idx2];
			nums[idx2] = nums[idx - 1];
			nums[idx - 1] = tmp;

			final a = nums.slice(idx);
			a.sort((i1, i2) -> i1 - i2);
			for (i in idx...nums.length)
				nums[i] = a[i - idx];
			return;
		}
	}

	nums.sort((i1, i2) -> i1 - i2);
}

function leetcode_substring_with_concatenation_of_all_words(s:String, words:Array<String>):Array<Int> {
	// https://leetcode.com/problems/substring-with-concatenation-of-all-words/

	final c:Map<String, Int> = [];

	for (w in words)
		c[w] = c.exists(w) ? c[w] + 1 : 1;

	final word_len = words[0].length;
	final total_len = word_len * words.length;
	final out:Array<Int> = [];

	for (shift in 0...total_len)
		for (sub_word in new StepIterator(shift, s.length - total_len + 1, total_len)) {
			final c2:Map<String, Int> = [];
			var exit = false;

			for (i in 0...words.length) {
				final w = s.substr(sub_word + i * word_len, word_len);
				if (!c.exists(w)) {
					exit = true;
					break;
				}
				c2[w] = c2.exists(w) ? c2[w] + 1 : 1;
			}

			if (exit)
				continue;

			for (k => v in c2)
				if (c[k] - v != 0) {
					exit = true;
					break;
				}

			if (exit)
				continue;

			out.push(sub_word);
		}

	return out;
}

function leetcode_divide_two_integers(dividend:Int, divisor:Int):Int {
	// https://leetcode.com/problems/divide-two-integers/

	final abs_divisor = Std.int(Math.abs(divisor));
	final abs_dividend = Std.int(Math.abs(dividend));

	if (abs_divisor > abs_dividend)
		return 0;

	final sign1 = dividend < 0 ? 1 : 0;
	final sign2 = divisor < 0 ? 1 : 0;

	var i = 0;
	while ((abs_divisor << (i + 1)) < abs_dividend)
		i += 1;

	var r = Std.int(Math.pow(2, i)) + leetcode_divide_two_integers(abs_dividend - (abs_divisor << i), abs_divisor);
	r = (sign1 ^ sign2) > 0 ? -r : r;

	if (r > 2147483647)
		return 2147483647;
	else if (r < -2147483648)
		return -2147483648;

	return r;
}

function leetcode_implement_strstr(haystack:String, needle:String):Int {
	// https://leetcode.com/problems/implement-strstr/

	final n = needle.length;

	if (n == 0)
		return 0;

	if (n > haystack.length)
		return -1;

	for (i in 0...haystack.length - n + 1)
		if (haystack.substr(i, n) == needle)
			return i;

	return -1;
}

function leetcode_remove_element(nums:Array<Int>, val:Int):Int {
	// https://leetcode.com/problems/remove-element/

	var i = 0;
	for (n in nums)
		if (n != val)
			nums[i++] = n;

	return i;
}

function leetcode_remove_duplicates_from_sorted_array(nums:Array<Int>):Int {
	// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

	final m:Map<Int, Bool> = [];
	for (n in nums)
		m[n] = true;

	final keys = [for (k in m.keys()) k];
	keys.sort((i1, i2) -> i1 - i2);

	var i = 0;
	for (key in keys)
		nums[i++] = key;

	return i;
}

function leetcode_reverse_nodes_in_k_group(?head:ListNode, k:Int):Null<ListNode> {
	// https://leetcode.com/problems/reverse-nodes-in-k-group/

	final lst:Array<ListNode> = [];
	var cur = head;
	while (cur != null) {
		lst.push(cur);
		cur = cur.next;
	}

	if (lst.length == 0)
		return null;

	if (lst.length == 1)
		return head;

	for (i in 0...Math.floor(lst.length / k)) {
		final _from = i * k;
		final _to = (i + 1) * k;

		final slice = [for (node in lst.slice(_from, _to)) node.val];
		slice.reverse();
		for (idx => val in slice)
			lst[_from + idx].val = val;
	}

	return head;
}

function leetcode_swap_nodes_in_pairs(?head:ListNode):Null<ListNode> {
	// https://leetcode.com/problems/swap-nodes-in-pairs/

	final lst:Array<ListNode> = [];
	var cur = head;
	while (cur != null) {
		lst.push(cur);
		cur = cur.next;
	}

	if (lst.length == 0)
		return null;

	if (lst.length == 1)
		return head;

	for (i in 0...Math.floor(lst.length / 2)) {
		var _i = i * 2;
		var tmp = lst[_i + 1].val;
		lst[_i + 1].val = lst[_i].val;
		lst[_i].val = tmp;
	}

	return head;
}

function leetcode_merge_k_sorted_lists(lists:Array<ListNode>):Null<ListNode> {
	// https://leetcode.com/problems/merge-k-sorted-lists/

	if (lists == null)
		return null;

	final lst:Array<ListNode> = [];

	for (l in lists)
		while (l != null) {
			lst.push(l);
			l = l.next;
		}

	if (lst.length == 0)
		return null;

	if (lst.length == 1)
		return lst[0];

	lst.sort((node1, node2) -> node1.val - node2.val);

	for (i in 1...lst.length)
		lst[i - 1].next = lst[i];

	lst[lst.length - 1].next = null;

	return lst[0];
}

function leetcode_generate_parentheses(n:Int):Array<String> {
	// https://leetcode.com/problems/generate-parentheses/

	final current:Array<String> = [];

	function _generate(s:String, opening:Int, closing:Int) {
		if (closing == n) {
			current.push(s);
			return;
		}

		if (opening < n)
			_generate('${s}(', opening + 1, closing);

		if (closing < opening)
			_generate('${s})', opening, closing + 1);
	}

	_generate("(", 1, 0);
	return current;
}

function leetcode_merge_two_sorted_lists(list1:ListNode, list2:ListNode):Null<ListNode> {
	// https://leetcode.com/problems/merge-two-sorted-lists/

	final lst:Array<ListNode> = [];

	while (list1 != null) {
		lst.push(list1);
		list1 = list1.next;
	}

	while (list2 != null) {
		lst.push(list2);
		list2 = list2.next;
	}

	if (lst.length == 0)
		return null;

	lst.sort((node1, node2) -> node1.val - node2.val);

	for (i in 1...lst.length)
		lst[i - 1].next = lst[i];

	lst[lst.length - 1].next = null;

	return lst[0];
}

function leetcode_valid_parentheses(s:String):Bool {
	// https://leetcode.com/problems/valid-parentheses/

	final m = ["(" => ")", "{" => "}", "[" => "]"];
	final inv_m = [")" => "(", "}" => "{", "]" => "["];

	final opening:Array<String> = [];

	for (ch in s.split(""))
		if (m.exists(ch))
			opening.push(ch);
		else if ((opening.length == 0) || (opening.pop() != inv_m[ch]))
			return false;

	return opening.length == 0;
}

function leetcode_remove_nth_node_from_end_of_list(head:ListNode, n:Int):Null<ListNode> {
	// https://leetcode.com/problems/remove-nth-node-from-end-of-list/

	var cur = head;
	var nodes:Array<ListNode> = [];

	while (cur != null) {
		nodes.push(cur);
		cur = cur.next;
	}

	if (nodes.length == 1)
		return null;

	if (nodes.length == n)
		return head.next;

	nodes[nodes.length - n - 1].next = nodes[nodes.length - n].next;

	return head;
}

function leetcode_4sum(nums:Array<Int>, target:Int):Array<String> {
	// https://leetcode.com/problems/4sum/

	final sum2:Map<Int, Array<Array<Int>>> = [];
	final cnt:Map<Int, Int> = [];
	final out:Map<String, Bool> = [];

	for (n in nums)
		cnt.exists(n) ? cnt[n] += 1 : cnt[n] = 1;

	for (i in cnt.keys())
		for (j in cnt.keys()) {
			final tmp = i + j;
			sum2.exists(tmp) ? sum2[tmp].push([i, j]) : sum2[tmp] = [[i, j]];
		}

	for (k => v in sum2) {
		if (!sum2.exists(target - k))
			continue;

		for (a_b in v) {
			for (c_d in sum2[target - k]) {
				cnt[a_b[0]] -= 1;
				cnt[a_b[1]] -= 1;
				cnt[c_d[0]] -= 1;
				cnt[c_d[1]] -= 1;

				if ((cnt[a_b[0]] >= 0) && (cnt[a_b[1]] >= 0) && (cnt[c_d[0]] >= 0) && (cnt[c_d[1]] >= 0)) {
					final tmp = [a_b[0], a_b[1], c_d[0], c_d[1]];
					tmp.sort((i1, i2) -> i1 - i2);

					out[tmp.join('|')] = true;
				}

				cnt[a_b[0]] += 1;
				cnt[a_b[1]] += 1;
				cnt[c_d[0]] += 1;
				cnt[c_d[1]] += 1;
			}
		}
	}

	return [for (k in out.keys()) k];
}

function leetcode_letter_combinations_of_a_phone_number(digits:String):Array<String> {
	// https://leetcode.com/problems/letter-combinations-of-a-phone-number/

	final mapping = [
		'2' => ['a', 'b', 'c'],
		'3' => ['d', 'e', 'f'],
		'4' => ['g', 'h', 'i'],
		'5' => ['j', 'k', 'l'],
		'6' => ['m', 'n', 'o'],
		'7' => ['p', 'q', 'r', 's'],
		'8' => ['t', 'u', 'v'],
		'9' => ['w', 'x', 'y', 'z']
	];

	if (digits.length == 0)
		return [];

	if (digits.length == 1)
		return mapping[digits];

	var stack = digits.split('');
	stack.reverse();

	var out = mapping[stack.pop()];

	while (stack.length > 0)
		out = [for (ch in mapping[stack.pop()]) for (v in out) v + ch];

	return out;
}

function leetcode_3sum_closest(nums:Array<Int>, target:Int):Int {
	// https://leetcode.com/problems/3sum-closest/

	if (nums.length == 3) {
		var sum = 0;
		for (n in nums)
			sum += n;
		return sum;
	}

	nums.sort((i1, i2) -> i1 - i2);

	var diff = Math.POSITIVE_INFINITY;
	var ans = 0;

	for (i in 0...nums.length - 2) {
		if ((i != 0) && (nums[i] == nums[i - 1]))
			continue;

		var left = i + 1;
		var right = nums.length - 1;
		final n1 = nums[i];

		while (left < right) {
			final tmp = n1 + nums[left] + nums[right];
			final curr_diff = Std.int(Math.abs(target - tmp));

			if (curr_diff < diff) {
				diff = curr_diff;
				ans = tmp;
			}

			tmp > target ? right -= 1 : left += 1;
		}
	}

	return ans;
}

function leetcode_3sum(nums:Array<Int>):Array<String> {
	// https://leetcode.com/problems/3sum/

	final m:Map<Int, Int> = [];
	final rv:Map<String, Bool> = [];

	for (n in nums)
		m.exists(n) ? m[n] += 1 : m[n] = 1;

	for (n1 in m.keys()) {
		m[n1] -= 1;

		for (n2 in m.keys()) {
			var n3 = (-n1 - n2);

			if (!m.exists(n3))
				continue;

			m[n2] -= 1;
			m[n3] -= 1;

			if ((m[n2] < 0) || (m[n3] < 0)) {
				m[n2] += 1;
				m[n3] += 1;
				continue;
			}

			m[n2] += 1;
			m[n3] += 1;

			// sorting:
			var on1 = n1;

			if (n1 > n2) {
				var tmp = n1;
				n1 = n2;
				n2 = tmp;
			}

			if (n2 > n3) {
				var tmp = n2;
				n2 = n3;
				n3 = tmp;
			}

			if (n1 > n2) {
				var tmp = n1;
				n1 = n2;
				n2 = tmp;
			}

			rv[[n1, n2, n3].join(',')] = true;

			n1 = on1;
		}

		m[n1] += 1;
	}

	return [for (k in rv.keys()) k];
}

function leetcode_longest_common_prefix(strs:Array<String>):String {
	// https://leetcode.com/problems/longest-common-prefix/

	strs.sort((a, b) -> a.length - b.length);

	for (i in 0...strs[0].length) {
		var prev_char = '';
		for (str in strs) {
			final ch = str.charAt(i);
			if (prev_char == '')
				prev_char = ch;
			else if (prev_char != ch)
				return strs[0].substr(0, i);
		}
		prev_char = '';
	}

	return strs[0];
}

function leetcode_roman_to_integer(s:String):Int {
	// https://leetcode.com/problems/roman-to-integer/

	final m = ['M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50, 'X' => 10, 'V' => 5, 'I' => 1];
	final nums:Array<Int> = [];
	var chars = s.split('');

	while (chars.length > 0) {
		final num = m[chars[0]];
		chars = chars.slice(1);

		if ((nums.length > 0) && (nums[nums.length - 1] < num))
			nums.push(num - nums.pop());
		else
			nums.push(num);
	}

	var sum = 0;
	for (val in nums)
		sum += val;
	return sum;
}

function leetcode_integer_to_roman(num:Int):String {
	// https://leetcode.com/problems/integer-to-roman/

	var rv = '';
	var i = Math.floor(num / 1000);

	rv = [for (_ in 0...i) 'M'].join('');
	num -= i * 1000;

	if (num >= 900) {
		rv = '${rv}CM';
		num -= 900;
	}

	i = Math.floor(num / 500);
	rv = '${rv}${[for (_ in 0...i) 'D'].join('')}';
	num -= i * 500;

	if (num >= 400) {
		rv = '${rv}CD';
		num -= 400;
	}

	i = Math.floor(num / 100);
	rv = '${rv}${[for (_ in 0...i) 'C'].join('')}';
	num -= i * 100;

	if (num >= 90) {
		rv = '${rv}XC';
		num -= 90;
	}

	i = Math.floor(num / 50);
	rv = '${rv}${[for (_ in 0...i) 'L'].join('')}';
	num -= i * 50;

	if (num >= 40) {
		rv = '${rv}XL';
		num -= 40;
	}

	i = Math.floor(num / 10);
	rv = '${rv}${[for (_ in 0...i) 'X'].join('')}';
	num -= i * 10;

	if (num == 9) {
		rv = '${rv}IX';
		num -= 9;
	}

	if (num >= 5) {
		rv = '${rv}V';
		num -= 5;
	}

	if (num == 4) {
		rv = '${rv}IV';
		num -= 4;
	}

	return '${rv}${[for (_ in 0...num) 'I'].join('')}';
}

function leetcode_container_with_most_water(height:Array<Int>):Int {
	// https://leetcode.com/problems/container-with-most-water/

	var left = 0;
	var right = height.length - 1;

	var current = (right - left) * Std.int(Math.min(height[left], height[right]));

	while (right > left) {
		if (height[left] > height[right])
			right -= 1;
		else
			left += 1;

		current = Std.int(Math.max(current, (right - left) * Math.min(height[left], height[right])));
	}

	return current;
}

function leetcode_regular_expression_matching(s:String, p:String):Bool {
	// https://leetcode.com/problems/regular-expression-matching/

	return new EReg('^${p}$', '').match(s);
}

function leetcode_palindrome_number(x:Int):Bool {
	// https://leetcode.com/problems/palindrome-number/

	var s = '${x}';
	var rev_s = s.split('');
	rev_s.reverse();

	return rev_s.join('') == s;
}

function leetcode_string_to_integer_atoi(s:String):Int {
	// https://leetcode.com/problems/string-to-integer-atoi/

	var pat = ~/\s*([+-]?\d+)/;

	if (pat.match(s)) {
		var x = Std.parseInt(pat.matched(1));
		if (x < -2147483648)
			return -2147483648;
		if (x > 2147483647)
			return 2147483647;
		return x;
	}

	return 0;
}

function leetcode_reverse_integer(x:Int):Int {
	// https://leetcode.com/problems/reverse-integer/

	var s = '${Math.abs(x)}'.split('');
	s.reverse();

	var new_x = Std.parseInt(s.join('')) * ((x < 0) ? -1 : 1);

	if ((new_x < -2147483648) || (new_x >= 2147483648))
		return 0;

	return new_x;
}

function leetcode_zigzag_conversion(s:String, num_rows:Int):String {
	// https://leetcode.com/problems/zigzag-conversion/

	if (num_rows == 1)
		return s;

	var rows:Array<Array<String>> = [];
	var increase = 1;
	var y = 0;

	for (ch in s.split("")) {
		if (rows[y] == null)
			rows[y] = [];

		rows[y].push(ch);

		y += increase;

		if ((y == 0) || (y == num_rows - 1))
			increase = -increase;
	}

	return [for (row in rows) row.join('')].join('');
}

function leetcode_longest_palindromic_substring(s:String):String {
	// https://leetcode.com/problems/longest-palindromic-substring/

	if (s.length == 1)
		return s;

	var m:Map<String, Array<Int>> = [];
	var rv:String = '';

	for (idx => ch in s.split('')) {
		if (m.exists(ch))
			m[ch].push(idx);
		else
			m[ch] = [idx];
	}

	for (idxs in m) {
		for (i => i1 in idxs) {
			for (j in i...idxs.length) {
				if (idxs[j] - i1 + 1 < rv.length)
					continue;

				var w = s.substr(i1, idxs[j] - i1 + 1);
				if (w.length > rv.length) {
					var rw = w.split('');
					rw.reverse();

					if (w == rw.join(''))
						rv = w;
				}
			}
		}
	}
	return rv;
}

function leetcode_median_of_two_sorted_arrays(m:Array<Int>, n:Array<Int>):Float {
	// https://leetcode.com/problems/median-of-two-sorted-arrays/

	var merged = m.concat(n);

	merged.sort((a, b) -> a - b);

	if (merged.length % 2 == 0) {
		return (merged[Std.int(merged.length / 2) - 1] + merged[Std.int(merged.length / 2)]) / 2.0;
	}

	return merged[Std.int(merged.length / 2)];
}

function leetcode_longest_substring_without_repeating_characters(s:String):Int {
	// https://leetcode.com/problems/longest-substring-without-repeating-characters/

	var seen:Map<String, Int> = [];
	var start = 0;
	var mx = 0;

	for (idx => ch in s.split('')) {
		if (seen.exists(ch)) {
			var tmp = seen[ch];
			if (tmp >= start)
				start = tmp + 1;
		}
		seen[ch] = idx;

		if (idx - start + 1 > mx)
			mx = idx - start + 1;
	}

	return mx;
}

function leetcode_two_sum(lst:Array<Int>, target:Int):Array<Int> {
	// https://leetcode.com/problems/two-sum/

	var seen:Map<Int, Int> = [];

	for (idx => val in lst) {
		if (seen.exists(target - val)) {
			return [seen[target - val], idx];
		}
		seen[val] = idx;
	}

	return [-1, -1]; // error!
}

function leetcode_add_two_numbers(l1:ListNode, l2:ListNode):ListNode {
	var n1:Array<Int> = [];
	var n2:Array<Int> = [];

	for (n in l1) {
		n1.push(n.val);
	}

	for (n in l2) {
		n2.push(n.val);
	}

	n1.reverse();
	n2.reverse();

	var ns1 = Std.parseInt(n1.join(''));
	var ns2 = Std.parseInt(n2.join(''));

	var arr_ch = '${ns1 + ns2}'.split('');
	arr_ch.reverse();

	return ListNode.from_int_array([for (ch in arr_ch) Std.parseInt(ch)]);
}
