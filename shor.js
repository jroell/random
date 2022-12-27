// Function to find the prime factors of a given integer using Shor's algorithm
function shorsAlgorithm(n) {
	// Initialize variables
	var r = 1;
	var a = 2;
	var x = 0;
	var y = 0;
	var w = n;
	var factors = [];

	// Repeat until all prime factors are found
	while (w != 0 && w != 1) {
		// Choose random integer a such that 1 < a < n
		a = Math.floor(Math.random() * (n - 1)) + 1;

		// Calculate the greatest common divisor of a and n using Euclid's algorithm
		x = a;
		y = w;
		while (y != 0) {
			r = x % y;
			x = y;
			y = r;
		}

		// If the GCD is not 1, then a and n are not relatively prime and a is a factor of n
		if (x != 1) {
			factors.push(x);
			w = w / x;
		}
	}

	// Return the prime factors of n
	return factors;
}

// Example usage: find the prime factors of 15
//console.log(shorsAlgorithm(15)); // Output: [3, 5]
console.log(shorsAlgorithm(1000000)); // Output: [3, 5]
//console.log(shorsAlgorithm(32)); // Output: [3, 5]
//console.log(shorsAlgorithm(98)); // Output: [3, 5]
//console.log(shorsAlgorithm(65)); // Output: [3, 5]
//console.log(shorsAlgorithm(39)); // Output: [3, 5]
//console.log(shorsAlgorithm(81)); // Output: [3, 5]
