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
