/// The fact that the input array is sorted can be taken advantage of
/// A sorted array aligns a high index with a high value, allowing us
/// to finely control the sum by increasing it (increasing index) or
/// decreasing it (decreasing index)

import 'package:test/test.dart';

// Assuming the findTwoSum function is implemented elsewhere

void main() {
  group('findTwoSum', () {
    test('Should return correct indices for valid input', () {
      // Example 1: Simple test case
      expect(findTwoSum([2, 7, 11, 15], 9), equals([1, 2]));
    });

    test('Should handle negative numbers', () {
      // Example 2: Array with negative numbers
      expect(findTwoSum([-10, -3, 4, 7], 1), equals([2, 3]));
    });

    test('Should return correct indices for larger numbers', () {
      // Example 3: Larger numbers
      expect(findTwoSum([1, 3, 5, 7, 10, 15], 17), equals([4, 5]));
    });

    test('Should handle two elements', () {
      // Example 4: Array with only two elements
      expect(findTwoSum([2, 3], 5), equals([1, 2]));
    });

    test('Should return correct result with duplicate elements', () {
      // Example 5: Array with duplicate elements
      expect(findTwoSum([1, 1, 3, 4], 2), equals([1, 2]));
    });

    test('Should return empty array if no solution exists', () {
      // Example 6: No solution case
      expect(findTwoSum([1, 2, 3, 4], 8), equals([]));
    });
  });
}

// =============================================================
// =============================================================
// =============================================================

List<int> findTwoSum(List<int> nums, int target) {
  int leftPointer = 0;
  int rightPointer = nums.length - 1;
  // assume input correctness, no edge case check
  while (leftPointer != rightPointer) {
    if (nums[leftPointer] + nums[rightPointer] < target) {
      leftPointer++;
    } else if (nums[leftPointer] + nums[rightPointer] > target) {
      rightPointer--;
    } else {
      break;
    }
  }
  final result =
      (leftPointer != rightPointer) ? [++leftPointer, ++rightPointer] : <int>[];
  return result; // 1-based indexing
}
