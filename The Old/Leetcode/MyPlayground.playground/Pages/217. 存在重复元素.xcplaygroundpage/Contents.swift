class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        var num = nums
        num.sort()
        for i in 0..<num.count-1 {
            if num[i] == num[i+1] {
                return true;
            }
        }
        return false;
    }
}

let solution = Solution()
let x = solution.containsDuplicate([1,1,1,3,3,4,3,2,4,2])
