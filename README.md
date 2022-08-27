# haxe-leetcode
Leetcode problems solved in Haxe language


## Solution 1

https://leetcode.com/problems/two-sum/

### Solution in Python

```py
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = {}
        for i, v in enumerate(nums):
            if target - v in seen:
                return [seen[target-v], i]
            seen[v] = i
```

## Solution 2

https://leetcode.com/problems/add-two-numbers/

### Solution in Python

```py
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:

    @staticmethod
    def list_nodes_from_iterable(it):
        nodes = [ListNode(v) for v in it]
        for n1, n2 in zip(nodes, nodes[1:]):
            n1.next = n2
        return nodes[0]

    def addTwoNumbers(self, l1: ListNode, l2: ListNode) -> ListNode:
        n1 = ''
        while l1:
            n1 += str(l1.val)
            l1 = l1.next

        n2 = ''
        while l2:
            n2 += str(l2.val)
            l2 = l2.next

        val = str(int(n1[::-1]) + int(n2[::-1]))[::-1]

        return Solution.list_nodes_from_iterable(val)
```

## Solution 3

https://leetcode.com/problems/longest-substring-without-repeating-characters/


### Solution in Python

```py
class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        seen = {}
        start = 0
        mx = 0

        for idx, ch in enumerate(s):
            if ch in seen:
                tmp = seen[ch]
                if tmp >= start:
                    start = tmp + 1

            seen[ch] = idx

            if (v:=idx - start + 1) > mx:
                mx = v

        return mx
```

## Solution 4

https://leetcode.com/problems/median-of-two-sorted-arrays/

### Solution in Python

```py
class Solution:
    def findMedianSortedArrays(self, nums1: List[int], nums2: List[int]) -> float:
        nums1.extend(nums2)
        nums1.sort()

        if len(nums1) % 2 != 0:
            return nums1[len(nums1) // 2]

        return (nums1[len(nums1) // 2 - 1] + nums1[len(nums1) // 2]) / 2
```

## Solution 5

https://leetcode.com/problems/longest-palindromic-substring/

### Solution in Python

```py
class Solution:
    def longestPalindrome(self, s: str) -> str:
        if len(s) == 1:
            return s

        rv = ''
        m = {}
        for i, ch in enumerate(s):
            m.setdefault(ch, []).append(i)

        for ch, idxs in m.items():
            for i, i1 in enumerate(idxs):
                for j in range(i, len(idxs)):
                    w = s[i1:idxs[j]+1]
                    if len(w) > len(rv) and w == w[::-1]:
                        rv = w

        return rv
```

## Solution 6

https://leetcode.com/problems/zigzag-conversion/

### Solution in Python

```py
class Solution:
    def convert(self, s: str, numRows: int) -> str:
        if numRows == 1:
            return s

        rows, increase, y = [[] for _ in range(numRows)], 1, 0
        for ch in s:
            rows[y].append(ch)

            y += increase

            if y == 0 or y == numRows - 1:
                increase = -increase

        return ''.join(''.join(row) for row in rows)
```

## Solution 7

https://leetcode.com/problems/reverse-integer/

### Solution in Python

```py
class Solution:
    def reverse(self, x: int) -> int:
        num = int(str(abs(x))[::-1])*(-1 if x < 0 else 1)
        if  -2147483648 <= num < 2147483648:
            return num
        return 0
```

## Solution 8

https://leetcode.com/problems/string-to-integer-atoi/

### Solution in Python

```py
import re

pat = re.compile(r'\s*([+-]?\d+)')

class Solution:
    def myAtoi(self, s: str) -> int:
        m = pat.match(s)
        if m:
            s = int(m[1])
            if (s < -2**31):
                return -2**31
            if (s > 2**31 - 1):
                return 2**31 - 1
            return s
        return 0
```

## Solution 9

https://leetcode.com/problems/palindrome-number/

### Solution in Python

```py
class Solution:
    def isPalindrome(self, x: int) -> bool:
        return str(x)[::-1] == str(x)
```

## Solution 10

https://leetcode.com/problems/regular-expression-matching/

### Solution in Python

```py
import re

class Solution:
    def isMatch(self, s: str, p: str) -> bool:
        return bool(re.match(p + '$', s))
```

## Solution 11

https://leetcode.com/problems/container-with-most-water/

### Solution in Python

```py
class Solution:
    def maxArea(self, height):
        left, right = 0, len(height)-1
        current = (right - left) * min(height[left], height[right])

        while right > left:

            if height[left] > height[right]:
                right -= 1
            else:
                left += 1

            current = max(current, (right - left) * min(height[left], height[right]))

        return current
```

## Solution 12

https://leetcode.com/problems/integer-to-roman/

### Solution in Python

```py
class Solution:
    def intToRoman(self, num: int) -> str:
        rv = ''

        i = num // 1000
        rv = 'M'*i + rv
        num -= i*1000

        if (num >= 900):
            rv = rv + 'CM'
            num -= 900

        i = num // 500
        rv = rv + 'D'*i
        num -= i*500

        if (num >= 400):
            rv = rv + 'CD'
            num -= 400

        i = num // 100
        rv = rv + 'C'*i
        num -= i*100

        if (num >= 90):
            rv = rv + 'XC'
            num -= 90

        i = num // 50
        rv = rv + 'L'*i
        num -= i*50

        if (num >= 40):
            rv = rv + 'XL'
            num -= 40

        i = num // 10
        rv = rv + 'X'*i
        num -= i*10

        if (num == 9):
            rv = rv + 'IX'
            num -= 9

        if (num >= 5):
            rv = rv + 'V'
            num -= 5

        if (num == 4):
            rv = rv + 'IV'
            num -= 4

        rv = rv + 'I'*num

        return rv
```

## Solution 13

https://leetcode.com/problems/roman-to-integer/

### Solution in Python

```py
m = {'M':1000, 'D':500, 'C':100, 'L':50, 'X':10, 'V':5, 'I':1}

class Solution:

    def romanToInt(self, s: str) -> int:
        nums = []

        while s:
            num, *s = s
            num = m[num]

            if nums and nums[-1] < num:
                nums.append(num - nums.pop())
            else:
                nums.append(num)

        return sum(nums)
```

## Solution 14

https://leetcode.com/problems/longest-common-prefix/

### Solution in Python

```py
class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        for i, ch in enumerate(zip(*strs)):
            if len(set(ch)) != 1:
                return strs[0][:i]

        return min(strs, key=len)
```

## Solution 15

https://leetcode.com/problems/3sum/

### Solution in Python

```py
class Solution:
    def threeSum(self, nums):

        m = {}
        for n in nums:
            m[n] = m.get(n, 0) + 1

        rv = set()

        for n1 in m:
            m[n1] -= 1

            for n2 in m:
                n3 = (-n1-n2)
                if n3 not in m:
                    continue

                m[n2] -= 1
                m[n3] -= 1

                if m[n2] < 0 or m[n3] < 0:
                    m[n2] += 1
                    m[n3] += 1
                    continue

                m[n2] += 1
                m[n3] += 1

                on1 = n1

                if n1 > n2:
                    n1, n2 = n2, n1

                if n2 > n3:
                    n2, n3 = n3, n2

                if n1 > n2:
                    n1, n2 = n2, n1

                vals = (n1, n2, n3)
                rv.add(vals)

                n1 = on1

            m[n1] += 1

        return rv
```

## Solution 16

https://leetcode.com/problems/3sum-closest/

### Solution in Python

```py
class Solution:

    def threeSumClosest(self, nums: List[int], target: int) -> int:
        if len(nums) == 3:
            return sum(nums)

        nums.sort()

        diff = float('inf')

        for i in range(len(nums) - 2):
            if i != 0 and nums[i] == nums[i - 1]:
                continue

            left = i + 1
            right = len(nums) - 1
            n1 = nums[i]

            while left < right:
                tmp = n1 + nums[left] + nums[right]
                cur_diff = abs(target - tmp)

                if cur_diff < diff:
                    diff = cur_diff
                    ans = tmp

                if tmp > target:
                    right -= 1
                else:
                    left += 1

        return ans
```

## Solution 17

https://leetcode.com/problems/letter-combinations-of-a-phone-number/

### Solution in Python

```py
mapping = {
    '2' : ['a', 'b', 'c'],
    '3' : ['d', 'e', 'f'],
    '4' : ['g', 'h', 'i'],
    '5' : ['j', 'k', 'l'],
    '6' : ['m', 'n', 'o'],
    '7' : ['p', 'q', 'r', 's'],
    '8' : ['t', 'u', 'v'],
    '9' : ['w', 'x', 'y', 'z']
}

class Solution:
    def letterCombinations(self, digits):
        if len(digits) == 0:
            return []

        if len(digits) == 1:
            return mapping[digits[0]]

        stack = [*digits][::-1]
        out = mapping[stack.pop()]

        while stack:
            out = [v + ch for ch in mapping[stack.pop()] for v in out]

        return out
```

## Solution 18

https://leetcode.com/problems/4sum/

## Solution in Python

```py
class Solution:
    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        sum2 = {}
        cnt = {}

        for v in nums:
            cnt[v] = cnt.get(v, 0) + 1

        keys = list(cnt)

        for i in range(len(keys)):
            for j in range(i, len(keys)):
                sum2.setdefault(keys[i] + keys[j], []).append((keys[i], keys[j]))

        out = set()

        for k, v in sum2.items():
            if target - k not in sum2:
                continue

            for a, b in v:
                for c, d in sum2[target - k]:

                    cnt[a] -= 1
                    cnt[b] -= 1
                    cnt[c] -= 1
                    cnt[d] -= 1

                    if cnt[a] >= 0 and cnt[b] >= 0 and cnt[c] >= 0 and cnt[d] >= 0:
                        out.add(tuple(sorted((a, b, c, d))))

                    cnt[a] += 1
                    cnt[b] += 1
                    cnt[c] += 1
                    cnt[d] += 1

        return out
```

## Solution 19

https://leetcode.com/problems/remove-nth-node-from-end-of-list/

### Solution in Python

```py
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def removeNthFromEnd(self, head, n):

        cur, nodes = head, []

        while cur:
            nodes.append(cur)
            cur = cur.next

        if len(nodes) == 1:
            return None

        if n == len(nodes):
            return head.next

        nodes[-n - 1].next = nodes[-n].next

        return head
```

## Solution 20

https://leetcode.com/problems/valid-parentheses/

### Solution in Python

```py
m = {'(':')', '{':'}', '[':']'}
inv_m = {')':'(', '}':'{', ']':'['}

class Solution:
    def isValid(self, s: str) -> bool:
        last_par = None

        opening = []
        for ch in s:
            if ch in m:
                opening.append(ch)
            else:
                if not opening or opening.pop() != inv_m[ch]:
                    return False

        return len(opening) == 0
```

## Solution 21

https://leetcode.com/problems/merge-two-sorted-lists/

### Solution in Python

```py
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next


class Solution:
    def mergeTwoLists(self, list1: Optional[ListNode], list2: Optional[ListNode]) -> Optional[ListNode]:

        lst = []

        while list1:
            lst.append(list1)
            list1 = list1.next

        while list2:
            lst.append(list2)
            list2 = list2.next

        if len(lst) == 0:
            return None

        lst.sort(key=lambda i: i.val)

        for i in range(1, len(lst)):
            lst[i-1].next = lst[i]

        lst[-1].next = None

        return lst[0]
```