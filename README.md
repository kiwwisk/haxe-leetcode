# haxe-leetcode
Leetcode problems solved in Haxe language


# Solution 1

https://leetcode.com/problems/two-sum/

## Solution in Python

```py
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        seen = {}
        for i, v in enumerate(nums):
            if target - v in seen:
                return [seen[target-v], i]
            seen[v] = i
```