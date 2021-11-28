class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var max = nums[0]
        for i in nums {
            sum += i
            if sum > max {
                max = sum
            }
            if sum < 0 {
                sum = 0
            }
        }
        return max
    }
}

let solution = Solution()
let x = solution.maxSubArray([-10000,-2])
