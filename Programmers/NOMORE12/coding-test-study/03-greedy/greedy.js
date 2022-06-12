// 02 큰 수의 법칙
function bicNumber(arr1, arr2) {
  const n = arr1[0];
  const m = arr1[1];
  const k = arr1[2];

  const numberArr = arr2.sort((pre, cur) => pre > cur ? -1 : 1);
  const first = numberArr[0];
  const second = numberArr[1];

  let result = 0;
  // 잘못된 첫 번째 풀이법
  // for (let i = 0; i < m; i++) {
  //   result = i < arr2.length ? result + first : result + second;
  // }

  // 잘못된 두 번째 풀이법
  // const bic = first * arr2.length;
  // const adder = (m - arr2.length) * second;
  // result = bic + adder;

  // const adder = arr2[k];
  // let count = Number(m / (k + 1)) * k;
  // count = count + m % (k + 1);

  // result = result + count * first;
  // result = result + (m - count) * second;

  // 다시 그냥 풀기
  let multi = k; // 가장 큰 수를 곱하는 횟수
  let iter = Math.ceil(m / (k + 1)); // 반복 횟수
  // 반복문
  // for (let i = 0; i < iter; i++) {
  //   if ( m % (multi + 1) !== 0 && i === iter - 1) {
  //     result = result + first * (m % multi + 1);
  //   } else {
  //     result = result + first * multi + second;
  //   }
  // }

  // 이취코와 비슷한 방법
  // 가장 큰 수와 두 번째로 큰 수를 반복하는 횟수를 구하면 반복문을 사용하지 않아도 답을 구할 수 있었다.
  // 반복 횟수가 딱 떨어지지 않을경우
  if (m % (k + 1) !== 0) {
    // (가장 큰 수 * k + 두 번째로 큰 수) * 반복 횟수 + 가장 큰 수 * 남아있는 횟수(?)
    result = (first * multi + second) * (iter - 1) + first * m % (k + 1);
  }
  // 반복 횟수가 딱 떨어지는 경우
  else {
    // (가장 큰 수 * k + 두 번째로 큰 수) * 반복 횟수
    result = (first * multi + second) * iter;
  }

  return result;
}

console.log(bicNumber([5, 8, 3], [2, 4, 5, 4, 6]))

/**
 * -----------------------------------------------------------------------------
 */

// 02 숫자 카드 게임
function numberCardGame(m, n, data) {
  let number = 10001;
  data.forEach((item) => {
    // 반복문을 돌며 행의 가장 작은 수를 찾는다.
    const arr = item.sort((pre, cur) => pre > cur ? 1 : -1);
    // 이전에 저장해놓은 가장 작은수와 현재 행의 가장 작은 수를 비교하여 근 수를 찾는다.
    number = number === 0 ? arr[0] : number < arr[0] ? arr[0] : number;
  })
  return number;
}

// console.log(numberCardGame(3, 3, [[3, 1, 2], [4, 1, 4], [2, 2, 2]]))

/**
 * -----------------------------------------------------------------------------
 */

// 04 1이 될 때까지
// 그냥 풀었음.
function toNumberOne(n, k) {
  let result = 0;
  console.log(n, k)
  while (true) {
    if (n % k === 0) {
      n = n / k;
    } else {
      n = n - 1;
    }
    result++;
    if (n <= 1) break;
  }
  return result;
}

// 이취코 풀이는 이해가 가지 않음.
// function toNumberOne(n, k) {
//   let result = 0;

//   while (true) {
//     let target = Math.ceil(n / k) * k;
//     result = result + (n - target);
//     n = target;
//     if (n < k) break;
//     result = result + 1;
//     n = Math.ceil(n / k);
//   }

//   return result + (n - 1);
// }

// console.log(toNumberOne(25, 5));
