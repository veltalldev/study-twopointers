import 'dart:math';

/// this file attempts to solve the water container problem
/// with O(n) runtime using the two pointer technique
///
/// Solution: we start with the maximum base by setting our pointers on either
/// end of the list, and we record the maximum area as we move in the shorter
/// line one at a time until the width of the base reachhes 0
///
/// Proof of Correctness: The crux of the correctness of this solution lies
/// not in the hope of finding better outcomes by moving in the shorter
/// line; rather, it lies in the fact that we can saafely prune the alternative
/// i.e. moving in the taller line will ALWAYS yield a worse outcome.
/// No matter how much taller the tall line can become, the height of the
/// container is limited to the short line (so the height of the container
/// cannot improve in that way), yet the base shrinks by 1 at every step.
/// Moving the tall line is guaranteed to always yield worse outcome, so
/// we can rigorously prune those options and only focus on checking the
/// outcomes given by moving the short lines without fear of missing
/// any potential pairing.

import 'package:test/test.dart';

void main() {
  group('findMaxContainerSize', () {
    test('Should return correct max area for standard input', () {
      // Test case 1: Basic test case with standard input
      expect(findMaxContainerSize([1, 8, 6, 2, 5, 4, 8, 3, 7]), equals(49));
    });

    test('Should return correct max area for input with uniform height', () {
      // Test case 2: All heights are the same
      expect(findMaxContainerSize([5, 5, 5, 5, 5]), equals(20));
    });

    test('Should return correct max area for input with decreasing heights',
        () {
      // Test case 3: Heights decreasing
      expect(findMaxContainerSize([8, 7, 6, 5, 4, 3, 2, 1]), equals(16));
    });

    test('Should return correct max area for input with increasing heights',
        () {
      // Test case 4: Heights increasing
      expect(findMaxContainerSize([1, 2, 3, 4, 5, 6, 7, 8]), equals(16));
    });

    test('Should return correct max area for input with very small container',
        () {
      // Test case 5: Only two vertical lines (minimum input case)
      expect(findMaxContainerSize([1, 1]), equals(1));
    });

    test('Should return correct max area for input with zeros', () {
      // Test case 6: Heights with zero values
      expect(findMaxContainerSize([0, 2, 0, 3, 0, 5, 0]), equals(8));
    });
  });
}

// ================================================================
// ================================================================
// ================================================================

int findMaxContainerSize(List<int> height) {
  int n = height.length;
  int maxSize = 0;
  int left = 0;
  int right = n - 1;
  while (left != right) {
    final int currentSize = (right - left) * min(height[left], height[right]);
    if (currentSize > maxSize) {
      maxSize = currentSize;
    }
    if (height[left] <= height[right]) {
      left++;
    } else {
      right--;
    }
  }
  return maxSize;
}
