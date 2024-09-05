import 'dart:math';

/// First we observe that the area is defined as:
/// - base * height
/// - where the base is j - i
/// - and the height is the smaller between f(i) and f(j)
///
/// The naive brute force solution contains 2 loops
/// for a runtime of O(n^2); it simply checks all possible pairings and
/// records the max value encountered

import 'package:test/test.dart';

// Assuming the function findMaxContainerSize is implemented elsewhere

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
  final n = height.length;
  var containerSize = 0;
  for (var i = 0; i < n; i++) {
    for (var j = 0; j < i; j++) {
      final int currentSize = (i - j) * min(height[i], height[j]);
      if (currentSize > containerSize) {
        containerSize = currentSize;
      }
    }
  }
  return containerSize;
}
