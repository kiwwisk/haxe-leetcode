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