# 그리디 알고리즘

그리디 알고리즘이란 '현재 상황에서 지금 당장 좋은 것만 고르는 방법'을 의미한다. 코딩테스트에서의 그리디 알고리즘의 유형은 사전에 외우고 있지 않아도 풀 수 있을 가능성이 높은 문제 유형이라는 특징이 있다. 그리디 알고리즘은 창의력, 즉 문제를 풀기위한 최소한의 아이디어를 떠올릴 수 있는 능력을 요구한다.

## 문제풀이

### 거스름돈

> 당신은 음식점의 계산을 도와주는 점원이다. 카운터에는 거스름돈으로 사용할 500원, 100원, 50원, 10원짜리 동전이 무한히 존재한다고 가정한다. 손님에게 거슬러 줘야 할 돈이 N원일 때 거슬러줘야 할 동전의 최소 개수를 구하라. 단, 거슬러 줘야 할 돈 N은 항상 10의 배수이다.

가장 큰 화폐단위부터 돈을 거슬러 주는 것만 생각하면 문제를 풀기 쉽다.

```javascript
let n = 1260;
let count = 0;

// 큰 단위의 화폐부터 차례로 확인
let coinTypes = [500, 100, 50, 10];
coinTypes.forEach((item) => {
  count = count + 1;
  n = n % coin;
})

console.log(count);
```

### 큰 수의 법칙

> 다양한 수로 이루어진 배열이 있을 때 주어진 수들을 M번 더하여 가장 큰 수를 만드는 법칙이다. 단 배열의 특정한 인덱스에 해당하는 수가 연속해서 K번을 초과하여 더해질 수 없는 것이 이 법칙의 특징이다.
> 예를 들어 순서대로 2, 4, 5, 4, 6으로 이루어진 배열이 있을 때 M이 8이고, K가 3이라고 가정하자. 이 경우 특정한 인덱스의 수가 연속해서 세 번까지만 더해질 수 있으므로 큰 수의 법칙에 따른 결과는 6 + 6 + 6 + 5 + 6 + 6 + 6 + 5인 46이 된다.

```javascript
function bicNumber(arr1, arr2) {
  const n = arr1[0];
  const m = arr1[1];
  const k = arr1[2];

  const numberArr = arr2.sort((pre, cur) => pre > cur ? -1 : 1);
  const first = numberArr[0];
  const second = numberArr[1];

  let result = 0;
  let multi = k; // 가장 큰 수를 곱하는 횟수
  let iter = Math.ceil(m / (k + 1)); // 반복 횟수

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
```

### 숫자 카드 게임

> 숫자 카드 게임은 여러 개의 숫자 카드 중에서 가장 높은 숫자가 쓰인 카드 한 장을 뽑는 게임이다.
>
> 1. 숫자가 쓰인 카드들이 N * M 형태로 놓여있다. 이때 N은 행의 개수를 의미하며, M은 열의 개수를 의미한다.
> 2. 먼저 뽑고자 하는 카드가 포함되어 있는 행을 선택한다.
> 3. 그다음 선택된 행에 포함된 카드들 중 가장 숫자가 낮은 카드를 뽑아야 한다.
> 4. 따라서 처음에 카드를 골라낼 행을 선택할 때, 이후에 해당 행에서 가장 숫자가 낮은 카드를 뽑을 것을 고려하여 최종적으로 가장 높은 숫자의 카드를 뽑을 수 있도록 전략을 세워야 한다.

```javascript
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
```

### 1이 될 때까지
> 어떠한 수 N이 1이 될 떄까지 다음의 두 과정 중 하나를 반복적으로 선택하여 수행하려고 한다. 단, 두 번째 연산은 N이 K로 나누어떨어질 때만 선택할 수 있다.
>
> 1. N에서 1을 뺀다.
> 2. N을 K로 나눈다.

```javascript
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
```
