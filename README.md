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