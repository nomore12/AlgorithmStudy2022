function solution(n, m) {
  var answer = [];

  const up = m % n === 0 ? m : m * n;
  let down = 1;
  if (m % n === 0) {
    down = n;
  } else {
    
  }

  return m;
}

console.log(solution(2, 5));