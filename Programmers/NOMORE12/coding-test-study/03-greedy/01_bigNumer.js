function solution(arr1, arr2) {
  const n = arr1[0];
  const m = arr1[1];
  const k = arr1[2];

  const adder = arr2[k];
  let result = 0;
  for (let i = 0; i < m; i++){
    result = i < n ? result + arr2[i] : result + arr2[k - 1];
    console.log(result)
  }

  return result;
}

console.log(solution([5, 8, 3], [2, 4, 5, 4, 6]))