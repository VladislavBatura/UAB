using System;
using System.Collections.Generic;
using System.Linq;

var arrayOfInt = new int[100];
var rand = new Random();
for (var i = 0; i < arrayOfInt.Length; i++)
{
    arrayOfInt[i] = rand.Next(-100_000, 100_001);
}

//linq approach
var distinctedArray = arrayOfInt.Distinct().ToArray();

//HashSet approach
var hashOfInts = new HashSet<int>(arrayOfInt);
var hashedArray = new int[hashOfInts.Count];
hashOfInts.CopyTo(hashedArray);

for (var i = 0; i < distinctedArray.Length; i++)
{
    Console.WriteLine($"{distinctedArray[i]} - distincted; {hashedArray[i]} - hashed");
}
