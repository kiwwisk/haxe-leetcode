package;

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
