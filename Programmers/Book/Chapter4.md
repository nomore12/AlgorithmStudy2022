# 구현

흔히 문제 해결 분야에서 구현 유형의 문제는 '풀이를 떠올리는 것은 쉽지만 소스코드로 옮기기 어려운 문제'를 의미한다.

> 머리속의 알고리즘을 소스 코드로 구현해야 한다. 일단,컴퓨팅 파워와 기본 라이브러리 등을 이용해서 푸는 것을 시도 할 수 있다.
> 구현 시 메모리 제약 사항을 고려.

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

입력 예시

```bash
5
R R R U D D
```

출력 예시

```bash
3 4
```

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

> 정수 N이 입력되면 00시 00분 00초부터 N시 59분 59초까지의 모든 시각 중에서 3이 하나라도 포함되는 모든 경우의 수를 구하는 프로그램을 작성하시오. 예를 들어 1을 입력했을 때 다음은 3이 하나라도 포함되어 있으므로 세어야 하는 시각이다.
> 00시 00분 03초
> 00시 13분 30초
> 반면에 다음은 3이 하나도 포함되어 있지 않으므로 세면 안 되는 시각이다.
> 00시 02분 55초
> 01시 27분 45초

입력 예시

```bash
5
```

출력 예시

```bash
11475
```

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
> 나이트는 다음과 같은 2가지 경우로 이동할 수 있다.
>
> 1. 수평으로 두 칸 이동한 뒤에 수직으로 한 칸 이동하기
>
> 2. 수직으로 두 칸 이동한 뒤에 수평으로 한 칸 이동하기

입력 예시(실제 입력 예시는 a~h, 1~8이나 a~h를 1~8로 변경하여 구현)

```bash
a1
```

출력 예시

```bash
2
```

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

> 현민이는 게임 캐릭터가 맵 안에서 움직이는 시스템을 개발 중이다. 캐릭터가 있는 장소는 1 * 1 크기의 정사각형으로 이뤄진 N * M 크기의 직사각형으로, 각각의 칸은 육지 또는 바다이다. 캐릭터는 동서남북 중 한 곳을 바라본다.
> 맵의 각 칸은 (A, B)로 나타낼 수 있고, A는 북쪽으로 떨어진 칸의 개수, B는 서쪽으로부터 떨어진 칸의 개수이다. 캐릭터는 상하좌우로 움직일 수 있고, 바다로 되어 있는 공간에는 갈 수 없다. 캐릭터의 움직임을 설정하기 위해 정해 놓은 매뉴얼은 이러하다.
>
> 1. 현재 위치에서 현재 방향을 기준으로 왼쪽 방향(반시계 방향으로 90도 회전한 방향)부터 차례대로 갈 곳을 정한다.
> 2. 캐릭터의 바로 왼쪽 방향에 아직 가보지 않은 칸이 존재한다면, 왼쪽 방향으로 회전한 다음 왼쪽으로 한 칸을 전진한다. 왼쪽 방향에 가보지 않은 칸이 없다면, 왼쪽 방향으로 회전만 수행하고 1단계로 돌아간다.
> 3. 만약 네 방향 모두 이미 가본 칸이거나 바다로 되어 있는 칸인 경우에는, 바라보는 방향을 유지한 채로 한 칸 뒤로 가고 1단계로 돌아간다. 단, 이때 뒤쪽 방향이 바다인 칸이라 뒤로 갈 수 없는 경우에는 움직임을 멈춘다.
>
> 현민이는 위 과정을 반복적으로 수행하면서 캐틱터의 움직임에 이상이 있는지 테스트하려고 한다. 매뉴얼에 따라 캐릭터를 이동시킨 뒤에, 캐릭터가 방문한 칸의 수를 출력하는 프로그램을 만드시오.

입력 예시

```bash
4 4
1 1 0
1 1 1 1
1 0 0 1
1 1 0 1
1 1 1 1
```

출력 예시

```bash
3
```

```javascript
function solution(n, m, pos, gameMap) {
  const dx = [-1, 0, 1, 0];
  const dy = [0, 1, 0, -1];

  let map = gameMap;
  let x = pos[0];
  let y = pos[1];
  map[x][y] = 1;
  let count = 1;
  let dir = pos[2];
  dirCount = 0;

  while(true) {
    dir = dir - 1;
    dir = dir < 0 ? 3 : dir;

    let nx = x + dx[dir];
    let ny = y + dy[dir];

    if (map[nx][ny] === 0) {
      map[nx][ny] = 1;
      x = nx;
      y = ny;
      count = count + 1;
      dirCount = 0;
      continue;
    } else {
      dirCount = dirCount + 1;
    }

    if (dirCount == 4) {
      nx = x - dx[dir];
      ny = y - dy[dir];

      if (map[nx][ny] === 0) {
        x = nx;
        y = ny;
      } else {
        break;
      }
      dirCount = 0;
    }
  }
  return count;
}
```
