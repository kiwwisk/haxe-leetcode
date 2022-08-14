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

	var ns1 = Std.parseInt(n1.map(val -> '$val').join(''));
	var ns2 = Std.parseInt(n2.map(val -> '$val').join(''));

	var arr_ch = '${ns1 + ns2}'.split('');
	arr_ch.reverse();

	return ListNode.from_int_array([for (ch in arr_ch) Std.parseInt(ch)]);
}
