// 이취코와 동일하게 풀었다.
function solution(n) {
  let count = 0;
  for (let h = 0; h <= n; h++) {
    for (let m = 1; m <= 60; m++) {
      for (let s = 1; s <= 60; s++) {
        const time = `${h}:${m}:${s}`;
        count = time.includes('3') ? count + 1 : count;
      }
    }
  }
  return count;
}

console.log('result', solution(5));