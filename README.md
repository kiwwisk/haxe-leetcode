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

## Solution 22

https://leetcode.com/problems/generate-parentheses/

### Solution in Python

```py
def generate(s, opening, closing, n, current):
    if closing == n:
        current.append(s)
        return

    if opening < n:
        generate(s + '(', opening + 1, closing, n, current)

    if closing < opening:
        generate(s + ')', opening, closing + 1, n, current)

class Solution:
    def generateParenthesis(self, n):
        lst = []
        generate('(', 1, 0, n, lst)
        return lst
```

## Solution 23

https://leetcode.com/problems/merge-k-sorted-lists/

### Solution in Python

```py
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        lst = []
        for l in lists:
            while l:
                lst.append(l)
                l = l.next

        if len(lst) == 0:
            return None

        if len(lst) == 1:
            return lst[0]

        lst.sort(key=lambda i: i.val)

        for i in range(1, len(lst)):
            lst[i-1].next = lst[i]

        lst[-1].next = None

        return lst[0]
```

## Solution 24

https://leetcode.com/problems/swap-nodes-in-pairs/

### Solution in Python

```py
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def swapPairs(self, head: Optional[ListNode]) -> Optional[ListNode]:

        cur, lst = head, []
        while cur:
            lst.append(cur)
            cur = cur.next

        if len(lst) == 0:
            return None

        if len(lst) == 1:
            return head

        i = iter(lst)
        for a, b in zip(i, i):
            a.val, b.val = b.val, a.val

        return head
```

## Solution 25

https://leetcode.com/problems/reverse-nodes-in-k-group/

### Solution in Python

```py
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reverseKGroup(self, head: Optional[ListNode], k: int) -> Optional[ListNode]:

        cur, lst = head, []

        while cur:
            lst.append(cur)
            cur = cur.next

        if len(lst) == 0:
            return None

        if len(lst) == 1:
            return head

        i = iter(lst)
        for items in zip(*(i for _ in range(k))):
            vals = [i.val for i in items]
            for v, i in zip(reversed(vals), items):
                i.val = v

        return head
```

## Solution 26

https://leetcode.com/problems/remove-duplicates-from-sorted-array/

### Solution in Python

```py
class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        nums[:] = dict.fromkeys(nums)  # in Python 3.6+ keys are kept in insertion order
        return len(nums)
```

## Solution 27

https://leetcode.com/problems/remove-element/

### Solution in Python

```py
class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        nums[:] = [v for v in nums if v != val]
        return len(nums)
```

## Solution 28

https://leetcode.com/problems/implement-strstr/

### Solution in Python

```py
class Solution:
    def strStr(self, haystack: str, needle: str) -> int:
        n = len(needle)

        if n == 0:
            return 0

        if n > len(haystack):
            return -1

        for i in range(len(haystack) - n + 1):
            if haystack[i:i+n] == needle:
                return i

        return -1
```

## Solution 29

https://leetcode.com/problems/divide-two-integers/

### Solution in Python

```py
class Solution:
    def divide(self, dividend: int, divisor: int) -> int:
        if abs(divisor) > abs(dividend):
            return 0

        sign1 = dividend < 0
        sign2 = divisor < 0

        dividend = abs(dividend)
        divisor = abs(divisor)

        i = 0
        while (divisor << (i + 1)) < dividend:
            i += 1

        r = 2 ** i + self.divide(dividend - (divisor << i), divisor)
        r = -r if (sign1 ^ sign2) else r

        if r > 2147483647:
            return 2147483647
        elif r < -2147483648:
            return -2147483648

        return r
```

## Solution 30

https://leetcode.com/problems/substring-with-concatenation-of-all-words/

### Solution in Python

```py
class Solution:
    def findSubstring(self, s, words):
        c = {}
        for w in words:
            c[w] = c.get(w, 0) + 1

        word_len = len(words[0])
        total_len = word_len * len(words)
        out = []

        for shift in range(total_len):
            for sub_word in range(shift, len(s) - total_len + 1, total_len):
                c2 = {}

                exit = False
                for i in range(len(words)):
                    w = s[sub_word + i * word_len : sub_word + (i + 1) * word_len]
                    if w not in c:
                        exit = True
                        break
                    c2[w] = c2.get(w, 0) + 1

                if exit:
                    continue

                for k, v in c2.items():
                    if c[k] - v != 0:
                        exit = True
                        break

                if exit:
                    continue

                out.append(sub_word)

        return out
```

## Solution 31

https://leetcode.com/problems/next-permutation/

### Solution in Python

```py
class Solution:
    def nextPermutation(self, nums):
        """
        Do not return anything, modify nums in-place instead.
        """

        ln = len(nums)
        if ln == 1:
            return

        for idx in range(ln - 1, 0, -1):
            idx_minus_1 = idx - 1
            if nums[idx_minus_1] < nums[idx]:

                for idx2 in range(ln - 1, -1, -1):
                    if nums[idx2] > nums[idx_minus_1]:
                        break

                nums[idx_minus_1], nums[idx2] = nums[idx2], nums[idx_minus_1]
                nums[idx:] = sorted(nums[idx:])
                return

        nums.sort()
```

## Solution 32

https://leetcode.com/problems/longest-valid-parentheses/

### Solution in Python

```py
import re

r1 = re.compile(r'\((X*)\)')
r2 = re.compile(r'X+')

class Solution:
    def longestValidParentheses(self, s):
        if len(s) < 2:
            return 0

        old_s = s
        while True:
            s = r1.sub(lambda g: f'X{g.group(1)}X', s)
            if s == old_s:
                break
            old_s = s

        return len(max(r2.findall(s), key=len, default=''))
```

## Solution 33

https://leetcode.com/problems/search-in-rotated-sorted-array/

### Solution in Python

```py
class Solution:
    def search(self, nums, target):
        if len(nums) == 1:
            if nums[0] == target:
                return 0
            else:
                return -1

        left, right = 0, len(nums) - 1

        while left <= right:
            mid = (left + right) // 2
            n_mid, n_left, n_right = nums[mid], nums[left], nums[right]

            if n_mid == target:
                return mid
            elif n_left == target:
                return left
            elif n_right == target:
                return right

            if n_left > n_right:
                if n_mid > n_left:
                    if n_left < target < n_mid:
                        right = mid - 1
                    else:
                        left = mid + 1
                else:
                    if n_mid < target < n_left:
                        left = mid + 1
                    else:
                        right = mid - 1
            # standard binary search:
            else:
                if n_mid < target:
                    left = mid + 1
                else:
                    right = mid - 1
        return -1
```

## Solution 34

https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

### Solution in Python

```py
class Solution:
    def searchRange(self, nums, target):
        if len(nums) == 0:
            return [-1, -1]

        # find right
        left, right = 0, len(nums) - 1

        while left <= right:
            mid = (left + right) // 2

            if target >= nums[mid]:
                left = mid + 1
            else:
                right = mid - 1

        r_right = left - 1

        if r_right < 0 or nums[r_right] != target:
            return [-1, -1]

        # find left
        left, right = 0, r_right

        while left <= right:
            mid = (left + right) // 2

            if target > nums[mid]:
                left = mid + 1
            else:
                right = mid - 1

        r_left = right + 1
        return [r_left, r_right]
```

## Solution 35

https://leetcode.com/problems/search-insert-position/

### Solution in Python

```py
class Solution:
    def searchInsert(self, nums: List[int], target: int) -> int:

        left, right = 0, len(nums) - 1

        while left <= right:
            mid = (left + right) // 2

            if nums[mid] == target:
                return mid

            if nums[mid] < target:
                left = mid + 1
            else:
                right = mid - 1

        return left
```

## Solution 36

https://leetcode.com/problems/valid-sudoku/

### Solution in Python

```py
import re

class Solution:
    pat = re.compile(r"(\d).*\1")

    def isValidSudoku(self, board: List[List[str]]) -> bool:
        if any(Solution.pat.search("".join(row)) for row in board):
            return False

        if any(
            Solution.pat.search("".join(board[r][c] for r in range(9))) for c in range(9)
        ):
            return False

        if any(
            Solution.pat.search(
                "".join(
                    board[x1][y1]
                    for x1 in range(x, x + 3)
                    for y1 in range(y, y + 3)
                )
            )
            for x in range(0, 9, 3)
            for y in range(0, 9, 3)
        ):
            return False

        return True
```

## Solution 37

https://leetcode.com/problems/sudoku-solver/

### Solution in Python

```py
def possible(board, row, column, number):

    if any(board[row][i] == number for i in range(9)):
        return False

    if any(board[i][column] == number for i in range(9)):
        return False

    r_start = (row // 3) * 3
    c_start = (column // 3) * 3

    for i in range(r_start, r_start + 3):
        for j in range(c_start, c_start + 3):
            if board[i][j] == number:
                return False

    return True


class Solution:
    def solveSudoku(self, board):
        def _fn():
            for row in range(9):
                for column in range(9):
                    if board[row][column] != ".":
                        continue

                    for number in "123456789":
                        if possible(board, row, column, number):
                            board[row][column] = number
                            yield from _fn()
                            board[row][column] = "."

                    return  # dead-end

            yield

        next(_fn())
```

## Solution 38

https://leetcode.com/problems/count-and-say/

### Solution in Python

```py
class Solution:
    def countAndSay(self, n: int) -> str:
        def get_string(n):
            if len(n) == 1:
                return f"1{n}"

            out, start = [], 0
            for i in range(1, len(n)):
                if n[i] != n[i - 1]:
                    out.append((i - start, n[i - 1]))
                    start = i

            return (
                "".join(f"{a}{b}" for a, b in out) + f"{i + 1 - start}{n[-1]}"
            )


        def say(steps, current="1"):
            if steps == 1:
                return current

            return say(steps - 1, get_string(current))

        return say(n)
```

## Solution 39

https://leetcode.com/problems/combination-sum/

### Solution in Python

```py
class Solution:
    def combinationSum(self, candidates, target):

        rv, current = [], []

        def get_sum(start_index=0, cur_sum=0):
            for i in range(start_index, len(candidates)):
                current.append(candidates[i])
                new_sum = cur_sum + candidates[i]

                if new_sum == target:
                    rv.append(current[:])
                elif new_sum < target:
                    get_sum(i, new_sum)

                current.pop()

        get_sum()
        return rv
```

## Solution 40

https://leetcode.com/problems/combination-sum-ii/

### Solution in Python

```py
class Solution:
    def combinationSum2(self, candidates, target):

        candidates.sort()

        rv, seen, skips, current = [], set(), set(), []

        def get_sum(start_index=0, cur_sum=0):
            if start_index >= len(candidates):
                skips.add(current[0])
                return

            for i in range(start_index, len(candidates)):

                if candidates[i] in skips:
                    continue

                current.append(candidates[i])
                new_sum = cur_sum + candidates[i]

                if new_sum == target:
                    t = tuple(current)
                    if t not in seen:
                        seen.add(t)
                        rv.append(current[:])
                    current.pop()
                    break
                elif new_sum < target:
                    get_sum(i + 1, new_sum)
                    current.pop()
                else:
                    current.pop()
                    break  # all other numbers are greater

        get_sum()
        return rv
```
