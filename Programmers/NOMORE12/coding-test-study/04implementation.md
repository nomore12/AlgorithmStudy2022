# 구현

흔히 문제 해결 분야에서 구현 유형의 문제는 '풀이를 떠올리는 것은 쉽지만 소스코드로 옮기기 어려운 문제'를 의미한다.

## 문제풀이

### 상하좌우

> 여행가 A는 N * M 크기의 정사각형 공간 위에 서 있다. 이 공간은 1 * 1 크기의 정사각형으로 나누어져 있다. 가장 왼쪽 위 좌표는 (1, 1)이며, 가장 오른쪽 아래 좌표는 (N, N)에 해당한다. 여행가 A는 상, 하, 좌, 우 방향으로 이동할 수 있으며, 시작 좌표는 항상 (1, 1)이다. 우리 앞에는 여행가 A가 이동할 계획이 적힌 계획서가 놓여있다.
>
> 계획서에는 하나의 줄에 띄어쓰기를 기준으로 하여 L, R, U, D 중 하나의 문자가 반복적으로 적혀있다. 각 문자의 의미는 다음과 같다.
>
> L: 왼쪽으로 한 칸 이동.
>
> R: 오른쪽으로 한 칸 이동.
>
> U: 위로 한 칸 이동.
>
> D: 아래로 한 칸 이동.
>
> 이때 여행가 A가 N * M 크기의 정사각형 공간을 벗어나는 움직임은 무시된다. 예를 들어 (1, 1)의 위치에서 L 혹은 U를 만나면 무시된다. 계획서가 주어졌을 때 여행가 A가 최종적으로 도착할 지점의 좌표를 출력하는 프로그램을 작성하시오.

```javascript
function upDownLeftRight(n, direction) {
  let map = [];
  // 맵을 만든다.
  for (let i = 0; i < n; i++) {
    let row = [];
    for (let k = 0; k < n; k++) {
      row.push([k + 1, i + 1]);
    }
    map.push(row)
  }
  
  // 현재 위치와 이동 방향을 이용해 이동 가능한 방향인지 판단하여 위치를 저장
  let current = [1, 1];
  direction.forEach(item => {
    const cur = isMoveable(current, item);
    current = !cur ? current : cur;
  })
  
  return current;
}

// 이동 가능한 위치인지 판별하여 이동 가능하다면 이동 위치를 반환, 아니라면 현재 위치를 반환한다.
function isMoveable(cur, dir, n) {
  // 이동 방향에 사용될 좌표 계산 배열
  let direction;
  switch (dir) {
    case 'R':
      direction = [1, 0];
      break;
    case 'L':
      direction = [-1, 0];
      break;
    case 'U':
      direction = [0, -1];
      break;
    case 'D':
      direction = [0, 1];
      break;
    default:
      direction = [0, 0];
  }
  // direction과 현재 위치를 더해준다.
  const result = [cur[0] + direction[0], cur[1] + direction[1]];

  // 이동이 불가능하다면 현재 위치를 반환한다.
  if (result[0] > n || result[1] > n || result[0] < 1 || result[1] < 1) {
    return cur;
  }
  return result;
}
```

### 시각

> 정수 N이 입력되면 00시 00분 00초부터 N시 59분 59초까지의 모든 시각 중에서 3이 하나라도 포함되는 모든 경우의 수를 구하는 프로그램을 작성하시오.

```javascript
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
```

### 왕실의 나이트
> 왕실의 정원은 체스판과 같은 8 * 8 좌표 평면이다. 정원의 특정한 한 칸에 나이트가 서 있다. 좌표 평면상에서 나이트의 위치가 주어졌을 때 나이트가 이동할 수 있는 경우의 수를 풀력하는 프로그램을 작성하시오.

```javascript
function solution(pos) {
  // 나이트의 이동 계산기(?)
  const knightMove = [[2, -1], [2, 1], [-2, 1], [-2, 1], [1, 2], [1, -2], [-1, 2], [1, -2]];
  let count = 0;
  // 나이트의 이동 가능한 위치는 최대 8개. 8회 반복문에서 이동 가능한 위치를 찾는다.
  for (let i = 0; i < knightMove.length; i++) {
    const isMove = isMoveable(pos, knightMove[i][0], knightMove[i][1]);
    count = isMove ? count + 1 : count;
  }
  return count;
}

// 이동 가능여부를 계산하여 반환하는 함수.
function isMoveable(curr, x, y) {
  const current = [curr[0] + x, curr[1] + y];
  if (current[0] > 8 || current[0] < 1 || current[1] > 8 || current[1] < 1) {
    return false;
  }
  return true;
}
```

### 게임개발
